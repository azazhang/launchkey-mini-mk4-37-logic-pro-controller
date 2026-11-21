#!/bin/zsh
set -euo pipefail
base="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
case "${1:-v1}" in
 v1) src="$base/config.working-v1.lua"; expected='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e';;
 v4) src="$base/config.previous-v4.lua"; expected='6c69d23c4c666e9938fced45971a0b9e6b7c56ca8d5e84fbd849290cb98c7058';;
 *) print -u2 'Usage: restore.sh v1 (known-good) or restore.sh v4'; exit 2;;
esac
hash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
[[ -f "$src" && "$(hash "$src")" == "$expected" ]] || { print -u2 'Backup verification failed'; exit 3; }
curr="$(hash "$target")"
[[ "$curr" == '1c3307a169c4b104975eaf7d321c90d09fdb646529fca742b38586ae8e599fc6' || "$curr" == '6c69d23c4c666e9938fced45971a0b9e6b7c56ca8d5e84fbd849290cb98c7058' || "$curr" == '2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e' ]] || { print -u2 'Unexpected installed revision; no changes'; exit 4; }
if [[ -w "$target" ]]; then /bin/cat "$src" > "$target"; else /usr/bin/sudo /usr/bin/install -m 644 "$src" "$target"; fi
[[ "$(hash "$target")" == "$expected" ]] || { print -u2 'Restore verification failed'; exit 5; }
print "RESTORED_$1_CHECKSUM_VERIFIED"
