// Raiden II
// #ID = 12860
// Author: TwosomesUP
// Rich Presence Script

//================================================================
// Accessors
//================================================================

GameState = byte(0x9d6f)

Credits = byte(0x9f4c)
NumberOfPlayers = byte(0x9f50)

Stage = byte(0x9ff8)
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
    "Lives": byte(0x9eed),
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

Stages = {
    0: "Countryside",
    1: "City",
    2: "Ocean",
    3: "Ruins",
    4: "Enemy Base",
    5: "Floating Continent",
    7: "Enemy Battleship",
    8: "Final Target",
    9: "Mission Complete",
    10: "Mission Complete"
}

//================================================================
// Helper Functions
//================================================================

function IsInGame() => GameState == 1
function IsOnTitle() => GameState == 0
function IsSinglePlayer() => NumberOfPlayers == 1
function IsMultiplayer() => NumberOfPlayers == 2

function IsValidSession() => IsInGame() && IsSinglePlayer() && all_of(ValidSettings, setting => Settings[setting] == ValidSettings[setting])

function CountBombs(type){
    return measured(tally_of(Player["Bombs"], 0, bomb => once(bomb == BombTypes[type] && never(bomb != BombTypes[type]))))
}

function GetTotalBombs(){
    return measured(tally_of(Player["Bombs"], 0, bomb => once(bomb > 0 && never(bomb < 1))))
}

//================================================================
// Rich Presence Definitions
//================================================================

rich_presence_conditional_display(IsInGame(), "Total Bombs: {0} | Standard Bombs: {1} | Cluster Bombs: {2}",
    rich_presence_value("TotalBombs", GetTotalBombs()),
    rich_presence_value("StandardBombs", CountBombs("Standard")),
    rich_presence_value("ClusterBombs", CountBombs("Cluster"))
)

rich_presence_display("Taking Raiden II for a spin")