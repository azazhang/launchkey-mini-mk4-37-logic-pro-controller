import AppKit
import ApplicationServices
import CoreMIDI
import Foundation

// Read-only Logic playhead observer with Novation stationary OLED refresh.
// Runs independently of Logic's callbacks, preserving temporary knob overlays.
func endpointName(_ ep: MIDIEndpointRef) -> String {
    var n: Unmanaged<CFString>?
    if MIDIObjectGetStringProperty(ep, kMIDIPropertyName, &n) == noErr,
       let p=n { return p.takeRetainedValue() as String }
    return ""
}
func axValue(_ el: AXUIElement, _ key: String) -> CFTypeRef? {
    var v: CFTypeRef?
    if AXUIElementCopyAttributeValue(el,key as CFString,&v) == .success {return v}
    return nil
}
func axText(_ el: AXUIElement, _ key: String) -> String {
    guard let v=axValue(el,key) else{return ""}
    return String(describing:v)
}
func say(_ words: Any...) {
    print(words.map{String(describing:$0)}.joined(separator:" "))
    fflush(stdout)
}
final class PositionBridge {
    var client=MIDIClientRef()
    var receivePort=MIDIPortRef()
    var sendPort=MIDIPortRef()
    var source:MIDIEndpointRef=0
    var dest:MIDIEndpointRef=0
    var mode:Int? = nil
    var pendingUntil=Date.distantPast
    var lastSent:String?=nil
    var lastSentAt=Date.distantPast
    var lastFind=Date.distantPast
    var logicPID:pid_t=0
    var barField:AXUIElement?
    var beatField:AXUIElement?
    var lastWarning=Date.distantPast
    var updates=0
    var started=false

