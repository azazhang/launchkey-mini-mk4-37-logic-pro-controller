Launchkey Mini MK4 37 — Transport Mode v2 (Mac mini, Logic 12.3.1)
==================================================================
Previous working version: normal Encoder 1 moves playhead 1 beat without
immediate audio dropout, but fast continuous movement causes silence.
v2 preserves that known-good mapping and adds:
- Beat-position feedback on OLED while Transport encoder mode is selected;
  the first stationary grid field shows bar:beat and the Encoder 1 popup
  shows the same value. The misleading "Scrub" label becomes "Position".
- Shift + Encoder 1 maps to Logic's Playhead (Beats, Scrubbing), for
  actual audio scrubbing while Logic is paused (per Apple's instructions).

Installation (after saving your active project):
1. Quit Logic Pro completely.
2. Execute ./install.sh in Terminal on Mac mini.
3. Open Logic Pro. Logic > Control Surfaces > Setup:
   delete only Launchkey Mini MK4 37 and re-add it via New > Install.
   Match DAW In / DAW Out ports. Leave other controllers alone.
4. Press Ctrl+Option+B to select Beat nudge if needed.
5. Test normal encoder rotation (the existing working behavior).
6. Observe bar:beat changing as Logic plays in Transport encoder mode.
7. PAUSE Logic playback, hold SHIFT, and turn Encoder 1 to test audio scrubbing.
   The controller already has Scrubbing With Audio in Tracks Area enabled.

If v2 misbehaves: save and QUIT Logic; run ./restore.sh;
restart Logic; re-register controller only if needed.

The prior factory-original Novation script is also preserved one level above
as config.original.lua. Neither this package nor its installer changes any
Logic project, global audio setting, or other controller's script.

Key limitation: tests are offline Lua+SysEx integration tests, not a
physical-controller/audio validation of Logic's live feedback or scrub behavior.
