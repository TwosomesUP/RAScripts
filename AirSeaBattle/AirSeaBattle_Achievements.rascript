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
    "Sprite0": high4(0x57),
    "Sprite1": high4(0x56)
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
function GameReset() => Game["HardwareState"] == 0x00

function BlimpShot(mode){
    return disable_when(Game["Mode"] == GameModes["BlimpAircraft"] && prev(Enemy["Sprite0"]) == 0x2 && Enemy["Sprite0"] == 0xa, !IsInGame() || GameReset()) &&
        disable_when(Game["Mode"] == GameModes["BlimpAircraft"] && prev(Enemy["Sprite1"]) == 0x2 && Enemy["Sprite1"] == 0xa, !IsInGame() || GameReset()) &&
        disable_when(Game["Mode"] == GameModes["GuidedBlimpAircraft"] && prev(Enemy["Sprite0"]) == 0x2 && Enemy["Sprite0"] == 0xa, !IsInGame() || GameReset()) &&
        disable_when(Game["Mode"] == GameModes["GuidedBlimpAircraft"] && prev(Enemy["Sprite1"]) == 0x2 && Enemy["Sprite1"] == 0xa, !IsInGame() || GameReset())
}

function MineShot(mode){
    return disable_when(Game["Mode"] == GameModes["MineTorpedo"] && prev(Enemy["Sprite0"]) == 0x6 && Enemy["Sprite0"] == 0xa, !IsInGame() || GameReset()) &&
        disable_when(Game["Mode"] == GameModes["MineTorpedo"] && prev(Enemy["Sprite1"]) == 0x6 && Enemy["Sprite1"] == 0xa, !IsInGame() || GameReset()) &&
        disable_when(Game["Mode"] == GameModes["GuidedMineTorpedo"] && prev(Enemy["Sprite0"]) == 0x6 && Enemy["Sprite0"] == 0xa, !IsInGame() || GameReset()) &&
        disable_when(Game["Mode"] == GameModes["GuidedMineTorpedo"] && prev(Enemy["Sprite1"]) == 0x6 && Enemy["Sprite1"] == 0xa, !IsInGame() || GameReset())
}

function GameEnded(){
    return Screen["State"] == 0xf && prev(Game["State"]) == 0xff && Game["State"] == 0x00 
}

function AnyPlayerScoredPoints(score){
    return ((prev(LeftPlayer["Points"]) < score && LeftPlayer["Points"] >= score) || 
        (prev(RightPlayer["Points"]) < score && RightPlayer["Points"] >= score))
}

function PlayerScoredPoints(score){
    return RightPlayer["Points"] < score && RightPlayer["Points"] >= score
}

// ======================================================================= //
// Achievement Functions
// ======================================================================= //  

function ClearedStandardMode(mode, score){
    return Screen["State"] == 0x0f &&
        Game["Mode"] == mode &&
        AnyPlayerScoredPoints(score)
}

function ClearedCPUMode(mode){
    return GameEnded() &&
        Game["Mode"] == mode &&
        RightPlayer["Points"] > LeftPlayer["Points"]
}

function ClearedBlimpChallenge(mode, score){
    return Screen["State"] == 0x0f &&
        Game["Mode"] == mode &&
        ((prev(LeftPlayer["Points"]) < score && trigger_when(LeftPlayer["Points"] >= score)) || 
        (prev(RightPlayer["Points"]) < score && trigger_when(RightPlayer["Points"] >= score))) &&
        BlimpShot(mode)
}

function ClearedMineChallenge(mode, score){
    return Screen["State"] == 0x0f &&
        Game["Mode"] == mode &&
        ((prev(LeftPlayer["Points"]) < score && trigger_when(LeftPlayer["Points"] >= score)) || 
        (prev(RightPlayer["Points"]) < score && trigger_when(RightPlayer["Points"] >= score))) &&
        MineShot(mode)
}

function Got99Points(){
    return Screen["State"] == 0x0f &&
        ((prev(RightPlayer["Points"]) < 99 && RightPlayer["Points"] >= 99) ||
        (
            prev(LeftPlayer["Points"]) < 99 && LeftPlayer["Points"] >= 99 && 
            Game["Mode"] != 3 &&
            Game["Mode"] != 6 &&
            Game["Mode"] != 9 &&
            Game["Mode"] != 12 &&
            Game["Mode"] != 15 &&
            Game["Mode"] != 18 &&
            Game["Mode"] != 21 &&
            Game["Mode"] != 24 &&
            Game["Mode"] != 27
        ))
}

