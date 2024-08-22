// Air-Sea Battle | Target Fun
// #ID = 13100
// Retro Achievements - Achievement Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "State": byte(0x17),
    "Mode": low4(0x19) + high4(0x19) * 10,
    "LeftDifficulty": byte(0x3a),
    "RightDifficulty": byte(0x3b),
    "Timer": byte(0x2),
    "HardwareState": byte(0x3),
    "TVType": byte(0x9)
}

Screen = {
    "State": low4(0x1b)
}

Enemy = {
    "Sprite0": byte(0x57),
    "Sprite1": byte(0x56)
}

RightPlayer = {
    "Points": low4(0xc) + high4(0xc) * 10
}

LeftPlayer = {
    "Points": low4(0xb) + high4(0xb) * 10
}

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

GameModes = {
    "Aircraft": 1,
    "GuidedAircraft": 2,
    "CPUAircraft": 3,
    "BlimpAircraft": 4,
    "GuidedBlimpAircraft": 5,
    "CPUBlimpAircraft": 6,
    "Torpedo": 7,
    "GuidedTorpedo": 8,
    "CPUTorpedo": 9,
    "MineTorpedo": 10,
    "GuidedMineTorpedo": 11,
    "CPUMineTorpedo": 12,
    "Shooting": 13,
    "GuidedShooting": 14,
    "CPUShooting": 15,
    "Polaris": 16,
    "GuidedPolaris": 17,
    "CPUPolaris": 18,
    "Bomber": 19,
    "GuidedBomber": 20,
    "CPUBomber": 21,
    "PolarisBomber": 22,
    "GuidedPolarisBomber": 23,
    "CPUPolarisBomber": 24,
    "MinePolarisBomber": 25,
    "GuidedMinePolarisBomber": 26,
    "CPUMinePolarisBomber": 27
}

// ======================================================================= //
// Lookup Dictionaries
// ======================================================================= //

GameModeLookup = {
    1: "Anti-Aircraft [STANDARD]",
    2: "Anti-Aircraft [GUIDED]",
    3: "Anti-Aircraft [VS. CPU]",
    4: "Blimp Anti-Aircraft [STANDARD]",
    5: "Blimp Anti-Aircraft [GUIDED]",
    6: "Blimp Anti-Aircraft [VS. CPU]",
    7: "Torpedo [STANDARD]",
    8: "Torpedo [GUIDED]",
    9: "Torpedo [VS. CPU]",
    10: "Mine Torpedo [STANDARD]",
    11: "Mine Torpedo [GUIDED]",
    12: "Mine Torpedo [VS. CPU]",
    13: "Shooting Gallery [STANDARD]",
    14: "Shooting Gallery [GUIDED]",
    15: "Shooting Gallery [VS. CPU]",
    16: "Polaris [STANDARD]",
    17: "Polaris [GUIDED]",
    18: "Polaris [VS. CPU]",
    19: "Bomber [STANDARD]",
    20: "Bomber [GUIDED]",
    21: "Bomber [VS. CPU]",
    22: "Polaris vs. Bomber [STANDARD]",
    23: "Polaris vs. Bomber [GUIDED]",
    24: "Polaris vs. Bomber [VS. CPU]",
    25: "Mine Polaris vs. Bomber [STANDARD]",
    26: "Mine Polaris vs. Bomber [GUIDED]",
    27: "Mine Polaris vs. Bomber [VS. CPU]"
}

