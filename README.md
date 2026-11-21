# Launchkey Mini MK4 37 × Logic Pro — transport encoder improvements

Community-facing, experimental modifications to the **Novation Launchkey Mini MK4 37-key** Logic Pro Lua control-surface script. The aim is to improve the transport encoders and OLED, and to find a reliable implementation of native audible scrubbing with other Launchkey users.

**Status: partially working, work in progress (V24, November 20, 2026).** The navigation and transport-display improvements below worked on the development setup. **Encoder 2 audible scrubbing is still incorrect.** V24 is an experimental development snapshot and should not be treated as a stable release.

## What works and what does not

| Feature | Current state |
|---|---|
| Encoder 1: Position | Working in observed tests: playhead movement and temporary Position display |
| Default encoder mode | Working: Transport selected at controller initialization |
| Stationary OLED | Working in observed tests: Transport bar:beat updates as Logic's playhead moves |
| Encoder order | Preserved: Position, Scrub, Zoom, Loop Start, Loop End, Marker, Not Used, Tempo |
| Encoder 2: Scrub | **Unresolved**: counterclockwise nearly correct; clockwise incorrect; scrub state may remain active |
| Other models / Logic versions | Untested compatibility; this particular Lua script is for the 37-key Mini |

Development setup: Logic Pro Creator Studio 12.3.1, macOS 27.2.1, Launchkey Mini MK4 37. Logic Pro 13 compatibility has **not** been tested for this custom revision.

## Start here

- **[How to try it and contribute](docs/TRY_AND_CONTRIBUTE.md)** — installation, restoration, feature mapping, known failures, useful bug reports.
- **[Modification patch](patches/launchkey-mini-mk4-37-v24.patch)** — a unified diff against the exact original Novation script used for development; application verified byte-for-byte.
- **[Experimental script V24](config.lua)** — current snapshot, including the still-broken Encoder 2 mapping.
- **[Technical findings](docs/STATUS_AND_NEXT_STEPS.md)** — physical MIDI results, Logic scrub assignments, and alternative strategies.
- **[Working-feature contract](docs/LOCKED_BEHAVIOR.md)** — behavior that an improved scrub implementation should preserve.

If you want just the reliable improvements in a different vendor-script revision, review and adapt the patch sections relevant to Position, startup Transport mode, and the Transport display. Do not blindly transplant the V24 scrub section.

## Important Logic configuration

**Encoder 1 depends on Logic's Nudge Value.** Its Lua mapping invokes the native Forward/Rewind by Nudge Value commands (IDs 2595/2594). Set **Nudge Value to Beat** (default shortcut **Control-Option-B**) for the one-beat navigation behavior tested here. The Lua script does not change that preference.

Logic persists controller mappings separately in `com.apple.logic.pro.cs`. V24 registers its named assignments via the Lua controller script; the community installation does not require copying another person's binary assignments file or manually learning scrub commands. In particular, **never manually map Scrub Rewind to MIDI `B0 73 7F`**: that is the Launchkey's Play-button message. Such an experimental assignment existed on the test Mac and was removed. See the [setup and cleanup details](docs/TRY_AND_CONTRIBUTE.md#logic-preferences-and-controller-assignments).

## Help solve Encoder 2 scrubbing

A physical capture recorded 1,038 Encoder 2 messages. The hardware input uses relative MIDI BF 56: clockwise 41/42/44/48, counterclockwise 3F/3E/3C/38. Earlier V22 native Scrub Forward/Rewind key-command bursts sometimes started normal playback without a Play press. V24 uses AGL_SCRUB and AGL_SCRUBSTATUS; directional asymmetry remains unresolved.

Relevant next directions include investigating Logic's Scrub by MIDI value (-2-) command, characterizing AGL_SCRUB relative value semantics, and finding a host-supported scrub release mechanism that works without a permanent background helper.

Please include the exact controller model, Logic version, stopped/playing state, turning direction, audible behavior, observed playhead movement, and reproducible MIDI messages when opening an issue or pull request.

## Source and provenance

The **history/** directory preserves earlier Lua experiments and diagnostic sources for reference. Its historical labels do not mean those versions are fully functional. The repository's main purpose is to share and improve the controller modifications, not to reconstruct every command run during development.

The original Logic controller integration comes from Focusrite/Novation. No separate upstream open-source license was identified in the provided Lua file; **the legal status of redistribution of the vendor code remains unverified**. The patch displays our changes separately from the complete file. This project is unofficial, experimental, and not endorsed by Novation or Apple.

[Official Launchkey MK4 Logic Pro setup guide](https://support.novationmusic.com/hc/en-gb/articles/17051149371026-Launchkey-MK4-Logic-Pro-Setup)
