#!/bin/zsh
set -euo pipefail
base="${0:A:h}"
installed='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
working_v1="$base/config.working-v1.lua"
candidate="$base/config.lua"
hash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected_v1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v2='226435ab03cea00524792db99a81bb7a25085ed3f6b31603a57069bcbe3be22b'
[[ -f "$working_v1" && -f "$candidate" && -f "$installed" ]] || { print -u2 'Required script missing'; exit 2; }
[[ "$(hash "$working_v1")" == "$expected_v1" ]] || { print -u2 'Working-version backup verification FAILED'; exit 3; }
[[ "$(hash "$candidate")" == "$expected_v2" ]] || { print -u2 'Candidate verification FAILED'; exit 4; }
[[ "$(hash "$installed")" == "$expected_v1" ]] || { print -u2 'Installed script differs from known working v1; refusing overwrite'; exit 5; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
 print -u2 'Logic Pro is running. Save project and QUIT Logic first. Existing script unchanged.'
 exit 6
fi
/usr/bin/sudo -v
/usr/bin/sudo /usr/bin/install -m 644 "$candidate" "$installed"
[[ "$(hash "$installed")" == "$expected_v2" ]] || { print -u2 'Installed checksum mismatch; use restore.sh immediately'; exit 7; }
print 'V2_INSTALLED_VERIFIED'
print 'Restart Logic; re-register ONLY the Launchkey Mini MK4 37 in Control Surfaces > Setup.'
