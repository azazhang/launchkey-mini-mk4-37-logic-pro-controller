#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
candidate="$folder/config.lua"
backup_v1="$folder/config.working-v1.lua"
backup_v2="$folder/config.installed-v2.lua"
hash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected_v1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v2='226435ab03cea00524792db99a81bb7a25085ed3f6b31603a57069bcbe3be22b'
expected_v3='ad40ad160182182ee9992f48bb969b5766b17fc62e111d1b95362e44f2b37ba6'
[[ -f "$target" && -f "$candidate" && -f "$backup_v1" && -f "$backup_v2" ]] || { print -u2 'Missing files'; exit 2; }
[[ "$(hash "$backup_v1")" == "$expected_v1" && "$(hash "$backup_v2")" == "$expected_v2" ]] || { print -u2 'Version backups failed verification'; exit 3; }
[[ "$(hash "$candidate")" == "$expected_v3" ]] || { print -u2 'Display-only candidate checksum mismatch'; exit 4; }
[[ "$(hash "$target")" == "$expected_v2" ]] || { print -u2 'Installed version unexpected; refusing overwrite'; exit 5; }
print 'Installing display-only v3. This changes only the Launchkey Mini MK4 37 script.'
/usr/bin/sudo -v
tmp_target="${target}.pending-v3"
/usr/bin/sudo /usr/bin/install -m 644 "$candidate" "$tmp_target"
[[ "$(hash "$tmp_target")" == "$expected_v3" ]] || { print -u2 'Copy verification failed. Existing live script unchanged'; exit 6; }
/usr/bin/sudo /bin/mv -f "$tmp_target" "$target"
[[ "$(hash "$target")" == "$expected_v3" ]] || { print -u2 'Post-install mismatch; restore known-good v1 with restore.sh'; exit 7; }
print 'V3_INSTALLED_CHECKSUM_VERIFIED'
print 'In Logic, Settings > Control Surfaces > MIDI Controllers: toggle only this Launchkey Auto OFF then ON.'
print 'If the modified script is still cached, quit and relaunch Logic; no delete/re-add is required.'
