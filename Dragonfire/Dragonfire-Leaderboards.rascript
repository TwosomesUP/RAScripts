// Dragonfire
// #ID = 28207
// Retro Achievements - Leaderboard Script
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

ModeValues = {
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
// Lookup Dictionaries
// ======================================================================= //

Modes = {
    0: "1-1",
    1: "1-2",
    2: "2-1",
    3: "2-2",
    4: "3-1",
    5: "3-2",
    6: "4-1",
    7: "4-2"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => Game["State"] == 0x81
function IsOnModeSelect() => Game["State"] == 0xc0
function CalcStage(){
    return measured(tally(0, Game["Screen"] == ScreenStates["Bridge"] && prev(Game["Screen"]) != ScreenStates["Bridge"])) &&
        never(!IsInGame())
}

// ======================================================================= //
// Leaderboard Functions
// ======================================================================= //

function Start() {
    return IsInGame() &&
        prev(Player["Lives"]) == 0 &&
        Player["Lives"] == 0xff &&
        (Game["Mode"] == ModeValues["1-1"] || Game["Mode"] == ModeValues["2-1"] || Game["Mode"] == ModeValues["3-1"] || Game["Mode"] == ModeValues["4-1"])
}

// ======================================================================= //
// Leaderboard Definitions
// ======================================================================= //

leaderboard("Score Attack", "Get the highest score possible on any single player mode",
    start = Start(),
    cancel = always_false(),
    submit = always_true(),
    value = Player["Score"]
)
