# Launchkey Mini MK4 37 — Encoder 2 V22 forensic trace (2026-11-20)

## Scope and integrity
- Mac mini recorded using passive CoreMIDI monitoring of Launchkey MIDI Out and DAW Out, plus Logic AX polling.
- Trace: ~/Music/Audio Music Apps/LaunchkeyMiniMK4_37_TransportFix/encoder2_dualport_trace_20261120.txt
- Installed V22 SHA256: 3bfb17200963a23a67df5dc021fcf8cd36e73124e3dbfa6a2032bff426a2f35d.
- The trace cannot establish audible sound or controller OLED behavior.

## Direct observations
- 1,038 physical Encoder 2 messages on Launchkey DAW Out; 89 AX transport/playhead updates.
- Three physical Play-button down/up pairs, no physical Shift messages.
- Hardware clockwise increments BF 56 41/42/44/48 (+1,+2,+4,+8), counterclockwise BF 56 3F/3E/3C/38 (-1,-2,-4,-8).
- Physical Play down: 39.694s, 41.706s, 85.105s. AX Play changed to 0 at 39.833, 1 at 42.015, 0 at 85.312. Encoder 2 began rotating again at 88.59, AX Play changed to 1 at 88.70, with no intervening physical Play press. Thus Encoder 2 activated a different transport state.
- 566 Encoder 2 events during 70.80–81.66s (~52 events/sec), with each V22 event converted to up to six native scrub key-command press/release pairs, causing heavy command bursts.
- Independent virtual MIDI tests showed loss of some rapid Scrub Rewind activations.

## Code findings
1. V22 converts Encoder 2 to keyCmd 18/19 (Scrub Rewind/Forward), potentially altering transport state. Its excessive burst load and the recorded unintended Play transition establish this approach as unsafe for this target.
2. B0 6C 7F and B0 6D 7F are assigned both to the new scrub controls and existing Global/Shift-mode Track Right Shift / Track Left Shift bank navigation. This collision is a real mapping defect, but the physical trace contained no Shift events, so track banking was NOT observed or demonstrated in this run.
3. Earlier V19's timer callback appended a BF 5B scrub-status release but returned outport=DAW_IN (toward hardware), while the activation used inport=DAW_OUT (toward Logic). Therefore the release was sent in the wrong direction and could fail to reset the host state.
4. V23 is an unapproved staged candidate. Do not install it; it has no reliable release.
5. Apple supports AGL_SCRUB with a Scrub Status mode set to Audio Scrubbing, and documents Scrub by MIDI value (-2-) as an external MIDI scrubbing mechanism. Those are the appropriate direct scrubbing paths to test.

## Next controlled experiment
- One relative host scrub event per detent, no discrete key commands.
- Correct control mapping collisions without disturbing original transport/Encoder 1.
- Host-input scrub-status reset on Encoder 1, Shift, Play, Stop; host timer output must not substitute for these resets.
- No permanent helper/LaunchAgent.
- Preserve V22 rollback, stable bar:beat display, normal Encoder 1 navigation.
- Validate actual audible scrubbing, stop/resume behavior, start/stop state, direction and OLED with a real hardware test before claiming completion.