function ClearedCPUChallenge(difference){
    return GameEnded() &&
        RightPlayer["Points"] - LeftPlayer["Points"] >= difference &&
        (
            Game["Mode"] == 3 ||
            Game["Mode"] == 6 ||
            Game["Mode"] == 9 ||
            Game["Mode"] == 12 ||
            Game["Mode"] == 15 ||
            Game["Mode"] == 18 ||
            Game["Mode"] == 21 ||
            Game["Mode"] == 24 ||
            Game["Mode"] == 27
        )
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //      

achievement("Not Cleared for Takeoff", "Score 30 points or more while playing game 1", points = 2, id = 458043,
    trigger = ClearedStandardMode(1, 30)
)

achievement("On Autopilot", "Score 40 points or more while playing game 2", points = 2, id = 458044,
    trigger = ClearedStandardMode(2, 40)
)

achievement("Computer Glitch", "Beat the CPU while playing game 3", points = 3, type = "progression", id = 458045,
    trigger = ClearedCPUMode(3)
)

achievement("Holding Pattern", "Score 50 points or more while playing game 4", points = 2, id = 458046,
    trigger = ClearedStandardMode(4, 50)
)

achievement("Turbulence Ahead", "Score 70 points or more while playing game 5", points = 2, id = 458047,
    trigger = ClearedStandardMode(5, 70)
)

achievement("Computer Shutdown", "Beat the CPU while playing game 6", points = 3, type = "progression", id = 458048,
    trigger = ClearedCPUMode(6)
)

achievement("Fire at Will", "Score 30 points or more while playing game 7", points = 2, id = 458049,
    trigger = ClearedStandardMode(7, 30)
)

achievement("Target Locked", "Score 40 points or more while playing game 8", points = 2, id = 458050,
    trigger = ClearedStandardMode(8, 40)
)

achievement("Computer Crash", "Beat the CPU while playing game 9", points = 3, type = "progression", id = 458051,
    trigger = ClearedCPUMode(9)
)

achievement("Mine for the Taking", "Score 50 points or more while playing game 10", points = 2, id = 458052,
    trigger = ClearedStandardMode(10, 50)
)

achievement("What's Yours is Mine", "Score 70 points or more while playing game 11", points = 2, id = 458053,
    trigger = ClearedStandardMode(11, 70)
)

achievement("Computer Reboot", "Beat the CPU while playing game 12", points = 3, type = "progression", id = 458054,
    trigger = ClearedCPUMode(12)
)

achievement("Big Shot", "Score 50 points or more while playing game 13", points = 2, id = 458055,
    trigger = ClearedStandardMode(13, 50)
)

achievement("Top Gun", "Score 70 points or more while playing game 14", points = 2, id = 458056,
    trigger = ClearedStandardMode(14, 70)
)

achievement("Computer Bug", "Beat the CPU while playing game 15", points = 3, type = "progression", id = 458057,
    trigger = ClearedCPUMode(15)
)

achievement("Flight Risk", "Score 30 points or more while playing game 16", points = 2, id = 458058,
    trigger = ClearedStandardMode(16, 30)
)

achievement("With Flying Colors", "Score 50 points or more while playing game 17", points = 2, id = 458059,
    trigger = ClearedStandardMode(17, 50)
)

achievement("Computer Hacker", "Beat the CPU while playing game 18", points = 3, type = "progression", id = 458060,
    trigger = ClearedCPUMode(18)
)

achievement("Bombs Away", "Score 50 points or more while playing game 19", points = 2, id = 458061,
    trigger = ClearedStandardMode(19, 50)
)

achievement("Full Blast", "Score 70 points or more while playing game 20", points = 2, id = 458062,
    trigger = ClearedStandardMode(20, 70)
)

achievement("Computer Overload", "Beat the CPU while playing game 21", points = 3, type = "progression", id = 458063,
    trigger = ClearedCPUMode(21)
)

// Removed due to no challenge
/*
achievement("[DRAFT] Mode 24 Clear", "Beat the CPU while playing game 24", points = 3, type = "progression", id = 458064,
    trigger = ClearedCPUMode(24)
)
*/

//Removed due to no challenge
/*
achievement("[DRAFT] Mode 27 Clear", "Beat the CPU while playing game 27", points = 3, type = "progression", id = 458065,
    trigger = ClearedCPUMode(27)
)
*/

// ======================================================================= //
// Achievement Definitions - Challenges
// ======================================================================= //  

achievement("Near Miss", "Score 30 points or more without hitting a blimp while playing game 4", points = 5, id = 458066,
    trigger = ClearedBlimpChallenge(4, 30)
)

achievement("Evasion Tactics", "Score 40 points or more without hitting a blimp while playing game 5", points = 5, id = 458067,
    trigger = ClearedBlimpChallenge(5, 40)
)

achievement("Mine Sweeper", "Score 30 points or more without hitting a mine while playing game 10", points = 5, id = 458068,
    trigger = ClearedMineChallenge(10, 30)
)

achievement("Demolitions Expert", "Score 40 points or more without hitting a mine while playing game 11", points = 5, id = 458069,
    trigger = ClearedMineChallenge(11, 40)
)

achievement("Skilled Marksman", "Score 99 points while playing any game", points = 10, id = 458070,
    trigger = Got99Points()
)

achievement("Bypassed", "Beat the CPU with a 10 or more point lead on any versus CPU game", points = 5, id = 458071,
    trigger = ClearedCPUChallenge(10)
)

achievement("Circumvented", "Beat the CPU with a 20 or more point lead on any versus CPU game", points = 10, id = 458072,
    trigger = ClearedCPUChallenge(20)
)

