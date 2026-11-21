#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
app='/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app'
[[ -d "$app" ]] || { print -u2 'Logic Pro Creator Studio not found'; exit 2; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
 print -u2 'Logic Pro is still running. Save your project and QUIT Logic before using this debug launcher.'
 exit 6
fi
"$folder/install.sh"
logbase="$HOME/Library/Logs/LaunchkeyMiniMK4_37"
out="$logbase-v4-debug.stdout.log"
err="$logbase-v4-debug.stderr.log"
: > "$out"
: > "$err"
print "Starting Logic Pro in LUA_DEBUG=1 mode."
/usr/bin/open -a "$app" --env 'LUA_DEBUG=1' --stdout "$out" --stderr "$err"
print 'Logic launch requested with Lua debug output.'
print "Debug stdout: $out"
print "Debug stderr: $err"
print 'Do not delete/re-add the controller. Its assignments should be imported on fresh launch.'
print 'Try Transport mode encoders 1 and 2, and play the project briefly so clock callbacks can be observed.'
