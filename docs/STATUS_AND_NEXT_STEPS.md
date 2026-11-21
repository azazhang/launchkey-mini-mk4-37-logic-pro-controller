# Encoder 2: forensic status and independent alternatives

## Verified physical trace

On November 20, 2026, the Launchkey produced 1,038 Encoder 2 messages on its DAW Out port across 10 turning episodes. The monitor recorded three physical Play-button presses and no Shift-button input. Clockwise used BF 56 41/42/44/48 (+1/+2/+4/+8), counterclockwise BF 56 3F/3E/3C/38 (-1/-2/-4/-8). The hardware direction and magnitude messages were consistent.

At 85.105 seconds the physical Play control was pressed and Logic registered its stopped state at 85.312 seconds. The next Encoder 2 rotation began at 88.59 seconds. At 88.70 seconds Logic registered Play again, even though no other physical Play-button message occurred. This directly demonstrates the user's broader point: the *kind of action performed* by Encoder 2 was inconsistent.

V22 generated between 1 and 6 native Scrub Forward/Rewind key-command press/release pairs for EACH physical encoder input, leading to excessive bursts at fast speeds. Independent tests also showed some dropped key-command steps.

The V22 script reused CC 0x6C/0x6D, which were already assigned in the Global Shift mode to track-bank functions. This collision is documented, but the recorded test had no Shift presses, so no observed track banking can be attributed to it.

An earlier V19 implementation attempted direct audio scrubbing through AGL_SCRUB with AGL_SCRUBSTATUS. Its timer callback sent scrub-status release toward the hardware (outport DAW_IN), whereas activation was sent toward Logic (inport DAW_OUT). This explains why automatic release could be unreliable.

## Independently learned Logic Key Command bindings (removed)

The November 10 native-key-command experiment added two persistent manual Controller Surface Key Command assignments: `Scrub Forward` on MIDI `B0 72 7F` (CC 114), and `Scrub Rewind` on `B0 73 7F` (CC 115). The latter overlaps the Launchkey's physical Play-button MIDI message. These were additional to the Lua script's named, automatically registered controls. Both manually learned assignments were deleted through Logic's Key Command Assignments interface on November 20; the script-generated `Native Scrub Forward Step` / `Native Scrub Rewind Step` rows remain. The saved controller-assignment database was verified to contain neither obsolete input.

This was a real Play-button mapping collision; it cannot by itself explain the earlier observed Play transition during Encoder 2 rotation, because the passive hardware capture contained no Play-button message at that moment. Keep those causal questions separate.

Encoder 1's native nudge commands depend on the global Logic Nudge Value. For the tested beat-based movement, select Beat (Control-Option-B); this is a setting external to `config.lua`.

## Current known state

V26 preserves V24's native AGL_SCRUB / AGL_SCRUBSTATUS route, Encoder 1 behavior, and scrub-status release on Encoder 1, Shift, Play or Stop. Encoder 2 retains the unresolved direction asymmetry: backward nearly correct, forward incorrect; scrub mode does not automatically exit solely when rotation stops.

**Logic 13 default mode:** V24 set the Launchkey hardware and the Lua display cache to Transport but left the Logic host's Encoder assignment-zone default at the first registered mode, Smart Controls. Logic 13 consequently showed the Transport pad lit while Encoder movements followed another host mode. V25 attempted a first-event synchronization; its first injected Encoder 1 test left the host mode unchanged, so the candidate was rejected. V26 instead moves the existing Encoder Transport mode block to the first position in the Encoder zone, without changing any mappings. Upon per-device Auto re-registration in Logic 13.0, the host selected Encoder Transport immediately, and injected clockwise/counterclockwise Encoder 1 events moved and restored the playhead exactly.

## Logic 13 cold-start failure confirmed November 20, 2026

After a real quit and restart with V26 installed, the physical Launchkey showed the Position screen, but Encoder 1 did not move the playhead and Encoders 2/3 adjusted track volumes. The host's Controller Assignments view still marked Encoder Transport active and the V26 script was loaded with intact assignments. Synthetic relative MIDI into the DAW input continued to move the playhead. The previously successful test following an Auto-registration refresh was therefore insufficient evidence of a persistent fix.

The hardware mode is a distinct state: Novation documents that entering DAW mode defaults hardware encoders to Plugin, and selecting Transport requires B6 1E 05. The passive physical MIDI capture attempts on Logic 13 produced no events, including after expanding the filters to include absolute BF 15-1C, so **the actual physical CC mode in the failed session has not been measured**.

A local, unreleased V27 candidate reasserts hardware Transport during initial host feedback and suppresses/repairs stray absolute encoder CCs while Lua is in Transport. It loaded and re-registered successfully, but **cold-start behavior is unverified**. Its synthetic nudge trial produced asymmetric movement, which was not attributed to the candidate; the project's original playhead position was subsequently restored through Logic's accessibility controls. Preserve the frozen V26 and V24 scripts for rollback. Do not describe V27 as a verified release.

## Next avenues — assess separately on Logic 13

1. Test the native AGL_SCRUB and AGL_SCRUBSTATUS modes directly, including host value semantics, two's-complement negative scaling, ACP_BEAT versus ACP_FORMAT, and audio audition in each direction.
2. Investigate the Logic Key Command named Scrub by MIDI value (-2-). Characterize the exact MIDI value convention, gesture end/release, bidirectional audio, and integration without a permanent service.
3. Investigate supported host-directed callbacks and feedback state transitions. Distinguish device-directed timer MIDI from internal Logic control-surface input.
4. Obtain physical-device confirmation that Logic 13 starts with Transport behavior and the preserved display; then test audible Encoder 2 scrubbing separately.

The passive trace cannot determine audible sound, DSP engine output, or OLED text. Real hardware and listening tests remain required before claiming scrubbing works.
