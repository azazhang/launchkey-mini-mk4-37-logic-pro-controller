# Launchkey Mini MK4 37 — Logic Pro controller customization

A documented series of custom Logic Pro Lua controller modifications for the Novation Launchkey Mini MK4 37-key keyboard. Work was done on Logic Pro Creator Studio 12.3.1 and macOS 27.2.1 and frozen on November 20, 2026, before testing Logic Pro 13.

## Current status

The frozen version is V24 (root config.lua). Encoder 2 audible scrubbing is STILL UNRESOLVED. The most recent physical observation was that counterclockwise behavior was almost correct, whereas clockwise behavior remained incorrect.

Other features to preserve during future changes:

- Encoder 1 playhead movement and temporary Position display.
- Default Transport encoder mode after Logic initializes.
- The encoder order: Position, Scrub, Zoom, Loop Start, Loop End, Marker, Not Used, Tempo.
- Stationary Transport bar:beat display and its live updates.
- Existing transport buttons, zoom, locator and marker behavior.

See docs/LOCKED_BEHAVIOR.md for a preservation contract and docs/STATUS_AND_NEXT_STEPS.md for the forensic findings and research options.

## Repository contents

- config.lua — exact current installed V24 Lua script (SHA-256 30fc11285d7053d0dcc3500ce7b23fa306cf9f00025b8c129e072d32cd8a6c3d)
- recovery-v22.lua — the exact earlier V22 source (SHA-256 3bfb17200963a23a67df5dc021fcf8cd36e73124e3dbfa6a2032bff426a2f35d)
- history — 84 text-source/history files: upstream reference, earlier versions V2–V24, install/restore scripts, Swift diagnostic source, and test logs
- history/LK37_ENCODER2_FORENSIC_2026-11-20.md — the observed test results and root causes
- tests/verify_contract.py — static script and history integrity checks

Earlier source folders labeled StableV* represent development milestones, not a guarantee that all functions were stable.

## Deployment safety

The live Lua controller file is installed at:
/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device/config.lua

Save and quit Logic before changing this file. Preserve the prior script revision in Git, verify the expected checksum, and reopen Logic after installing. Historical install scripts are included for traceability and should be reviewed before execution.

This GitHub repository contains source code, historical versions, and diagnostic traces. Logic projects, audio, application files, and binary preferences remain at their original locations on the Mac mini. No additional application bundle or duplicate workspace archive is maintained.

## Copyright and support

The underlying controller integration is distributed by Focusrite/Novation, and the original copyright notices remain in its source. This repository documents modifications and debugging. It claims no independent license to third-party code.

Official setup guide:
https://support.novationmusic.com/hc/en-gb/articles/17051149371026-Launchkey-MK4-Logic-Pro-Setup

Experimental reference only. No permanent background helper or LaunchAgent is required.
