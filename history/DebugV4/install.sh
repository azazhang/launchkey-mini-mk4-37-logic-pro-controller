#!/bin/zsh
set -euo pipefail
home="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
candidate="$home/config.lua"
prev="$home/config.previous-v3.lua"
working="$home/config.working-v1.lua"
checksum() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected_v1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v3='ad40ad160182182ee9992f48bb969b5766b17fc62e111d1b95362e44f2b37ba6'
expected_v4='6c69d23c4c666e9938fced45971a0b9e6b7c56ca8d5e84fbd849290cb98c7058'
[[ -f "$target" && -f "$candidate" && -f "$prev" && -f "$working" ]] || { print -u2 'Missing script or backup'; exit 2; }
[[ "$(checksum "$prev")" == "$expected_v3" && "$(checksum "$working")" == "$expected_v1" ]] || { print -u2 'Version backup checksum mismatch'; exit 3; }
[[ "$(checksum "$candidate")" == "$expected_v4" ]] || { print -u2 'Debug v4 checksum mismatch'; exit 4; }
[[ "$(checksum "$target")" == "$expected_v3" ]] || { print -u2 'Installed version differs from verified v3; preserving it'; exit 5; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
  print -u2 'Logic Pro is running. Save the project and QUIT before installing v4.'
  exit 6
fi
print 'Installing v4 debug controller script. Administrator authentication is required.'
/usr/bin/sudo -v
pending="${target}.pending-v4"
/usr/bin/sudo /usr/bin/install -m 644 "$candidate" "$pending"
[[ "$(checksum "$pending")" == "$expected_v4" ]] || { print -u2 'Staging checksum failed; installed script unchanged'; exit 7; }
/usr/bin/sudo /bin/mv -f "$pending" "$target"
[[ "$(checksum "$target")" == "$expected_v4" ]] || { print -u2 'Installation verification failed; restore previous script'; exit 8; }
print 'DEBUG_V4_INSTALLED_VERIFIED'
