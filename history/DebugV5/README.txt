Launchkey Mini MK4 37 / Logic 12.3.1 / V5
-----------------------------------------
V4 evidence: Encoder2 caused 1 bar per detent because the separate Logic
Scrub Status was still in "Set Clock" mode. Read-only Clock Bar/Beat
probes 125 and 126 never received callbacks even after re-registration.
Encoder1's AGL_PLAYHEAD assignment returned an empty text value.

V5 makes two controlled changes:
- Encoder1 uses AGL_BEATS instead of AGL_PLAYHEAD for feedback.
  Its existing virtual key commands (IDs 2595/2594) still drive motion.
- Encoder7 in Transport is an explicit Scrub Mode selector for Encoder2:
    Mode 0 = Clock, Mode 1 = Audio Scrub, Mode 2 = Shuttle.
  Start paused, turn Encoder7 clockwise one detent, then turn Encoder2.
  If it still moves one bar, check the debug log for Encoder7 feedback and
  try one additional Encoder7 step, not a sweeping continuous spin.
  Other knobs retain v4's layout (1 Position,2 Scrub,3 Zoom,
  4 Loop Start,5 Loop End,6 Marker,7 Mode,8 Tempo).

To activate:
1. With Logic running in debug mode, run ./install.sh in Mac mini Terminal.
   It requests sudo only once and makes this ONE Lua script writable for
   subsequent MCPX edits without further administrator authentication.
2. Try Encoder7 once in Transport mode and Encoder2 while paused.
   Observe whether the OLED now shows actual bar:beat position.
3. Report. MCPX will inspect ~/Library/Logs/LaunchkeyMiniMK4_37-v4-debug.stdout.log.
   If v5's marker is missing or Encoder7 remains inactive, Logic retained the
   old mappings; re-register only Launchkey Mini MK4 37 (one time).
4. If regression, ./restore.sh v1 restores the proven original patch.

The new bindings require live physical/controller verification; Lua tests
have validated relative MIDI mapping and feedback formatting only.
