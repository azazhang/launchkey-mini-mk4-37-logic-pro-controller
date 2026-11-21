#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
v1="$folder/config.working-v1.lua"
hash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected_v1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v2='226435ab03cea00524792db99a81bb7a25085ed3f6b31603a57069bcbe3be22b'
expected_v3='ad40ad160182182ee9992f48bb969b5766b17fc62e111d1b95362e44f2b37ba6'
[[ -f "$v1" && "$(hash "$v1")" == "$expected_v1" ]] || { print -u2 'Working v1 backup mismatch'; exit 2; }
now="$(hash "$target")"
[[ "$now" == "$expected_v1" || "$now" == "$expected_v2" || "$now" == "$expected_v3" ]] || { print -u2 'Unknown current version; refusing overwrite'; exit 3; }
if [[ "$now" == "$expected_v1" ]]; then print 'WORKING_V1_ALREADY_PRESENT'; exit 0; fi
/usr/bin/sudo -v
tmp_target="${target}.pending-v1"
/usr/bin/sudo /usr/bin/install -m 644 "$v1" "$tmp_target"
[[ "$(hash "$tmp_target")" == "$expected_v1" ]] || { print -u2 'Staging checksum mismatch'; exit 4; }
/usr/bin/sudo /bin/mv -f "$tmp_target" "$target"
[[ "$(hash "$target")" == "$expected_v1" ]] || { print -u2 'Restore checksum mismatch'; exit 5; }
print 'WORKING_V1_RESTORED_CHECKSUM_VERIFIED'
print 'Toggle Launchkey Auto OFF/ON in Logic or relaunch Logic for reload.'
