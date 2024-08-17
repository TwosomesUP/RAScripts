// Burai Fighter
// #ID = 1599
// Retro Achievements - Rich Presence Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "Difficulty": byte(0x8b),
    "ScreenId": word(0xc),
    "ScreenIdLower": byte(0xd),
    "Flags": {
        "Demo": byte(0x40),
        "StatusBar": byte(0x41),
        "Results": byte(0xec),
        "HiddenKey": byte(0xf0),
        "UltimateDifficulty": byte(0x725)
    },
    "SpriteIndex": byte(0x47)
}

Stage = {
    "State": byte(0x7e),
    "Index": byte(0x8c),
    "Section": byte(0x50),
    "ScrollDirection": byte(0xdf)
}

Player = {
    "State": byte(0xd5),
    "Weapon": {
        "Index": byte(0xc6),
        "Power": [
            byte(0xc3),
            byte(0xc4),
            byte(0xc5)
        ]
    },
    "Cobalt": byte(0xc7),
    "Pod": byte(0xc8),
    "Speed": byte(0xc9),
    "Lives": byte(0x72f),
    "Score": (
        byte(0x732) * 10000000 +
        byte(0x733) * 1000000 +
        byte(0x734) * 100000 +
        byte(0x735) * 10000 +
        byte(0x736) * 1000 +
        byte(0x737) * 100 +
        byte(0x738) * 10 +
        byte(0x739)
    ),
    "ScoreDemo": byte(0x736)
}

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

Difficulties = {
    "Eagle": 0,
    "Albatross": 1,
    "Ace": 2,
    "Ultimate": 3
}

ScreenIds = {
    "Continue": 0x3b2,
    "StageStart": 0x40b,
    "StageStartPassword": 0x41d,
    "Taxan": 0x415,
    "StageStartOverhead": 0x435,
    "Password": 0x4ed,
    "Title": 0x600,
    "Ending1": 0x302, //Eagle and Albatross
    "Ending2": 0x600, //Ace and Ultimate
    "Ending2Start": 0x5f4, //Ace and Ultimate
    "AceEnding1": 0x617,
    "AceEnding2": 0x64c,
    "AceEnding3": 0x670,
    "AceEnding4": 0x698,
    "UltimateEnding1": 0x6a4,
    "UltimateEnding2": 0x6d4,
    "UltimateEnding3": 0x6f1,
    "Results": 0x732,
    "Difficulty": 0xa3, //Use with ScreenIdLower
    "Difficulty1": 0xa3c9,
    "Difficulty2": 0xa3cd,
    "Difficulty3": 0xa3d1,
    "Difficulty4": 0xa3c5
}

ScreenEndingIds = [
    0x300,
    0x302,
    0x600,
    0x5f4,
    0x6a4,
    0x6d4,
    0x6f1,
    0x6f1,
    0x617,
    0x64c,
    0x670,
    0x698
]

SpriteIndices = {
    "Ending": 0,
    "Title": 2,
    "Splash": 4
}

Stages = [
    0,
    1,
    2,
    3,
    4,
    5,
    6
]

Weapons = {
    "Default": 0,
    "Laser": 1,
    "Ring": 2,
    "Missile": 3
}

// ======================================================================= //
// Lookups
// ======================================================================= //

DifficultyLookup = {
    0: "EAGLE",
    1: "ALBATROSS",
    2: "ACE",
    3: "ULTIMATE"
}

EndingDifficultyLookup = {
    1: "EAGLE",
    2: "ALBATROSS",
    3: "ACE",
    4: "ULTIMATE"
}

Weapon = {
    0: "Default",
    1: "Laser",
    2: "Ring",
    3: "Missile"
}