    func start() {
        guard AXIsProcessTrusted() else {
            say("AX_PERMISSION_DENIED: Accessibility permission required; no writes")
            exit(8)
        }
        guard MIDIClientCreate("Launchkey Position Bridge" as CFString,nil,nil,&client)==noErr else {
            say("MIDI_CLIENT_ERROR"); exit(9)
        }
        let callback:MIDIReadBlock={ [weak self] packets,_ in
            var packet=withUnsafePointer(to:packets.pointee.packet) {
                UnsafeMutablePointer(mutating:$0)
            }
            for _ in 0..<packets.pointee.numPackets {
                let p=packet.pointee
                let b=withUnsafeBytes(of:p.data){Array($0.prefix(Int(p.length)))}
                DispatchQueue.main.async { self?.observe(b) }
                packet=MIDIPacketNext(packet)
            }
        }
        guard MIDIInputPortCreateWithBlock(client,"LK Bridge Input" as CFString,
                &receivePort,callback)==noErr else {say("MIDI_INPUT_ERROR");exit(10)}
        guard MIDIOutputPortCreate(client,"LK Bridge Output" as CFString,
                &sendPort)==noErr else {say("MIDI_OUTPUT_ERROR");exit(11)}
        reconnect()
        Timer.scheduledTimer(withTimeInterval:0.18,repeats:true) { [weak self] _ in self?.tick() }
        say("LK37_POSITION_BRIDGE_STARTED")
        if CommandLine.arguments.contains("--probe") {
            DispatchQueue.main.asyncAfter(deadline:.now()+3.5) {
                say("PROBE_COMPLETE")
                exit(0)
            }
        }
        RunLoop.main.run()
    }
    func reconnect() {
        if source != 0 {MIDIPortDisconnectSource(receivePort,source)}
        source=0; dest=0; mode=nil
        for i in 0..<MIDIGetNumberOfSources() {
            let p=MIDIGetSource(i)
            if endpointName(p)=="DAW Out" {source=p;break}
        }
        for i in 0..<MIDIGetNumberOfDestinations() {
            let p=MIDIGetDestination(i)
            if endpointName(p)=="DAW In" {dest=p;break}
        }
        guard source != 0 && dest != 0 else {say("MIDI_PORTS_UNAVAILABLE");return}
        guard MIDIPortConnectSource(receivePort,source,nil)==noErr else {
            say("MIDI_CONNECT_FAILED");source=0;dest=0;return
        }
        say("MIDI_CONNECTED_DAW_PORTS")
        // Query actual device encoder mode (07 = channel 8 query; replies on 06).
        // Restore feature reply mode immediately afterward; no persistent changes.
        send([0x9F,0x0B,0x7F])
        DispatchQueue.main.asyncAfter(deadline:.now()+0.10){ [weak self] in
            self?.send([0xB7,0x1E,0x00])
        }
        DispatchQueue.main.asyncAfter(deadline:.now()+0.55){ [weak self] in
            self?.send([0x9F,0x0B,0x00])
        }
        lastSent=nil
    }
    func send(_ bytes:[UInt8]) {
        guard dest != 0 else{return}
        var list=MIDIPacketList()
        let first=MIDIPacketListInit(&list)
        bytes.withUnsafeBufferPointer { p in
            _=MIDIPacketListAdd(&list,1024,first,0,bytes.count,p.baseAddress!)
            let result=MIDISend(sendPort,dest,&list)
            if result != noErr {say("MIDI_SEND_ERROR",result)}
        }
    }
    func observe(_ bytes:[UInt8]) {
        if bytes.count < 3{return}
        var i=0
        while i+2 < bytes.count {
            let a=bytes[i], cc=bytes[i+1], v=bytes[i+2]
            if a==0xB6 && cc==0x1E {
                let old=mode
                mode=Int(v)
                if old != mode {
                    say("ENCODER_MODE",Int(v))
                    lastSent=nil
                    pendingUntil=Date().addingTimeInterval(0.45)
                }
            }
            if a==0xBF && cc>=0x55 && cc<=0x5C && v != 0x40 {
                let delay:TimeInterval = cc==0x55 ? 3.0 : 2.7
                let when=Date().addingTimeInterval(delay)
                if when>pendingUntil {pendingUntil=when}
            }
            i+=3
        }
    }
    func acquireLogic() -> Bool {
        guard let app=NSRunningApplication.runningApplications(
            withBundleIdentifier:"com.apple.mobilelogic").first else {
            logicPID=0;barField=nil;beatField=nil;return false
        }
        if logicPID != app.processIdentifier {
            logicPID=app.processIdentifier
            barField=nil;beatField=nil;lastSent=nil
            say("LOGIC_PID",logicPID)
        }
        if barField != nil && beatField != nil{return true}
        let root=AXUIElementCreateApplication(logicPID)
        var queue:[AXUIElement]=[root],i=0
        while i<queue.count && i<2000 {
            let e=queue[i];i+=1
            if axText(e,kAXDescriptionAttribute as String)=="Playhead Position" &&
                axText(e,kAXHelpAttribute as String).contains("(Bars)") {
                if let children=axValue(e,kAXChildrenAttribute as String) as? [AXUIElement] {
                    for c in children {
                        let key=axText(c,kAXDescriptionAttribute as String)
                        if key=="bar" {barField=c}
                        else if key=="beat" {beatField=c}
                    }
                }
                break
            }
            if let children=axValue(e,kAXChildrenAttribute as String) as? [AXUIElement] {
                queue.append(contentsOf:children)
            }
        }
        return barField != nil && beatField != nil
    }
    func tick() {
        let now=Date()
        if now.timeIntervalSince(lastFind)>6.0 {
            lastFind=now
            if source==0 || dest==0 {
                reconnect()
            }
        }
        guard mode==5, source != 0, dest != 0 else{return}
        guard now>=pendingUntil else{return}
        guard acquireLogic(),let bar=barField,let beat=beatField else{return}
        guard let b=Int(axText(bar,kAXValueAttribute as String)),
            let t=Int(axText(beat,kAXValueAttribute as String)),
            b>=1 && b<=9999 && t>=1 && t<=32 else {
            barField=nil; beatField=nil
            if now.timeIntervalSince(lastWarning)>10 {
                say("AX_POSITION_UNAVAILABLE")
                lastWarning=now
            }
            return
        }
        let label="Transport \(b):\(t)"
        if lastSent==label && now.timeIntervalSince(lastSentAt)<6.0{return}
        // F0 00 20 29 02 13 06 20 40 <7-bit ASCII title> F7
        let sysex:[UInt8]=[0xF0,0x00,0x20,0x29,0x02,0x13,0x06,0x20,0x40]+Array(label.utf8)+[0xF7]
        send(sysex)
        lastSent=label
        lastSentAt=now
        updates+=1
        if updates<50 || updates%100==0 {say("DISPLAY_REFRESH",label,"count",updates)}
    }
}
PositionBridge().start()
