#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
installed='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
good="$folder/config.working-v1.lua"
expected1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected6='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1'
sum() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
[[ -f "$good" && "$(sum "$good")" == "$expected1" ]] || { print -u2 'Working backup checksum invalid'; exit 2; }
existing="$(sum "$installed")"
[[ "$existing" == "$expected1" || "$existing" == "$expected6" ]] || { print -u2 'Unrecognized installed script; refusing overwrite'; exit 3; }
[[ -w "$installed" ]] || { print -u2 'Installed script is not user-writable'; exit 4; }
if [[ "$existing" != "$expected1" ]]; then
  /bin/cat "$good" > "$installed"
  [[ "$(sum "$installed")" == "$expected1" ]] || { print -u2 'Restore checksum failed'; exit 5; }
fi
print 'WORKING_V1_RESTORED_SHA_VERIFIED'
print 'For restored v1 assignments, re-register the Launchkey once after restarting Logic.'
