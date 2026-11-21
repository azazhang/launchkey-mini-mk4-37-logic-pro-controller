#!/bin/zsh
set -euo pipefail
base="${0:A:h}"
target='/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua'
v5="$base/config.lua"
v4="$base/config.previous-v4.lua"
v1="$base/config.working-v1.lua"
hash() { /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'; }
expected4='6c69d23c4c666e9938fced45971a0b9e6b7c56ca8d5e84fbd849290cb98c7058'
expected5='1c3307a169c4b104975eaf7d321c90d09fdb646529fca742b38586ae8e599fc6'
expected1='2e00eafcd4c10fedc123617c34c1f457edd8a924b2f140565242a56e3d1d807e'
[[ -f "$v5" && -f "$v4" && -f "$v1" && -f "$target" ]] || { print -u2 'Missing required files'; exit 2; }
[[ "$(hash "$v5")" == "$expected5" ]] || { print -u2 'v5 checksum incorrect'; exit 3; }
[[ "$(hash "$v4")" == "$expected4" && "$(hash "$v1")" == "$expected1" ]] || { print -u2 'Backup checksum incorrect'; exit 4; }
[[ "$(hash "$target")" == "$expected4" ]] || { print -u2 'Active script is not expected v4; refusing overwrite'; exit 5; }
print 'Updating ONLY Launchkey Mini MK4 37 Lua script to v5; one-time admin authorization.'
/usr/bin/sudo -v
# We preserve the exact existing file and make only this file user-writeable
# to support later Lua debug hot reloads without repeated sudo dialogs.
/usr/bin/sudo /usr/bin/install -m 644 "$v5" "$target"
/usr/bin/sudo /usr/sbin/chown friend:staff "$target"
[[ "$(hash "$target")" == "$expected5" ]] || { print -u2 'v5 checksum mismatch; restore v4 from backup'; exit 7; }
[[ -w "$target" ]] || { print -u2 'v5 installed but not user-writable'; exit 8; }
print 'V5_INSTALLED_VERIFIED'
print 'This one device script now belongs to user friend for iterative debug edits.'
print 'Logic LUA_DEBUG may reload script changes automatically; controller assignment updates require verification.'