WeaponPower = {
    0: "0",
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9",
    32: "MAX"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsOnTitle() => Game["ScreenId"] == ScreenIds["Title"] && Stage["Index"] < 6
function IsOnDemo() => Game["Flags"]["Demo"] == 1
function IsInGame() => Player["Lives"] > 0 && Player["ScoreDemo"] != 0x23
function IsOnContinue() => Player["Lives"] == 0 && Game["ScreenId"] == ScreenIds["Continue"]
function IsOnDifficultySelect() => Game["ScreenIdLower"] == ScreenIds["Difficulty"] && Game["ScreenId"] != 0xa3b9
function IsOnPassword() => Game["ScreenId"] == ScreenIds["Password"]
function IsOnEnding() => any_of(ScreenEndingIds, id => Game["ScreenId"] == id)

function NoCheats(){
    return disable_when(Game["Difficulty"] == 0 && Stage["Index"] == 0 && Player["Score"] == 0 && Player["Lives"] == 100, IsOnTitle()) &&
        disable_when(Game["Difficulty"] == 0 && Stage["Index"] == 0 && Player["Score"] == 0 && Player["Weapon"]["Power"][0] == 32 && Player["Weapon"]["Power"][1] == 32 && Player["Weapon"]["Power"][2] == 32, IsOnTitle())
}

function IsValidSession() {
    return IsInGame() && NoCheats() && !IsOnDemo()
}

// ======================================================================= //
// Leaderboard Functions
// ======================================================================= //

function Start(difficulty){
    return 
    once(Game["Difficulty"] == difficulty && Player["Score"] == 0 && Player["Lives"] > 0) &&
    NoCheats() &&
    ((
        Game["Difficulty"] == difficulty &&
        prev(Game["ScreenId"]) != ScreenIds["Continue"] && 
        Game["ScreenId"] == ScreenIds["Continue"]
        
    ) ||
    (
        Stage["Index"] == 6 &&
        prev(Game["Difficulty"]) == difficulty &&
        Game["Difficulty"] == difficulty + 1
    )) &&
    never(prev(Game["ScreenId"]) == ScreenIds["Continue"] && Game["ScreenId"] != ScreenIds["Continue"]) && 
    never(IsOnTitle()) &&
    never(Game["ScreenId"] == ScreenIds["Difficulty1"]) &&
    never(Game["ScreenId"] == ScreenIds["Difficulty2"]) &&
    never(Game["ScreenId"] == ScreenIds["Difficulty3"]) &&
    never(Game["ScreenId"] == ScreenIds["Difficulty4"])
}

function StartOverall(){
    return 
    once(Player["Score"] == 0 && Player["Lives"] > 0) &&
    NoCheats() &&
    ((
        prev(Game["ScreenId"]) != ScreenIds["Continue"] && 
        Game["ScreenId"] == ScreenIds["Continue"]
    ) ||
    (
        Stage["Index"] == 6 &&
        Game["Difficulty"] == prev(Game["Difficulty"]) + 1
    )) &&
    never(prev(Game["ScreenId"]) == ScreenIds["Continue"] && Game["ScreenId"] != ScreenIds["Continue"]) && 
    never(IsOnTitle())
}

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

function ClearedStage(stage, difficulty){
    return IsValidSession() &&
        Game["Difficulty"] == difficulty &&
        prev(Stage["Index"]) == stage &&
        Stage["Index"] == stage + 1
}

function ClearedGame(difficulty){
    return IsValidSession() &&
        Stage["Index"] == 6 &&
        prev(Game["Difficulty"]) == difficulty &&
        Game["Difficulty"] == difficulty + 1
}

function GotMaxWeapon(weapon){
    return IsValidSession() &&
        prev(Player["Weapon"]["Power"][weapon]) == 9 &&
        Player["Weapon"]["Power"][weapon] == 32
}

function ClearedStageWithAnyMaxWeapon(){
    return IsValidSession() &&
        Stage["Index"] == prev(Stage["Index"]) + 1 &&
        (
            Player["Weapon"]["Power"][0] == 32 ||
            Player["Weapon"]["Power"][1] == 32 ||
            Player["Weapon"]["Power"][2] == 32
        )
}

function ClearedStageWithAllMaxWeapons(){
    return IsValidSession() &&
        Stage["Index"] == prev(Stage["Index"]) + 1 &&
        (
            Player["Weapon"]["Power"][0] == 32 &&
            Player["Weapon"]["Power"][1] == 32 &&
            Player["Weapon"]["Power"][2] == 32
        )
}

function GotMaxExtraGauge(){
    return IsValidSession() &&
        prev(Player["Cobalt"] == 62) &&
        Player["Cobalt"] == 0 &&
        Player["Lives"] > prev(Player["Lives"]) 
}

function Got20Lives(){
    return IsValidSession() &&
        prev(Player["Lives"]) < 20 &&
        Player["Lives"] >= 20
}

function GotMaxDefensePod(){
    return IsValidSession() &&
        prev(Player["Pod"]) == 2 &&
        Player["Pod"] == 3
}

function GotMaxSpeed() {
    return IsValidSession() &&
        prev(Player["Speed"]) == 6 &&
        Player["Speed"] == 7
}

function FoundHiddenRoom(stage, difficulty){
    return once
        (
            Stage["Index"] == stage &&
            Game["Difficulty"] == difficulty &&
            prev(Game["Flags"]["HiddenKey"]) == 1 &&
            Game["Flags"]["HiddenKey"] == 0 &&
            prev(Stage["ScrollDirection"]) != Stage["ScrollDirection"]
        )
}

function GotEagleHiddenRooms(){
    return IsValidSession() &&
        measured(tally(3, FoundHiddenRoom(0, 0), FoundHiddenRoom(3, 0), FoundHiddenRoom(6, 0))) &&
        Stage["Index"] == 6 &&
        prev(Game["Difficulty"]) == 0 &&
        Game["Difficulty"] == 1 && 
        (
            never(IsOnTitle()) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty1"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty2"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty3"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty4"])
        )
}

