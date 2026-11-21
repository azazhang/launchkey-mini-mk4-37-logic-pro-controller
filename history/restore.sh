#!/bin/zsh
set -euo pipefail
here="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
backup="$here/config.original.lua"
gethash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
[[ "$(gethash "$backup")" == '4ec565815460156f348301e774576cecd975fa25d521d6e8f25185635faeb3b7' ]] || { print -u2 'Backup invalid'; exit 2; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
 print -u2 'Save and quit Logic before restoring.'; exit 3
fi
/usr/bin/sudo -v
/usr/bin/sudo /usr/bin/install -m 644 "$backup" "$target"
[[ "$(gethash "$target")" == '4ec565815460156f348301e774576cecd975fa25d521d6e8f25185635faeb3b7' ]] || { print -u2 'Restore checksum failed'; exit 4; }
print 'ORIGINAL_RESTORED_AND_VERIFIED'
