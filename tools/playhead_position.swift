import Foundation
import AppKit
import ApplicationServices
func a(_ e:AXUIElement,_ k:String)->CFTypeRef?{
 var x:CFTypeRef?
 return AXUIElementCopyAttributeValue(e,k as CFString,&x) == .success ? x:nil
}
func s(_ e:AXUIElement,_ k:String)->String{
 guard let x=a(e,k) else{return ""}
 return String(describing:x)
}
guard let app=NSRunningApplication.runningApplications(withBundleIdentifier:"com.apple.mobilelogic").first else{exit(2)}
let root=AXUIElementCreateApplication(app.processIdentifier)
var q=[root],idx=0
var reported=false
while !q.isEmpty && idx<5000{
 let e=q.removeLast();idx+=1
 if s(e,kAXDescriptionAttribute as String)=="Playhead Position" &&
    s(e,kAXHelpAttribute as String).contains("Bars"){
   var out=[String]()
   for child in a(e,kAXChildrenAttribute as String) as? [AXUIElement] ?? [] {
    let key=s(child,kAXDescriptionAttribute as String)
    if ["bar","beat","division","tick"].contains(key){out.append(key+"="+s(child,kAXValueAttribute as String))}
   }
   print("POSITION",out.joined(separator:" "))
   reported=true
   break
 }
 if let children=a(e,kAXChildrenAttribute as String) as? [AXUIElement]{
   q.append(contentsOf:children)
 }
}
if !reported{print("PLAYHEAD_NOT_FOUND");exit(3)}

