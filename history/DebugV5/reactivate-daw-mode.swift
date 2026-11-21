import Foundation
import CoreMIDI

let expectedName = "Launchkey Mini MK4 37 DAW In"
var destination: MIDIEndpointRef = 0
for i in 0..<MIDIGetNumberOfDestinations() {
    let ep = MIDIGetDestination(i)
    var display: Unmanaged<CFString>?
    if MIDIObjectGetStringProperty(ep, kMIDIPropertyDisplayName, &display) == noErr,
       let name = display?.takeRetainedValue() as String?, name == expectedName {
        destination = ep
        break
    }
}
guard destination != 0 else { fputs("ERROR: Launchkey DAW In destination not found\n", stderr); exit(2) }
var client = MIDIClientRef()
var outputPort = MIDIPortRef()
let rc1 = MIDIClientCreate("Launchkey Mini MK4 37 DAW reactivation" as CFString, nil, nil, &client)
guard rc1 == noErr else { fputs("ERROR: MIDIClientCreate \(rc1)\n", stderr); exit(3) }
defer { MIDIClientDispose(client) }
let rc2 = MIDIOutputPortCreate(client, "DAW Mode Once" as CFString, &outputPort)
guard rc2 == noErr else { fputs("ERROR: MIDIOutputPortCreate \(rc2)\n", stderr); exit(4) }
defer { MIDIPortDispose(outputPort) }
var packetList = MIDIPacketList()
let data: [UInt8] = [0x9f, 0x0c, 0x7f]
let status = withUnsafeMutablePointer(to: &packetList) { listPtr -> OSStatus in
    let packet = MIDIPacketListInit(listPtr)
    return data.withUnsafeBufferPointer { buffer -> OSStatus in
        guard let ptr = buffer.baseAddress,
              MIDIPacketListAdd(listPtr, MemoryLayout<MIDIPacketList>.size, packet, 0, data.count, ptr) != nil else { return -1 }
        return MIDISend(outputPort, destination, listPtr)
    }
}
guard status == noErr else { fputs("ERROR: MIDISend status \(status)\n", stderr); exit(5) }
print("SENT 9F 0C 7F to \(expectedName) (CoreMIDI status=\(status))")
