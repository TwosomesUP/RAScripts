// Batman Returns
// #ID = 11657
// Retro Achievements - Achievement Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "State": byte(0x1296),
    "SubState": byte(0x1297),
    "Stage": byte(0x1298),
    "StagePart": byte(0x129a),
    "Cheats": byte(0x12b9),
    "SoundId": word(0x1e04)
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

EntityIds = {
    "Item": 0x0f,
    "Collected": 0xff
}

SoundIds = {
    "Orange": 0x23,
    "Blue": 0x24,
    "Yellow": 0x25
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsOnTitle() => Game["State"] == GameStates["Title"]
function IsInDemo() => Game["State"] == GameStates["Demo"]
function IsInGame() => !IsOnTitle() && !IsInDemo() && Game["SubState"] != GameSubStates["Loading"] && Game["Stage"] < 6
function IsOnGameOver() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["GameOverTransition"]
function IsOnStageClear() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["StageClear"]
function IsOnRouteSelect() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["RouteSelect"]
function IsOnEnding() => !IsOnTitle() && !IsInDemo() && Game["SubState"] == GameSubStates["Ending"]
function IsOnStageSelect() => !IsOnTitle() && !IsInDemo() && Game["Stage"] == Stages["StageSelect"]

function AreCheatsEnabled() => Game["Cheats"] > 0

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
// Achievement Functions
// ======================================================================= //

function ClearStage(stage){
    return IsInGame() && 
        Game["Stage"] == Stages[stage] && 
        prev(Game["SubState"]) == GameSubStates["InGame"] && 
        Game["SubState"] == GameSubStates["StageClear"] &&
        disable_when(AreCheatsEnabled())
}

function ClearStageOnRoute(stage, route){
    part = 1
    if(route == 2)
        part = 3
        
    return prior(Game["StagePart"]) == part &&
        ClearStage(stage)
}

function ClearGameNoContinues(){
    return ClearStage("Stage5") &&
        disable_when(IsOnGameOver() && Player["Lives"] == 0, IsOnTitle()) &&
        disable_when(IsOnStageSelect(), IsOnTitle())
}

function ClearStageMaxPower(stage){
    return Player["Batarang"] == 8 &&
        Player["Speed"] == 8 &&
        ClearStage(stage)
}

function CollectedAllUpgrades_old(stage, route, count){
    routeCheck = Game["StagePart"] <= 1
    if(route == 2)
        routeCheck = Game["StagePart"] > 1 && Game["StagePart"] <= 3
    if(stage == "Stage5")
        routeCheck = Game["StagePart"] <= 3
    return IsInGame() &&
        Game["Stage"] == Stages[stage] &&
        routeCheck &&
        measured
        (
            tally
            (   
                count, 
                array_map
                (
                    range(0,20), index => 
                    prev(GetEntityId(index)) == EntityIds["Item"] && 
                    GetEntityId(index) == EntityIds["Collected"] &&
                    never(IsOnTitle())
                )
            ),
            IsInGame()
        ) &&
        disable_when(AreCheatsEnabled())
}

function CollectedAllUpgrades(stage, route, count){
    routeCheck = Game["StagePart"] <= 1
    if(route == 2)
        routeCheck = Game["StagePart"] > 1 && Game["StagePart"] <= 3
    if(stage == "Stage5")
        routeCheck = Game["StagePart"] <= 3
    return IsInGame() &&
        Game["Stage"] == Stages[stage] &&
        routeCheck &&
        measured
        (
            tally
            (   
                count, 
                Game["Stage"] == Stages[stage] && 
                routeCheck &&
                prev(Game["SoundId"]) != SoundIds["Orange"] &&
                Game["SoundId"] == SoundIds["Orange"] && never(IsOnTitle()),
                Game["Stage"] == Stages[stage] && 
                routeCheck &&
                prev(Game["SoundId"]) != SoundIds["Yellow"] &&
                Game["SoundId"] == SoundIds["Yellow"] && never(IsOnTitle()),
                Game["Stage"] == Stages[stage] && 
            routeCheck &&
                prev(Game["SoundId"]) != SoundIds["Blue"] &&
                Game["SoundId"] == SoundIds["Blue"] && never(IsOnTitle())
            ),
            Game["Stage"] == Stages[stage] && 
            routeCheck &&
            IsInGame() 
        ) &&
        disable_when(AreCheatsEnabled())
}

function AcquiredLives(lives){
    return IsInGame() &&
        prev(Player["Lives"]) < lives &&
        Player["Lives"] >= lives &&
        disable_when(AreCheatsEnabled())
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //

achievement("[Draft] Clear Stage 1 Route 1", "Clear Stage 1 Route 1", points = 1, type = "progression", id = 463079,
    trigger = ClearStageOnRoute("Stage1", 1)
)

achievement("[Draft] Clear Stage 2 Route 1", "Clear Stage 2 Route 1", points = 1, type = "progression", id = 463080,
    trigger = ClearStageOnRoute("Stage2", 1)
)

achievement("[Draft] Clear Stage 3 Route 1", "Clear Stage 3 Route 1", points = 2, type = "progression", id = 463081,
    trigger = ClearStageOnRoute("Stage3", 1)
)

achievement("[Draft] Clear Stage 4 Route 1", "Clear Stage 4 Route 1", points = 2, type = "progression", id = 463082,
    trigger = ClearStageOnRoute("Stage4", 1)
)

achievement("[Draft] Clear Stage 1 Route 2", "Clear Stage 1 Route 2", points = 3, type = "progression", id = 463083,
    trigger = ClearStageOnRoute("Stage1", 2)
)

achievement("[Draft] Clear Stage 2 Route 2", "Clear Stage 2 Route 2", points = 3, type = "progression", id = 463084,
    trigger = ClearStageOnRoute("Stage2", 2)
)

achievement("[Draft] Clear Stage 3 Route 2", "Clear Stage 3 Route 2", points = 4, type = "progression", id = 463085,
    trigger = ClearStageOnRoute("Stage3", 2)
)

achievement("[Draft] Clear Stage 4 Route 2", "Clear Stage 4 Route 2", points = 4, type = "progression", id = 463086,
    trigger = ClearStageOnRoute("Stage4", 2)
)

achievement("[Draft] Clear Stage 5", "Clear Stage 5", points = 5, type = "win_condition", id = 463087,
    trigger = ClearStage("Stage5")
)

// ======================================================================= //
// Achievement Definitions - Challenges
// ======================================================================= //

achievement("[Draft] No Continues", "Without using Stage Select, clear the game using any route without using a continue", points = 25, id = 463088,
    trigger = ClearGameNoContinues()
)

achievement("[Draft] Max Power - Stage 1", "Clear Stage 1 using any route with max speed and max batarang power", points = 10, id = 463089,
    trigger = ClearStageMaxPower("Stage1")
)

achievement("[Draft] Max Power - Stage 2", "Clear Stage 2 using any route with max speed and max batarang power", points = 10, id = 463090,
    trigger = ClearStageMaxPower("Stage2")
)

achievement("[Draft] Max Power - Stage 3", "Clear Stage 3 using any route with max speed and max batarang power", points = 10, id = 463091,
    trigger = ClearStageMaxPower("Stage3")
)

achievement("[Draft] Max Power - Stage 4", "Clear Stage 4 using any route with max speed and max batarang power", points = 10, id = 463092,
    trigger = ClearStageMaxPower("Stage4")
)

achievement("[Draft] Max Power - Stage 5", "Clear Stage 5 using any route with max speed and max batarang power", points = 25, id = 463093,
    trigger = ClearStageMaxPower("Stage5")
)

achievement("[Draft] All Upgrades - Stage 1 Route 1", "Collect all upgrades on Stage 1 Route 1", points = 5, id = 463094,
    trigger = CollectedAllUpgrades("Stage1", 1, 13)
)

achievement("[Draft] All Upgrades - Stage 2 Route 1", "Collect all upgrades on Stage 2 Route 1", points = 5, id = 463095,
    trigger = CollectedAllUpgrades("Stage2", 1, 16)
)

achievement("[Draft] All Upgrades - Stage 3 Route 1", "Collect all upgrades on Stage 3 Route 1", points = 5, id = 463096,
    trigger = CollectedAllUpgrades("Stage3", 1, 21)
)

achievement("[Draft] All Upgrades - Stage 4 Route 1", "Collect all upgrades on Stage 4 Route 1", points = 5, id = 463097,
    trigger = CollectedAllUpgrades("Stage4", 1, 19)
)

achievement("[Draft] All Upgrades - Stage 1 Route 2", "Collect all upgrades on Stage 1 Route 2", points = 10, id = 463098,
    trigger = CollectedAllUpgrades("Stage1", 2, 16)
)

achievement("[Draft] All Upgrades - Stage 2 Route 2", "Collect all upgrades on Stage 2 Route 2", points = 10, id = 463099,
    trigger = CollectedAllUpgrades("Stage2", 2, 19)
)

achievement("[Draft] All Upgrades - Stage 3 Route 2", "Collect all upgrades on Stage 3 Route 2", points = 10, id = 463100,
    trigger = CollectedAllUpgrades("Stage3", 2, 17)
)

achievement("[Draft] All Upgrades - Stage 4 Route 2", "Collect all upgrades on Stage 4 Route 2", points = 10, id = 463101,
    trigger = CollectedAllUpgrades("Stage4", 2, 19)
)

achievement("[Draft] All Upgrades - Stage 5", "Collect all upgrades on Stage 1 Route 1", points = 25, id = 463102,
    trigger = CollectedAllUpgrades("Stage5", 2, 36)
)

achievement("[Draft] Lives", "Have a stock of 15 lives or more", points = 5, id = 463103,
    trigger = AcquiredLives(15)
)
