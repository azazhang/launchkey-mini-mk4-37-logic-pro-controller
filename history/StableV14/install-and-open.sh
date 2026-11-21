#!/bin/zsh
set -euo pipefail
d="$HOME/Music/Audio Music Apps/LaunchkeyMiniMK4_37_TransportFix/StableV14"
active="/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua"
expect12="abe72390eb3a37f34971bcb69e8c38e94e53a8b91892a790cf9ce26d29d4fb44"
expect14="65a4e43304b2706f1faaae112a31ea7f87ad4c77fe9b8e15663634359a557e06"
gethash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
  print -u2 "Logic is running: save and quit the project before installation."
  exit 6
fi
[[ "$(gethash "$d/config.lua")" == "$expect14" ]] || { print -u2 "Candidate checksum invalid"; exit 7; }
[[ "$(gethash "$d/config.working-v12.lua")" == "$expect12" ]] || { print -u2 "Backup checksum invalid"; exit 8; }
current="$(gethash "$active")"
if [[ "$current" == "$expect12" ]]; then
  /bin/cp "$d/config.lua" "$active"
  if [[ "$(gethash "$active")" != "$expect14" ]]; then
    /bin/cp "$d/config.working-v12.lua" "$active"
    [[ "$(gethash "$active")" == "$expect12" ]] || { print -u2 "Rollback verification failed"; exit 10; }
    print -u2 "V14 write failed; V12 restored."
    exit 9
  fi
elif [[ "$current" != "$expect14" ]]; then
  print -u2 "Unexpected live config checksum $current; no changes."
  exit 11
fi
print "V14_INSTALLED_AND_VERIFIED $(gethash "$active")"
out="$HOME/Library/Logs/LaunchkeyMiniMK4_37-v14.stdout.log"
err="$HOME/Library/Logs/LaunchkeyMiniMK4_37-v14.stderr.log"
/usr/bin/open -a "/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app" --env LUA_DEBUG=1 --stdout "$out" --stderr "$err"
print "LOGIC_LAUNCH_REQUESTED"