LeftPlayerLookup = {
    1: "LEFT: ",
    2: "LEFT: ",
    3: "CPU: ",
    4: "LEFT: ",
    5: "LEFT: ",
    6: "CPU: ",
    7: "LEFT: ",
    8: "LEFT: ",
    9: "CPU: ",
    10: "LEFT: ",
    11: "LEFT: ",
    12: "CPU:",
    13: "LEFT: ",
    14: "LEFT: ",
    15: "CPU: ",
    16: "LEFT: ",
    17: "LEFT: ",
    18: "CPU:",
    19: "LEFT: ",
    20: "LEFT: ",
    21: "CPU: ",
    22: "LEFT: ",
    23: "LEFT: ",
    24: "CPU: ",
    25: "LEFT: ",
    26: "LEFT: ",
    27: "CPU: "
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => Game["State"] == 0xff
function IsSelectingMode() => Game["State"] == 0x00 && Screen["State"] == 0x00
function IsOnGameOver() => Game["State"] == 0x00 && Screen["State"] == 0x0f

function BallonShot(mode){
    return disable_when(Game["Mode"] == Modes["BlimpAircraft"] && prev(Enemy["Sprite0"]) == 0x20 && Enemy["Sprite0"] == 0xa0) &&
        disable_when(Game["Mode"] == Modes["BlimpAircraft"] && prev(Enemy["Sprite1"]) == 0x20 && Enemy["Sprite1"] == 0xa0) &&
        disable_when(Game["Mode"] == Modes["GuidedBlimpAircraft"] && prev(Enemy["Sprite0"]) == 0x20 && Enemy["Sprite0"] == 0xa0) &&
        disable_when(Game["Mode"] == Modes["GuidedBlimpAircraft"] && prev(Enemy["Sprite1"]) == 0x20 && Enemy["Sprite1"] == 0xa0) &&
        (
            never(Game["HardwareState"] == 0x00) || 
            never(Game["HardwareState"] == 0xff) ||
            never(Game["Timer"] == 0x00)
        )
}

function MineShot(mode){
    return disable_when(Game["Mode"] == Modes["MineTorpedo"] && prev(Enemy["Sprite0"]) == 0x60 && Enemy["Sprite0"] == 0xa0) &&
        disable_when(Game["Mode"] == Modes["MineTorpedo"] && prev(Enemy["Sprite1"]) == 0x60 && Enemy["Sprite1"] == 0xa0) &&
        disable_when(Game["Mode"] == Modes["GuidedMineTorpedo"] && prev(Enemy["Sprite0"]) == 0x60 && Enemy["Sprite0"] == 0xa0) &&
        disable_when(Game["Mode"] == Modes["GuidedMineTorpedo"] && prev(Enemy["Sprite1"]) == 0x60 && Enemy["Sprite1"] == 0xa0) &&
        (
            never(Game["HardwareState"] == 0x00) || 
            never(Game["HardwareState"] == 0xff) ||
            never(Game["Timer"] == 0x00)
        )
}

function GameEnded(){
    return Screen["State"] == 0xf && prev(Game["State"]) == 0xff && Game["State"] == 0x00 
}

// ======================================================================= //
// Achievement Functions
// ======================================================================= //  



// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //      

achievement("[DRAFT] Mode 1 Clear", "Score 30 points or more on mode 1", points = 2, id = 458043,
    trigger = always_false()
)

achievement("[DRAFT] Mode 2 Clear", "Score 50 points or more on mode 2", points = 2, id = 458044,
    trigger = always_false()
)

achievement("[DRAFT] Mode 3 Clear", "Beat the CPU on mode 3", points = 3, type = "progression", id = 458045,
    trigger = always_false()
)

achievement("[DRAFT] Mode 4 Clear", "Score 30 points or more on mode 4", points = 2, id = 458046,
    trigger = always_false()
)

achievement("[DRAFT] Mode 5 Clear", "Score 50 points or more on mode 5", points = 2, id = 458047,
    trigger = always_false()
)

achievement("[DRAFT] Mode 6 Clear", "Beat the CPU on mode 6", points = 3, type = "progression", id = 458048,
    trigger = always_false()
)

achievement("[DRAFT] Mode 7 Clear", "Score 30 points or more on mode 7", points = 2, id = 458049,
    trigger = always_false()
)

achievement("[DRAFT] Mode 8 Clear", "Score 50 points or more on mode 8", points = 2, id = 458050,
    trigger = always_false()
)

achievement("[DRAFT] Mode 9 Clear", "Beat the CPU on mode 9", points = 3, type = "progression", id = 458051,
    trigger = always_false()
)

achievement("[DRAFT] Mode 10 Clear", "Score 30 points or more on mode 10", points = 2, id = 458052,
    trigger = always_false()
)

achievement("[DRAFT] Mode 11 Clear", "Score 50 points or more on mode 11", points = 2, id = 458053,
    trigger = always_false()
)

achievement("[DRAFT] Mode 12 Clear", "Beat the CPU on mode 12", points = 3, type = "progression", id = 458054,
    trigger = always_false()
)

achievement("[DRAFT] Mode 13 Clear", "Score 50 points or more on mode 13", points = 2, id = 458055,
    trigger = always_false()
)

achievement("[DRAFT] Mode 14 Clear", "Score 70 points or more on mode 14", points = 2, id = 458056,
    trigger = always_false()
)

achievement("[DRAFT] Mode 15 Clear", "Beat the CPU on mode 15", points = 3, type = "progression", id = 458057,
    trigger = always_false()
)

achievement("[DRAFT] Mode 16 Clear", "Score 30 points or more on mode 16", points = 2, id = 458058,
    trigger = always_false()
)

achievement("[DRAFT] Mode 17 Clear", "Score 50 points or more on mode 17", points = 2, id = 458059,
    trigger = always_false()
)

achievement("[DRAFT] Mode 18 Clear", "Beat the CPU on mode 18", points = 3, type = "progression", id = 458060,
    trigger = always_false()
)

achievement("[DRAFT] Mode 19 Clear", "Score 50 points or more on mode 19", points = 2, id = 458061,
    trigger = always_false()
)

achievement("[DRAFT] Mode 20 Clear", "Score 70 points or more on mode 20", points = 2, id = 458062,
    trigger = always_false()
)

achievement("[DRAFT] Mode 21 Clear", "Beat the CPU on mode 21", points = 3, type = "progression", id = 458063,
    trigger = always_false()
)

achievement("[DRAFT] Mode 24 Clear", "Beat the CPU on mode 24", points = 3, type = "progression", id = 458064,
    trigger = always_false()
)

achievement("[DRAFT] Mode 27 Clear", "Beat the CPU on mode 27", points = 3, type = "progression", id = 458065,
    trigger = always_false()
)

// ======================================================================= //
// Achievement Definitions - Challenges
// ======================================================================= //  

achievement("[DRAFT] Mode 4 Challenge", "Score 20 points or more without hitting a blimp on mode 4", points = 5, id = 458066,
    trigger = always_false()
)

achievement("[DRAFT] Mode 5 Challenge", "Score 30 points or more without hitting a blimp on mode 5", points = 5, id = 458067,
    trigger = always_false()
)

achievement("[DRAFT] Mode 10 Challenge", "Score 20 points or more without hitting a mine on mode 10", points = 5, id = 458068,
    trigger = always_false()
)

achievement("[DRAFT] Mode 11 Challenge", "Score 30 points or more without hitting a mine on mode 11", points = 5, id = 458069,
    trigger = always_false()
)

achievement("[DRAFT] 99 Point Challenge", "Score 99 points on any mode", points = 10, id = 458070,
    trigger = always_false()
)

achievement("[DRAFT] CPU Challenge 1", "Beat the CPU with a 10 or more point lead on any versus CPU mode", points = 5, id = 458071,
    trigger = always_false()
)

achievement("[DRAFT] CPU Challenge 2", "Beat the CPU with a 20 or more point lead on any versus CPU mode", points = 10, id = 458072,
    trigger = always_false()
)

