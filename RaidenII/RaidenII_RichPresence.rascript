// Raiden II
// #ID = 12860
// Author: TwosomesUP
// Rich Presence Script

//================================================================
// Accessors
//================================================================

GameState = byte(0x842)
TitleState = byte(0x9f54)

Credits = byte(0x9f4c)
NumberOfPlayers = byte(0x9f50)
ActivePlayers = byte(0x9f52)

//Stage = byte(0x9ff8)
Stage = low4(0x900)
StageState = byte(0x9d64)
StageBonus = word(0x9fea)

Loop = byte(0x9f60)

Settings = {
    "P1Coinage": (bit0(0x9d98) + (bit1(0x9d98) * 10) + (bit2(0x9d98) * 100)),
    "P2Coinage": (bit3(0x9d98) + (bit4(0x9d98) * 10) + (bit5(0x9d98) * 100)),
    "StartCoin": bit6(0x9d98),
    "FlipScreen": bit7(0x9d98),
    "Difficulty": (bit0(0x9d99) + (bit1(0x9d99) * 10)),
    "Lives": (bit2(0x9d99) + (bit3(0x9d99) * 10)),
    "Extends": (bit4(0x9d99) + (bit5(0x9d99) * 10)),
    "DemoSound": bit6(0x9d99),
    "ServiceMode": bit7(0x9d99)
}

Player = {
    "State": byte(0xdb1),
    "Lives": byte(0x9eee),
    "Weapon": {
        "Vulcan": {
            "IsActive": (byte(0x9ed6) > 0),
            "Power": byte(0x9ed6)
        },
        "Laser": {
            "IsActive": (byte(0x9ed8) > 0),
            "Power": byte(0x9ed8)
        },
        "Plasma": {
            "IsActive": (byte(0x9eda) > 0),
            "Power": byte(0x9eda)
        }
    },
    "Missile": {
        "Standard": {
            "IsActive": (byte(0x9ede) > 0),
            "Power": byte(0x9ede)
        },
        "Homing": {
            "IsActive": (byte(0x9ee0) > 0),
            "Power": byte(0x9ee0)
        }
    },
    "Bombs": [
        byte(0x9ee6),
        byte(0x9ee7),
        byte(0x9ee8),
        byte(0x9ee9),
        byte(0x9eea),
        byte(0x9eeb),
        byte(0x9eec)
    ],
    "Medals": {
        "Gold": byte(0x9ef0),
        "Platinum": byte(0x9ef2)
    },
    "Fairies": byte(0x9ef4),
    "Score": (word(0x9ef6) + (word(0x9ef8) * 0x10000))
}

//================================================================
// Value Dictionaries
//================================================================

ValidSettings = {
    "Difficulty": 0,
    "Lives": 0,
    "Extends": 0
}

BombTypes = {
    "Standard": 1,
    "Cluster": 2
}


//================================================================
// Lookups
//================================================================

StageNames = {
    1: "Countryside",
    2: "City",
    3: "Ocean",
    4: "Ruins",
    5: "Enemy Base",
    6: "Floating Continent",
    7: "Enemy Battleship",
    8: "Final Target",
    10: "Mission Complete"
}

StageNumbers = {
    1: "-1",
    2: "-2",
    3: "-3",
    4: "-4",
    5: "-5",
    6: "-6",
    7: "-7",
    8: "-8",
    10: "-END"
}

ActiveWeapon = {
    1: "Vulcan LV1",
    2: "Vulcan LV2",
    3: "Vulcan LV3",
    4: "Vulcan LV4",
    5: "Vulcan LV5",
    6: "Vulcan LV6",
    7: "Vulcan LV7",
    8: "Vulcan LV8",
    10: "Laser LV1",
    20: "Laser LV2",
    30: "Laser LV3",
    40: "Laser LV4",
    50: "Laser LV5",
    60: "Laser LV6",
    70: "Laser LV7",
    80: "Laser LV8",
    100: "Plasma LV1",
    200: "Plasma LV2",
    300: "Plasma LV3",
    400: "Plasma LV4",
    500: "Plasma LV5",
    600: "Plasma LV6",
    700: "Plasma LV7",
    800: "Plasma LV8"
}


