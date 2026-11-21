Launchkey Mini MK4 37 / Logic Pro 12.3.1 / DisplayOnlyV3
=====================================================
This is an incremental diagnostic follow-up after v2 failed with Shift+Encoder.
Factory Novation says Shift+turn is hardware parameter preview, so it is NOT
available for another control assignment. A Shift latch can also be triggered
by double pressing Shift. v3 removes the Shift+Encoder 1 scrub experiment.

What is preserved:
 - The proven v1 Encoder 1 Forward/Rewind by Nudge Value movement (1 beat with
   Ctrl+Option+B). Other encoder assignments remain unchanged.
What is tested offline and being evaluated on hardware:
 - Playhead feedback request from Logic; host textual feedback enabled.
 - The display redraw SysEx uses field 1 of the stationary Transport grid
   and triggers redraw once per musical beat when formatted host data arrives.
 - The knob popup says "Playhead" rather than "Position" for an easy
   fingerprint proving that the v3 Lua script was reloaded.
 - If Logic supplies only the beat, v3 does not invent the bar number.

ACTIVATION WITHOUT DELETING / RE-ADDING CONTROL SURFACE:
1. Run ./install.sh on Mac mini. It changes ONLY the system-wide
   Launchkey Mini MK4 37.device/config.lua, atomically. It asks sudo once.
2. Logic Pro -> Settings -> Control Surfaces -> MIDI Controllers.
   Toggle the "Auto" checkbox OFF then ON for Launchkey Mini MK4 37.
   This is Apple's documented per-device reinitialization mechanism.
3. In Transport mode turn Encoder 1. If the popup says "Playhead" then
   the new script loaded. If it still says "Position", quit and reopen
   Logic (still NO remove/re-add). Check if the Transport grid shows bar:beat.
4. Test one ordinary Encoder 1 detent; it should remain the known-good jog.

If display is blank or the jog regresses, execute ./restore.sh to return
directly to known-good v1. Toggle Auto OFF then ON, or restart Logic.
All known backup versions and control-surface preferences are saved here.

The code passes Lua syntax and simulated MIDI/feedback callback tests.
Live Logic host callback frequency and playhead feedback format need a
physical-controller test; they have not yet been independently confirmed.
No installation action was automatically triggered during staging.
