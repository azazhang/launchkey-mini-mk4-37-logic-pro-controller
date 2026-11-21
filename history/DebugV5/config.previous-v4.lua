-- Port names
DAW_IN = 'DAW In'
DAW_OUT = 'DAW Out'

-- SKU specific settings
HAS_FADERS = false
DEVICE_NAME = 'Launchkey Mini MK4 37'
DEVICE_PID_1 = 2
DEVICE_PID_2 = 19
IS_MINI = true

-- Control Surface Constants
BRIGHTNESS = {
  off = 0x00,
  dim = 0x20,
  bright = 0x7f,
}

MAX_SENDS = 12
MAX_PLUGIN_PAGES = 2

MODE = {
  global = 'Global',
  shift = 'Shift',
  plugin1 = 'Smart Controls,1-8',
  plugin2 = 'Smart Controls,9-12',
  encoderVolume = 'Mixer,Volume',
  encoderTransport = 'Encoder Transport',
  encoderOther = 'Encoder Other',
  pan = 'Mixer,Pan',
  eq = 'Mixer,EQ',
  sends1 = 'Sends,Slot 1',
  sends2 = 'Sends,Slot 2',
  sends3 = 'Sends,Slot 3',
  sends4 = 'Sends,Slot 4',
  sends5 = 'Sends,Slot 5',
  sends6 = 'Sends,Slot 6',
  sends7 = 'Sends,Slot 7',
  sends8 = 'Sends,Slot 8',
  sends9 = 'Sends,Slot 9',
  sends10 = 'Sends,Slot 10',
  sends11 = 'Sends,Slot 11',
  sends12 = 'Sends,Slot 12',
  transport = 'Transport',
  shiftTransport = 'Shift Transport',
  padDrum = 'Drum',
  padSelectArm = 'Pad Function,Select/Arm',
  padSoloMute = 'Pad Function,Solo/Mute',
  padOther = 'Pad Other',
  faderButtonArm = 'Button Mode,Arm',
  faderButtonSelect = 'Button Mode,Select',
  trackBank = 'Track Bank',
  liveLoops = 'Pad Function,Live Loops',
  shiftLiveLoops = 'Shift Live Loops'
}

DEFAULT_PAD_COLOR = 0xffffff -- white

PAD_COLORS = {
  [CS_RECRDY] = { [0] = 7, [1] = 5 },
  [AUMUTE] = { [0] = 39, [1] = 37 },
  [AUSOLO] = { [0] = 15, [1] = 13 },
  [CS_SELECT] = { [0] = 1, [1] = 3 },
}

TRANSPORT_ENCODER_NAMES = {
  [0x15] = 'Playhead',
  [0x16] = 'Audio Scrub',
  [0x17] = 'Zoom',
  [0x18] = 'Loop Start',
  [0x19] = 'Loop End',
  [0x1a] = 'Marker',
  [0x1b] = 'Not Used',
  [0x1c] = 'Tempo'
};

CC_PADMODE = 0x1d
CC_PADMODE_LEGACY = 0x40

CC_ENCODERMODE = 0x1e
CC_ENCODERMODE_LEGACY = 0x41

CC_FADERMODE = 0x1f
CC_FADERMODE_LEGACY = 0x42

CC_SHIFT = 0x3f
CC_SHIFT_LEGACY = 0x48

-- Control IDs. These are retrieved from the control names. Use these IDs for comparison with controlID
kControlIDCaptureMidi = 0
kControlIDQuantize = 1
kControlIDClick = 2
kControlIDUndo = 3
kControlIDPlay = 4
kControlIDStop = 5
kControlIDRecord = 6
kControlIDLoop = 7
kControlIDTrackLeft = 8
kControlIDTrackRight = 9
kControlIDEncoder1 = 10
kControlIDEncoder2 = 11
kControlIDEncoder3 = 12
kControlIDEncoder4 = 13
kControlIDEncoder5 = 14
kControlIDEncoder6 = 15
kControlIDEncoder7 = 16
kControlIDEncoder8 = 17
kControlIDPad1 = 18
kControlIDPad2 = 19
kControlIDPad3 = 20
kControlIDPad4 = 21
kControlIDPad5 = 22
kControlIDPad6 = 23
kControlIDPad7 = 24
kControlIDPad8 = 25
kControlIDPad9 = 26
kControlIDPad10 = 27
kControlIDPad11 = 28
kControlIDPad12 = 29
kControlIDPad13 = 30
kControlIDPad14 = 31
kControlIDPad15 = 32
kControlIDPad16 = 33
kControlIDSessionModeToggle = 34
kControlIDMasterFader = 35
kControlIDFader1 = 36
kControlIDFader2 = 37
kControlIDFader3 = 38
kControlIDFader4 = 39
kControlIDFader5 = 40
kControlIDFader6 = 41
kControlIDFader7 = 42
kControlIDFader8 = 43
kControlIDArmSelect = 44
kControlIDFaderPad1 = 45
kControlIDFaderPad2 = 46
kControlIDFaderPad3 = 47
kControlIDFaderPad4 = 48
kControlIDFaderPad5 = 49
kControlIDFaderPad6 = 50
kControlIDFaderPad7 = 51
kControlIDFaderPad8 = 52

kControlIDPlugin = 53
kControlIDMixer = 54
kControlIDSends = 55
kControlIDTransport = 56
kControlIDEncoderCustom1 = 57
kControlIDEncoderCustom2 = 58
kControlIDEncoderCustom3 = 59
kControlIDEncoderCustom4 = 60

kControlIDDaw = 61
kControlIDDrum = 62
kControlIDUserChord = 63
kControlIDArpPattern = 64
kControlIDPadCustom1 = 65
kControlIDPadCustom2 = 66
kControlIDPadCustom3 = 67
kControlIDPadCustom4 = 68

kControlIDEncoderPageUp = 69
kControlIDEncoderPageDown = 70
kControlIDPadPageUp = 71
kControlIDPadPageDown = 72

kControlIDShift = 73
kControlIDFunction = 74

kControlIDTrackName1 = 75
kControlIDTrackName2 = 76
kControlIDTrackName3 = 77
kControlIDTrackName4 = 78
kControlIDTrackName5 = 79
kControlIDTrackName6 = 80
kControlIDTrackName7 = 81
kControlIDTrackName8 = 82

kControlIDNextMarker = 83
kControlIDPreviousMarker = 84

kControlIDFocussedTrack = 85

kControlIDTrackLeftShift = 86
kControlIDTrackRightShift = 87

kControlIDSubPagePlugin1 = 88
kControlIDSubPagePlugin2 = 89
kControlIDSubPageMixerVolume = 90
kControlIDSubPageMixerPan = 91
kControlIDSubPageMixerEq = 92
kControlIDSubPageSends1 = 93
kControlIDSubPageSends2 = 94
kControlIDSubPageSends3 = 95
kControlIDSubPageSends4 = 96
kControlIDSubPageSends5 = 97
kControlIDSubPageSends6 = 98
kControlIDSubPageSends7 = 99
kControlIDSubPageSends8 = 100
kControlIDSubPageSends9 = 101
kControlIDSubPageSends10 = 102
kControlIDSubPageSends11 = 103
kControlIDSubPageSends12 = 104

-- Debug function to dump tables
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-------------------------------------------------------------------------------
-- Gets the midi messages for all encoders to rotate by zero
-------------------------------------------------------------------------------
function getAllEncodersZeroRotationMidi()
  local midi = {}
  for i=0x55,0x5c do
    table.insert(midi, 0xbf)
    table.insert(midi, i)
    table.insert(midi, 0x00)
  end
  return midi
end

-------------------------------------------------------------------------------
-- Appends the sends assignments to all_assignments
-------------------------------------------------------------------------------
function getSendsAssignments(assignments)
  for i=1,MAX_SENDS do
    table.insert(assignments, {mode=MODE['sends' .. i]})
    if i ~= 1 then
      table.insert(assignments, {control='Encoder Page Up', setMode=MODE['sends' .. i-1], paramName='Sends ' .. i-1})
    end
    if i ~= MAX_SENDS then
      table.insert(assignments, {control='Encoder Page Down', setMode=MODE['sends' .. i+1], paramName='Sends ' .. i+1})
    end
    for j=1,8 do
      table.insert(assignments, {control='Encoder ' .. j, faderBankTrack=j-1, trackParam=AUSEND1, paramOffset=i-1, paramName='@tp,@tn'})
    end
  end
end

