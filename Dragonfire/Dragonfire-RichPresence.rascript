// Dragonfire
// #ID = 28207
// Retro Achievements - Rich Presence Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "State": byte(0x2),
    "Screen": byte(0x7),
    "Mode": byte(0xc),
    "Stage": byte(0x21),
    "Active": bit7(0x11)
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
    return measured(tally(0, Game["Screen"] == ScreenStates["Bridge"] && prev(Game["Screen"]) != ScreenStates["Bridge"]))  &&
        never(!IsInGame()) &&
        never(prev(Player["Lives"]) == 0xff && Player["Lives"] == 0) &&
        never(prev(Game["Screen"]) == ScreenStates["TreasureRoom"] && Game["Screen"] == ScreenStates["Bridge"] && Player["Score"] == 0) &&
        never(prev(Player["Score"]) > 0 && Player["Score"] == 0)
}

// ======================================================================= //
// Rich Presence Definitions
// ======================================================================= //

rich_presence_conditional_display(IsInGame() && Game["Screen"] != ScreenStates["ModeSelect"], "The Prince is slaying dragons on STAGE {0} | MODE: {1} | LIVES: {2} | {3}",
    rich_presence_value("Stage", CalcStage()),
    rich_presence_lookup("Mode", Game["Mode"], Modes),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Score", Player["Score"])
)

rich_presence_conditional_display(IsInGame() && Game["Screen"] == ScreenStates["ModeSelect"], "The Prince mustering the courage to try again")

rich_presence_conditional_display(IsOnModeSelect(), "The Prince is deciding which mode to play")

rich_presence_display("The Prince is honing his blade in Dragonfire")