import Foundation
import CoreMIDI
import ApplicationServices
import AppKit

let watchSeconds=CommandLine.arguments.count>1 ? (Double(CommandLine.arguments[1]) ?? 12) : 12.0
let t0=ProcessInfo.processInfo.systemUptime
func elapsed()->String { String(format:"%.3f",ProcessInfo.processInfo.systemUptime-t0) }
func label(_ e:MIDIEndpointRef)->String {
 var s:Unmanaged<CFString>?
 guard MIDIObjectGetStringProperty(e,kMIDIPropertyDisplayName,&s)==noErr,let p=s else{return ""}
 return p.takeRetainedValue() as String
}
func ax(_ e:AXUIElement,_ k:String)->CFTypeRef?{
 var x:CFTypeRef?
 return AXUIElementCopyAttributeValue(e,k as CFString,&x) == .success ? x:nil
}
func val(_ e:AXUIElement,_ k:String)->String{
 guard let x=ax(e,k) else{return ""}
 return String(describing:x)
}
let apps=NSRunningApplication.runningApplications(withBundleIdentifier:"com.apple.mobilelogic")
let process=apps.first
var project: AXUIElement?=nil
if let p=process {
 let root=AXUIElementCreateApplication(p.processIdentifier)
 if let windows=ax(root,kAXWindowsAttribute as String) as? [AXUIElement] {
  project=windows.first{val($0,kAXTitleAttribute as String).contains("BGM.logicx")}
 }
}
let app=project
func snapshot()->String {
 guard let win=app else {return "PROJECT_WINDOW_MISSING"}
 var stack=[win], n=0, position="", playing="", paused=""
 while let e=stack.popLast(),n<5000{
  n+=1
  let role=val(e,kAXRoleAttribute as String)
  let desc=val(e,kAXDescriptionAttribute as String)
  if desc=="Playhead Position" && val(e,kAXHelpAttribute as String).contains("Bars") {
   let kids=ax(e,kAXChildrenAttribute as String) as? [AXUIElement] ?? []
   position=kids.compactMap{ k -> String? in
     let desc=val(k,kAXDescriptionAttribute as String)
     return ["bar","beat","division","tick"].contains(desc) ? desc+":"+val(k,kAXValueAttribute as String):nil
   }.joined(separator:",")
  }
  if role=="AXCheckBox" && ["Play","Pause"].contains(desc) {
    if desc=="Play" {playing=val(e,kAXValueAttribute as String)}
    if desc=="Pause" {paused=val(e,kAXValueAttribute as String)}
  }
  if let kids=ax(e,kAXChildrenAttribute as String) as? [AXUIElement]{stack.append(contentsOf:kids)}
 }
 return "POS="+position+" PLAY="+playing+" PAUSE="+paused
}
var sources:[(MIDIEndpointRef,String)]=[]
for i in 0..<MIDIGetNumberOfSources(){
 let e=MIDIGetSource(i)
 let n=label(e)
 if n.contains("Launchkey Mini MK4 37") && (n.contains("DAW Out") || n.contains("MIDI Out")){
   sources.append((e,n))
 }
}
guard sources.count==2 else {print("ERROR_SOURCE_COUNT",sources.count);exit(2)}
var client=MIDIClientRef()
let r=MIDIClientCreate("LK37 Passive Dual Port Trace" as CFString,nil,nil,&client)
guard r==noErr else {print("ERROR_CLIENT",r);exit(3)}
var ports:[MIDIPortRef]=[]
for (source,sourceName) in sources{
 var port=MIDIPortRef()
 let status=MIDIInputPortCreateWithBlock(client,"LK37 Monitor " as CFString,&port){packetList,_ in
   var packet=withUnsafePointer(to:packetList.pointee.packet){UnsafeMutablePointer(mutating:$0)}
   for _ in 0..<Int(packetList.pointee.numPackets) {
      let length=Int(packet.pointee.length)
      let bytes=withUnsafeBytes(of:packet.pointee.data){Array($0.prefix(length))}
      if !bytes.isEmpty && !(bytes.count == 1 && bytes[0] >= 0xF8) {
       let output=bytes.map{String(format:"%02X",$0)}.joined(separator:" ")
       let kind=(bytes.count>=2 && bytes[0]==0xBF && bytes[1]==0x56) ? "ENCODER2" : "OTHER"
       print("MIDI",elapsed(),kind,sourceName,output)
       fflush(stdout)
      }
      packet=MIDIPacketNext(packet)
   }
 }
 guard status==noErr else {print("ERROR_INPUT",status);exit(4)}
 let connect=MIDIPortConnectSource(port,source,nil)
 guard connect==noErr else {print("ERROR_CONNECT",connect);exit(5)}
 ports.append(port)
}
print("START",Date(),"SOURCES",sources.map{$0.1}.joined(separator:" & "),"SECONDS",watchSeconds)
fflush(stdout)
var prior=""
while ProcessInfo.processInfo.systemUptime-t0 < watchSeconds {
 let x=snapshot()
 if x != prior {
   print("AX",elapsed(),x)
   prior=x
   fflush(stdout)
 }
 Thread.sleep(forTimeInterval:0.35)
}
print("END",Date(),"DURATION",elapsed())
fflush(stdout)
for (i,port) in ports.enumerated(){
 MIDIPortDisconnectSource(port,sources[i].0)
 MIDIPortDispose(port)
}
MIDIClientDispose(client)