ActiveMissile = {
    0: "",
    1: " • Missile LV1",
    2: " • Missile LV2",
    3: " • Missile LV3",
    4: " • Missile LV4",
    10: " • Homing LV1",
    20: " • Homing LV2",
    30: " • Homing LV3",
    40: " • Homing LV4"
}

//================================================================
// Helper Functions
//================================================================

function IsInGame() => GameState == 1 && TitleState == 0
function IsOnTitle() => TitleState > 0
function IsSinglePlayer() => NumberOfPlayers == 1
function IsMultiplayer() => NumberOfPlayers == 2
function IsPlayingP2() => ActivePlayers > 1
function IsValidSession() => IsInGame() && IsSinglePlayer() && all_of(ValidSettings, setting => Settings[setting] == ValidSettings[setting])

function UsingValidSettings() => all_of(ValidSettings, setting => Settings[setting] == ValidSettings[setting])
function NotUsingValidSettings() => any_of(ValidSettings, setting => Settings[setting] != ValidSettings[setting])

function PlayerUsedContinue() {
    return IsInGame() && prev(NumberOfPlayers) == 0 && NumberOfPlayers > 0
}

function CountBombs(type){
    return measured(tally_of(Player["Bombs"], 0, bomb => once(bomb == BombTypes[type] && never(bomb != BombTypes[type]))))
}

function GetTotalBombs(){
    return measured(tally_of(Player["Bombs"], 0, bomb => once(bomb > 0 && never(bomb < 1))))
}

function CountContinues(){
    return measured(tally(0, IsInGame() && PlayerUsedContinue() && never(IsOnTitle())))
}

function GetActiveWeapon(){
    return Player["Weapon"]["Vulcan"]["Power"] + (Player["Weapon"]["Laser"]["Power"] * 10) + (Player["Weapon"]["Plasma"]["Power"] * 100)
}

function GetActiveMissile(){
    return Player["Missile"]["Standard"]["Power"] + (Player["Missile"]["Homing"]["Power"] * 10)
}

//================================================================
// Rich Presence Definitions
//================================================================

rich_presence_conditional_display(UsingValidSettings() && IsInGame() && !IsMultiplayer() && !IsPlayingP2(), "Fighting the extraterrestrial menace on Stage {0}{1} [{2}] | {4}{5} | Bombs: 🔴 {6} 🟡 {7} | Medals: 🥇 {8} 🥈 {9} | 🧚 {10} | 🛩️ {3} • 🔄 {11} | {12}",
    rich_presence_value("Loop", Loop + 1),
    rich_presence_lookup("StageNumber", Stage, StageNumbers),
    rich_presence_lookup("StageName", Stage, StageNames),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_lookup("Weapon", GetActiveWeapon(), ActiveWeapon),
    rich_presence_lookup("Missile", GetActiveMissile(), ActiveMissile),
    rich_presence_value("StandardBombs", CountBombs("Standard")),
    rich_presence_value("ClusterBombs", CountBombs("Cluster")),
    rich_presence_value("GoldMedals", Player["Medals"]["Gold"]),
    rich_presence_value("PlatinumMedals", Player["Medals"]["Platinum"]),
    rich_presence_value("Fairies", Player["Fairies"]),
    rich_presence_value("Continues", CountContinues()),
    rich_presence_value("Score", Player["Score"], "Score")
)

rich_presence_conditional_display(UsingValidSettings() && IsInGame() && !IsMultiplayer() && IsPlayingP2(), "Fighting the extraterrestrial menace on the wrong side of the road!!")

rich_presence_conditional_display(UsingValidSettings() && IsInGame() && IsMultiplayer(), "Fighting the extraterrestrial menace with a friend")

rich_presence_conditional_display(NotUsingValidSettings(), "INVALID SETTINGS FOUND - Achievements Disabled. Apply default settings to re-enabled.")

rich_presence_display("Taking Raiden II for a spin")