function GotAlbatrossHiddenRooms(){
    return IsValidSession() &&
        measured(tally(2, FoundHiddenRoom(1, 1), FoundHiddenRoom(4, 1))) &&
        Stage["Index"] == 6 &&
        prev(Game["Difficulty"]) == 1 &&
        Game["Difficulty"] == 2 && 
        (
            never(IsOnTitle()) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty1"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty2"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty3"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty4"])
        )
}

function GotAceHiddenRooms(){
    return IsValidSession() &&
        measured(tally(5, FoundHiddenRoom(0, 2), FoundHiddenRoom(1, 2), FoundHiddenRoom(3, 2), FoundHiddenRoom(4, 2), FoundHiddenRoom(6, 2))) &&
        Stage["Index"] == 6 &&
        prev(Game["Difficulty"]) == 2 &&
        Game["Difficulty"] == 3 && 
        (
            never(IsOnTitle()) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty1"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty2"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty3"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty4"])
        )
}

function ClearedAllDifficulties(){
    return IsValidSession() &&
        trigger_when(once(Stage["Index"] == 6 && prev(Game["Difficulty"]) == 0 && Game["Difficulty"] == 1 && never(IsOnTitle()))) &&
        trigger_when(once(Stage["Index"] == 6 && prev(Game["Difficulty"]) == 1 && Game["Difficulty"] == 2 && never(IsOnTitle()))) &&
        trigger_when(once(Stage["Index"] == 6 && prev(Game["Difficulty"]) == 2 && Game["Difficulty"] == 3 && never(IsOnTitle()))) &&
        trigger_when(once(Stage["Index"] == 6 && prev(Game["Difficulty"]) == 3 && Game["Difficulty"] == 4 && never(IsOnTitle()))) &&
        disable_when(Game["ScreenId"] == ScreenIds["Continue"], IsOnTitle())
}

function GotScore(score){
    return IsValidSession() &&
        prev(Player["Score"]) < score &&
        Player["Score"] >= score
}

function ClearStageNoDeath(stage){
    return IsValidSession() &&
        Game["Difficulty"] >= 2 &&
        prev(Stage["Index"]) == stage &&
        trigger_when(Stage["Index"] == stage + 1) &&
        disable_when(Game["Difficulty"] >= 2 && Stage["Index"] == stage && prev(Player["Lives"]) > Player["Lives"]) &&
        (
            never(IsOnTitle()) || 
            never(Game["ScreenId"] == ScreenIds["Continue"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty1"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty2"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty3"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty4"])
        )
}

