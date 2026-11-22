# Launchkey Mini MK4 37 × Logic Pro — transport encoder improvements

Community-facing, experimental modifications to the **Novation Launchkey Mini MK4 37-key** Logic Pro Lua control-surface script. The aim is to improve the transport encoders and OLED, and to find a reliable implementation of native audible scrubbing with other Launchkey users.

**Status: partially working, work in progress (V27, November 21, 2026).** The navigation and transport-display improvements below worked on the development setup. **Encoder 2 audible scrubbing is still incorrect.** V27 is an experimental development snapshot and should not be treated as a stable release.

## What works and what does not

| Feature | Current state |
|---|---|
| Encoder 1: Position | Working in observed tests: playhead movement and temporary Position display |
| Default encoder mode | **Logic 13 regression:** V27 worked on one restart, then failed on another. Incorrect control-surface MIDI ports were found and corrected; next restart test pending |
| Stationary OLED | Working in observed tests: Transport bar:beat updates as Logic's playhead moves |
| Encoder order | Preserved: Position, Scrub, Zoom, Loop Start, Loop End, Marker, Not Used, Tempo |
| Encoder 2: Scrub | **Unresolved**: counterclockwise nearly correct; clockwise incorrect; scrub state may remain active |
| Other models / Logic versions | Untested compatibility; this particular Lua script is for the 37-key Mini |

Development setup: Logic Pro Creator Studio 12.3.1, macOS 27.2.1, Launchkey Mini MK4 37. On Logic Pro 13.0, Lua registration requires the Launchkey's Auto setting. V27 worked after one complete restart but failed after a later restart, leaving Mixer,Volume active in Logic despite a lit Transport pad. Control Surface Setup was using the Launchkey's performance MIDI Out/In ports. The input and output were corrected to the DAW Out/In pair specified by Novation. Disabling and re-enabling Auto was separately observed to reset them to the incorrect performance ports, so check the port pair after any registration refresh. A full restart of the corrected configuration has not yet been verified. Encoder 2 audible scrubbing remains unresolved.

## Start here

- **[How to try it and contribute](docs/TRY_AND_CONTRIBUTE.md)** — installation, restoration, feature mapping, known failures, useful bug reports.
- **[Modification patch](patches/launchkey-mini-mk4-37-v27.patch)** — a unified diff against the exact original Novation script used for development; application verified byte-for-byte.
- **[Experimental script V27](config.lua)** — current snapshot, including the still-broken Encoder 2 mapping.
- **[Previous V26 patch](patches/launchkey-mini-mk4-37-v26.patch)** — retained for rollback/comparison after its confirmed Logic 13 cold-start failure.
- **[Technical findings](docs/STATUS_AND_NEXT_STEPS.md)** — physical MIDI results, Logic scrub assignments, and alternative strategies.
- **[Working-feature contract](docs/LOCKED_BEHAVIOR.md)** — behavior that an improved scrub implementation should preserve.

If you want just the reliable improvements in a different vendor-script revision, review and adapt the patch sections relevant to Position, startup Transport mode, and the Transport display. Do not blindly transplant the V27 scrub section.

## Important Logic configuration

**Required port routing:** In Logic Pro > Control Surfaces > Setup, select the Launchkey Mini MK4 37 and set Input Port to **Launchkey Mini MK4 37 DAW Out** and Output Port to **Launchkey Mini MK4 37 DAW In**. These match [Novation's official Mini MK4 Logic setup guide](https://support.novationmusic.com/hc/en-gb/articles/20225284293906-Launchkey-MK4-Mini-Logic-Pro-Setup). On the test Mac, switching Auto off and on reverted these fields to the wrong MIDI pair. Recheck after registration changes.

**Encoder 1 depends on Logic's Nudge Value.** Its Lua mapping invokes the native Forward/Rewind by Nudge Value commands (IDs 2595/2594). Set **Nudge Value to Beat** (default shortcut **Control-Option-B**) for the one-beat navigation behavior tested here. The Lua script does not change that preference.

Logic persists controller mappings separately in `com.apple.logic.pro.cs`. V27 registers its named assignments via the Lua controller script; the community installation does not require copying another person's binary assignments file or manually learning scrub commands. In particular, **never manually map Scrub Rewind to MIDI `B0 73 7F`**: that is the Launchkey's Play-button message. Such an experimental assignment existed on the test Mac and was removed. See the [setup and cleanup details](docs/TRY_AND_CONTRIBUTE.md#logic-preferences-and-controller-assignments).

## Help solve Encoder 2 scrubbing

A physical capture recorded 1,038 Encoder 2 messages. The hardware input uses relative MIDI BF 56: clockwise 41/42/44/48, counterclockwise 3F/3E/3C/38. Earlier V22 native Scrub Forward/Rewind key-command bursts sometimes started normal playback without a Play press. V27 retains V24's AGL_SCRUB and AGL_SCRUBSTATUS route; directional asymmetry remains unresolved.

Relevant next directions include investigating Logic's Scrub by MIDI value (-2-) command, characterizing AGL_SCRUB relative value semantics, and finding a host-supported scrub release mechanism that works without a permanent background helper.

Please include the exact controller model, Logic version, stopped/playing state, turning direction, audible behavior, observed playhead movement, and reproducible MIDI messages when opening an issue or pull request.

## Source and provenance

The **history/** directory preserves earlier Lua experiments and diagnostic sources for reference. Its historical labels do not mean those versions are fully functional. The repository's main purpose is to share and improve the controller modifications, not to reconstruct every command run during development.

The original Logic controller integration comes from Focusrite/Novation. No separate upstream open-source license was identified in the provided Lua file; **the legal status of redistribution of the vendor code remains unverified**. The patch displays our changes separately from the complete file. This project is unofficial, experimental, and not endorsed by Novation or Apple.

[Official Launchkey MK4 Logic Pro setup guide](https://support.novationmusic.com/hc/en-gb/articles/17051149371026-Launchkey-MK4-Logic-Pro-Setup)
