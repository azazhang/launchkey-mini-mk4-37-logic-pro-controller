#!/bin/zsh
set -euo pipefail
base="${0:A:h}"
installed='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
backup="$base/config.working-v1.lua"
hash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected_v1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v2='226435ab03cea00524792db99a81bb7a25085ed3f6b31603a57069bcbe3be22b'
[[ -f "$backup" && "$(hash "$backup")" == "$expected_v1" ]] || { print -u2 'Working v1 backup checksum mismatch'; exit 2; }
current="$(hash "$installed")"
[[ "$current" == "$expected_v2" || "$current" == "$expected_v1" ]] || { print -u2 'Unknown installed script; refusing overwrite'; exit 3; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
 print -u2 'Save project and quit Logic before restoring'; exit 6
fi
if [[ "$current" == "$expected_v1" ]]; then print 'WORKING_V1_ALREADY_INSTALLED'; exit 0; fi
/usr/bin/sudo -v
/usr/bin/sudo /usr/bin/install -m 644 "$backup" "$installed"
[[ "$(hash "$installed")" == "$expected_v1" ]] || { print -u2 'Restore checksum mismatch'; exit 7; }
print 'WORKING_V1_RESTORED_VERIFIED'
print 'Restart Logic; re-register the Launchkey if its previous assignments need refresh.'
