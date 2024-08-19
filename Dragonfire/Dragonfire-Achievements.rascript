// Dragonfire
// #ID = 28207
// Retro Achievements - Achievement Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "State": byte(0x2),
    "Screen": byte(0x7),
    "Mode": byte(0xc),
    "Stage": byte(0x21)
}

Player = {
    "Lives": byte(0x12),
    "Score": (
        high4(0x2a) * 10 +
        low4(0x2c) * 100 +
        high4(0x2c) * 1000 +
        low4(0x2e) * 10000 +
        high4(0x2e) * 100000
    )
}

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

ScreenStates = {
    "ModeSelect": 0x00,
    "Bridge": 0x40,
    "TreasureRoom": 0xc0
}

Modes = {
    "1-1": 0,
    "1-2": 1,
    "2-1": 2,
    "2-2": 3,
    "3-1": 4,
    "3-2": 5,
    "4-1": 6,
    "4-2": 7
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => Game["State"] == 0x81
function IsOnModeSelect() => Game["State"] == 0xc0

function ClearedStage(stage, isChallenge, isMeasured){
    trigger = tally(stage, Game["Screen"] == ScreenStates["Bridge"] && prev(Game["Screen"]) == ScreenStates["TreasureRoom"])
    
    if(isChallenge)
        trigger = trigger_when(trigger)
        
    if(isMeasured)
        trigger = measured(trigger)

    return trigger && 
        never(!IsInGame()) && 
        never(Player["Lives"] == 0xff)
}

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

function ClearedStageOnMode(mode, stage, isChallenge, isMeasured){
    return Game["Mode"] == Modes[mode] &&
        ClearedStage(stage, isChallenge, isMeasured)
}

function ClearedStageNoDeath(mode, stage){
    return IsInGame() && 
        Player["Lives"] == 6 &&
        ClearedStageOnMode(mode, stage, true, false)
}

function PlayerGotScore(score){
    return IsInGame() &&
        prev(Player["Score"]) < score &&
        Player["Score"] >= score
}

// ======================================================================= //
// Achievement Definitions
// ======================================================================= //

achievement("Nickles and Dimes", "Clear 1 stage on mode 1-1", points = 2, type = "progression", id = 457162,
    trigger = ClearedStageOnMode("1-1", 1, false, false)
)

achievement("A Dollar and a Dream", "Clear 3 stages on mode 1-1", points = 3, type = "progression", id = 457163,
    trigger = ClearedStageOnMode("1-1", 3, false, false)
)

achievement("Sitting on a Goldmine", "Clear 6 stages on mode 1-1", points = 5, type = "progression", id = 457164,
    trigger = ClearedStageOnMode("1-1", 6, false, false)
)

achievement("Final Nail in the Coffer", "Clear 9 stages on mode 1-1", points = 10, type = "win_condition", id = 457165,
    trigger = ClearedStageOnMode("1-1", 9, false, false)
)

achievement("Highborn Heist", "Clear 18 stages on any single player mode", points = 25, id = 457166,
    trigger = (Game["Mode"] == Modes["1-1"] || Game["Mode"] == Modes["2-1"] || Game["Mode"] == Modes["3-1"] || Game["Mode"] == Modes["4-1"]) && ClearedStage(18, false, true)
)

achievement("Enduring Abundance", "Clear 9 stages on mode 1-1 without losing a life", points = 5, id = 457167,
    trigger = ClearedStageNoDeath("1-1", 9)
)

achievement("Perpetual Bounty", "Clear 9 stages on mode 2-1 without losing a life", points = 5, id = 457168,
    trigger = ClearedStageNoDeath("2-1", 9)
)

achievement("Everlasting Loot", "Clear 9 stages on mode 3-1 without losing a life", points = 10, id = 457169,
    trigger = ClearedStageNoDeath("3-1", 9)
)

achievement("Immortal Riches", "Clear 9 stages on mode 4-1 without losing a life", points = 10, id = 457170,
    trigger = ClearedStageNoDeath("4-1", 9)
)

achievement("Penny Pincher", "Score 5,000 points or more on any single player mode", points = 5, id = 457171,
    trigger = (Game["Mode"] == Modes["1-1"] || Game["Mode"] == Modes["2-1"] || Game["Mode"] == Modes["3-1"] || Game["Mode"] == Modes["4-1"]) && PlayerGotScore(5000)
)

achievement("Break the Bank", "Score 15,000 points or more on any single player mode", points = 10, id = 457172,
    trigger = (Game["Mode"] == Modes["1-1"] || Game["Mode"] == Modes["2-1"] || Game["Mode"] == Modes["3-1"] || Game["Mode"] == Modes["4-1"]) && PlayerGotScore(15000)
)

achievement("Money To Burn", "Score 30,000 points or more on any single player mode", points = 25, id = 457173,
    trigger = (Game["Mode"] == Modes["1-1"] || Game["Mode"] == Modes["2-1"] || Game["Mode"] == Modes["3-1"] || Game["Mode"] == Modes["4-1"]) && PlayerGotScore(30000)
)