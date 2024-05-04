// Raiden
// #ID = 15140

// ======================================================================= //
// Accessors
// ======================================================================= //

InGame = byte(0x566)
MultiplayerActive = byte(0x41a)
GameOverState = byte(0xac2)

//Lives, Extends, and Difficulty are the only settings that affect gameplay
DIPSettings = {
    "CoinMode": bit0(0xb60),
    "Coinage": (bit1(0xb60) + bit2(0xb60) * 10 + bit3(0xb60) * 100 + bit4(0xb60) * 1000),
    "Credits": bit5(0xb60),
    "InvertScreen": bit7(0xb60),
    "Lives": (bit0(0xb62) + bit1(0xb62) * 10),
    "Extends": (bit2(0xb62) + bit3(0xb62) * 10),
    "Difficulty": (bit4(0xb62) + bit5(0xb62) * 10),
    "ContinuesEnabled": bit6(0xb62),
    "DemoSoundEnabled": bit7(0xb62)
}

Player = {
    "P1": {
        "Active": byte(0xb83),
        "Lives": byte(0xb85),
        "Vulcan": byte(0xb8b),
        "Laser": byte(0xb8d),
        "Missile": byte(0xb8f),
        "Homing": byte(0xb91),
        "Bombs": byte(0xb93),
        "Medals": byte(0xb95),
        "Fairies": byte(0xb97),
        "Score": (byte(0xba1) + byte(0xba2) * 0x100 + byte(0xba3) * 0x10000 + byte(0xba4) * 0x1000000)
    },
    "P2": {
        "Active": byte(0xba9),
        "Lives": byte(0xbab),
        "Vulcan": byte(0xbb1),
        "Laser": byte(0xbb3),
        "Missile": byte(0xbb5),
        "Homing": byte(0xbb7),
        "Bombs": byte(0xbb9),
        "Medals": byte(0xbbb),
        "Fairies": byte(0xbbd),
        "Score": (byte(0xbc7) + byte(0xbc8) * 0x100 + byte(0xbc9) * 0x10000 + byte(0xbca) * 0x1000000)
    }
}

// ======================================================================= //
// Helper Dictionaries
// ======================================================================= //

GameOverStates = {
    "Transition": 0x2,
    "Active": 0xe
}

ValidDIPSettings = {
    "Lives": 0,
    "Extends": 0,
    "Difficulty": 0
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsValidSession(){
    return InGame > 0 &&
        MultiplayerActive == 0 &&
        all_of(ValidDIPSettings, setting => DIPSettings[setting] == ValidDIPSettings[setting])
}

// ======================================================================= //
// Leaderboard Functions
// ======================================================================= //

function Start(){
    return IsValidSession() && prev(GameOverState) == GameOverStates["Transition"] && GameOverState == GameOverStates["Active"]
}

function InvalidStart(){
    return any_of(ValidDIPSettings, setting => DIPSettings[setting] != ValidDIPSettings[setting]) &&
        prev(InGame) == 0 && InGame > 0
}

function Value(){
    return Player["P1"]["Score"] + Player["P2"]["Score"]
}

function InvalidValue(){
    return DIPSettings["Lives"] + DIPSettings["Extends"] * 100 + DIPSettings["Difficulty"] * 1000
}

leaderboard("Score Attack", "Get the highest score possible before getting a Game Over",
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