// Deathsmiles - Rich Presence
// #ID = 21889

// ======================================================================= //
// Accessors
// ======================================================================= //

GameState = byte(0x53b4bc)
Tutorial = byte(0x53b4f0)
Players = byte(0x38870e)

ResultScreenState = {
    "P1": byte(0x540944),
    "P2": byte(0x54156c)
}

ResultScreenCharacter = {
    "P1": byte(0x540942),
    "P2": byte(0x54156a)
}

ResultScreenScore = {
    "P1": (word(0x54093c) * 0x10000 + word(0x54093e)),
    "P2": (word(0x541564) * 0x10000 + word(0x541566))
}

Characters = {
    "Windia": 0,
    "Casper": 1,
    "Follett": 2,
    "Rosa": 3
}

GameOptions = {
    "Extends": byte(0x388628),
    "Difficulty": byte(0x388629),
    "EnemyDamage": byte(0x38862a),
    "LifeCapacity": byte(0x38862b),
    "BulletDamage": byte(0x38862d)
}

ValidOptions = {
    "Extends": 0x00,
    "Difficulty": 0x01,
    "EnemyDamage": 0x03,
    "LifeCapacity": 0x00,
    "BulletDamage": 0x04
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsValidSession(){
    return 
        GameState == 1 && 
        Players == 1 && 
        Tutorial == 0 &&
        all_of(GameOptions, option => GameOptions[option] == ValidOptions[option])
}

function GetScore() => ResultScreenScore["P1"] + ResultScreenScore["P2"]

function Start(character){
    return IsValidSession() && 
        ((prev(ResultScreenState["P1"]) == 2 && ResultScreenState["P1"] == 3 && ResultScreenCharacter["P1"] == Characters[character]) || 
        (prev(ResultScreenState["P2"]) == 2 && ResultScreenState["P2"] == 3 && ResultScreenCharacter["P2"] == Characters[character]))
}
        
function Cancel() => always_false()
function Submit() => always_true()
function Value() => GetScore()

// ======================================================================= //
// Leaderboard Definitions
// ======================================================================= //

leaderboard("Highscore Challenge - Windia", "Get the highest score possible while playing as Windia [Default Settings] [Free Play Allowed]",
    start = Start("Windia"),
    cancel = Cancel(),
    submit = Submit(),
    value = GetScore())
    
leaderboard("Highscore Challenge - Casper", "Get the highest score possible while playing as Casper [Default Settings] [Free Play Allowed]",
    start = Start("Casper"),
    cancel = Cancel(),
    submit = Submit(),
    value = GetScore())

leaderboard("Highscore Challenge - Follett", "Get the highest score possible while playing as Follett [Default Settings] [Free Play Allowed]",
    start = Start("Follett"),
    cancel = Cancel(),
    submit = Submit(),
    value = GetScore())
    
leaderboard("Highscore Challenge - Rosa", "Get the highest score possible while playing as Rosa [Default Settings] [Free Play Allowed]",
    start = Start("Rosa"),
    cancel = Cancel(),
    submit = Submit(),
    value = GetScore())