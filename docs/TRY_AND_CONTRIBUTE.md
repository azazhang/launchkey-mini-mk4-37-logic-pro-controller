# Using the experimental Launchkey changes

## Intended hardware and software

The script is specifically for the **Launchkey Mini MK4 37-key** (not the full-size Launchkey MK4 37 or the Mini MK4 25). It assumes Novation's official Logic controller script is installed. Our physical tests used Logic Pro Creator Studio 12.3.1. On Logic Pro 13.0, Lua registration was recovered by enabling the controller's Auto setting; physical control and audio behavior on Logic 13 is not yet verified.

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

## Logic Pro 13: controller script is installed but controls do not work

After upgrading from Logic 12.3.1 to 13.0 on the development Mac, the custom Lua file and hardware MIDI endpoints remained intact, but Logic's controller database was missing the script-created mappings. The Launchkey Mini MK4 37 was listed in **Logic Pro > Settings > Control Surfaces > MIDI Controllers**, with its **Auto** checkbox turned **off**.

**Fix:** with the Launchkey connected, enable **Auto** for the Launchkey Mini MK4 37 row (and leave unrelated controller rows unchanged). Logic immediately repopulated the script-created entries, including Encoder 1 and the clock-feedback controls; the installed V24 Lua source was unchanged.

The test confirms the registration mechanism in Logic 13.0. It does not establish that all controller functions or audible Encoder 2 scrubbing work correctly in Logic 13.0. Simply placing the script in the system MIDI Device Scripts folder or using Control Surface Setup > New > Install may not restore mappings while Auto is off.

## Logic preferences and Controller Assignments

**Required for the tested Encoder 1 step size:** set Logic's Nudge Value to **Beat** using the default **Control-Option-B** shortcut (or the corresponding Nudge Value key command). Encoder 1 invokes Logic's native Forward/Rewind by Nudge Value commands; its movement increments depend on this global Logic setting. On the development machine `NudgeIncrement` was `2`. Use the named Beat command to select the setting; do not directly edit the preference plist. See [Apple's Logic Pro global key commands](https://support.apple.com/guide/logicpro/global-commands-lgcp02bf31b6/mac).

**Controller assignments:** the Lua script declares its own control mappings, including the Position step commands, clock feedback, encoder modes, and experimental scrub controls. Logic stores registrations in the per-user `~/Library/Preferences/com.apple.logic.pro.cs` binary database. That file is specific to the user's Logic installation and may contain other controllers; it must not be copied from this project's Mac mini. Clean installation and re-registration on an unrelated Mac have not yet been independently tested.

**Do not add manual Scrub Forward/Rewind MIDI bindings.** During a November 10 experiment, Logic acquired two additional learned Key Command assignments:

- Scrub Forward: `B0 72 7F` (CC 114)
- Scrub Rewind: `B0 73 7F` (CC 115)

They were removed from the test Mac on November 20 after discovering they were unrelated to V24's current Encoder 2 route. The rewind binding conflicts with the Launchkey Play button (`B0 73 7F`). If you previously created these exact mappings, remove *only those manual CC rows* in **Logic Pro > Key Commands > Edit Assignments**, select the relevant scrub command, then choose its CC 114 or CC 115 Control Surface row and click **Delete Assignment**. Keep the script-created `Native Scrub Forward Step` and `Native Scrub Rewind Step` rows (if present). A new user who has never created these manual bindings has nothing to remove.

**Other recorded test-machine preferences:** `ScrubAudioInArrange = true`, `ScrubResponse = 4`, and `ScrubSpeed = 0`. They were already present in the November 7 diagnostic record and remain unchanged in the latest checks. Their necessity for the unresolved Encoder 2 audio-scrub implementation has *not* been established. Do not replace your Logic preferences or change those values merely to mirror the test machine; include your settings in an issue report if investigating audio scrubbing.

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
