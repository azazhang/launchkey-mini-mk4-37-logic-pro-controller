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

V24 removes native key-command bursts, routes each Encoder 2 detent through AGL_SCRUB, and explicitly releases audio-scrub status when Encoder 1, Shift, Play or Stop is used. It also moves the dormant conflicting command controls to different CC numbers. V24 still has direction asymmetry: backward nearly correct, forward incorrect. Its scrub mode does not automatically exit solely when rotation stops.

## Next avenues — assess separately after the Logic 13 migration

1. Test the native AGL_SCRUB and AGL_SCRUBSTATUS modes directly, including host value semantics, two's-complement negative scaling, ACP_BEAT versus ACP_FORMAT, and audio audition in each direction.
2. Investigate the Logic Key Command named Scrub by MIDI value (-2-). Characterize the exact MIDI value convention, gesture end/release, bidirectional audio, and integration without a permanent service.
3. Investigate supported host-directed callbacks and feedback state transitions. Distinguish device-directed timer MIDI from internal Logic control-surface input.
4. Compare real Logic 13 behavior while holding the preserved Encoder 1, startup Transport mode, encoder order, and stationary display constant.

The passive trace cannot determine audible sound, DSP engine output, or OLED text. Real hardware and listening tests remain required before claiming scrubbing works.
