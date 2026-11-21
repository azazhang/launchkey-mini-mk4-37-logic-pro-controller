#!/bin/bash
set -euo pipefail
dir="$HOME/Music/Audio Music Apps/LaunchkeyMiniMK4_37_TransportFix/StableV19"
script="/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua"
v18="0bd4564870b4a0e4fcb7146e73be424195b1571e9713d64d1abc990947334a88"
v19="6c697838aa761d263ce25e5d548118af56be2b203a852003578c1f64b28a1fe0"
if pgrep -f '/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
  echo 'REFUSED: Logic Pro remains open; save and quit before deployment' >&2
  exit 9
fi
function checksum() { shasum -a 256 "$1" | awk '{print $1}'; }
[[ "$(checksum "$script")" == "$v18" ]] || { echo 'REFUSED: unexpected currently installed version' >&2; exit 10; }
[[ "$(checksum "$dir/config.lua")" == "$v19" ]] || { echo 'REFUSED: staged V19 checksum mismatch' >&2; exit 11; }
[[ "$(checksum "$dir/config.working-v18.lua")" == "$v18" ]] || { echo 'REFUSED: rollback checksum mismatch' >&2; exit 12; }
cp "$dir/config.lua" "$script"
[[ "$(checksum "$script")" == "$v19" ]] || { echo 'ERROR: failed installed checksum verification' >&2; exit 13; }
echo 'V19_INSTALLED_VERIFIED'
