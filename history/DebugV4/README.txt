Launchkey Mini MK4 37 — Logic 12.3.1 — V4 diagnostic and transport remapping
==============================================================================
Goal: preserve working single-beat navigation and test actual audio scrub on
physical encoder 2, with other physical knob functions moved to make room.
Physical Transport encoder layout:
  1 Position (working Forward/Rewind by Nudge Value)
  2 Audible Scrub (Logic global AGL_SCRUB, ACP_FORMAT, relative)
  3 Zoom                 (original knob 2)
  4 Loop Start           (original knob 3)
  5 Loop End             (original knob 4)
  6 Marker Selection     (original knob 5)
  7 Unused
  8 Tempo                (unchanged)

The active V3 did not display real bar:beat after Auto was toggled. The debug
script captures actual Logic control surface callbacks for:
  Control 10: current Playhead binding (AGL_PLAYHEAD)
  Control 125: diagnostic clock bar binding (AGL_CLOCK, ACP_BAR)
  Control 126: diagnostic clock beat binding (AGL_CLOCK, ACP_BEAT)
The read-only probes have no physical MIDI inputs.

Debug mode: Apple Logic's executable contains LUA_DEBUG and a developer
reference documents using LUA_DEBUG=1 to log script print output and reload
script changes. Mac mini's native open command supports --env and stdout/stderr
file redirects.

USER ACTION:
1. Save the active Logic project and QUIT Logic Pro completely.
2. In the Mac mini's Terminal run:
   "$HOME/Music/Audio Music Apps/LaunchkeyMiniMK4_37_TransportFix/DebugV4/launch-debug.sh"
   This installs only this model's controller script (sudo requested locally),
   verifies checksums, and re-launches Logic with LUA_DEBUG=1 + logging.
3. Switch to Transport encoder mode (Shift+Pad 4; release Shift).
   Play a few bars, then turn Encoder 1 one step and turn Encoder 2 both ways
   while paused/stopped. Check whether Encoder 2 produces audible scrub.
   Try Zoom on Encoder 3. No need to delete or re-add controller.
4. Report result; MCPX can read:
   ~/Library/Logs/LaunchkeyMiniMK4_37-v4-debug.stdout.log
   ~/Library/Logs/LaunchkeyMiniMK4_37-v4-debug.stderr.log

If functions behave unexpectedly: quit Logic and execute ./restore-working-v1.sh
to restore the successfully tested one-detent navigation version. No project
or other controller is modified by the launcher.

Offline code checks pass. Live scrub behavior and clock feedback remain to be
determined from the next actual Logic debug log and physical hardware tests.
