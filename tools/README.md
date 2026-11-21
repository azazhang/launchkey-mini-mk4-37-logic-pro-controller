# Read-only diagnostic tools

These two Swift utilities are preserved from the November 20, 2026 Encoder 2 investigation. They have no startup service, installation, or persistent process. Both run only when explicitly launched.

- passive_dualport.swift: observes raw Launchkey DAW Out / MIDI Out events and Logic's accessible playhead and Play/Pause state for a specified number of seconds. Filters one-byte realtime MIDI clock packets.
- playhead_position.swift: retrieves one Logic playhead-position reading through macOS Accessibility APIs.

Compile on the Mac that runs Logic:

    swiftc tools/passive_dualport.swift -o /tmp/lk37_passive_dualport
    swiftc tools/playhead_position.swift -o /tmp/lk37_position

Run an explicitly bounded test:

    /tmp/lk37_passive_dualport 60
    /tmp/lk37_position

The CoreMIDI and Accessibility observations are read-only. Accessibility permission must be granted to the executing process. Diagnostic output can include control activity and project/playhead state, so review it before publishing.

The original experiment recorded MIDI input and AX data; it did not record or assess actual audio output or OLED contents.
