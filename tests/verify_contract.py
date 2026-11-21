#!/usr/bin/env python3
"""Static preservation checks for Launchkey Mini MK4 37 development snapshots.

These assertions do not prove audio, timing, Lua runtime execution or Logic 13 compatibility.
"""
from pathlib import Path
import hashlib
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
BASELINES = {
    "config.lua": "30fc11285d7053d0dcc3500ce7b23fa306cf9f00025b8c129e072d32cd8a6c3d",
    "recovery-v22.lua": "3bfb17200963a23a67df5dc021fcf8cd36e73124e3dbfa6a2032bff426a2f35d",
    "history/StableV19/config.lua": "6c697838aa761d263ce25e5d548118af56be2b203a852003578c1f64b28a1fe0",
    "history/StableV18/config.lua": "0bd4564870b4a0e4fcb7146e73be424195b1571e9713d64d1abc990947334a88",
    "history/config.original.lua": "4ec565815460156f348301e774576cecd975fa25d521d6e8f25185635faeb3b7",
}
errors = []
for rel, expected in BASELINES.items():
    file = ROOT / rel
    actual = hashlib.sha256(file.read_bytes()).hexdigest() if file.is_file() else "MISSING"
    if actual != expected:
        errors.append(f"Baseline file mismatch: {rel}: {actual}")

s = (ROOT / "config.lua").read_text()
expected_labels = [
    ("0x15", "Position"), ("0x16", "Scrub"), ("0x17", "Zoom"),
    ("0x18", "Loop Start"), ("0x19", "Loop End"), ("0x1a", "Marker"),
    ("0x1b", "Not Used"), ("0x1c", "Tempo"),
]
section = s.split("TRANSPORT_ENCODER_NAMES = {",1)[1].split("}",1)[0]
for c,n in expected_labels:
    if not re.search(r"\[" + c + r"\]\s*=\s*'" + re.escape(n) + "'",section):
        errors.append(f"Encoder label/order changed: {c}: {n}")
for pattern,desc in [
    ("encoderMode = MODE.encoderTransport", "default Transport mode"),
    ("CC_ENCODERMODE, 0x05", "hardware Transport mode"),
    ("midi[1] == 0x55", "Encoder 1 playhead handler"),
    ("lk37HoldStationary", "stationary title lifetime handling"),
    ("positionDisplay", "position display state"),
    ("TRANSPORT_ENCODER_NAMES", "encoder title table"),
    ("function controller_timer_trigger", "display timer"),
]:
    if pattern not in s:
        errors.append("Missing expected code anchor: " + desc)
controls = s.split("controls = {",1)[1].split("all_assignments = {",1)[0]
ids = {int(i) for i in re.findall(r"\[(\d+)\]\s*=\s*\{name=",controls)}
if ids != set(range(134)):
    errors.append("Declared controller indices are not contiguous 0..133")

manifest = ROOT / "history/SOURCE_MANIFEST.sha256"
manifest_files = 0
for line in manifest.read_text().splitlines()[1:]:
    chunks = line.split("  ",2)
    if len(chunks)!=3:
        errors.append("Malformed manifest line: " + line[:70])
        continue
    sha, n, rel = chunks
    f = ROOT / "history" / rel
    if not f.is_file():
        errors.append("Missing historical source: " + rel)
        continue
    raw = f.read_bytes()
    if hashlib.sha256(raw).hexdigest() != sha or len(raw)!=int(n):
        errors.append("Modified historical source: " + rel)
    manifest_files += 1

if errors:
    print("FAIL")
    print("\n".join(errors))
    sys.exit(1)
print("PASS: 5 exact baseline checksums; 8 encoder labels; default Transport and display anchors;")
print(f"      134 contiguous controller indices; {manifest_files} archived files validated.")
print("NOTE: No audio-scrubbing, Logic runtime, or Logic 13 compatibility test was performed.")
