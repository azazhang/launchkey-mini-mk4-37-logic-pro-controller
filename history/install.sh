#!/bin/zsh
set -euo pipefail
here="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
new="$here/config.lua"
backup="$here/config.original.lua"
expected_original="4ec565815460156f348301e774576cecd975fa25d521d6e8f25185635faeb3b7"
expected_patch="2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e"
gethash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
[[ -f "$target" && -f "$new" && -f "$backup" ]] || { print -u2 "Missing one of the three scripts"; exit 2; }
[[ "$(gethash "$backup")" == "$expected_original" ]] || { print -u2 'Original backup checksum mismatch'; exit 3; }
[[ "$(gethash "$new")" == "$expected_patch" ]] || { print -u2 'Candidate checksum mismatch'; exit 4; }
[[ "$(gethash "$target")" == "$expected_original" ]] || { print -u2 'Installed script is different from the known Novation original; refusing to overwrite'; exit 5; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
  print -u2 'Logic is running. Save your project and quit Logic before running this installer.'
  exit 6
fi
print "This installs the tested Transport Encoder 1 patch. Original backup: $backup"
/usr/bin/sudo -v
/usr/bin/sudo /usr/bin/install -m 644 "$new" "$target"
[[ "$(gethash "$target")" == "$expected_patch" ]] || { print -u2 'Install checksum mismatch; restore original immediately'; exit 7; }
print "INSTALLED_AND_SHA_VERIFIED. Start Logic and set Nudge Value to Beat (Control-Option-B)."
