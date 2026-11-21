# Logic 13 migration

Pre-upgrade system at freeze: Mac mini, macOS 27.2.1, Logic Pro Creator Studio version 12.3.1, app bundle identifier com.apple.mobilelogic. Logic Pro 13.0 was released November 5, 2026 for the Creator Studio and standalone editions. Continued general controller support does not guarantee identical behavior of this custom script.

## Preserved local artifacts

The Mac mini stores an APFS frozen snapshot:
~/Music/Audio Music Apps/LaunchkeyMiniMK4_37_FROZEN_PRE_LOGIC13_20261120

This includes the complete 1.4 GB modification workspace with historical audio-project and private preference backups. The CurrentInstalledAndPreferences folder holds the exact installed V24 Lua file and the binary Logic preference backups. A separate copied Logic Pro Creator Studio 12.3.1 app bundle is included, with an 86,933-file inventory and sizes matched to the pre-upgrade bundle.

These personal and binary backups are intentionally excluded from the public GitHub repository.

## Upgrade and post-upgrade checks

1. Save and quit Logic. Retain the current Logic project and prior backups.
2. Upgrade the existing Creator Studio app using the macOS App Store. Avoid changing controller or project settings at the same time.
3. Compare the new app version and the actual controller script file checksum, as the system MIDI script directory may be touched by app updates.
4. Inspect Logic's Control Surfaces setting: correct model, online, updated script assignments. Avoid resetting the saved controller database without a verified need.
5. Validate the locked features before any fresh Encoder 2 changes: Encoder 1, all encoder order/labels, default Transport mode, stationary bar:beat at stop and play, other transport controls.
6. Only then resume independent investigation of Encoder 2 in both directions and audible scrubbing.

References:
https://support.apple.com/en-euro/109503
https://support.apple.com/en-gb/125075
https://support.novationmusic.com/hc/en-gb/articles/17051149371026-Launchkey-MK4-Logic-Pro-Setup
