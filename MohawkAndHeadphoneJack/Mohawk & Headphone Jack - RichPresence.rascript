// Mohawk & Headphone Jack
// #ID = 1036

// $00EC: Play Mode [8-bit]
//        0x00 = Default
//        0x10 = Demo Mode
//        0x50 = Playback Mode
//        0x80 = Title Screen
//        0x90 = Transition to Demo
function playMode() => byte(0x0000EC)

PlayModeLookup = {
    0x10: "Watching Demo",
    0x50: "Watching a Playback",
    0x80: "On Title Screen",
}

// $00E7: Game State [8-bit]
//        0x00 = On Title/Result Screen
//        0x42 = In Level
function gameState() => byte(0x0000E7)

// $0318: Selected Music Track [8-bit]
//        "Bonus" tracks are only accessible in the menu when using cheats.
//        0x00-0x14 = Mega CD Tracks
//        0x15-0x1f = Bonus Tracks
function selectedMusicTrack() => byte(0x000318)

TrackLookup = {
    0: "Scissor Fish 1",
    1: "Scissor Fish 2",
    2: "Scissor Fish 3",
    3: "Rubber Bucket 1",
    4: "Rubber Bucket 2",
    5: "Rubber Bucket 3",
    6: "Chopper Hounds 1",
    7: "Chopper Hounds 2",
    8: "Chopper Hounds 3",
    9: "Voodoo Puppets 1",
    10: "Voodoo Puppets 2",
    11: "Voodoo Puppets 3",
    12: "Elepfant Funk 1",
    13: "Elepfant Funk 2",
    14: "Elepfant Funk 3",
    15: "Atomic Raygun 1",
    16: "Atomic Raygun 2",
    17: "Atomic Raygun 3",
    18: "Corsehairs 1",
    19: "Corsehairs 2",
    20: "Corsehairs 3",
    21: "Headslots Funbot 1",
    22: "Headslots Funbot 2",
    23: "Headslots Orbatron",
    24: "Headslots Psychic Brain",
    25: "Headslots Tiki par lez VooDoo",
    26: "Headslots Octopus",
    27: "Headslots Moa Moa Sulfuric Surfer",
    28: "Headslots Skeleguts",
    29: "Mohawk Bonus Round",
    30: "Mohawk Finale 1",
    31: "Mohawk Finale 2",
}

// $031A: Mega CD Set 1 [Bit Flags]
//        0 = Scissor Fish 1 (1-1, 5-1)
//        1 = Scissor Fish 2 (2-1, 7-2)
//        2 = Scissor Fish 3 (4-1, 6-1)
//        3 = Rubberbucket 1 (2-1, 2-2)
//        4 = Rubberbucket 2 (3-2, 5-2)
//        5 = Rubberbucket 3 (4-1, 7-1)
//        6 = Chopper Hounds 1 (1-1, 4, 2)
//        7 = Chopper Hounds 2 (2-2, 5-2)
function megaCDSet1Bit0() => bit0(0x00031A)
function megaCDSet1Bit1() => bit1(0x00031A)
function megaCDSet1Bit2() => bit2(0x00031A)
function megaCDSet1Bit3() => bit3(0x00031A)
function megaCDSet1Bit4() => bit4(0x00031A)
function megaCDSet1Bit5() => bit5(0x00031A)
function megaCDSet1Bit6() => bit6(0x00031A)
function megaCDSet1Bit7() => bit7(0x00031A)
function megaCDSet1Count() => bitcount(0x00031A)

// $031B: Mega CD Set 2 [Bit Flags]
//        0 = Chopper Hounds 3 (3-2, 7-2)
//        1 = Voodoo Puppets 1 (Default, 1-2, 6-1) -- Exclude
//        2 = Voodoo Puppets 2 (2-1, 4-2)
//        3 = Voodoo Puppets 3 (3-1, 7-1)
//        4 = Elepfant Funk 1 (1-1, 5-1)
//        5 = Elepfant Funk 2 (2-2, 7-1)
//        6 = Elepfant Funk 3 (3-2, 6-1)
//        7 = Atomic Raygun 1 (1-2, 4-2)
function megaCDSet2Bit0() => bit0(0x00031B)
function megaCDSet2Bit1() => bit1(0x00031B)
function megaCDSet2Bit2() => bit2(0x00031B)
function megaCDSet2Bit3() => bit3(0x00031B)
function megaCDSet2Bit4() => bit4(0x00031B)
function megaCDSet2Bit5() => bit5(0x00031B)
function megaCDSet2Bit6() => bit6(0x00031B)
function megaCDSet2Bit7() => bit7(0x00031B)

// $031C: Mega CD Set 3 [Bit Flags]
//        "Bonus" tracks play during boss fights or during the final stage. Only accessible in the menu when using cheats.
//        0 = Atomic Raygun 2 (2-1, 5-2)
//        1 = Atomic Raygun 3 (3-1, 6-2)
//        2 = Corsehairs 1 (1-2, 5-1)
//        3 = Corsehairs 2 (3-1, 7-2)
//        4 = Corsehairs 3 (4-1, 6-2)
//        5 = Headslots Funbot (Bonus)
//        6 = Headslots Funbot (Bonus)
//        7 = Headslots Orbatron (Bonus)
function megaCDSet3Bit0() => bit0(0x00031C)
function megaCDSet3Bit1() => bit1(0x00031C)
function megaCDSet3Bit2() => bit2(0x00031C)
function megaCDSet3Bit3() => bit3(0x00031C)
function megaCDSet3Bit4() => bit4(0x00031C)