function ClearGameNoDeath(){
    return IsValidSession() &&
        Game["Difficulty"] >= 2 &&
        Stage["Index"] == 6 &&
        prev(Game["Difficulty"]) >= 2 &&
        trigger_when(Game["Difficulty"] == prev(Game["Difficulty"]) + 1) &&
        disable_when(Game["Difficulty"] >= 2 && Stage["Index"] == 6 && prev(Player["Lives"]) > Player["Lives"]) &&
        (
            never(IsOnTitle()) || 
            never(Game["ScreenId"] == ScreenIds["Continue"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty1"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty2"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty3"]) ||
            never(Game["ScreenId"] == ScreenIds["Difficulty4"])
        )
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //

achievement(title = "Amature Crab Crusher", description = "Clear Stage 1 on Eagle difficulty", points = 1, id = 456011,
    trigger = ClearedStage(0, 0)
)

achievement(title = "Amature Insect Inhibitor", description = "Clear Stage 2 on Eagle difficulty", points = 1, id = 456012,
    trigger = ClearedStage(1, 0)
)

achievement(title = "Amature Infiltrator", description = "Clear Stage 3 on Eagle difficulty", points = 1, id = 456013,
    trigger = ClearedStage(2, 0)
)

achievement(title = "Amature Monster Masher", description = "Clear Stage 4 on Eagle difficulty", points = 1, id = 456014,
    trigger = ClearedStage(3, 0)
)

achievement(title = "Amature Bird Basher", description = "Clear Stage 5 on Eagle difficulty", points = 1, id = 456015,
    trigger = ClearedStage(4, 0)
)

achievement(title = "Amature Sabotuer", description = "Clear Stage 6 on Eagle difficulty", points = 1, id = 456016,
    trigger = ClearedStage(5, 0)
)

achievement(title = "Amature Dragon Decimator", description = "Clear Stage 7 on Eagle difficulty", points = 2, id = 456017,
    trigger = ClearedGame(0)
)

achievement(title = "Proficient Crab Crusher", description = "Clear Stage 1 on Albatross difficulty", points = 2, id = 456018,
    trigger = ClearedStage(0, 1)
)

achievement(title = "Proficient Insect Inhibitor", description = "Clear Stage 2 on Albatross difficulty", points = 2, id = 456019,
    trigger = ClearedStage(1, 1)
)

achievement(title = "Proficient Infiltrator", description = "Clear Stage 3 on Albatross difficulty", points = 2, id = 456020,
    trigger = ClearedStage(2, 1)
)

achievement(title = "Proficient Monster Masher", description = "Clear Stage 4 on Albatross difficulty", points = 2, id = 456021,
    trigger = ClearedStage(3, 1)
)

achievement(title = "Proficient Bird Basher", description = "Clear Stage 5 on Albatross difficulty", points = 2, id = 456022,
    trigger = ClearedStage(4, 1)
)

achievement(title = "Proficient Sabotuer", description = "Clear Stage 6 on Albatross difficulty", points = 2, id = 456023,
    trigger = ClearedStage(5, 1)
)

achievement(title = "Proficient Dragon Decimator", description = "Clear Stage 7 on Albatross difficulty", points = 3, id = 456024,
    trigger = ClearedGame(1)
)

achievement(title = "Master Crab Crusher", description = "Clear Stage 1 on Ace difficulty", points = 4, type = "progression", id = 456025,
    trigger = ClearedStage(0, 2)
)

achievement(title = "Master Insect Inhibitor", description = "Clear Stage 2 on Ace difficulty", points = 4, type = "progression", id = 456026,
    trigger = ClearedStage(1, 2)
)

achievement(title = "Master Infiltrator", description = "Clear Stage 3 on Ace difficulty", points = 4, type = "progression", id = 456027,
    trigger = ClearedStage(2, 2)
)

achievement(title = "Master Monster Masher", description = "Clear Stage 4 on Ace difficulty", points = 4, type = "progression", id = 456028,
    trigger = ClearedStage(3, 2)
)

achievement(title = "Master Bird Basher", description = "Clear Stage 5 on Ace difficulty", points = 4, type = "progression", id = 456029,
    trigger = ClearedStage(4, 2)
)

achievement(title = "Master Sabotuer", description = "Clear Stage 6 on Ace difficulty", points = 4, type = "progression", id = 456030,
    trigger = ClearedStage(5, 2)
)

achievement(title = "Master Dragon Decimator", description = "Clear Stage 7 on Ace difficulty", points = 5, type = "win_condition", id = 456031,
    trigger = ClearedGame(2)
)

achievement(title = "Ultimate Crab Crusher", description = "Clear Stage 1 on Ultimate difficulty", points = 5, id = 456032,
    trigger = ClearedStage(0, 3)
)

achievement(title = "Ultimate Insect Inhibitor", description = "Clear Stage 2 on Ultimate difficulty", points = 5, id = 456033,
    trigger = ClearedStage(1, 3)
)

achievement(title = "Ultimate Infiltrator", description = "Clear Stage 3 on Ultimate difficulty", points = 5, id = 456034,
    trigger = ClearedStage(2, 3)
)

achievement(title = "Ultimate Monster Masher", description = "Clear Stage 4 on Ultimate difficulty", points = 5, id = 456035,
    trigger = ClearedStage(3, 3)
)

achievement(title = "Ultimate Bird Basher", description = "Clear Stage 5 on Ultimate difficulty", points = 5, id = 456036,
    trigger = ClearedStage(4, 3)
)

achievement(title = "Ultimate Sabotuer", description = "Clear Stage 6 on Ultimate difficulty", points = 5, id = 456037,
    trigger = ClearedStage(5, 3)
)

achievement(title = "Ultimate Dragon Decimator", description = "Clear Stage 7 on Ultimate difficulty", points = 10, id = 456038,
    trigger = ClearedGame(3)
)

// ======================================================================= //
// Achievement Definitions - Play Challenges
// ======================================================================= //

achievement(title = "Optimum Arms", description = "Upgrade the Laser weapon to MAX power", points = 3, id = 456039,
    trigger = GotMaxWeapon(0)
)

achievement(title = "Peerless Munitions", description = "Upgrade the Ring weapon to MAX power", points = 3, id = 456040,
    trigger = GotMaxWeapon(1)
)

achievement(title = "Paramount Artillery", description = "Upgrade the Missile weapon to MAX power", points = 3, id = 456041,
    trigger = GotMaxWeapon(2)
)

achievement(title = "Well Stocked", description = "Clear any stage with any weapon at max firepower", points = 5, id = 456042,
    trigger = ClearedStageWithAnyMaxWeapon()
)

achievement(title = "Surplus Supply", description = "Clear any stage with all weapons at max firepower", points = 10, id = 456043,
    trigger = ClearedStageWithAllMaxWeapons()
)

achievement(title = "Ordnance Overload", description = "Fill the Extra gauge by collecting Bomb Fragments and increase your lives", points = 4, id = 456044,
    trigger = GotMaxExtraGauge()
)

achievement(title = "Stockpiled", description = "Have a stock of 20 or more lives", points = 10, id = 456045,
    trigger = Got20Lives()
)

achievement(title = "Defense Diviner", description = "Upgrade the Defense Pod to its max speed", points = 3, id = 456046,
    trigger = GotMaxDefensePod()
)

achievement(title = "Speed Demon", description = "Upgrade your speed to the max level", points = 4, id = 456047,
    trigger = GotMaxSpeed()
)

achievement(title = "Treasure Collector", description = "Find all 3 hidden rooms available on the Eagle difficulty and clear the game", points = 3, id = 456048,
    trigger = GotEagleHiddenRooms()
)

achievement(title = "Treasure Accumulator", description = "Find all 2 hidden rooms available on the Albatross difficulty and clear the game", points = 5, id = 456049,
    trigger = GotAlbatrossHiddenRooms()
)

achievement(title = "Treasure Hoarder", description = "Find all 5 hidden rooms available on the Ace difficulty and clear the game", points = 10, id = 456050,
    trigger = GotAceHiddenRooms()
)

achievement(title = "Transcendent Burai Fighter", description = "Clear the game all 4 difficulties consecutively without using a continue", points = 50, id = 456051,
    trigger = ClearedAllDifficulties()
)

// ======================================================================= //
// Achievement Definitions - Score Challenges
// ======================================================================= //

achievement(title = "Multitudinous", description = "Score 100,000 points or more", points = 5, id = 456052,
    trigger = GotScore(100000)
)

achievement(title = "Abounding", description = "Score 250,000 points or more", points = 10, id = 456053,
    trigger = GotScore(250000)
)

achievement(title = "Innumerable", description = "Score 500,000 points or more", points = 25, id = 456054,
    trigger = GotScore(500000)
)

// ======================================================================= //
// Achievement Definitions - Other Challenges
// ======================================================================= //

achievement(title = "Transcendent Crab Crusher", description = "Clear Stage 1 without losing a life on Ace difficulty or higher", points = 10, id = 456055,
    trigger = ClearStageNoDeath(0)
)

achievement(title = "Transcendent Insect Inhibitor", description = "Clear Stage 2 without losing a life on Ace difficulty or higher", points = 10, id = 456056,
    trigger = ClearStageNoDeath(1)
)

achievement(title = "Transcendent Infiltrator", description = "Clear Stage 3 without losing a life on Ace difficulty or higher", points = 10, id = 456057,
    trigger = ClearStageNoDeath(2)
)

achievement(title = "Transcendent Monster Masher", description = "Clear Stage 4 without losing a life on Ace difficulty or higher", points = 10, id = 456058,
    trigger = ClearStageNoDeath(3)
)

achievement(title = "Transcendent Bird Basher", description = "Clear Stage 5 without losing a life on Ace difficulty or higher", points = 25, id = 456059,
    trigger = ClearStageNoDeath(4)
)

achievement(title = "Transcendent Sabotuer", description = "Clear Stage 6 without losing a life on Ace difficulty or higher", points = 25, id = 456060,
    trigger = ClearStageNoDeath(5)
)

achievement(title = "Transcendent Dragon Decimator", description = "Clear Stage 7 without losing a life on Ace difficulty or higher", points = 25, id = 456061,
    trigger = ClearGameNoDeath()
)
