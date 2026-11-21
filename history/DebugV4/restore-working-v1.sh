#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
installed='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
prev="$folder/config.previous-v3.lua"
working="$folder/config.working-v1.lua"
checksum() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected_v1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v3='ad40ad160182182ee9992f48bb969b5766b17fc62e111d1b95362e44f2b37ba6'
expected_v4='6c69d23c4c666e9938fced45971a0b9e6b7c56ca8d5e84fbd849290cb98c7058'
[[ -f "$working" && "$(checksum "$working")" == "$expected_v1" ]] || { print -u2 'Working-v1 backup corrupted'; exit 2; }
current="$(checksum "$installed")"
[[ "$current" == "$expected_v1" || "$current" == "$expected_v3" || "$current" == "$expected_v4" ]] || { print -u2 'Installed version unrecognized; aborting'; exit 3; }
if [[ "$current" == "$expected_v1" ]]; then print 'WORKING_V1_ALREADY_ACTIVE_ON_DISK'; exit 0; fi
print 'Restoring verified working-v1 navigation script.'
/usr/bin/sudo -v
pending="${installed}.pending-working-v1"
/usr/bin/sudo /usr/bin/install -m 644 "$working" "$pending"
[[ "$(checksum "$pending")" == "$expected_v1" ]] || { print -u2 'Staging failed; original unchanged'; exit 4; }
/usr/bin/sudo /bin/mv -f "$pending" "$installed"
[[ "$(checksum "$installed")" == "$expected_v1" ]] || { print -u2 'Restore verification failed'; exit 5; }
print 'WORKING_V1_RESTORED_AND_VERIFIED; relaunch Logic or use debug hot reload.'
