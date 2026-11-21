Launchkey Mini MK4 37 — Stable-Assignments V6 / Logic 12.3.1
=============================================================
This is a staged candidate, not live hardware verified.

Previously confirmed:
  V1: Encoder 1 one-beat navigation keeps audio playing for one detent.
  V1: quick repeated jumps still have audio interruptions.
  V4: Encoder 2 with AGL_SCRUB on default Scrub Status behaves like a
      one-bar playhead jump rather than audible scrubbing.
  V2-V4: no real bar:beat appeared, host clock feedback callbacks absent
      or empty. V5 never initialized in the running Logic process.
  Prior code displayed "Zoom IN/OUT" in response to host feedback; its
      popup was reproducible without rotating the knob.
  Frequent re-registration sends controller_finalize() and can leave
      Launchkey outside DAW mode. Avoid repeatedly doing this.
  Mere file replacement with LUA_DEBUG enabled did not reliably show
      new controller_info() lines and was not a safe confirmed hot reload.

V6 architectural changes:
  - Stable controller_info() hardware and virtual control assignments.
  - Encoder1 uses v1 key-command pulse 2594/2595, with read-only AGL_BEATS
    for musical playhead feedback. Does not alter the working jog engine.
  - Encoder2 is Logic's AGL_SCRUB.
  - Encoder7 controls AGL_SCRUBSTATUS. Turn it one step clockwise while
    paused; the screen should show Audio Scrub if Logic confirms mode 1.
    Then Encoder2 should be evaluated in actual Scrub mode.
  - Encoders3-6 are Zoom, Loop Start, Loop End, Marker; Encoder8 Tempo.
  - Zoom notifications are generated only by physically turning
    Encoder3; idle host feedback no longer creates Zoom popups.
  - Position feedback checks actual numeric bar:beat text from AGL_BEATS
    and/or separate read-only AGL_CLOCK probes, then sends one OLED
    update per changed beat. The host may still supply no usable data.
  - The official Novation DAW enable/disable lifecycle payloads are
    unchanged. No direct external DAW-mode messages are sent.
  - Finite logging on Encoder2/7 and timecode feedback.
  - Four dormant alternate scrub/shuttle inputs and a Clock Format probe
    are pre-registered now. Later Lua callback revisions can route Encoder2
    to these alternate parameters without changing controller assignments.
  - A deterministic 570-line assignment manifest is locked and can be
    compared on future versions to prevent accidental schema changes.
  - User-writable installed script allows MCPX patching without sudo.

FIRST-TIME ACTIVATION (one command plus one controller registration)
  1. Save your active project and QUIT Logic Pro.
  2. From Mac mini Terminal:
     "$HOME/Music/Audio Music Apps/LaunchkeyMiniMK4_37_TransportFix/StableV6/activate-and-open.sh"
     The script checks file hashes, refuses while Logic is running,
     installs V6 without sudo, and opens Logic with Lua logs.
  3. Logic Pro > Control Surfaces > Setup: delete only Launchkey
     Mini MK4 37, re-add it with its DAW In/Out ports. Do this ONE time,
     to register V6's stable schema.
  4. In Transport encoder mode, test:
     (i) Encoder 1 single step during normal playback;
     (ii) Encoder 3 zoom (look for temporary Zoom popup);
     (iii) Encoder7 clockwise ONE detent to set Audio Scrub;
     (iv) Encoder2 forward/back while paused;
     (v) play several bars and see if actual bar:beat appears.
  5. Reply with only observed behavior. MCPX can inspect
     ~/Library/Logs/LaunchkeyMiniMK4_37-v6.stdout.log itself.

SUBSEQUENT REVISIONS
  - Keep controller_info() and its assignment schema unchanged, so no
    further delete/re-add is needed for callback-only improvements.
  - MCPX can update the Lua file on Mac mini directly without sudo.
  - Do not assume LUA_DEBUG automatically reloads in Logic 12.3.1;
    if runtime reload is unavailable, save/quit/reopen Logic normally.
  - Avoid unverified MIDI injection and active-project termination.
  - A v1 rollback is always available: ./restore-working-v1.sh
    followed by a Logic restart and a single v1 re-registration if
    assignment mapping has changed.

Software-level tests were performed separately; results require the real
host's feedback and controller/audio testing before marking functional.
