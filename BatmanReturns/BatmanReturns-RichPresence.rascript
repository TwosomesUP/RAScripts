// Batman Returns
// #ID = 11657
// Retro Achievements - Rich Presence Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "State": byte(0x1296),
    "SubState": byte(0x1297),
    "Stage": byte(0x1298),
    "StagePart": byte(0x129a),
    "Cheats": byte(0x12b0)
}

Player = {
    "Lives": low4(0x129b) + high4(0x129b) * 10,
    "Batarang": low4(0x12a5),
    "Speed": high4(0x12a5)
}

EntityArrayStart = 0x1580
EntityStructOffset = 64 

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

GameStates = {
    "Title": 0x20,
    "Demo": 0x10,
    "Game": 0x00
}

GameSubStates = {
    "Loading": 0x00,
    "InGame": 0x40,
    "RouteSelect": 0x44,
    "GameOver": 0x48,
    "GameOverTransition": 0x08,
    "StageClear": 0x50,
    "Ending": 0xc0
}

Stages = {
    "Stage1": 0x00,
    "Stage2": 0x01,
    "Stage3": 0x02,
    "Stage4": 0x03,
    "Stage5": 0x04,
    "Ending": 0x05,
    "Credits": 0x0f,
    "StageSelect": 0xff
}

StageParts = {
    "Route1Part1": 0x00,
    "Route1Part2": 0x01,
    "Route2Part1": 0x02,
    "Route2Part2": 0x03,
    "Boss": 0x04
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsOnTitle() => Game["State"] == GameStates["Title"]
function IsInDemo() => Game["State"] == GameStates["Demo"]
function IsInGame() => !IsOnTitle() && !IsInDemo() && Game["SubState"] != GameSubStates["Loading"] && Game["Stage"] < 6
function IsOnGameOver() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["GameOver"]
function IsOnStageClear() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["StageClear"]
function IsOnRouteSelect() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["RouteSelect"]
function IsOnEnding() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["Ending"]

function GetEntityId(index){
    return byte(EntityArrayStart + (index * 64))
}

// ======================================================================= //
// Lookups
// ======================================================================= //

StagePart = {
    0: "1",
    1: "2",
    2: "1",
    3: "2"
}

StageRoute = {
    0: "1",
    1: "1",
    2: "2",
    3: "2"
}

StageBoss = {
    0: "Fire Breather",
    1: "Catwoman",
    2: "Golem",
    3: "Catwoman - Again!",
    4: "Penguin"
}

BatarangLevel = {
    0: "◯◯◯◯",
    2: "🔴◯◯◯",
    4: "🔴🔴◯◯",
    6: "🔴🔴🔴◯",
    8: "🔴🔴🔴🔴"
}

SpeedLevel = {
    0: "◯",
    8: "🟡"
}

// ======================================================================= //
// Rich Presence Definitions
// ======================================================================= //

rich_presence_conditional_display(IsInDemo(), "Batman is watching reruns of his favorite Gotham excursions")
rich_presence_conditional_display(IsOnGameOver(), "Batman may have lost the battle, but he will rise again")
rich_presence_conditional_display(IsOnStageClear(), "Batman is traveling to his next objective")
rich_presence_conditional_display(IsOnEnding(), "Batman has defeated the Penguin and the streets are safe... for now")
rich_presence_conditional_display(IsOnRouteSelect(), "Batman is plotting his route through Stage {0}",
    rich_presence_value("Stage", Game["Stage"] + 1)
)

rich_presence_conditional_display(IsInGame() && Game["StagePart"] != 4, "Batman is fighting the Penguin's thugs on Stage {0}-{1} Route {2} | Lives: {3} | Batarang: {4} • Speed: {5}",
    rich_presence_value("Stage", Game["Stage"] + 1),
    rich_presence_lookup("Part", Game["StagePart"], StagePart),
    rich_presence_lookup("Route", Game["StagePart"], StageRoute),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_lookup("Batarang", Player["Batarang"], BatarangLevel),
    rich_presence_lookup("Speed", Player["Speed"], SpeedLevel)
)

rich_presence_conditional_display(IsInGame() && Game["StagePart"] == 4, "Batman is fighting his arch-nemesis {0} on Stage {1} Route {2} | Lives: {3} | Batarang: {4} • Speed: {5}",
    rich_presence_lookup("Boss", Game["Stage"], StageBoss),
    rich_presence_value("Stage", Game["Stage"] + 1),
    rich_presence_lookup("Route", prior(Game["StagePart"]), StageRoute),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_lookup("Batarang", Player["Batarang"], BatarangLevel),
    rich_presence_lookup("Speed", Player["Speed"], SpeedLevel)
)

rich_presence_display("Batman is preparing to face the dark corners of Gotham")