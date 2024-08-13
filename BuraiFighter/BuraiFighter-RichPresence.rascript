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
    "Section": byte(0x50)
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
function IsOnDifficultySelect() => Game["ScreenIdLower"] == ScreenIds["Difficulty"]
function IsOnPassword() => Game["ScreenId"] == ScreenIds["Password"]
function IsOnEnding() => any_of(ScreenEndingIds, id => Game["ScreenId"] == id)

// ======================================================================= //
// Rich Presence Definitions
// ======================================================================= //

rich_presence_conditional_display(IsOnTitle(), "The Burai Figher is strapping on their Proton Pack")
rich_presence_conditional_display(IsOnDemo(), "The Burai Figher is reviewing a training demo")
rich_presence_conditional_display(IsOnDifficultySelect() && !IsInGame(), "The Burai Figher is deciding which path to conquer")
rich_presence_conditional_display(IsOnDifficultySelect() && IsInGame(), "The Burai Figher is deciding on another path to conquer")
rich_presence_conditional_display(IsOnContinue(), "The Burai Figher is deciding if they want to continue their fight")
rich_presence_conditional_display(IsOnPassword(), "The Burai Figher is decrypting classified passwords")

rich_presence_conditional_display(IsOnEnding(), "The Burai Figher defeated the super-brain menace! | {0} | {1}",
    rich_presence_lookup("EndingDifficulty", Game["Difficulty"], EndingDifficultyLookup),
    rich_presence_value("Score", Player["Score"])
)

rich_presence_conditional_display(IsInGame() && !IsOnDemo(), "The Burai Figher is battling the super-brain menace on Stage {0} | {1} | LIVES: {2} • BOMBS: {3} | LASER: {4} • RING: {5} • MISSILE: {6} | POD: {7} • SPEED: {8} | {9}",  
    rich_presence_value("Stage", Stage["Index"] + 1),
    rich_presence_lookup("Difficulty", Game["Difficulty"], DifficultyLookup),
    rich_presence_value("Lives", Player["Lives"] - 1),
    rich_presence_value("Extra", Player["Cobalt"] / 8),
    rich_presence_lookup("Laser", Player["Weapon"]["Power"][0], WeaponPower),
    rich_presence_lookup("Ring", Player["Weapon"]["Power"][1], WeaponPower),
    rich_presence_lookup("Missile", Player["Weapon"]["Power"][2], WeaponPower),
    rich_presence_value("Pod", Player["Pod"]),
    rich_presence_value("Speed", Player["Speed"]),
    rich_presence_value("Score", Player["Score"])
)

rich_presence_display("Preparing to battle the super-brain menaces in Burai Fighter")
