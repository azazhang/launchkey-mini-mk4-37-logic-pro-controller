#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
source="$folder/config.lua"
knowngood="$folder/config.working-v1.lua"
expected_good='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
expected_v6='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1'
app='/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app'
sum() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
[[ -f "$target" && -f "$source" && -f "$knowngood" && -d "$app" ]] || { print -u2 'Missing source, backup, installed script, or Logic application'; exit 2; }
[[ "$(sum "$source")" == "$expected_v6" ]] || { print -u2 'Candidate checksum mismatch'; exit 3; }
[[ "$(sum "$knowngood")" == "$expected_good" ]] || { print -u2 'Working-v1 backup checksum mismatch'; exit 4; }
now="$(sum "$target")"
[[ "$now" == "$expected_good" || "$now" == "$expected_v6" ]] || { print -u2 'Unknown installed script; refusing to overwrite'; exit 5; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
  print -u2 'Logic is still open. Save and QUIT Logic before activating v6. Nothing has been changed.'
  exit 6
fi
[[ -w "$target" ]] || { print -u2 'Installed script is not writeable by this account; no changes made'; exit 7; }
# Rollback source is validated before touching the active file.
if [[ "$now" == "$expected_good" ]]; then
  /bin/cat "$source" > "$target"
  if [[ "$(sum "$target")" != "$expected_v6" ]]; then
    /bin/cat "$knowngood" > "$target"
    print -u2 'Installation checksum failed; working v1 restored'
    exit 8
  fi
fi
logdir="$HOME/Library/Logs"
stdout="$logdir/LaunchkeyMiniMK4_37-v6.stdout.log"
stderr="$logdir/LaunchkeyMiniMK4_37-v6.stderr.log"
: > "$stdout"
: > "$stderr"
print 'V6_SCRIPT_INSTALLED_AND_SHA_VERIFIED'
print 'Starting Logic with Lua diagnostics; preserving your project and other controllers.'
/usr/bin/open -a "$app" --env 'LUA_DEBUG=1' --stdout "$stdout" --stderr "$stderr"
print "LOG_FILE=$stdout"
print 'You will need to re-register only Launchkey Mini MK4 37 once for the new mapping.'
print 'After that, preserve the assignment structure across subsequent script revisions.'
