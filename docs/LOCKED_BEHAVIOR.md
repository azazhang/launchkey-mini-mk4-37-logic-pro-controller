# Frozen behavioral contract — do not regress

Freeze date: November 20, 2026. Installed revision: V27_LOGIC13_HW_TRANSPORT_POST_INIT_RESYNC_2026_11_20. Historical V26 and V24 references are retained.

| Control / feature | Preservation requirement |
|---|---|
| Encoder 1 / Position | Bounded forward/backward playhead movement; Position temporary screen; no unwanted scrub mode |
| Encoder 2 / Scrub | Still unsolved. Intended real bidirectional audible scrubbing, safe Play/Stop and playback restoration |
| Encoder 3 | Zoom |
| Encoder 4 | Loop Start |
| Encoder 5 | Loop End |
| Encoder 6 | Marker |
| Encoder 7 | Not Used |
| Encoder 8 | Tempo |
| Default startup | Transport selected in Logic host Encoder zone and reasserted on Launchkey hardware after initialization; observed working after one Logic 13 cold restart |
| Stationary display | Transport bar:beat title stays current through playback, stopping, and playhead navigation |
| Playback buttons | Play and Stop work normally; turning Encoder 2 must not unexpectedly toggle Play |

Implementation anchors: TRANSPORT_ENCODER_NAMES, encoderMode = MODE.encoderTransport, CC_ENCODERMODE with value 0x05, the BF 55 Encoder 1 handler, musical-position feedback and stationary Transport title logic.

## Frozen checksums

- Current installed V27: cd87b106b670c953d41101082cf8f4727a61650023ab194fdc64873719c0c8f8
- Historical V26: 383f77167304739f18363652dcbe2fedbb276886e7e37d70f80c0d0b20725faf
- Historical V24: 30fc11285d7053d0dcc3500ce7b23fa306cf9f00025b8c129e072d32cd8a6c3d
- V22 fallback: 3bfb17200963a23a67df5dc021fcf8cd36e73124e3dbfa6a2032bff426a2f35d
- V19 historical: 6c697838aa761d263ce25e5d548118af56be2b203a852003578c1f64b28a1fe0
- V18 historical: 0bd4564870b4a0e4fcb7146e73be424195b1571e9713d64d1abc990947334a88
- Original source reference: 4ec565815460156f348301e774576cecd975fa25d521d6e8f25185635faeb3b7

Run python3 tests/verify_contract.py to check frozen code files and relevant static invariants. Afterwards, physically verify all preserved features, audible scrub direction, Play/Stop and temporary displays. Static testing alone cannot prove audio behavior.
