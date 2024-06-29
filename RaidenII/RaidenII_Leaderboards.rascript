// Raiden II
// #ID = 12860
// Author: TwosomesUP
// Leaderboards Script

//================================================================
// Accessors
//================================================================

GameState = byte(0x842)
TitleState = byte(0x9f54)
ScoreSubmitState = byte(0x00b158)

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
// Helper Functions
//================================================================

function IsInGame() => GameState == 1 && TitleState == 0
function IsOnTitle() => TitleState > 0
function IsSinglePlayer() => NumberOfPlayers == 1
function IsMultiplayer() => NumberOfPlayers == 2
function IsValidSession() => all_of(ValidSettings, setting => Settings[setting] == ValidSettings[setting])

function PlayerUsedContinue() {
    return IsInGame() && prev(NumberOfPlayers) == 0 && NumberOfPlayers > 0
}

function PlayerSubmittedScore() {
    return once(prev(ScoreSubmitState) != 0x0a && ScoreSubmitState == 0x0a && never(!IsInGame()))
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
// Leaderboard Functions
//================================================================

function Start() {
    return IsValidSession() && 
        PlayerSubmittedScore() &&
        disable_when(NumberOfPlayers > 1, !IsInGame())
}

function InvalidStart(){
    return any_of(ValidSettings, setting => Settings[setting] != ValidSettings[setting]) &&
        prev(GameState) == 0 && GameState == 1 && TitleState == 0
}

function Value() {
    return Player["Score"]
}

function InvalidValue(){
    return Settings["Difficulty"] + Settings["Difficulty"] * 10 + Settings["Lives"] * 100 + Settings["Extends"] * 1000
}

leaderboard("Score Attack", "Get the highest score possible",
    start = Start(),
    cancel = always_false(),
    submit = always_true(),
    value = Value()
)

leaderboard("Invalid Game Settings Found", "To re-enable achievements, reset the game settings to their default values",
    start = InvalidStart(),
    cancel = always_false(),
    submit = always_true(),
    value = InvalidValue()
)