function countMegaCDs(){
    return
        megaCDSet1Count() +
        megaCDSet2Bit0() + megaCDSet2Bit2() +
        megaCDSet2Bit3() + megaCDSet2Bit4() +
        megaCDSet2Bit5() + megaCDSet2Bit6() +
        megaCDSet2Bit7() + 
        megaCDSet3Bit0() + megaCDSet3Bit1() +
        megaCDSet3Bit2() + megaCDSet3Bit3() +
        megaCDSet3Bit4()
}

// $032E: Level [8-bit]
//        0x00 = 1-1
//        0x01 = 1-2
//        0x02 = 2-1
//        0x03 = 2-2
//        0x04 = 3-1
//        0x05 = 3-2
//        0x06 = 4-1
//        0x07 = 4-2
//        0x08 = 5-1
//        0x09 = 5-2
//        0x0a = 6-1
//        0x0b = 6-2
//        0x0c = 7-1
//        0x0d = 7-2
//        0x0e = Final
//        0x0f = Bonus 1-1
//        0x10 = Bonus 1-2
//        0x11 = Bonus 2-1
//        0x12 = Bonus 2-2
//        0x13 = Bonus 3-1
//        0x14 = Bonus 3-2
//        0x15 = Bonus 4-1
//        0x16 = Bonus 4-2
//        0x17 = Bonus 5-1
//        0x18 = Bonus 5-2
//        0x19 = Bonus 6-1
//        0x1a = Bonus 6-2
//        0x1b = Bonus 7-1
//        0x1c = Bonus 7-2
function level() => byte(0x00032E)

LevelLookup = {
    0: "Scraping the Surface 1",
    1: "Scraping the Surface 2",
    2: "Tropical Caves 1",
    3: "Tropical Caves 2",
    4: "Deep Water 1",
    5: "Deep Water 2",
    6: "Toast in the Machine 1",
    7: "Toast in the Machine 2",
    8: "It Takes Guts 1",
    9: "It Takes Guts 2",
    10: "Getting Warmer 1",
    11: "Getting Warmer 2",
    12: "Radio-Active 1",
    13: "Radio-Active 2",
    14: "Headslot H.Q.",
    15: "Scraping the Surface Bonus 1",
    16: "Scraping the Surface Bonus 2",
    17: "Tropical Caves Bonus 1",
    18: "Tropical Caves Bonus 2",
    19: "Deep Water Bonus 1",
    20: "Deep Water Bonus 2",
    21: "Toast in the Machine Bonus 1",
    22: "Toast in the Machine Bonus 2",
    23: "It Takes Guts Bonus 1",
    24: "It Takes Guts Bonus 2",
    25: "Getting Warmer Bonus 1",
    26: "Getting Warmer Bonus 2",
    27: "Radio-Active Bonus 1",
    28: "Radio-Active Bonus 2"
}

//Score [32-bit] [Decimal]
function score() => byte(0x00030C)

function warpType() => byte(0x000FB8)
function warping() => warpType() != 0

function bossState() => byte(0x0000EB)
function bossActive() => bossState() == 0x03
function bossDefeated() => bossState() == 0x01

function inGame() => playMode() == 0x00 && gameState() == 0x42
function onResultScreen() => playMode() == 0x00 && score() != 0 && warping()
function watchingCredits() => playMode() == 0x00 && score() == 0 && selectedMusicTrack() == 0x1e
function inDemo() => playMode() == 0x10
function inPlayback() => playMode() == 0x50
function onTitle() => playMode() == 0x80

rich_presence_conditional_display(inGame() && !bossActive(), "Playing {0} | Listening to {1} | Mega CDs {2}/20",
    rich_presence_lookup("Level", level(), LevelLookup),
    rich_presence_lookup("Track", selectedMusicTrack(), TrackLookup),
    rich_presence_value("Number", countMegaCDs())
)

rich_presence_conditional_display(inGame() && bossActive(), "Fighting the Boss on {0} | Listening to {1} | Mega CDs {2}/20",
    rich_presence_lookup("Level", level(), LevelLookup),
    rich_presence_lookup("Track", selectedMusicTrack(), TrackLookup),
    rich_presence_value("Number", countMegaCDs())
)

rich_presence_conditional_display(onResultScreen() && selectedMusicTrack() != 0x1e, "Warping to a New Location")

rich_presence_conditional_display(onResultScreen() && selectedMusicTrack() == 0x1e, "Watching Ending")

rich_presence_conditional_display(watchingCredits(), "Watching Credits")

rich_presence_conditional_display(inDemo() || inPlayback(), "{0} | Listening to {1}",
    rich_presence_lookup("PlayMode", playMode(), PlayModeLookup),
    rich_presence_lookup("Track", selectedMusicTrack(), TrackLookup)
)

rich_presence_conditional_display(onTitle(), "{0}",
    rich_presence_lookup("PlayMode", playMode(), PlayModeLookup)
)

rich_presence_display("Playing Mohawk & Headphone Jack")