controls = {
  [0] = {name='Capture Midi', controlID=0, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x4A,MIDI_LSB}, fbType=FB_MIN}, -- kControlIDCaptureMidi
  [1] = {name='Quantize', controlID=1, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x4B,MIDI_LSB}, fbType=FB_MIN}, -- kControlIDQuantize
  [2] = {name='Click', controlID=2, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x4C,MIDI_LSB}}, -- kControlIDClick
  [3] = {name='Undo', controlID=3, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x4D,MIDI_LSB}}, -- kControlIDUndo
  [4] = {name='Play', controlID=4, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x73,MIDI_LSB}}, -- kControlIDPlay
  [5] = {name='Stop', controlID=5, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x74,MIDI_LSB}, fbType=FB_MIN}, -- kControlIDStop
  [6] = {name='Record', controlID=6, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x75,MIDI_LSB}}, -- kControlIDRecord
  [7] = {name='Loop', controlID=7, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x76,MIDI_LSB}}, -- kControlIDLoop

  -- use 0x7f for the MIDI value, otherwise the live loops bank move on both down and up
  [8] = {name='Track Left', controlID=8, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x67,0x7f}, fbType=FB_HOR_SINGLE}, -- kControlIDTrackLeft
  [9] = {name='Track Right', controlID=9, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x66,0x7f}, fbType=FB_HOR_SINGLE}, -- kControlIDTrackRight

  [10] = {name='Encoder 1', controlID=10, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x55,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement, hasFeedback=true, hasFeedbackValueText=true}, -- kControlIDEncoder1
  [11] = {name='Encoder 2', controlID=11, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x56,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder2
  [12] = {name='Encoder 3', controlID=12, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x57,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder3
  [13] = {name='Encoder 4', controlID=13, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x58,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder4
  [14] = {name='Encoder 5', controlID=14, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x59,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder5
  [15] = {name='Encoder 6', controlID=15, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x5A,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder6
  [16] = {name='Encoder 7', controlID=16, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x5B,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder7
  [17] = {name='Encoder 8', controlID=17, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x5C,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, midiType=Relative2C, valueMode=kAssignRelative, valueFormat=kAssign2sComplement}, -- kControlIDEncoder8

  [18] = {name='Pad 1', controlID=18, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x60,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad1
  [19] = {name='Pad 2', controlID=19, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x61,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad2
  [20] = {name='Pad 3', controlID=20, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x62,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad3
  [21] = {name='Pad 4', controlID=21, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x63,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad4
  [22] = {name='Pad 5', controlID=22, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x64,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad5
  [23] = {name='Pad 6', controlID=23, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x65,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad6
  [24] = {name='Pad 7', controlID=24, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x66,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad7
  [25] = {name='Pad 8', controlID=25, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x67,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad8
  [26] = {name='Pad 9', controlID=26, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x70,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad9
  [27] = {name='Pad 10', controlID=27, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x71,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad10
  [28] = {name='Pad 11', controlID=28, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x72,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad11
  [29] = {name='Pad 12', controlID=29, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x73,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad12
  [30] = {name='Pad 13', controlID=30, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x74,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad13
  [31] = {name='Pad 14', controlID=31, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x75,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad14
  [32] = {name='Pad 15', controlID=32, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x76,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad15
  [33] = {name='Pad 16', controlID=33, inport=DAW_OUT, outport=DAW_IN, midi={0x90,0x77,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDPad16

  [34] = {name='Session Mode Toggle', controlID=34}, -- kControlIDSessionModeToggle
  [35] = {name='Master Fader', inport=DAW_OUT, outport=DAW_IN, controlID=35, midi={0xBF,0x0D,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDMasterFader

  [36] = {name='Fader 1', controlID=36, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x05,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader1
  [37] = {name='Fader 2', controlID=37, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x06,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader2
  [38] = {name='Fader 3', controlID=38, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x07,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader3
  [39] = {name='Fader 4', controlID=39, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x08,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader4
  [40] = {name='Fader 5', controlID=40, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x09,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader5
  [41] = {name='Fader 6', controlID=41, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x0A,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader6
  [42] = {name='Fader 7', controlID=42, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x0B,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader7
  [43] = {name='Fader 8', controlID=43, inport=DAW_OUT, outport=DAW_IN, midi={0xBF,0x0C,MIDI_LSB}, fbType=FB_HOR_LTOR_BAR, valueMode=kAssignScaled}, -- kControlIDFader8
  [44] = {name='Arm/Select',  controlID=44, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x2D,MIDI_LSB}, fbType=FB_HOR_SINGLE, maxVal=1}, -- kControlIDArmSelect

  [45] = {name='Fader Pad 1', controlID=45, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x25,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad1
  [46] = {name='Fader Pad 2', controlID=46, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x26,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad2
  [47] = {name='Fader Pad 3', controlID=47, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x27,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad3
  [48] = {name='Fader Pad 4', controlID=48, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x28,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad4
  [49] = {name='Fader Pad 5', controlID=49, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x29,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad5
  [50] = {name='Fader Pad 6', controlID=50, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x2A,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad6
  [51] = {name='Fader Pad 7', controlID=51, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x2B,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad7
  [52] = {name='Fader Pad 8', controlID=52, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x2C,MIDI_LSB}, valueMode=kAssignRotate}, -- kControlIDFaderPad8

  [53] = {name='Plugin', controlID=53, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE,0x02}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPlugin
  [54] = {name='Mixer', controlID=54, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE,0x01}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDMixer
  [55] = {name='Sends', controlID=55, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE,0x04}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDSends
  [56] = {name='Transport', controlID=56, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE,0x05}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDTransport
  [57] = {name='Encoder Custom 1', controlID=57, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE,0x06}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom1
  [58] = {name='Encoder Custom 2', controlID=58, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE,0x07}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom2
  [59] = {name='Encoder Custom 3', controlID=59, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE,0x08}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom3
  [60] = {name='Encoder Custom 4', controlID=60, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE,0x09}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom4

  [61] = {name='DAW', controlID=61, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE,0x02}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDDaw
  [62] = {name='Drum', controlID=62, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE,0x0f}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDDrum
  [63] = {name='User Chord', controlID=63, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_PADMODE,0x04}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDUserChord
  [64] = {name='Arp Pattern', controlID=64, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_PADMODE,0x0d}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDArpPattern
  [65] = {name='Pad Custom 1', controlID=65, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_PADMODE,0x05}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom1
  [66] = {name='Pad Custom 2', controlID=66, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_PADMODE,0x06}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom2
  [67] = {name='Pad Custom 3', controlID=67, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_PADMODE,0x07}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom3
  [68] = {name='Pad Custom 4', controlID=68, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_PADMODE,0x08}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom4

  [69] = {name='Encoder Page Up', controlID=69, inport=DAW_OUT, outport=DAW_IN, maxVal=1, midi={0xB0,0x33,MIDI_LSB}}, -- kControlIDEncoderPageUp
  [70] = {name='Encoder Page Down', controlID=70, inport=DAW_OUT, outport=DAW_IN, maxVal=1, midi={0xB0,0x34,MIDI_LSB}}, -- kControlIDEncoderPageDown
  [71] = {name='Pad Page Up', controlID=71, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x6A,MIDI_LSB}}, -- kControlIDPadPageUp
  [72] = {name='Pad Page Down', controlID=72, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x6B,MIDI_LSB}}, -- kControlIDPadPageDown

  [73] = {name='Shift', controlID=73, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_SHIFT,MIDI_LSB}}, -- kControlIDShift

  [74] = {name='Function', controlID=74, midi={0xB0, 0x69, MIDI_LSB}, fbType=FB_HOR_SINGLE, maxVal=1, inport=DAW_OUT, outport=DAW_IN}, --kControlIDFunction

  -- Placeholders for track names
  [75] = {name='Track 1', controlID=75}, -- kControlIDTrackName1
  [76] = {name='Track 2', controlID=76}, -- kControlIDTrackName2
  [77] = {name='Track 3', controlID=77}, -- kControlIDTrackName3
  [78] = {name='Track 4', controlID=78}, -- kControlIDTrackName4
  [79] = {name='Track 5', controlID=79}, -- kControlIDTrackName5
  [80] = {name='Track 6', controlID=80}, -- kControlIDTrackName6
  [81] = {name='Track 7', controlID=81}, -- kControlIDTrackName7
  [82] = {name='Track 8', controlID=82}, -- kControlIDTrackName8

  -- Fake buttons used for next and previous marker selection
  [83] = {name='Next Marker', controlID=83, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x4e,MIDI_LSB}}, -- kControlIDNextMarker
  [84] = {name='Previous Marker', controlID=84, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x4f,MIDI_LSB}}, -- kControlIDPreviousMarker

  [85] = {name='Focussed Track', controlID=85}, -- kControlIDFocussedTrack  

  [86] = {name='Track Left Shift', controlID=86, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x6d,0x7f}, fbType=FB_HOR_SINGLE}, -- kControlIDTrackLeftShift
  [87] = {name='Track Right Shift', controlID=87, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x6c,0x7f}, fbType=FB_HOR_SINGLE}, -- kControlIDTrackRightShift

  -- Fake controls to support persistent sub pages
  [88] = {name='Encoder Plugin 1', controlID=88, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x00}}, -- kControlIDSubPagePlugin1
  [89] = {name='Encoder Plugin 2', controlID=89, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x01}}, -- kControlIDSubPagePlugin2
  [90] = {name='Encoder Mixer Volume', controlID=90, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x02}}, -- kControlIDSubPageMixerVolume
  [91] = {name='Encoder Mixer Pan', controlID=91, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x03}}, -- kControlIDSubPageMixerPan
  [92] = {name='Encoder Mixer Eq', controlID=92, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x04}}, -- kControlIDSubPageMixerEq
  [93] = {name='Encoder Sends 1', controlID=93, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x05}}, -- kControlIDSubPageSends1
  [94] = {name='Encoder Sends 2', controlID=94, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x06}}, -- kControlIDSubPageSends2
  [95] = {name='Encoder Sends 3', controlID=95, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x07}}, -- kControlIDSubPageSends3
  [96] = {name='Encoder Sends 4', controlID=96, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x08}}, -- kControlIDSubPageSends4
  [97] = {name='Encoder Sends 5', controlID=97, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x09}}, -- kControlIDSubPageSends5
  [98] = {name='Encoder Sends 6', controlID=98, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x0a}}, -- kControlIDSubPageSends6
  [99] = {name='Encoder Sends 7', controlID=99, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x0b}}, -- kControlIDSubPageSends7
  [100] = {name='Encoder Sends 8', controlID=100, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x0c}}, -- kControlIDSubPageSends8
  [101] = {name='Encoder Sends 9', controlID=101, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x0d}}, -- kControlIDSubPageSends9
  [102] = {name='Encoder Sends 10', controlID=102, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x0e}}, -- kControlIDSubPageSends10
  [103] = {name='Encoder Sends 11', controlID=103, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x0f}}, -- kControlIDSubPageSends11
  [104] = {name='Encoder Sends 12', controlID=104, inport=DAW_OUT, outport=DAW_IN, midi={0xbd,0x00,0x10}}, -- kControlIDSubPageSends12

  -- Duplicate of the encoder modes with legacy CC number.
  [105] = {name='Legacy Plugin', controlID=105, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE_LEGACY,0x02}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPlugin
  [106] = {name='Legacy Mixer', controlID=106, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE_LEGACY,0x01}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDMixer
  [107] = {name='Legacy Sends', controlID=107, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE_LEGACY,0x04}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDSends
  [108] = {name='Legacy Transport', controlID=108, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_ENCODERMODE_LEGACY,0x05}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDTransport
  [109] = {name='Legacy Encoder Custom 1', controlID=109, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE_LEGACY,0x06}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom1
  [110] = {name='Legacy Encoder Custom 2', controlID=110, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE_LEGACY,0x07}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom2
  [111] = {name='Legacy Encoder Custom 3', controlID=111, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE_LEGACY,0x08}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom3
  [112] = {name='Legacy Encoder Custom 4', controlID=112, inport=DAW_OUT, outport=DAW_IN, midi={0xb6,CC_ENCODERMODE_LEGACY,0x09}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDEncoderCustom4

  -- Duplicate of the pad modes with legacy CC number.
  [113] = {name='Legacy DAW', controlID=113, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x02}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDDaw
  [114] = {name='Legacy Drum', controlID=114, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x0f}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDDrum
  [115] = {name='Legacy User Chord', controlID=115, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x04}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDUserChord
  [116] = {name='Legacy Arp Pattern', controlID=116, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x0d}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDArpPattern
  [117] = {name='Legacy Pad Custom 1', controlID=117, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x05}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom1
  [118] = {name='Legacy Pad Custom 2', controlID=118, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x06}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom2
  [119] = {name='Legacy Pad Custom 3', controlID=119, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x07}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom3
  [120] = {name='Legacy Pad Custom 4', controlID=120, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_PADMODE_LEGACY,0x08}, maxVal=1, fbType=FB_HOR_SINGLE}, -- kControlIDPadCustom4

  -- Legacy shift button
  [121] = {name='Legacy Shift', controlID=121, inport=DAW_OUT, outport=DAW_IN, midi={0xB6,CC_SHIFT_LEGACY,MIDI_LSB}}, -- kControlIDShift
  -- Encoder 1 transport navigation via key commands instead of direct clock edits.
  [122] = {name='Playhead Forward Step', controlID=122, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x5D,MIDI_LSB}},
  [123] = {name='Playhead Rewind Step', controlID=123, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x5E,MIDI_LSB}},
  -- Read-only probes, never receiving physical MIDI from the controller.
  [125] = {name='Diagnostic Clock Bar', controlID=125, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x62,MIDI_LSB}, hasFeedback=true, hasFeedbackValueText=true},
  [126] = {name='Diagnostic Clock Beat', controlID=126, inport=DAW_OUT, outport=DAW_IN, midi={0xB0,0x63,MIDI_LSB}, hasFeedback=true, hasFeedbackValueText=true},
}

all_assignments = {

  {zone='Global'},
  ----------------------------
  {mode=MODE.global},
  {control='Shift', setMode=MODE.shift},
  {control='Legacy Shift', setMode=MODE.shift},
  {control='Track 1', faderBankTrack=0, trackParam=CS_COLOR},
  {control='Track 2', faderBankTrack=1, trackParam=CS_COLOR},
  {control='Track 3', faderBankTrack=2, trackParam=CS_COLOR},
  {control='Track 4', faderBankTrack=3, trackParam=CS_COLOR},
  {control='Track 5', faderBankTrack=4, trackParam=CS_COLOR},
  {control='Track 6', faderBankTrack=5, trackParam=CS_COLOR},
  {control='Track 7', faderBankTrack=6, trackParam=CS_COLOR},
  {control='Track 8', faderBankTrack=7, trackParam=CS_COLOR},
  {control='Track 1', faderBankTrack=0, trackParam=CS_SELECT},
  {control='Track 2', faderBankTrack=1, trackParam=CS_SELECT},
  {control='Track 3', faderBankTrack=2, trackParam=CS_SELECT},
  {control='Track 4', faderBankTrack=3, trackParam=CS_SELECT},
  {control='Track 5', faderBankTrack=4, trackParam=CS_SELECT},
  {control='Track 6', faderBankTrack=5, trackParam=CS_SELECT},
  {control='Track 7', faderBankTrack=6, trackParam=CS_SELECT},
  {control='Track 8', faderBankTrack=7, trackParam=CS_SELECT},
  {control='Focussed Track', CSTrack=true, trackParam=CS_COLOR},
  {control='Focussed Track', CSTrack=true, trackParam=CS_NAME},
  {control='Track Left', keyCmd=1272}, -- Select Previous Track
  {control='Track Right', keyCmd=1273}, -- Select Next Track

  {mode=MODE.shift},
  {control='Shift', setMode=MODE.global},
  {control='Legacy Shift', setMode=MODE.global},
  {control='Track Left Shift', CSGroupObj=ACS_FADERBANK, bankType=ABT_BYBANK, valueMode=kAssignRelative, maxVal=1, multiply=-1.0, paramName=MODE.trackBank},
  {control='Track Right Shift', CSGroupObj=ACS_FADERBANK, bankType=ABT_BYBANK, valueMode=kAssignRelative, maxVal=1, paramName=MODE.trackBank},
  {control='Track Right', keyCmd=1272}, -- Select Previous Track (for mini)
  {control='Track Left', keyCmd=1273}, -- Select Next Track (for mini)
  {control='Focussed Track', CSTrack=true, trackParam=CS_COLOR}, -- (for mini to cache track colour when shift is down)
  {control='Focussed Track', CSTrack=true, trackParam=CS_NAME}, -- (for mini to display track name when shift is down)
  
  --------------------------------------------------------------
  {zone='Transport'},

  {mode=MODE.transport},
  {control='Shift', setMode=MODE.shiftTransport},
  {control='Legacy Shift', setMode=MODE.shiftTransport},
  {control='Capture Midi', keyCmd=542}, -- Capture as Recording
  {control='Quantize', keyCmd=110}, -- Quantize Selected Regions/Cells/Events
  {control='Click', keyCmd=474}, -- Toggle Metronome Click
  {control='Undo', keyCmd=761}, -- Undo
  {control='Play', keyCmd=535}, -- Play or Stop
  {control='Stop', keyCmd=5}, -- Stop
  {control='Record', keyCmd=7}, -- Record
  {control='Loop', keyCmd=15}, -- Cycle Mode

  {mode=MODE.shiftTransport},
  {control='Shift', setMode=MODE.transport},
  {control='Legacy Shift', setMode=MODE.transport},
  {control='Undo', keyCmd=796}, -- Redo
  {control='Stop', keyCmd=5}, -- Stop
  {control='Capture Midi', keyCmd=542}, -- Capture as Recording

  --------------------------------------------------------------
  {zone='Pads'},
  {control='DAW', setMode=MODE.padSelectArm, paramName='DAW'},
  {control='Drum', setMode=MODE.padDrum, paramName='Drum'},
  {control='Arp Pattern', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Pad Custom 1', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Pad Custom 2', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Pad Custom 3', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Pad Custom 4', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Legacy DAW', setMode=MODE.padSelectArm, paramName='DAW'},
  {control='Legacy Drum', setMode=MODE.padDrum, paramName='Drum'},
  {control='Legacy Arp Pattern', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Legacy Pad Custom 1', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Legacy Pad Custom 2', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Legacy Pad Custom 3', setMode=MODE.padOther, paramName='Pad Other'},
  {control='Legacy Pad Custom 4', setMode=MODE.padOther, paramName='Pad Other'},

  {mode=MODE.padSelectArm},
  {control='Pad Page Down', setMode=MODE.padSoloMute},
  {control='Function', setMode=MODE.liveLoops},
  {control='Pad 1', faderBankTrack=0, trackParam=CS_SELECT},
  {control='Pad 2', faderBankTrack=1, trackParam=CS_SELECT},
  {control='Pad 3', faderBankTrack=2, trackParam=CS_SELECT},
  {control='Pad 4', faderBankTrack=3, trackParam=CS_SELECT},
  {control='Pad 5', faderBankTrack=4, trackParam=CS_SELECT},
  {control='Pad 6', faderBankTrack=5, trackParam=CS_SELECT},
  {control='Pad 7', faderBankTrack=6, trackParam=CS_SELECT},
  {control='Pad 8', faderBankTrack=7, trackParam=CS_SELECT},
  {control='Pad 1', faderBankTrack=0, trackParam=CS_COLOR},
  {control='Pad 2', faderBankTrack=1, trackParam=CS_COLOR},
  {control='Pad 3', faderBankTrack=2, trackParam=CS_COLOR},
  {control='Pad 4', faderBankTrack=3, trackParam=CS_COLOR},
  {control='Pad 5', faderBankTrack=4, trackParam=CS_COLOR},
  {control='Pad 6', faderBankTrack=5, trackParam=CS_COLOR},
  {control='Pad 7', faderBankTrack=6, trackParam=CS_COLOR},
  {control='Pad 8', faderBankTrack=7, trackParam=CS_COLOR},
  {control='Pad 9',  faderBankTrack=0, trackParam=CS_RECRDY},
  {control='Pad 10', faderBankTrack=1, trackParam=CS_RECRDY},
  {control='Pad 11', faderBankTrack=2, trackParam=CS_RECRDY},
  {control='Pad 12', faderBankTrack=3, trackParam=CS_RECRDY},
  {control='Pad 13', faderBankTrack=4, trackParam=CS_RECRDY},
  {control='Pad 14', faderBankTrack=5, trackParam=CS_RECRDY},
  {control='Pad 15', faderBankTrack=6, trackParam=CS_RECRDY},
  {control='Pad 16', faderBankTrack=7, trackParam=CS_RECRDY},

  {mode=MODE.padSoloMute},
  {control='Pad Page Up', setMode=MODE.padSelectArm},
  {control='Function', setMode=MODE.liveLoops},
  {control='Pad 1', faderBankTrack=0, trackParam=AUSOLO},
  {control='Pad 2', faderBankTrack=1, trackParam=AUSOLO},
  {control='Pad 3', faderBankTrack=2, trackParam=AUSOLO},
  {control='Pad 4', faderBankTrack=3, trackParam=AUSOLO},
  {control='Pad 5', faderBankTrack=4, trackParam=AUSOLO},
  {control='Pad 6', faderBankTrack=5, trackParam=AUSOLO},
  {control='Pad 7', faderBankTrack=6, trackParam=AUSOLO},
  {control='Pad 8', faderBankTrack=7, trackParam=AUSOLO},
  {control='Pad 9',  faderBankTrack=0, trackParam=AUMUTE},
  {control='Pad 10', faderBankTrack=1, trackParam=AUMUTE},
  {control='Pad 11', faderBankTrack=2, trackParam=AUMUTE},
  {control='Pad 12', faderBankTrack=3, trackParam=AUMUTE},
  {control='Pad 13', faderBankTrack=4, trackParam=AUMUTE},
  {control='Pad 14', faderBankTrack=5, trackParam=AUMUTE},
  {control='Pad 15', faderBankTrack=6, trackParam=AUMUTE},
  {control='Pad 16', faderBankTrack=7, trackParam=AUMUTE},

  {mode=MODE.shiftLiveLoops},
  {control='Shift', setMode=MODE.liveLoops},
  {control='Legacy Shift', setMode=MODE.liveLoops},
  -- Duplicate block to work around the banking inconsistencies when entering and exiting liveloops and shift-liveloops
  {control='Function', setMode=MODE.padSelectArm},
  {control='Pad Page Up', keyCmd=1272},
  {control='Pad Page Down', keyCmd=1273},
  {control='Track Left', CSGroupObj=ACS_LIVELOOPBANK, bankType=ABT_BYONE, multiply=IS_MINI and 1.0 or -1.0, valueMode=kAssignRelative, exclusive=true},
  {control='Track Right', CSGroupObj=ACS_LIVELOOPBANK, bankType=ABT_BYONE, multiply=IS_MINI and -1.0 or 1.0, valueMode=kAssignRelative, exclusive=true},
  {control='Pad 1', trackParam=CS_LIVELOOP1, paramOffset=0, valueMode=kAssignDirect},
  {control='Pad 2', trackParam=CS_LIVELOOP1, paramOffset=1, valueMode=kAssignDirect},
  {control='Pad 3', trackParam=CS_LIVELOOP1, paramOffset=2, valueMode=kAssignDirect},
  {control='Pad 4', trackParam=CS_LIVELOOP1, paramOffset=3, valueMode=kAssignDirect},
  {control='Pad 5', trackParam=CS_LIVELOOP1, paramOffset=4, valueMode=kAssignDirect},
  {control='Pad 6', trackParam=CS_LIVELOOP1, paramOffset=5, valueMode=kAssignDirect},
  {control='Pad 7', trackParam=CS_LIVELOOP1, paramOffset=6, valueMode=kAssignDirect},
  {control='Pad 8', trackParam=CS_LIVELOOP1, paramOffset=7, valueMode=kAssignDirect},
  {control='Pad 9', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=0, valueMode=kAssignDirect},
  {control='Pad 10', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=1, valueMode=kAssignDirect},
  {control='Pad 11', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=2, valueMode=kAssignDirect},
  {control='Pad 12', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=3, valueMode=kAssignDirect},
  {control='Pad 13', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=4, valueMode=kAssignDirect},
  {control='Pad 14', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=5, valueMode=kAssignDirect},
  {control='Pad 15', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=6, valueMode=kAssignDirect},
  {control='Pad 16', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=7, valueMode=kAssignDirect},

  {mode=MODE.liveLoops},
  {control='Shift', setMode=MODE.shiftLiveLoops},
  {control='Legacy Shift', setMode=MODE.shiftLiveLoops},
  {control='Function', setMode=MODE.padSelectArm},
  {control='Pad Page Up', keyCmd=1272},
  {control='Pad Page Down', keyCmd=1273},
  {control='Track Left', CSGroupObj=ACS_LIVELOOPBANK, bankType=ABT_BYONE, multiply=-1.0, valueMode=kAssignRelative, exclusive=true},
  {control='Track Right', CSGroupObj=ACS_LIVELOOPBANK, bankType=ABT_BYONE, valueMode=kAssignRelative, exclusive=true},
  {control='Pad 1', trackParam=CS_LIVELOOP1, paramOffset=0, valueMode=kAssignDirect},
  {control='Pad 2', trackParam=CS_LIVELOOP1, paramOffset=1, valueMode=kAssignDirect},
  {control='Pad 3', trackParam=CS_LIVELOOP1, paramOffset=2, valueMode=kAssignDirect},
  {control='Pad 4', trackParam=CS_LIVELOOP1, paramOffset=3, valueMode=kAssignDirect},
  {control='Pad 5', trackParam=CS_LIVELOOP1, paramOffset=4, valueMode=kAssignDirect},
  {control='Pad 6', trackParam=CS_LIVELOOP1, paramOffset=5, valueMode=kAssignDirect},
  {control='Pad 7', trackParam=CS_LIVELOOP1, paramOffset=6, valueMode=kAssignDirect},
  {control='Pad 8', trackParam=CS_LIVELOOP1, paramOffset=7, valueMode=kAssignDirect},
  {control='Pad 9', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=0, valueMode=kAssignDirect},
  {control='Pad 10', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=1, valueMode=kAssignDirect},
  {control='Pad 11', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=2, valueMode=kAssignDirect},
  {control='Pad 12', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=3, valueMode=kAssignDirect},
  {control='Pad 13', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=4, valueMode=kAssignDirect},
  {control='Pad 14', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=5, valueMode=kAssignDirect},
  {control='Pad 15', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=6, valueMode=kAssignDirect},
  {control='Pad 16', globalObj=AGL_LIVELOOPSCOLUMN, liveLoopsColumn=7, valueMode=kAssignDirect},

  {mode=MODE.padDrum},

  {mode=MODE.padOther},


  --------------------------------------------------------------
  {zone='Faders'},
  {control='Master Fader', master=0, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 1', faderBankTrack=0, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 2', faderBankTrack=1, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 3', faderBankTrack=2, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 4', faderBankTrack=3, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 5', faderBankTrack=4, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 6', faderBankTrack=5, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 7', faderBankTrack=6, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Fader 8', faderBankTrack=7, trackParam=AUVOLUME, paramName='Volume,@tn'},

  --------------------------------------------------------------
  {zone='Fader Pads'},

  {mode=MODE.faderButtonArm},
  {control='Fader Pad 1', faderBankTrack=0, trackParam=CS_RECRDY},
  {control='Fader Pad 2', faderBankTrack=1, trackParam=CS_RECRDY},
  {control='Fader Pad 3', faderBankTrack=2, trackParam=CS_RECRDY},
  {control='Fader Pad 4', faderBankTrack=3, trackParam=CS_RECRDY},
  {control='Fader Pad 5', faderBankTrack=4, trackParam=CS_RECRDY},
  {control='Fader Pad 6', faderBankTrack=5, trackParam=CS_RECRDY},
  {control='Fader Pad 7', faderBankTrack=6, trackParam=CS_RECRDY},
  {control='Fader Pad 8', faderBankTrack=7, trackParam=CS_RECRDY},
  {control='Arm/Select', setMode=MODE.faderButtonSelect},

  {mode=MODE.faderButtonSelect},
  {control='Fader Pad 1', faderBankTrack=0, trackParam=CS_SELECT},
  {control='Fader Pad 2', faderBankTrack=1, trackParam=CS_SELECT},
  {control='Fader Pad 3', faderBankTrack=2, trackParam=CS_SELECT},
  {control='Fader Pad 4', faderBankTrack=3, trackParam=CS_SELECT},
  {control='Fader Pad 5', faderBankTrack=4, trackParam=CS_SELECT},
  {control='Fader Pad 6', faderBankTrack=5, trackParam=CS_SELECT},
  {control='Fader Pad 7', faderBankTrack=6, trackParam=CS_SELECT},
  {control='Fader Pad 8', faderBankTrack=7, trackParam=CS_SELECT},
  {control='Fader Pad 1', faderBankTrack=0, trackParam=CS_COLOR},
  {control='Fader Pad 2', faderBankTrack=1, trackParam=CS_COLOR},
  {control='Fader Pad 3', faderBankTrack=2, trackParam=CS_COLOR},
  {control='Fader Pad 4', faderBankTrack=3, trackParam=CS_COLOR},
  {control='Fader Pad 5', faderBankTrack=4, trackParam=CS_COLOR},
  {control='Fader Pad 6', faderBankTrack=5, trackParam=CS_COLOR},
  {control='Fader Pad 7', faderBankTrack=6, trackParam=CS_COLOR},
  {control='Fader Pad 8', faderBankTrack=7, trackParam=CS_COLOR},
  {control='Arm/Select', setMode=MODE.faderButtonArm},

  --------------------------------------------------------------
  {zone='Encoder'},
  {control='Plugin', setMode=MODE.plugin1, paramName='Plugin 1'},
  {control='Legacy Plugin', setMode=MODE.plugin1, paramName='Plugin 1'},
  {control='Encoder Plugin 1', setMode=MODE.plugin1},
  {control='Encoder Plugin 2', setMode=MODE.plugin2},
  {control='Mixer', setMode=MODE.encoderVolume, paramName='Volume'},
  {control='Legacy Mixer', setMode=MODE.encoderVolume, paramName='Volume'},
  {control='Encoder Mixer Volume', setMode=MODE.encoderVolume},
  {control='Encoder Mixer Pan', setMode=MODE.pan},
  {control='Encoder Mixer Eq', setMode=MODE.eq},
  {control='Sends', setMode=MODE.sends1, paramName='Sends 1'},
  {control='Legacy Sends', setMode=MODE.sends1, paramName='Sends 1'},
  {control='Encoder Sends 1', setMode=MODE.sends1},
  {control='Encoder Sends 2', setMode=MODE.sends2},
  {control='Encoder Sends 3', setMode=MODE.sends3},
  {control='Encoder Sends 4', setMode=MODE.sends4},
  {control='Encoder Sends 5', setMode=MODE.sends5},
  {control='Encoder Sends 6', setMode=MODE.sends6},
  {control='Encoder Sends 7', setMode=MODE.sends7},
  {control='Encoder Sends 8', setMode=MODE.sends8},
  {control='Encoder Sends 9', setMode=MODE.sends9},
  {control='Encoder Sends 10', setMode=MODE.sends10},
  {control='Encoder Sends 11', setMode=MODE.sends11},
  {control='Encoder Sends 12', setMode=MODE.sends12},
  {control='Transport', setMode=MODE.encoderTransport, paramName='Transport'},
  {control='Legacy Transport', setMode=MODE.encoderTransport, paramName='Transport'},
  {control='Encoder Custom 1', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Legacy Encoder Custom 1', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Encoder Custom 2', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Legacy Encoder Custom 2', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Encoder Custom 3', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Legacy Encoder Custom 3', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Encoder Custom 4', setMode=MODE.encoderOther, paramName='Encoder Other'},
  {control='Legacy Encoder Custom 4', setMode=MODE.encoderOther, paramName='Encoder Other'},

  {mode=MODE.plugin1},
  {control='Encoder Page Down', setMode=MODE.plugin2},
  {control='Encoder 1', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=0, paramName='@tp,@tn'},
  {control='Encoder 2', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=1, paramName='@tp,@tn'},
  {control='Encoder 3', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=2, paramName='@tp,@tn'},
  {control='Encoder 4', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=3, paramName='@tp,@tn'},
  {control='Encoder 5', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=4, paramName='@tp,@tn'},
  {control='Encoder 6', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=5, paramName='@tp,@tn'},
  {control='Encoder 7', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=6, paramName='@tp,@tn'},
  {control='Encoder 8', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=7, paramName='@tp,@tn'},

  {mode=MODE.plugin2},
  {control='Encoder Page Up', setMode=MODE.plugin1},
  {control='Encoder 1', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=8, paramName='@tp,@tn'},
  {control='Encoder 2', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=9, paramName='@tp,@tn'},
  {control='Encoder 3', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=10, paramName='@tp,@tn'},
  {control='Encoder 4', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=11, paramName='@tp,@tn'},
  {control='Encoder 5', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=12, paramName='@tp,@tn'},
  {control='Encoder 6', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=13, paramName='@tp,@tn'},
  {control='Encoder 7', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=14, paramName='@tp,@tn'},
  {control='Encoder 8', CSTrack=true, trackParam=CS_SMARTCONTROL1, paramOffset=15, paramName='@tp,@tn'},

  {mode=MODE.encoderVolume},
  {control='Encoder Page Down', setMode=MODE.pan},
  {control='Encoder 1', faderBankTrack=0, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 2', faderBankTrack=1, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 3', faderBankTrack=2, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 4', faderBankTrack=3, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 5', faderBankTrack=4, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 6', faderBankTrack=5, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 7', faderBankTrack=6, trackParam=AUVOLUME, paramName='Volume,@tn'},
  {control='Encoder 8', faderBankTrack=7, trackParam=AUVOLUME, paramName='Volume,@tn'},

  {mode=MODE.pan},
  {control='Encoder Page Up', setMode=MODE.encoderVolume},
  {control='Encoder Page Down', setMode=MODE.eq},
  {control='Encoder 1', faderBankTrack=0, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 2', faderBankTrack=1, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 3', faderBankTrack=2, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 4', faderBankTrack=3, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 5', faderBankTrack=4, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 6', faderBankTrack=5, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 7', faderBankTrack=6, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},
  {control='Encoder 8', faderBankTrack=7, trackParam=AUPAN, paramName='Pan,@tn', fbType=FB_HOR_CNTR_BAR},

  {mode=MODE.eq},
  {control='Encoder Page Up', setMode=MODE.pan},
  {control='Encoder 1', CSTrack=true, trackParam=CS_EQ1FREQ, paramOffset=1, paramName='@tp,@tn'},
  {control='Encoder 2', CSTrack=true, trackParam=CS_EQ1GAIN, paramOffset=1, paramName='@tp,@tn'},
  {control='Encoder 3', CSTrack=true, trackParam=CS_EQ1FREQ, paramOffset=3, paramName='@tp,@tn'},
  {control='Encoder 4', CSTrack=true, trackParam=CS_EQ1GAIN, paramOffset=3, paramName='@tp,@tn'},
  {control='Encoder 5', CSTrack=true, trackParam=CS_EQ1FREQ, paramOffset=5, paramName='@tp,@tn'},
  {control='Encoder 6', CSTrack=true, trackParam=CS_EQ1GAIN, paramOffset=5, paramName='@tp,@tn'},
  {control='Encoder 7', CSTrack=true, trackParam=CS_EQ1FREQ, paramOffset=6, paramName='@tp,@tn'},
  {control='Encoder 8', CSTrack=true, trackParam=CS_EQ1GAIN, paramOffset=6, paramName='@tp,@tn'},

  {mode=MODE.encoderTransport},
  -- Verified numeric Logic key-command IDs (rather than unsupported label strings).
  {control='Playhead Forward Step', keyCmd=2595}, -- Forward by Nudge Value
  {control='Playhead Rewind Step', keyCmd=2594}, -- Rewind by Nudge Value
  -- Read the playhead's formatted position, independently of the MIDI jog steps.
  {control='Encoder 1', globalObj=AGL_PLAYHEAD, valueMode=kAssignRelative},
  {control='Diagnostic Clock Bar', globalObj=AGL_CLOCK, clockPart=ACP_BAR},
  {control='Diagnostic Clock Beat', globalObj=AGL_CLOCK, clockPart=ACP_BEAT},
  {control='Encoder 2', globalObj=AGL_SCRUB, clockPart=ACP_FORMAT, valueMode=kAssignRelative, localResolution=127},
  {control='Encoder 3', globalObj=AGL_HORIZONTALZOOM},
  {control='Encoder 4', globalObj=AGL_LEFTLOCATOR, clockPart=ACP_BEAT},
  {control='Encoder 5', globalObj=AGL_RIGHTLOCATOR, clockPart=ACP_BEAT},
  -- Tempo control needs kAssignRotate to inc/dec in single units. Leaving it at kAssignRelative in/decs in 7BPM units.
  {control='Encoder 8', globalObj=AGL_TEMPO, valueMode=kAssignRotate}, 
  {control='Next Marker', keyCmd='next marker'},
  {control='Previous Marker', keyCmd='prev marker'},
  
  {mode=MODE.encoderOther},

  -- Encoder modes must be last in this table since the sends are appended via the getSendsAssignments method
}

getSendsAssignments(all_assignments)

SUBPAGE_MIDI_MAP = {
  [MODE.encoderVolume] = controls[kControlIDSubPageMixerVolume].midi,
  [MODE.pan] = controls[kControlIDSubPageMixerPan].midi,
  [MODE.eq] = controls[kControlIDSubPageMixerEq].midi,
  [MODE.plugin1] = controls[kControlIDSubPagePlugin1].midi,
  [MODE.plugin2] = controls[kControlIDSubPagePlugin2].midi,
  [MODE.sends1] = controls[kControlIDSubPageSends1].midi,
  [MODE.sends2] = controls[kControlIDSubPageSends2].midi,
  [MODE.sends3] = controls[kControlIDSubPageSends3].midi,
  [MODE.sends4] = controls[kControlIDSubPageSends4].midi,
  [MODE.sends5] = controls[kControlIDSubPageSends5].midi,
  [MODE.sends6] = controls[kControlIDSubPageSends6].midi,
  [MODE.sends7] = controls[kControlIDSubPageSends7].midi,
  [MODE.sends8] = controls[kControlIDSubPageSends8].midi,
  [MODE.sends9] = controls[kControlIDSubPageSends9].midi,
  [MODE.sends10] = controls[kControlIDSubPageSends10].midi,
  [MODE.sends11] = controls[kControlIDSubPageSends11].midi,
  [MODE.sends12] = controls[kControlIDSubPageSends12].midi
}

allEncodersZeroRotationMidi = getAllEncodersZeroRotationMidi()
appName = ''
delayedDisplay = nil
delayedMidi = nil
displayValueCache = {};
encoderMode = MODE.plugin1
lastPlayheadDisplay = ''
LK37_DBG_V4 = '2026-11-03 23:24'
lk37DebugMidiCount = {}
lk37DebugFeedbackCount = {}
lk37DebugLastFeedback = {}
faderButtonMode = MODE.faderButtonArm
focussedTrackColor = nil
focussedTrackIndex = nil
focussedTrackName = nil
liveLoopMode = false
markerDamperValue = 0
markerDamperThreshold = 2
mixerSubPage = MODE.encoderVolume
padMode = MODE.padSelectArm
pluginSubPage = MODE.plugin1
preventDisplayTrigger = false
settledDisplay = false
sendsSubPage = MODE.sends1
shift = false
trackBanking = false
trackStatus = {}
zoom = nil

-------------------------------------------------------------------------------
-- Called by the app to get the controller info
-- @return table controller info
-------------------------------------------------------------------------------
function controller_info()
  print('LK37_V4_DEBUG controller_info invoked', LK37_DBG_V4)
	print("-------------------- Launchkey Mini MK4 37 controller_info --------------------")
	return {
		model = 'Launchkey Mini MK4 37',
		manufacturer = 'Focusrite - Novation',
		version = 100,
		copyright = [[Jan 29 2024
Copyright © 2004-2024 Focusrite Audio Engineering Ltd. All rights reserved]],

		items =  controls,
		assignments = all_assignments,
		alertAssignments = {},
	}
end

-------------------------------------------------------------------------------
-- Called once by the app to retrieve the midi messages to initialise the device
-- @return table containing midi messages to initialise the device
-------------------------------------------------------------------------------
function controller_initialize(applicationName, deviceNewlyDetected)
	print("-------------------- Launchkey Mini MK4 37 controller_initialize --------------------", applicationName, deviceNewlyDetected)
  appName = applicationName
  local midi = {
    -- DAW Mode
    0x9f, 0x0c, 0x7f,
    -- Set default modes for Pads, Faders and Encoders
    0xb6, CC_ENCODERMODE, 0x02, -- encoders = plugin
    0xb6, CC_PADMODE, 0x02, -- pads = DAW
    0xb6, CC_FADERMODE, 0x01, -- faders = volume
    -- Set encoders to Relative mode
    0xb6, 0x45, 0x7f,
    -- Initial button LED brightnesses
    0xb3, 0x66, BRIGHTNESS.bright, -- Track Right
    0xb3, 0x67, BRIGHTNESS.bright, -- Track Left
    0xb3, 0x69, BRIGHTNESS.bright, -- Function button
    0xb3, 0x6a, BRIGHTNESS.dim, -- Pad Up button
    0xb3, 0x6b, BRIGHTNESS.bright, -- Pad Down button
    -- Drumrack ownership
    0xb6, 0x54, 0x7f,
  }

  -- Set the display configuration
  midi = tableConcat(midi, getInitialDisplayConfigMidi())

  -- Set the stationary display to the app name
  midi = tableConcat(midi, getStationaryDisplayTextMidi(nil, appName, nil))

  -- This is workaround of the bug where the first settriggertimer does not call controller_timer_trigger
  -- Calling it here means all subsequent settriggertimer calls will work as expected
  -- Calling it twice here does not cause the controller_timer_trigger to be called at all
  settriggertimer(500)

  return {
		midi = midi,
		outport = DAW_IN
	}
end

-------------------------------------------------------------------------------
-- Called once by the app to retrieve the midi messages to instruct the device to exit DAW mode
-- @return table containing midi message to instruct the device to exit DAW mode
-------------------------------------------------------------------------------
function controller_finalize()
  return {
    midi = {
      0xb6, 0x54, 0x00, -- Release drumrack ownership
      0x9f, 0x0c, 0x00 -- Exit DAW mode
    },
    outport = DAW_IN
  }
end

-------------------------------------------------------------------------------
-- Called by the app to filter for every midi event. This function must be as fast as possible.
-- @return table containing midi messages to set the controller to the specified mode
-------------------------------------------------------------------------------
function controller_midi_in(midi, port)
  if port == DAW_OUT then
    if midi[0] == 0xbf and midi[1] >= 0x55 and midi[1] <= 0x5c then
      local idx = midi[1] - 0x54
      lk37DebugMidiCount[idx] = (lk37DebugMidiCount[idx] or 0) + 1
      if lk37DebugMidiCount[idx] <= 8 then
        print('LK37_V4_DEBUG encoder',idx,'data',midi[2],'encoderMode',encoderMode,'shift',shift)
      end
    end
    -- make sure the echoed activation message doesn't mess up the chord display
    if midi[0] == 0x9f and midi[1] == 0x0c then 
      return {}
    end

    -- Cache the shift button state
    if midi[0] == 0xb6 and (midi[1] == CC_SHIFT or midi[1] == CC_SHIFT_LEGACY) then
      -- If Logic is started (or Rebuild Defaults is executed) while the device's Shift key is pressed (or latched) then ...
      -- ... ignore the first Shift up button message. This prevents the Shift modes in the all_assignments from being flipped.
      if shift == false and midi[2] == 0x00 then
        return {}
      end

      shift = midi[2] == 0x7f
      if shift == true and encoderMode ~= MODE.plugin1 and encoderMode ~= MODE.plugin2 and encoderMode ~= MODE.eq and encoderMode ~= MODE.encoderTransport then
        -- Fake an encoder rotation for each encoder to update the display
        midi = tableConcat(midi, allEncodersZeroRotationMidi)
        return {midi = midi, inport = port}
      end
    end

    -- Set the stationary display based on the encoder mode
    if shift and midi[0] == 0xb6 and (midi[1] == CC_ENCODERMODE or midi[1] == CC_ENCODERMODE_LEGACY) then
      local modesForAppName = Set({ 0x01, 0x02, 0x04, 0x06, 0x07, 0x08, 0x09 })
      if modesForAppName.includes(midi[2]) then
        encoderMode = midi[2]
        sendDelayedStationaryTextMidi(nil, appName, nil)
      elseif midi[2] == 0x05 then
        sendDelayedStationaryGridMidi('Transport', {lastPlayheadDisplay ~= '' and lastPlayheadDisplay or 'PH', 'Scrub', 'Zoom', 'LPS', 'LPE', 'Mark', '-', 'BPM'})
      end
    end
  
    -- Fixup the preview values for mixer and sends when shift key is down
    if shift and midi[0] == 0xb6 and (midi[1] == CC_ENCODERMODE or midi[1] == CC_ENCODERMODE_LEGACY) and (midi[2] == 0x01 or midi[2] == 0x02 or midi[2] == 0x04) then
      -- Select the correct subpage
      transformMidiToSelectSubPage(midi)

      -- Fake an encoder rotation for each encoder to update the display
      midi = tableConcat(midi, allEncodersZeroRotationMidi)
      return {midi = midi, inport = port}
    end

    -- Support shift-play and shift-record for minis
    if IS_MINI == true and shift == true and midi[0] == 0xb0 then
      if midi[1] == 0x73 then
        -- Map shift-play to stop
        return {midi = {0xb0, 0x74, midi[2]}, inport = port}
      end
      if midi[1] == 0x75 then
        -- Map shift-record to capture midi
        return {midi = {0xb0, 0x4a, midi[2]}, inport = port}
      end
    end

    -- Convert Encoder 1 steps into directional transport key commands.
    -- 0x40 means no movement; 0x41 clockwise; 0x3F counterclockwise.
    if shift == false and encoderMode == MODE.encoderTransport and midi[0] == 0xbf and midi[1] == 0x55 then
      -- Show the last real playhead feedback when the knob is moved.
      sendDelayedDisplayMidi(0x15, '', 'Playhead', lastPlayheadDisplay, true)
      local steps = midi[2] - 0x40
      if steps == 0 then return {} end
      local cc = steps > 0 and 0x5D or 0x5E
      local out = {}
      for i = 1, math.min(math.abs(steps), 16) do
        out[#out+1] = 0xB0
        out[#out+1] = cc
        out[#out+1] = 0x7F
        out[#out+1] = 0xB0
        out[#out+1] = cc
        out[#out+1] = 0x00
      end
      return {midi = out, inport = port}
    end

    -- Trigger next or previous marker events from encoder 6
    if shift == false and midi[0] == 0xbf and midi[1] == 0x5a and encoderMode == MODE.encoderTransport then
      local diff = midi[2] - 0x40
      markerDamperValue = markerDamperValue + diff
      if markerDamperValue > markerDamperThreshold then
        markerDamperValue = 0;
        sendDelayedDisplayMidi(0x21, 'Marker Select', 'Next', '', true)
        return {midi = {0xb0, 0x4e, 0x7f, 0xb0, 0x4e, 0x00}, inport = port} -- Next Marker
      elseif markerDamperValue < -markerDamperThreshold then
        markerDamperValue = 0;
        sendDelayedDisplayMidi(0x21, 'Marker Select', 'Previous', '', true)
        return {midi = {0xb0, 0x4f, 0x7f, 0xb0, 0x4f, 0x00}, inport = port} -- Previous Marker
      end
    end

    -- Convert encoder values from binary offset to 2's complement
    if midi[0] == 0xbf and midi[1] >= 0x55 and midi[1] <= 0x5c then
      if encoderMode == MODE.encoderTransport then
        -- Send the display midi appropriate for the changed transport encoder
        local field = midi[1] - 0x40;
        if field == 0x15 or field == 0x16 or field == 0x18 or field == 0x19 then
          sendDelayedDisplayMidi(field, '', TRANSPORT_ENCODER_NAMES[field], (field == 0x15 and lastPlayheadDisplay or ''), false)
        end        
      end
      local value2C = convertBOTo2C(midi[2])
      return {midi = {midi[0], midi[1], value2C}, inport = port}
    end
  
    -- Light up button LEDs when they're down and dim them when they're up for Capture Midi, Quantize and Stop
    if midi[0] == 0xb0 and (midi[1] == 0x4a or midi[1] == 0x4b or midi[1] == 0x74) then
      sendDelayedButtonBrightnessMidi(midi, BRIGHTNESS.bright, BRIGHTNESS.dim)
    end

    -- Set the padMode based on the pressed pad buttons
    if midi[0] == 0xb6 and (midi[1] == CC_PADMODE or midi[1] == CC_PADMODE_LEGACY) then
      -- Light the Function button when the pad mode is DAW
      sendDelayedButtonBrightnessMidi({[0] = 0xb6, [1] = 0x69, [2] = midi[2] == 0x02 and 0x7f or 0x00}, BRIGHTNESS.bright, BRIGHTNESS.off)

      -- Turn off the pad up and down buttons when the pad mode is not DAW
      if midi[2] ~= 0x02 and settledDisplay == true and preventDisplayTrigger == false then
        appendDelayedMidi({0xb3, 0x6a, BRIGHTNESS.off, 0xb3, 0x6b, BRIGHTNESS.off})
        settriggertimer(100)
      end

      if midi[2] == 0x0f then -- Drum mode pad is 0x0f when drumrack feature is owned, otherwise 0x01
        if padMode ~= MODE.padDrum then
          padMode = MODE.padDrum
        end
      elseif midi[2] == 0x02 then -- DAW mode
        if padMode == MODE.padDrum or padMode == MODE.padOther then
          padMode = MODE.padSelectArm
        end
      end
    end

    -- Pause display updates for the following events
    if (midi[0] == 0xb0 and midi[1] >= 0x73 and midi[1] <= 0x75 and midi[2] == 0x7f) or -- Play, Stop, Record buttons down
      (midi[0] == 0xb6 and (midi[1] == CC_SHIFT or midi[1] == CC_SHIFT_LEGACY) and midi[2] == 0x00) -- Shift button up (for mode changes)
    then
      pauseDisplayTrigger()
    end

    -- To work around the banking inconsistencies in live loop mode, fake a shift key press when track left/right is pressed
    if midi[0] == 0xb0 and (midi[1] == 0x67 or midi[1] == 0x66) and midi[2] == 0x7f and liveLoopMode == true then
      midi = tableConcat(midi, {0xb6, CC_SHIFT, 0x7f, 0xb6, CC_SHIFT, 0x00})
      return {midi = midi, inport = port}
    end
  end

  return nil
end

-------------------------------------------------------------------------------
-- Called by the app after a call to settriggertime
-- @return table containing midi messages or nil if nothing to send
-------------------------------------------------------------------------------
function controller_timer_trigger()
  resumeDisplayTrigger()
  local midi = getDelayedDisplayMidi() or {}
  midi = tableConcat(midi, getDelayedMidi())
  return {midi = midi, outport = DAW_IN}
end

-------------------------------------------------------------------------------
-- Called by the app to process numeric feedback
-- @return an integer containing the max length of the text in the subsequent CSFeedbackText call or a table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function CSFeedback(controlID, currentValue, minValue, maxValue, nSubSequentControls, feedbackType, assignment)
  if controlID == 10 or controlID == 125 or controlID == 126 then
    local key = tostring(currentValue)
    if lk37DebugLastFeedback[controlID] ~= key then
      lk37DebugLastFeedback[controlID] = key
      lk37DebugFeedbackCount[controlID] = (lk37DebugFeedbackCount[controlID] or 0) + 1
      if lk37DebugFeedbackCount[controlID] <= 32 then
        print('LK37_V4_DEBUG feedback',controlID,'value',currentValue,'min',minValue,'max',maxValue,'fbtype',feedbackType)
      end
    end
  end
  -- print("CSFeedback", controlID, currentValue, minValue, maxValue, nSubSequentControls, feedbackType, assignment)
  local midi = {}
  local ret = 0
  local textFeedbackControlIDs = Set({
    kControlIDPlugin,
    kControlIDMixer,
    kControlIDSends,
    kControlIDTransport,
    kControlIDEncoderPageUp,
    kControlIDEncoderPageDown,
    kControlIDEncoder1,
    125, -- Diagnostic Clock Bar
    126, -- Diagnostic Clock Beat
    kControlIDEncoder2,
    kControlIDEncoder3,
    kControlIDEncoder4,
    kControlIDEncoder5,
    kControlIDEncoder6,
    kControlIDEncoder7,
    kControlIDEncoder8,
    kControlIDEncoderCustom1,
    kControlIDFunction,
    kControlIDDaw,
    kControlIDDrum,
    kControlIDPadPageUp,
    kControlIDPadPageDown,
    kControlIDMasterFader,
    kControlIDFader1,
    kControlIDFader2,
    kControlIDFader3,
    kControlIDFader4,
    kControlIDFader5,
    kControlIDFader6,
    kControlIDFader7,
    kControlIDFader8,
    kControlIDArmSelect
  })

  -- Cache the focussed track index and colour
  if controlID == kControlIDFocussedTrack then
    if assignment.trackParam == CS_NAME then
      focussedTrackIndex = currentValue
      ret = 32
    -- Ignore zero values for track colour, all tracks have a colour in Logic.
    elseif assignment.trackParam == CS_COLOR and currentValue ~= 0 then
      focussedTrackColor = currentValue
      if padMode == MODE.padDrum then
        midi = tableConcat(midi, getDrumPadsColorMidi())
      end
    end
  end

  -- Cache the track colours
  if controlID >= kControlIDTrackName1 and controlID <= kControlIDTrackName8 and assignment.trackParam == CS_COLOR and assignment.objOffset ~= nil then
    cacheTrackColor(assignment.objOffset, currentValue)
  end

  -- Cache the track selection
  if assignment.trackParam == CS_SELECT and assignment.objOffset ~= nil then
    cacheTrackSelect(assignment.objOffset, currentValue == 1)
  end

  -- Set the mode of the encoders to relative
  if controlID == kControlIDPlugin or controlID == kControlIDMixer or controlID == kControlIDSends or controlID == kControlIDTransport then
    midi = tableConcat(midi, {0xb6, 0x45, 0x7f})
  end

  -- Transport and workflow button LEDs
  if Set({kControlIDRecord, kControlIDPlay, kControlIDStop, kControlIDLoop, kControlIDCaptureMidi, kControlIDUndo, kControlIDQuantize, kControlIDClick}).includes(controlID)  then
    local control = controls[controlID]
    midi = tableConcat(midi, getButtonBrightnessMidi(0xb3, control.midi[2], currentValue))
  elseif textFeedbackControlIDs.includes(controlID) then
    if encoderMode == MODE.encoderTransport then
      -- Set the display appropriate for the changed transport encoder
      midi = tableConcat(midi, getEncoderTransportDisplayMidi(controlID, currentValue))
    end
    -- Causes Logic to call CSFeedbackText with pText no longer than 32 characters
    ret = 32
  end

  if (controlID == kControlIDTrackLeft or controlID == kControlIDTrackRight) and assignment.CSGroupObj == ACS_FADERBANK and trackBanking == true then
    -- Call CSFeedbackText for track banking
    ret = 32
  end

  if HAS_FADERS then
    -- Set the color of the fader buttons
    if (controlID >= kControlIDFaderPad1) and (controlID <= kControlIDFaderPad8) then
      midi = getPadColorMidi(midi, controlID, assignment, currentValue)
    end
  
    -- Set the color of the Arm/Select fader button
    if (controlID == kControlIDArmSelect) then
      local control = controls[controlID]
      local color = currentValue == 1 and 0x03 or 0x05
      midi = tableConcat(midi,  {control.midi[1], control.midi[2], color})
    end
  end

  -- Set the color of the pads
  if controlID >= kControlIDPad1 and controlID <= kControlIDPad16 and padMode ~= MODE.padDrum and padMode ~= MODE.padOther then
    if assignment.liveLoopsColumn or assignment.trackParam == CS_LIVELOOP1 then
      midi = getLiveLoopPadColor(midi, controlID, assignment, currentValue)
    else
      midi = getPadColorMidi(midi, controlID, assignment, currentValue)
    end
  end

  return {
    midi = midi,
    outport = DAW_IN,
    ret = ret
  }
end

-------------------------------------------------------------------------------
-- Called by the app to process text feedback, only called when CSFeedback returns an integer
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
-- Display only actual host position data. Re-trigger the stationary grid's
-- first field: a non-triggering SysEx changes stored text but does not redraw.
function updatePositionDisplay(pText)
  if type(pText) ~= 'string' or pText == '' then return nil end
  local bar, beat = pText:match('^%s*(%d+)%D+(%d+)')
  if not bar or not beat then return nil end
  local compact = tostring(tonumber(bar)) .. ':' .. tostring(tonumber(beat))
  if lastPlayheadDisplay == compact then return nil end
  lastPlayheadDisplay = compact
  if encoderMode ~= MODE.encoderTransport then return nil end
  return getDisplayMidi(0x20, 1, true, compact)
end

function CSFeedbackText(controlID, pText, length)
  if controlID == 10 or controlID == 125 or controlID == 126 then
    local id = 1000+controlID
    lk37DebugFeedbackCount[id] = (lk37DebugFeedbackCount[id] or 0)+1
    if lk37DebugFeedbackCount[id] <= 32 then
      print('LK37_V4_DEBUG feedback_text',controlID,'text',pText,'len',length,'mode',encoderMode)
    end
  end
  -- print("CSFeedbackText", controlID, pText, length)
  local midi = {}
  local safeText = length > 0 and pText or ''
  if controlID == kControlIDEncoder1 then
    midi = tableConcat(midi, updatePositionDisplay(safeText))
  end

  if controlID == kControlIDDrum then
    setLiveLoopMode(false)
  end

  if controlID == kControlIDDaw or controlID == kControlIDPadPageUp or controlID == kControlIDPadPageDown then
    -- Light up the pad page buttons for DAW mode
    if safeText == MODE.padSelectArm then
      midi = tableConcat(midi, getUpDownButtonBrightnessMidi(0xb3, 0x6a, BRIGHTNESS.dim, BRIGHTNESS.bright))
    elseif safeText == MODE.padSoloMute then
      midi = tableConcat(midi, getUpDownButtonBrightnessMidi(0xb3, 0x6a, BRIGHTNESS.bright, BRIGHTNESS.dim))
    end
  end

  if controlID == kControlIDFunction and safeText == MODE.liveLoops then
    -- light up page up/down buttons for pads in Live Loops mode
    midi = tableConcat(midi, {0xb3, 0x6a, BRIGHTNESS.bright, 0xb3, 0x6b, BRIGHTNESS.bright})
    setLiveLoopMode(true)
  end

  if controlID == kControlIDTransport and safeText == MODE.encoderTransport then
    -- Dim the encoder page buttons for transport mode
    midi = tableConcat(midi, {0xb3, 0x33, BRIGHTNESS.dim, 0xb3, 0x34, BRIGHTNESS.dim})
  end

  if controlID == kControlIDEncoderCustom1 then
    -- Dim the Encoder page up and down buttons for Custom modes
    midi = tableConcat(midi, {0xb3, 0x33, 0, 0xb3, 0x34, 0})
  end

  if controlID == kControlIDPlugin or controlID == kControlIDMixer or controlID == kControlIDSends or controlID == kControlIDEncoderPageUp or controlID == kControlIDEncoderPageDown then
    -- Light up the encoder page buttons for Mixer mode
    if safeText == MODE.encoderVolume then
      midi = tableConcat(midi, getUpDownButtonBrightnessMidi(0xb3, 0x33, BRIGHTNESS.dim, BRIGHTNESS.bright))
    elseif safeText == MODE.pan then
      midi = tableConcat(midi, getUpDownButtonBrightnessMidi(0xb3, 0x33, BRIGHTNESS.bright, BRIGHTNESS.bright))
    elseif safeText == MODE.eq then
      midi = tableConcat(midi, getUpDownButtonBrightnessMidi(0xb3, 0x33, BRIGHTNESS.bright, BRIGHTNESS.dim))
    end

    -- Light up the encoder page buttons for Sends mode
    midi = tableConcat(midi, getEncoderPageButtonBrightnessMidi(safeText, 'sends', MAX_SENDS))

    -- Light up the encoder page buttons for Plugin mode
    midi = tableConcat(midi, getEncoderPageButtonBrightnessMidi(safeText, 'plugin', MAX_PLUGIN_PAGES))
  end

  -- Set the display value for the encoders (except transport mode, which was set in CSFeedback)
  if encoderMode ~= MODE.encoderTransport and controlID >= kControlIDEncoder1 and controlID <= kControlIDEncoder8 then
    midi = tableConcat(midi, getValueDisplayMidi(controlID, safeText, 0x40))
  end 

  -- Set the temporary display for encoder mode change
  if (controlID == kControlIDEncoderPageUp or controlID == kControlIDEncoderPageDown or controlID == kControlIDTransport) and encoderMode ~= safeText then
    cacheEncoderMode(safeText)
    midi = tableConcat(midi, getModeChangeMidi(safeText))
    if controlID == kControlIDTransport and encoderMode == MODE.encoderTransport then
      midi = tableConcat(midi, getEncoderTransportNamesMidi(controlID, 0))
    end
  end

  -- Set the temporary display for pad mode change
  if controlID == kControlIDPadPageUp or controlID == kControlIDPadPageDown or controlID == kControlIDFunction then
    local title, safePadMode = splitOnFirstMatch(safeText, ',')
    if safePadMode == nil then
      safePadMode = safeText
    end
    if safePadMode ~= "" and safePadMode ~= nil and padMode ~= safePadMode and padMode ~= MODE.padDrum then
      padMode = safePadMode
      midi = tableConcat(midi, getModeChangeMidi(safeText))
    end
  end

  -- Set the temporary display for track bank range
  if controlID == kControlIDTrackLeft or controlID == kControlIDTrackRight then
    midi = tableConcat(midi, getTrackBankDisplayMidi(safeText))
  end

  -- Set the temporary display for selected track change
  if controlID == kControlIDFocussedTrack then
    midi = tableConcat(midi, getFocussedTrackDisplayMidi(safeText))
  end

  -- Set the display value for the faders and fader buttons
  if HAS_FADERS then
    if controlID >= kControlIDMasterFader and controlID <= kControlIDFader8 then
      -- Set the display for the faders
      midi = tableConcat(midi, getValueDisplayMidi(controlID, safeText, 0))
    end
    if controlID == kControlIDArmSelect and faderButtonMode ~= safeText then
      -- Set the display for the fader button mode
      faderButtonMode = safeText
      midi = tableConcat(midi, getModeChangeMidi(safeText))
    end
  end

  return {midi = midi, outport = DAW_IN}
end

-------------------------------------------------------------------------------
-- Called by the app to process the text value when a controller is moved on the device
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function CSLongFeedbackText(controlID, pText, len)
  if controlID == 10 or controlID == 125 or controlID == 126 then
    local id = 2000+controlID
    lk37DebugFeedbackCount[id] = (lk37DebugFeedbackCount[id] or 0)+1
    if lk37DebugFeedbackCount[id] <= 32 then
      print('LK37_V4_DEBUG long_feedback',controlID,'text',pText,'len',len,'mode',encoderMode)
    end
  end
  -- print('CSLongFeedbackText', pText, len)
  if controlID == kControlIDEncoder1 and len > 0 then
    return {midi=updatePositionDisplay(pText) or {},outport=DAW_IN}
  end
  
  if len > 0 then
    -- Set the display value for the encoders
    if controlID >= kControlIDEncoder1 and controlID <= kControlIDEncoder8 then
      return {midi = getValueDisplayMidi(controlID, pText, 0x40), outport = DAW_IN}
    end

    -- Set the display value for the faders
    if HAS_FADERS and controlID >= kControlIDMasterFader and controlID <= kControlIDFader8 then
      -- Always trigger the fader displays to ensure correct display values
      return {midi = getValueDisplayMidi(controlID, pText, 0, true), outport = DAW_IN}
    end
  end
end

-------------------------------------------------------------------------------
-- Called by the app to retrieve the maximum length of a label from the supplied controlID
-- @return integer containing the maximum length of the label
-------------------------------------------------------------------------------
function CSLabelSize(controlID, nSubSequentControls)
  -- Prevent any display updates for first 500ms
  if settledDisplay == false then
    pauseDisplayTrigger()
    settledDisplay = true
  end

  return 32
end

-------------------------------------------------------------------------------
-- Called by the app when a label has changed for the supplied controlID
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function CSLabel(controlID, pText, textLength, labelLine, nSubSequentControls)
  -- print("CSLabel", controlID, pText, textLength, labelLine, nSubSequentControls)

  -- Cache the trackBanking mode
  if controlID == kControlIDTrackLeft or controlID == kControlIDTrackRight then
    trackBanking = pText == MODE.trackBank
  end

  -- Set the labels for the encoders
  if controlID >= kControlIDEncoder1 and controlID <= kControlIDEncoder8 then
    local midi = getLabelDisplayMidi(controlID, pText, 0x40)
    return {midi = midi, outport = DAW_IN}
  end

  -- Set the labels for the faders
  if HAS_FADERS and controlID >= kControlIDMasterFader and controlID <= kControlIDFader8 then
    local midi = getLabelDisplayMidi(controlID, pText, 0)
    return {midi = midi, outport = DAW_IN}
  end
end

-------------------------------------------------------------------------------
-- Called by the app to process the label when a controller is moved on the device
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function CSLongLabel(controlID, pText, textLength)
  -- print("CSLongLabel", controlID, pText, textLength)

  -- Set the labels for the encoders
  if controlID >= kControlIDEncoder1 and controlID <= kControlIDEncoder8 then
    local midi = getLabelDisplayMidi(controlID, pText, 0x40)
    return {midi = midi, outport = DAW_IN}
  end

  -- Set the labels for the faders
  if HAS_FADERS and controlID >= kControlIDMasterFader and controlID <= kControlIDFader8 then
    local midi = getLabelDisplayMidi(controlID, pText, 0)
    return {midi = midi, outport = DAW_IN}
  end
end

-------------------------------------------------------------------------------
-- Appends the supplied midi table to the delayedMidi table
-- @param {table} midi The midi table to append
-------------------------------------------------------------------------------
function appendDelayedMidi(midi)
  if midi ~= nil then
    delayedMidi = tableConcat(delayedMidi, midi)
  end
end

-------------------------------------------------------------------------------
-- Caches the encoder mode and sub page
-- @param {string} Encoder mode to cache
-------------------------------------------------------------------------------
function cacheEncoderMode(mode)
  encoderMode = mode
  local page, subPage = splitOnFirstMatch(mode, ',')
  if page == "Mixer" then
    mixerSubPage = encoderMode
  elseif page == "Smart Controls" then
    pluginSubPage = encoderMode
  elseif page == "Sends" then
    sendsSubPage = encoderMode
  end
end


-------------------------------------------------------------------------------
-- Caches the colour integer for supplied track index
-- @param {number} index Track index
-- @param {number} color Logic supplied colour integer
-------------------------------------------------------------------------------
function cacheTrackColor(index, color)
  if color == 0 then
    if shift == true then
      return nil
    end
    color = DEFAULT_PAD_COLOR
  end
  local status = trackStatus[index]
  if status == nil then
    trackStatus[index] = {
      color = color
    }
  else
    status.color = color
  end
end

-------------------------------------------------------------------------------
-- Caches the selected state for supplied track index
-- @param {number} index Track index
-- @param {boolean} selected True if the track is selected
-------------------------------------------------------------------------------
function cacheTrackSelect(index, selected)
  local status = trackStatus[index]
  if status == nil then
    trackStatus[index] = {
      selected = selected
    }
  else
    status.selected = selected
  end
end

-------------------------------------------------------------------------------
-- Converts the supplied binary offset value to a 2's complement value
-- @returns a 2's complement value
-------------------------------------------------------------------------------
function convertBOTo2C(value)
  if value < 0x40 then
    value = 0x80 - (0x40 - value)
  else
    value = value - 0x40
  end
  return value
end

-------------------------------------------------------------------------------
-- Converts the supplied value to a 7-bit representation
-- @return a 7-bit representation of the supplied value
-------------------------------------------------------------------------------
function convertValueTo7Bit(value, minValue, maxValue)
  local divisor = maxValue - minValue
  if divisor ~= 0 then
    value = math.floor((value - minValue) / divisor * 127)
  else
    value = 0
  end
  return value
end

-------------------------------------------------------------------------------
-- Darkens RGB colors to be able to show active and non active states
-- @param {number} r 7 bit integer value for the red component
-- @param {number} g 7 bit integer value for the green component
-- @param {number} b 7 bit integer value for the blue component
-- @returns {number, number, number} 7 bit integer values for the darkened red, green and blue components
-------------------------------------------------------------------------------
function darken(r, g, b)
  local factor = 0.1
  return math.floor(r * factor), math.floor(g * factor), math.floor(b * factor)
end

-------------------------------------------------------------------------------
-- Gets the button LED brightness midi to send to the device
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function getButtonBrightnessMidi(status, cc, value)
  return {status, cc, value == 0 and BRIGHTNESS.dim or BRIGHTNESS.bright}
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the display text from the delayedDisplay table
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getDelayedDisplayMidi()
  if delayedDisplay ~= nil then
    local midi = getDisplayMidi(delayedDisplay.address, 0, false, delayedDisplay.line1 or '')
    midi = tableConcat(midi, getDisplayMidi(delayedDisplay.address, 1, false, delayedDisplay.line2 or ''))
    midi = tableConcat(midi, getDisplayMidi(delayedDisplay.address, 2, delayedDisplay.trigger, delayedDisplay.line3 or ''))
    delayedDisplay = nil
    return midi
  end
end

-------------------------------------------------------------------------------
-- Gets the delayedMidi table to send and resets the delayedMidi table to nil
-- @return table containing the delayedMidi
-------------------------------------------------------------------------------
function getDelayedMidi()
  local midi = delayedMidi;
  delayedMidi = nil;
  return midi;
end

-------------------------------------------------------------------------------
-- Gets the sysex message to configure the supplied addressable display
-- @param {number} address The address of the display to configure
-- @param {number} config The configuration value for the display. See LK4 SysEx documentation for details.
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getDisplayConfigMidi(address, config)
  return makeSysex({0x04, address, config})
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the display parameter name
-- @param {number} address Encoder/fader cc number associated with text or 0x21 for global temporary display or 0x20 for stationary display
-- @param {number} field Zero indexed line to display text on
-- @param {boolean} trigger True to trigger the display
-- @param {string} text Display text
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getDisplayMidi(address, field, trigger, text)
  if preventDisplayTrigger == true and address == 0x21 then
    -- Do not send any global temporary display messages if preventDisplayTrigger is true
    return nil
  end
  if trigger and (address == 0x20 or preventDisplayTrigger == false) then
    -- This version of Lua does not support bitwise operations so use + instead of | here
    field = field + 0x40
  end
  return makeSysex({0x06, address, field, text})
  end

-------------------------------------------------------------------------------
-- Gets the sysex messages to set the colour of each pad to the selected track's color
-- @return table containing the sysex messages
-------------------------------------------------------------------------------
function getDrumPadsColorMidi()
  local midi = {}
  if focussedTrackColor ~= nil then
    local r, g, b = IntegerToRGB(focussedTrackColor)
    local rs, gs, bs = shiftRGB(r, g, b)
    for i=0x24,0x33 do
      midi = tableConcat(midi, makeSysex({0x01, 0x63, i, rs, gs, bs}))
    end
  end
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the brightness for both encoder page buttons
-- @param {string} pText The text to check against the supplied modeName
-- @param {string} modeName The mode name to check against the supplied text
-- @param {number} maxModePages The maximum number of pages for the mode
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getEncoderPageButtonBrightnessMidi(pText, modeName, maxModePages)
  if pText == MODE[modeName .. 1] then
    return getUpDownButtonBrightnessMidi(0xb3, 0x33, BRIGHTNESS.dim, BRIGHTNESS.bright)
  end
  if pText == MODE[modeName .. maxModePages] then
    return getUpDownButtonBrightnessMidi(0xb3, 0x33, BRIGHTNESS.bright, BRIGHTNESS.dim)
  end
  local bothLeds = {}
  for i=2,maxModePages-1 do
    table.insert(bothLeds, MODE[modeName .. i])
  end
  if hasValue(bothLeds, pText) then
    return getUpDownButtonBrightnessMidi(0xb3, 0x33, BRIGHTNESS.bright, BRIGHTNESS.bright)
  end    
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the encoder transport display text
-- @param {number} controlID The control ID of the changed encoder
-- @param {number} value The value bound to the encoder (if appropriate)
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getEncoderTransportDisplayMidi(controlID, value)
  local midi = {}
  if shift == false then
    if controlID == kControlIDEncoder3 then
      if zoom ~= nil and value ~= zoom then
        midi = tableConcat(midi, getTemporaryDisplayMidi('Zoom', value > zoom and 'IN' or 'OUT'))
      else
        midi = tableConcat(midi, getTemporaryDisplayMidi('Zoom', 'IN/OUT'))
      end
      zoom = value
    elseif controlID == kControlIDEncoder8 then
      if value ~= nil then
        midi = tableConcat(midi, getTemporaryDisplayMidi('Tempo', value .. ' BPM'))
      end
    end
  end
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the encoder transport names
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getEncoderTransportNamesMidi()
  local midi = {}
  for i=0x15,0x1c do
    midi = tableConcat(midi, getDisplayMidi(i, 0, false, ''))
    midi = tableConcat(midi, getDisplayMidi(i, 1, false, TRANSPORT_ENCODER_NAMES[i] or ''))
    midi = tableConcat(midi, getDisplayMidi(i, 2, false, (i == 0x15 and lastPlayheadDisplay or '')))
  end
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to display the supplied track name
-- @param {string} pText The track name to display
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getFocussedTrackDisplayMidi(pText)
  if ((IS_MINI == true or shift == true) or (IS_MINI ~= true and shift ~= true)) and pText ~= '' then
    focussedTrackName = pText
    return getTemporaryDisplayMidi('Selected Track', pText)
  end
end

-------------------------------------------------------------------------------
-- Gets the initial display configuration midi for the device
-- @return table containing the display configuration midi
-------------------------------------------------------------------------------
function getInitialDisplayConfigMidi()
  -- Configure the global temporary display to be 2 lines with no auto generation
  local midi = makeSysex({0x04, 0x21, 0x01})

  -- Configure the stationary display to be 3 lines with no auto generation
  midi = tableConcat(midi, makeSysex({0x04, 0x20, 0x02}))

  --Configure the master fader display to be ID 2 (3 lines) and auto-triggered (0x40)
  midi = tableConcat(midi, makeSysex({0x04, 0x0d, 0x42}))

  for i=0,7 do
    -- Configure each fader display to be ID 2 (3 lines) and auto-triggered (0x40)
    midi = tableConcat(midi, makeSysex({0x04, 0x05 + i, 0x42}))

    -- Configure each encoder display to be ID 2 (3 lines) and touch enabled (0x20 shift rotate) and auto-triggered (0x40)
    midi = tableConcat(midi, makeSysex({0x04, 0x15 + i, 0x62}))
  end

  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to display the track name and parameter name on the device
-- @param {number} controlID The control ID of the control to set the label for
-- @param {string} pText The text containing the parameter and track names
-- @param {number} ccOffset The offset to apply to the matching controlID to get the cc number
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getLabelDisplayMidi(controlID, pText, ccOffset)
  pText = sanitizeLabel(controlID, pText)
  local paramName, trackName = splitOnFirstMatch(pText, ',')

  -- Substitute eq parameter names to match spec
  if encoderMode == MODE.eq  and paramName ~= '-' then
    if controlID == kControlIDEncoder1 or controlID == kControlIDEncoder2 then
      paramName = 'Low Shelf'
    elseif controlID == kControlIDEncoder3 or controlID == kControlIDEncoder4 then
      paramName = 'Low Mid'
    elseif controlID == kControlIDEncoder5 or controlID == kControlIDEncoder6 then
      paramName = 'High Mid'
    elseif controlID == kControlIDEncoder7 or controlID == kControlIDEncoder8 then
      paramName = 'High Shelf'
    end
  end

  -- This assumes that the controlID is equal to the index in the controls table
  local cc = controls[controlID].midi[2] - ccOffset
  local midi = getDisplayMidi(cc, 0, false, trackName)
  midi = tableConcat(midi, getDisplayMidi(cc, 1, false, paramName))
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the pad colour in loveloop mode
-- @param {table} midi table containing the midi to send to the device, additional midi data will be added to this table and returned
-- @param {number} controlID The control ID of the pad
-- @param {table} assignment for the control
-- @param {number} currentValue of the control
-- @return table containing the midi data concatenated to the input midi table
-------------------------------------------------------------------------------
function getLiveLoopPadColor(midi, controlID, assignment, currentValue)
  local control = controls[controlID]
  local r, g, b, state, selected = IntegerToLiveLoopButtonState(currentValue)
  if state == kCSCellState_Playing then
    midi = tableConcat(midi, {0x92, control.midi[2], 21})
  elseif (state == kCSCellState_Armed) or (state == kCSCellState_Stopping) then
    midi = tableConcat(midi, {0x90, control.midi[2], 23, 0x91, control.midi[2], 21})
  elseif state == kCSCellState_CountingIn then
    midi = tableConcat(midi, {0x91, control.midi[2], 5})
  elseif state == kCSCellState_Recording then
    midi = tableConcat(midi, {0x92, control.midi[2], 5})
  elseif state == kCSCellState_Stopped then
    if r == 0 and g == 0 and b == 0 then
      midi = tableConcat(midi, {0x90, control.midi[2], 0})
    else
      if assignment.trackParam == CS_LIVELOOP1 then
        local rs, gs, bs = shiftRGB(r, g, b)
        midi = tableConcat(midi, makeSysex({0x01, 0x43, control.midi[2], rs, gs, bs}))
      else
        midi = tableConcat(midi, {0x90, control.midi[2], 21})
      end
    end
  end
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to display the mode change
-- @param {string} pText The text as supplied from CSFeedbackText
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getModeChangeMidi(pText)
  if shift == false then
    local title, body = splitOnFirstMatch(pText, ',')
    if title ~= nil and body ~= nil then
      return getTemporaryDisplayMidi(title, body)
    end
  end
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the pad or fader button colour
-- @param {table} midi table containing the midi to send to the device, additional midi data will be added to this table and returned
-- @param {number} controlID The control ID of the pad or fader button
-- @param {table} assignment for the control
-- @param {number} currentValue of the control
-- @return table containing the midi data concatenated to the input midi table
-------------------------------------------------------------------------------
function getPadColorMidi(midi, controlID, assignment, currentValue)
  if assignment.trackParam == CS_SELECT or assignment.trackParam == CS_COLOR then
    local control = controls[controlID]
    local trackIndex = assignment.objOffset
    local color = getTrackColor(trackIndex)
    if (color ~= nil) then
      local r, g, b = IntegerToRGB(color)
      local rs, gs, bs = shiftRGB(r, g, b)
      if getTrackSelect(trackIndex) ~= true then
        rs, gs, bs = darken(rs, gs, bs)
      end
      local lightingTypeAndTarget = nil
      local controlStatus = control.midi[1]
      if controlStatus >= 0x90 and controlStatus <= 0x9f then
        lightingTypeAndTarget = 0x43
      elseif controlStatus >= 0xb0 and controlStatus <= 0xbf then
        lightingTypeAndTarget = 0x53
      end
      if lightingTypeAndTarget ~= nil then
        midi = tableConcat(midi, makeSysex({0x01, lightingTypeAndTarget, control.midi[2], rs, gs, bs}))
        return midi;
      end
    end
  end

  local colorConfig = PAD_COLORS[assignment.trackParam]
  if colorConfig ~= nil then
    local color = colorConfig[currentValue]
    local control = controls[controlID]
    local value = color == nil and 0 or color
    midi = tableConcat(midi,  {control.midi[1], control.midi[2], value})
  end
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the stationary display grid
-- @param {string} title Text to render on the top line of the display
-- @param {table} fields Table containing up to 8 text items to render
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getStationaryDisplayGridMidi(title, fields)
  local address = 0x20
  local midi = getDisplayConfigMidi(address, 0x03)
  for i=1,8 do
    midi = tableConcat(midi, getDisplayMidi(address, i, false, fields[i]))
  end
  midi = tableConcat(midi, getDisplayMidi(address, 0, true, title))

  -- Turn off auto-trigger for Zoom, Marker & BPM encoders
  midi = tableConcat(midi, makeSysex({0x04, 0x16, 0x22}))
  midi = tableConcat(midi, makeSysex({0x04, 0x19, 0x22}))
  midi = tableConcat(midi, makeSysex({0x04, 0x1c, 0x22}))

  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the stationary display text
-- @param {string} topLine Text to render on the top line of the display
-- @param {string} middleLine Text to render on the middle line of the display
-- @param {string} bottomLine Text to render on the bottom line of the display
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getStationaryDisplayTextMidi(topLine, middleLine, bottomLine)
  local address = 0x20
  local midi = getDisplayConfigMidi(address, 0x02)
  midi = tableConcat(midi, getDisplayMidi(address, 0, false, topLine))
  midi = tableConcat(midi, getDisplayMidi(address, 1, false, middleLine))
  midi = tableConcat(midi, getDisplayMidi(address, 2, true, bottomLine))

  -- Turn on auto-trigger for Zoom, Marker & BPM encoders
  midi = tableConcat(midi, makeSysex({0x04, 0x16, 0x62}))
  midi = tableConcat(midi, makeSysex({0x04, 0x19, 0x62}))
  midi = tableConcat(midi, makeSysex({0x04, 0x1c, 0x62}))
  
  return midi
end

-------------------------------------------------------------------------------
-- Gets the sysex message to set the temporary display text
-- @param {string} title
-- @param {string} body
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getTemporaryDisplayMidi(title, body)
  local midi = getDisplayMidi(0x21, 0, false, title)
  midi = tableConcat(midi, getDisplayMidi(0x21, 1, true, body))
  return midi
end

-------------------------------------------------------------------------------
-- Gets sysex message to display the track bank range on the device
-- @param {string} trackStart The track number at the start of the track bank
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function getTrackBankDisplayMidi(trackStart)
  if trackStart ~= nil then
    local n = tonumber(trackStart)
    if n ~= nil then
      local range = trackStart .. '-' .. tostring(n + 7)
      local midi = getTemporaryDisplayMidi('Mixer Tracks', range)
      return midi
    end
  end
end

-------------------------------------------------------------------------------
-- Gets the colour integer for the supplied track index
-- @param {number} index Track index
-- @returns {number} Logic supplied colour integer
-------------------------------------------------------------------------------
function getTrackColor(index)
  local status = trackStatus[index] or {}
  return status.color
end 

-------------------------------------------------------------------------------
-- Gets the selected state for the supplied track index
-- @param {number} index Track index
-- @returns {boolean} True if the track is selected
-------------------------------------------------------------------------------
function getTrackSelect(index)
  local status = trackStatus[index] or {}
  return status.selected
end 

-------------------------------------------------------------------------------
-- Gets the LED brightness midi for up/down buttons to send to the device
-- @return table containing midi to send feedback to the device
-------------------------------------------------------------------------------
function getUpDownButtonBrightnessMidi(status, ccUp, brightnessUp, brightnessDown)
  return {status, ccUp, brightnessUp, status, ccUp+1, brightnessDown}
end

-------------------------------------------------------------------------------
-- Gets the sysex message to display the value on the device
-- @param {number} controlID The control ID of the control to set the value for
-- @param {string} pText The text containing the value
-- @param {number} ccOffset The offset to apply to the matching controlID to get the cc number
-- @param {boolean} trigger True to trigger the display
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function getValueDisplayMidi(controlID, pText, ccOffset, trigger)
  local cachedText = displayValueCache[controlID]
  pText = sanitizeValue(controlID, pText)
  if pText ~= cachedText then
    displayValueCache[controlID] = pText
    -- This assumes that the controlID is equal to the index in the controls table
    local cc = controls[controlID].midi[2] - ccOffset
    return getDisplayMidi(cc, 2, trigger, pText)
  end
end

-------------------------------------------------------------------------------
-- Checks if the supplied table contains the supplied value
-- @return `true` if the the supplied table contains the supplied value otherwise `false`
-------------------------------------------------------------------------------
function hasValue (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

-------------------------------------------------------------------------------
-- Creates a sysex message for the device using the supplied table
-- @return table containing the sysex message
-------------------------------------------------------------------------------
function makeSysex(t)
  local sysex = {0xf0, 0x00, 0x20, 0x29, DEVICE_PID_1, DEVICE_PID_2, table.unpack(t)}
  table.insert(sysex, 0xf7)
  return sysex
end

-------------------------------------------------------------------------------
-- Sets the flag to prevent display updates for 100ms
-------------------------------------------------------------------------------
function pauseDisplayTrigger()
  preventDisplayTrigger = true
  settriggertimer(settledDisplay == false and 500 or 100)
end

-------------------------------------------------------------------------------
-- Resets the flag to allow display updates
-------------------------------------------------------------------------------
function resumeDisplayTrigger()
  preventDisplayTrigger = false
end

-------------------------------------------------------------------------------
-- Ensures the supplied label matches the DAW spec for the supplied controlID and current encoderMode
-- @param {number} controlID The control ID of the control to set the label for
-- @param {string} label The label to ensure matches the DAW spec
-- @return a label which matches the DAW spec
-------------------------------------------------------------------------------
function sanitizeLabel(controlID, label)
  if controlID >= kControlIDEncoder1 and controlID <= kControlIDEncoder8 then
    local sendModes = {
      MODE.sends1,
      MODE.sends2,
      MODE.sends3,
      MODE.sends4,
      MODE.sends5,
      MODE.sends6,
      MODE.sends7,
      MODE.sends8,
      MODE.sends9,
      MODE.sends10,
      MODE.sends11,
      MODE.sends12
    }
    if hasValue(sendModes, encoderMode) then
      -- Remove the 'Send %d ' from the label
      label = label:gsub('^Send %d ', '')
    end
  end
  return label
end

-------------------------------------------------------------------------------
-- Ensures the supplied value matches the DAW spec for the supplied controlID and current encoderMode
-- @param {number} controlID The control ID of the control to set the value for
-- @param {string} value The value to ensure matches the DAW spec
-- @return a value which matches the DAW spec
-------------------------------------------------------------------------------
function sanitizeValue(controlID, value)
  if controlID >= kControlIDEncoder1 and controlID <= kControlIDEncoder8 then
    if encoderMode == MODE.pan then
      local n = tonumber(value)
      if n == nil or n == 0 then
        value = 'C'
      else
        value = (n > 0 and 'R' or 'L') .. value:sub(2)
      end
    end
  end
  return value
end

-------------------------------------------------------------------------------
-- Sends the button brightness midi to the device for the button matching the supplied midi table
-- @param {table} midi The midi of the button send brightness for
-- @param {number} bright The brightness value for the button when it is bright
-- @param {number} dim The brightness value for the button when it is dim
-------------------------------------------------------------------------------
function sendDelayedButtonBrightnessMidi(midi, bright, dim)
  local value = midi[2] == 0x7f and bright or dim
  appendDelayedMidi({0xb3, midi[1], value})
  -- The midi will be sent to the device from the controller_timer_trigger function
  settriggertimer(100)
end

-------------------------------------------------------------------------------
-- Sends the supplied text to the appropriate display on the device
-- @param {number} address Encoder/fader cc number associated with text or 0x21 for global temporary display or 0x20 for stationary display
-- @param {string} line1 Text to set in line 1 of the display
-- @param {string} line2 Text to set in line 2 of the display
-- @param {string} line3 Text to set in line 3 of the display
-- @param {boolean} trigger True to trigger the display
-------------------------------------------------------------------------------
function sendDelayedDisplayMidi(address, line1, line2, line3, trigger)
  if shift == false then
    delayedDisplay = {
      address = address,
      line1 = line1,
      line2 = line2,
      line3 = line3,
      trigger = trigger
    }
    -- The midi will be sent to the device from the controller_timer_trigger function
    settriggertimer(100)
  end
end

-------------------------------------------------------------------------------
-- Sends the supplied title and fields to the stationary display on the device
-- @param {string} title Text to set in line 1 of the display
-- @param {table} fields Table containing up to 8 text items to render
-------------------------------------------------------------------------------
function sendDelayedStationaryGridMidi(title, fields)
  appendDelayedMidi(getStationaryDisplayGridMidi(title, fields))
end

-------------------------------------------------------------------------------
-- Sends the supplied text to the stationary display on the device
-- @param {string} topLine Text to set in line 1 of the display
-- @param {string} middleLine Text to set in line 2 of the display
-- @param {string} bottomLine Text to set in line 3 of the display
-------------------------------------------------------------------------------
function sendDelayedStationaryTextMidi(topLine, middleLine, bottomLine)
  appendDelayedMidi(getStationaryDisplayTextMidi(topLine, middleLine, bottomLine))
end

-------------------------------------------------------------------------------
-- Sets the global liveLoopMode flag
-- @param {boolean} isLiveLoopMode True if the device is in Live Loops mode
-------------------------------------------------------------------------------
function setLiveLoopMode(isLiveLoopMode)
  liveLoopMode = isLiveLoopMode
end

-------------------------------------------------------------------------------
-- Sets the bytes in the supplied midi table to select the appropriate sub page
-- @param {table} midi The midi to transform
-- @param {string} subPage The sub page to set
-------------------------------------------------------------------------------
function setMidiToSelectSubPage(midi, subPage)
  midi[0] = SUBPAGE_MIDI_MAP[subPage][1];
  midi[1] = SUBPAGE_MIDI_MAP[subPage][2];
  midi[2] = SUBPAGE_MIDI_MAP[subPage][3];
end

-------------------------------------------------------------------------------
-- Shifts the supplied RGB values
-- @param {number} r integer value for the red component
-- @param {number} g integer value for the green component
-- @param {number} b integer value for the blue component
-- @returns {number, number, number} integer values for the shifted red, green and blue components
-------------------------------------------------------------------------------
function shiftRGB(r, g, b)
  return bit32.rshift(r,1), bit32.rshift(g,1), bit32.rshift(b,1)
end

-------------------------------------------------------------------------------
-- Splits the supplied text on the first match of the supplied pattern
-- @return the text before the match and the text after the match
-------------------------------------------------------------------------------
function splitOnFirstMatch(text, pattern)
  local a, b = text:match("([^" .. pattern .. "]+)" .. pattern .. "(.+)")
  return a, b
end

-------------------------------------------------------------------------------
-- Transforms the supplied midi to select the appropriate sub page
-- @param {table} midi The midi to transform
-------------------------------------------------------------------------------
function transformMidiToSelectSubPage(midi)
  if shift and midi[0] == 0xb6 and (midi[1] == CC_ENCODERMODE or midi[1] == CC_ENCODERMODE_LEGACY) then
    if midi[2] == 0x01 then
      setMidiToSelectSubPage(midi, mixerSubPage);
    elseif midi[2] == 0x02 then
      setMidiToSelectSubPage(midi, pluginSubPage);
    elseif midi[2] == 0x04 then
      setMidiToSelectSubPage(midi, sendsSubPage);
    end
  end
end

-------------------------------------------------------------------------------
-- Utility function for creating a Set
-- 
-- Example usage
-- ```
-- set = Set({1, 2, 3})
-- 
-- // check if the Set includes a value
-- if set.includes(2)
-- // or
-- if Set({1, 2, 3}).includes(2)
-- ```
-- 
-- @param {table} list of items to add to the set
-- @return {table} the set of items
-------------------------------------------------------------------------------
function Set(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  
  function set.includes(key)
    return set[key] ~= nil
  end

  return set
end

-------------------------------------------------------------------------------
-- Taken from https://stackoverflow.com/questions/1410862/concatenation-of-tables-in-lua
-- Concatenates the supplied tables. NB t1 is modified.
-- @return table containing the concatenated tables
-------------------------------------------------------------------------------
function tableConcat(t1, t2)
  if t1 ~= nil and t2 ~= nil then
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
  end
  return t1 or t2
end