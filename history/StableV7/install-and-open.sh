#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
active='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
app='/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app'
expected6='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1'
expected7='fb14ca4da9a90a326fdcfa334091ed8d174f32fc6e46be999b5e4dafcbfb7892'
sum() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
[[ -f "$active" && -f "$folder/config.lua" && -f "$folder/config.working-v6.lua" && -d "$app" ]] || { print -u2 'Missing required files. Nothing changed.'; exit 2; }
[[ "$(sum "$folder/config.lua")" == "$expected7" && "$(sum "$folder/config.working-v6.lua")" == "$expected6" ]] || { print -u2 'Script or backup checksum mismatch. Nothing changed.'; exit 3; }
current="$(sum "$active")"
[[ "$current" == "$expected6" || "$current" == "$expected7" ]] || { print -u2 'Unexpected installed version; refusing to overwrite'; exit 4; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
 print -u2 'Logic is running. Please SAVE and QUIT it before installation; active file unchanged.'
 exit 6
fi
[[ -w "$active" ]] || { print -u2 'Active script not user-writable. Refusing overwrite.'; exit 7; }
if [[ "$current" == "$expected6" ]]; then
  /usr/bin/python3 - "$active" "$folder/config.lua" <<'PY'
import os,sys,tempfile,hashlib
from pathlib import Path
active=Path(sys.argv[1]); candidate=Path(sys.argv[2])
expected6='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1'
expected7='fb14ca4da9a90a326fdcfa334091ed8d174f32fc6e46be999b5e4dafcbfb7892'
digest=lambda x:hashlib.sha256(x).hexdigest()
if digest(active.read_bytes())!=expected6 or digest(candidate.read_bytes())!=expected7:
 raise SystemExit('Checksum changed before atomic install; aborting')
temp=None
try:
 with tempfile.NamedTemporaryFile(dir=active.parent, prefix='.lk37-v7-',delete=False) as f:
  temp=f.name;f.write(candidate.read_bytes());f.flush();os.fsync(f.fileno())
 os.chmod(temp,0o644)
 os.replace(temp,active);temp=None
finally:
 if temp and os.path.exists(temp):os.unlink(temp)
if digest(active.read_bytes())!=expected7:raise SystemExit('Postinstall checksum incorrect')
print('V7_INSTALLED_SHA_VERIFIED')
PY
else
 print 'V7_ALREADY_INSTALLED'
fi
stdout="$HOME/Library/Logs/LaunchkeyMiniMK4_37-v7.stdout.log"
stderr="$HOME/Library/Logs/LaunchkeyMiniMK4_37-v7.stderr.log"
: > "$stdout"; : > "$stderr"
print 'Opening Logic with LUA_DEBUG=1, no control-surface re-registration.'
/usr/bin/open -a "$app" --env 'LUA_DEBUG=1' --stdout "$stdout" --stderr "$stderr"
print "Debug log: $stdout"
