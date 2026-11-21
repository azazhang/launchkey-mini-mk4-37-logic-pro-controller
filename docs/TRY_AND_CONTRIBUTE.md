# Using the experimental Launchkey changes

## Intended hardware and software

The script is specifically for the **Launchkey Mini MK4 37-key** (not the full-size Launchkey MK4 37 or the Mini MK4 25). It assumes Novation's official Logic controller script is installed. Our physical tests used Logic Pro Creator Studio 12.3.1; Logic 13 and other models/versions have not been tested.

**Important limitation:** Encoder 2 audible scrubbing is broken. The latest trial found direction-dependent movement (counterclockwise was close to the intended behavior, clockwise was abnormal), and releasing the encoder does not always exit scrub mode. Use an expendable test session and avoid V24 if you need dependable audible scrubbing.

## Current Transport encoder layout

| Encoder | OLED name | Role |
|---|---|---|
| 1 | Position | Navigate playhead; temporary position readout |
| 2 | Scrub | Experimental; currently incorrect |
| 3 | Zoom | Zoom |
| 4 | Loop Start | Loop start |
| 5 | Loop End | Loop end |
| 6 | Marker | Marker navigation |
| 7 | Not Used | Unused |
| 8 | Tempo | Tempo |

The script selects the Transport encoder mode on initialization and refreshes the stationary Transport bar:beat display. Those features worked on the development setup and are the baseline for further scrubbing work.

## Inspect the patch and confirm your original script version

The source shipped with our development installation had SHA-256:

    4ec565815460156f348301e774576cecd975fa25d521d6e8f25185635faeb3b7

The experimental V24 script has SHA-256:

    30fc11285d7053d0dcc3500ce7b23fa306cf9f00025b8c129e072d32cd8a6c3d

See patches/launchkey-mini-mk4-37-v24.patch to review the changes. Applying the patch to exactly the source above was independently checked to produce V24 byte-for-byte. If you have a different vendor-script revision, review the patch and adapt only appropriate portions; do not force it onto an incompatible base.

## Trial installation (advanced users)

1. Save your Logic project and quit Logic.
2. Verify the official device script exists, and inspect its current checksum:

       DEVICE="/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device"
       test -f "$DEVICE/config.lua"
       shasum -a 256 "$DEVICE/config.lua"

3. Keep **one copy of your existing script** for restoring the trial. For example, put it on the Desktop:

       cp "$DEVICE/config.lua" "$HOME/Desktop/launchkey-mini-mk4-37-before-trial.lua"

4. From the directory where you downloaded this repository, install the experimental file and inspect its resulting checksum:

       sudo install -m 644 ./config.lua "$DEVICE/config.lua"
       shasum -a 256 "$DEVICE/config.lua"

5. Relaunch Logic. Confirm that the Mini MK4 37 is recognized in Controller Assignments, that Transport mode is initially active, and that Encoder 1 and the stationary OLED work before experimenting with Encoder 2.

To restore the previous vendor script, save and quit Logic again, then:

    DEVICE="/Library/Audio/MIDI Device Scripts/Focusrite - Novation/Launchkey Mini MK4 37.device"
    sudo install -m 644 "$HOME/Desktop/launchkey-mini-mk4-37-before-trial.lua" "$DEVICE/config.lua"

Restoring the Lua script does not automatically restore any separate Controller Assignments changes a user may have made in Logic. No LaunchAgent or permanently running background process is installed.

## Useful issue reports and pull requests

Please describe the exact controller model and Logic version, whether playback is stopped or running, clockwise versus counterclockwise rotation, audible scrubbing, playhead movement, OLED state, and behavior after stopping rotation. A small passive MIDI trace helps establish whether the device reports correctly.

See docs/STATUS_AND_NEXT_STEPS.md for forensic results and the failed earlier techniques. The tools/passive_dualport.swift recorder observes raw MIDI and Logic's accessibility state without injecting control data. It cannot establish audible playback behavior on its own.

Working improvements to Encoder 1, the default mode, display refresh, and encoder ordering should remain intact. Pull requests should identify any new mappings/CC values and ideally show a reproducible hardware test.

## Distribution

The original Novation Lua file did not include a separately identified open-source license in the copy we inspected. Redistribution rights for that vendor code remain unverified. The unified diff is provided to make the modifications inspectable and adaptable without requiring a full vendor source replacement.
