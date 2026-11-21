#!/bin/zsh
set -euo pipefail
folder="${0:A:h}"
active='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
v6="$folder/config.working-v6.lua"
sum() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected6='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1'
expected7='fb14ca4da9a90a326fdcfa334091ed8d174f32fc6e46be999b5e4dafcbfb7892'
[[ -f "$v6" && "$(sum "$v6")" == "$expected6" ]] || { print -u2 'V6 backup verification failed'; exit 2; }
[[ "$(sum "$active")" == "$expected7" || "$(sum "$active")" == "$expected6" ]] || { print -u2 'Unexpected installed version'; exit 3; }
if /usr/bin/pgrep -f '^/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app/Contents/MacOS/Logic Pro Creator Studio$' >/dev/null; then
 print -u2 'Save and QUIT Logic first'; exit 6
fi
/usr/bin/python3 - "$active" "$v6" <<'PY'
import os,sys,tempfile,hashlib
from pathlib import Path
active=Path(sys.argv[1]); backup=Path(sys.argv[2])
digest=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
if digest(backup)!='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1':raise SystemExit('V6 backup mismatch')
if digest(active) not in ('759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1','fb14ca4da9a90a326fdcfa334091ed8d174f32fc6e46be999b5e4dafcbfb7892'):raise SystemExit('Unknown active version')
temp=None
try:
 with tempfile.NamedTemporaryFile(dir=active.parent,prefix='.lk37-v6-',delete=False) as f:
  temp=f.name;f.write(backup.read_bytes());f.flush();os.fsync(f.fileno())
 os.chmod(temp,0o644);os.replace(temp,active);temp=None
finally:
 if temp and os.path.exists(temp):os.unlink(temp)
assert digest(active)=='759522cfb1e30f91322267ff621db97037b93c5e331ab31cce08f1f9fef5e0e1'
print('V6_RESTORED_SHA_VERIFIED')
PY
/usr/bin/open -a '/Volumes/Samsung_T5/Applications/Logic Pro Creator Studio.app'
