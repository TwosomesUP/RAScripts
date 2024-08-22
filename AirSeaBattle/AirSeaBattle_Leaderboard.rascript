// Air-Sea Battle | Target Fun
// #ID = 13100
// Retro Achievements - Leaderboard Script
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
// Leaderboard Helper Functions
// ======================================================================= //  

function Start(mode){
    return GameEnded() &&
        Game["Mode"] == GameModes[mode]
}

function MaxValue(){
    return max_of(RightPlayer["Points"], LeftPlayer["Points"])
}

function Value(){
    return RightPlayer["Points"]
}

// ======================================================================= //
// Leaderboard Definitions
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


leaderboard("Score Attack - Game 1", "Get the highest score possible while playing Game 1",
    start = Start("Aircraft"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 2", "Get the highest score possible while playing Game 2",
    start = Start("GuidedAircraft"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 3", "Get the highest score possible while playing Game 3 [Requires Right Player]",
    start = Start("CPUAircraft"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 4", "Get the highest score possible while playing Game 4",
    start = Start("BlimpAircraft"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 5", "Get the highest score possible while playing Game 5",
    start = Start("GuidedBlimpAircraft"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 6", "Get the highest score possible while playing Game 6 [Requires Right Player]",
    start = Start("CPUBlimpAircraft"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 7", "Get the highest score possible while playing Game 7",
    start = Start("Torpedo"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 8", "Get the highest score possible while playing Game 8",
    start = Start("GuidedTorpedo"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 9", "Get the highest score possible while playing Game 9 [Requires Right Player]",
    start = Start("CPUTorpedo"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 10", "Get the highest score possible while playing Game 10",
    start = Start("MineTorpedo"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 11", "Get the highest score possible while playing Game 11",
    start = Start("GuidedMineTorpedo"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 12", "Get the highest score possible while playing Game 12 [Requires Right Player]",
    start = Start("CPUMineTorpedo"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 13", "Get the highest score possible while playing Game 13",
    start = Start("Shooting"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 14", "Get the highest score possible while playing Game 14",
    start = Start("GuidedShooting"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 15", "Get the highest score possible while playing Game 15 [Requires Right Player]",
    start = Start("CPUShooting"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 16", "Get the highest score possible while playing Game 16",
    start = Start("Polaris"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 17", "Get the highest score possible while playing Game 17",
    start = Start("GuidedPolaris"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 18", "Get the highest score possible while playing Game 18 [Requires Right Player]",
    start = Start("CPUPolaris"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 19", "Get the highest score possible while playing Game 19",
    start = Start("Bomber"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 20", "Get the highest score possible while playing Game 20",
    start = Start("GuidedBomber"),
    cancel = always_false(),
    submit = always_true(),
    value = MaxValue()
)

leaderboard("Score Attack - Game 21", "Get the highest score possible while playing Game 21 [Requires Right Player]",
    start = Start("CPUBomber"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 24", "Get the highest score possible while playing Game 24 [Requires Right Player]",
    start = Start("CPUPolarisBomber"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Score Attack - Game 27", "Get the highest score possible while playing Game 27 [Requires Right Player]",
    start = Start("CPUMinePolarisBomber"),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)
