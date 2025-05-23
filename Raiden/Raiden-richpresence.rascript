// Raiden
// #ID = 15140

// ======================================================================= //
// Accessors
// ======================================================================= //

InGame = byte(0x6ff4)
PlayerCount = byte(0xce3) 
MultiplayerActive = byte(0x41a)
Stage = byte(0x402)
Loop = byte(0x41c) + 1
GameOverState = byte(0xac2)
StageState = byte(0x4c06)

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

Item = [
    {
        "State": byte(0x471a),
        "Collected": byte(0x472a),
        "Id": byte(0x4732)
    },
    {
        "State": byte(0x478a),
        "Collected": byte(0x479a),
        "Id": byte(0x47a2)
    },
    {
        "State": byte(0x47fa),
        "Collected": byte(0x480a),
        "Id": byte(0x4812)
    },
    {
        "State": byte(0x486a),
        "Collected": byte(0x487a),
        "Id": byte(0x4882)
    },
    {
        "State": byte(0x48da),
        "Collected": byte(0x48ea),
        "Id": byte(0x48f2)
    },
    {
        "State": byte(0x494a),
        "Collected": byte(0x495a),
        "Id": byte(0x4962)
    },
    {
        "State": byte(0x49ba),
        "Collected": byte(0x49ca),
        "Id": byte(0x49d2)
    },
    {

        "Collected": byte(0x4a3a),
        "Id": byte(0x4a42)
    },
]

ItemIds = {
    "LaserUp": 0x2c8,
    "VulcanUp": 0x2c4,
    "Bomb": 0x2d4,
    "Missiles": 0x5dc,
    "Homing": 0x5e0,
    "Medal": 0x5ec,
    "Fairy": 0x92e,
    "MiclusRight": 0x3ac,
    "MiclusLeft": 0x3b0,
    "3000pts": 0x2e4
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

StageStates = {
    "InStage": 0,
    "BossActive": 1,
    "BossDefeated": 2,
    "PreResults": 3,
    "ResultsStart": 4,
    "ResultsEnd": 5
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsPlaying(player){
    otherPlayer = "P2"
    if(player == "P2")
        otherPlayer = "P1"

    return InGame == 0x0b && 
        Player[player]["Active"] > 0 && 
        Player[otherPlayer]["Active"] == 0 &&
        MultiplayerActive == 0
} 

function IsGameOver(){
    return InGame == 0x0b && 
    Player["P1"]["Active"] == 0 && 
    Player["P2"]["Active"] == 0 &&
    MultiplayerActive == 0
} 

function IsOnTitle() => InGame == 0xfa
function IsMultiplayer() => InGame == 0x0b && (Player["P2"]["Active"] > 0 || Player["P2"]["Active"] > 0) && MultiplayerActive == 1
function IsMultiplayerGameOver() => InGame == 0x0b && Player["P2"]["Active"] == 0 && Player["P2"]["Active"] == 0 && MultiplayerActive == 1

function IsValidSession(){
    return InGame == 0x0b &&
        MultiplayerActive == 0 &&
        all_of(ValidDIPSettings, setting => DIPSettings[setting] == ValidDIPSettings[setting])
}

function CountContinues() {
    return measured(tally(0, prev(GameOverState) == GameOverStates["Transition"] && GameOverState == GameOverStates["Active"])) && never(InGame == 0)
}

function CountExtends(player){
    return measured(tally(0, prev(Player[player]["Score"]) < 150000 && Player[player]["Score"] >= 150000, prev(Player[player]["Score"]) < 400000 && Player[player]["Score"] >= 400000)) && never(InGame == 0)
}

function GetPrimaryWeapon(player){
    return Player[player]["Vulcan"] + Player[player]["Laser"] * 10
}

function GetSecondaryWeapon(player){
    return Player[player]["Missile"] + Player[player]["Homing"] * 10
}

// ======================================================================= //
// Lookups
// ======================================================================= //

StageLookup = {
    0x00: "1 [Countryside]",
    0x01: "1 [Countryside]",
    0x02: "2 [City]",
    0x03: "3 [Ocean]",
    0x04: "4 [Ruins]",
    0x05: "5 [Wasteland]",
    0x06: "6 [Floating Continent]",
    0x07: "6 [Floating Continent]",
    0x08: "7 [Space Station]",
    0x09: "8 [Enemy Final Base]",
    0x0a: "8 [Enemy Final Base]"
}

PrimaryWeaponLookup = {
    1: "[Vulcan LV1]",
    2: "[Vulcan LV2]",
    3: "[Vulcan LV3]",
    4: "[Vulcan LV4]",
    5: "[Vulcan LV5]",
    6: "[Vulcan LV6]",
    7: "[Vulcan LV7]",
    8: "[Vulcan LV8]",
    10: "[Laser LV1]",
    20: "[Laser LV2]",
    30: "[Laser LV3]",
    40: "[Laser LV4]",
    50: "[Laser LV5]",
    60: "[Laser LV6]",
    70: "[Laser LV7]",
    80: "[Laser LV8]",
}

SecondaryWeaponLookup = {
    0: "",
    1: "[Missiles LV1]",
    2: "[Missiles LV2]",
    3: "[Missiles LV3]",
    4: "[Missiles LV4]",
    10: "[Homing LV1]",
    20: "[Homing LV2]",
    30: "[Homing LV3]",
    40: "[Homing LV4]"
}

// ======================================================================= //
// Rich Presence Functions
// ======================================================================= //

rich_presence_conditional_display(IsPlaying("P1"), "{0} | 🔴 Raiden {1} {2} | Stage {3}-{4} | 🧚{5} • 🎖️{6} • 💣{7} | 🛩️{8} • 🆙{9} • 🔄{10}",
    rich_presence_value("Score", Player["P1"]["Score"], "SCORE"),
    rich_presence_lookup("PrimaryWeaponLookup", GetPrimaryWeapon("P1"), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryWeaponLookup", GetSecondaryWeapon("P1"), SecondaryWeaponLookup),
    rich_presence_value("Loop", Loop),
    rich_presence_lookup("StageLookup", Stage, StageLookup),
    rich_presence_value("Fairies", Player["P1"]["Fairies"]),
    rich_presence_value("Medals", Player["P1"]["Medals"]),
    rich_presence_value("Bombs", Player["P1"]["Bombs"]),
    rich_presence_value("Lives", Player["P1"]["Lives"]),
    rich_presence_value("Extends", CountExtends("P1")), 
    rich_presence_value("Continues", CountContinues())
)

rich_presence_conditional_display(IsPlaying("P2"), "{0} | 🔵 Raiden {1} {2} | Stage {3}-{4} | 🧚{5} • 🎖️{6} • 💣{7} | 🛩️{8} • 🆙{9} • 🔄{10}",
    rich_presence_value("Score", Player["P2"]["Score"], "SCORE"),
    rich_presence_lookup("PrimaryWeaponLookup", GetPrimaryWeapon("P2"), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryWeaponLookup", GetSecondaryWeapon("P2"), SecondaryWeaponLookup),
    rich_presence_value("Loop", Loop),
    rich_presence_lookup("StageLookup", Stage, StageLookup),
    rich_presence_value("Fairies", Player["P2"]["Fairies"]),
    rich_presence_value("Medals", Player["P2"]["Medals"]),
    rich_presence_value("Bombs", Player["P2"]["Bombs"]),
    rich_presence_value("Lives", Player["P2"]["Lives"]),
    rich_presence_value("Extends", CountExtends("P2")), 
    rich_presence_value("Continues", CountContinues())
)
    
rich_presence_conditional_display(IsGameOver(), "Mission Failed | Stage {0}-{1} | {2}", 
    rich_presence_value("Loop", Loop),
    rich_presence_lookup("StageLookup", Stage, StageLookup),
    rich_presence_value("Score", Player["P1"]["Score"] + Player["P2"]["Score"], "SCORE")
)

rich_presence_conditional_display(IsOnTitle(), "Preparing to fight the Extraterrestrial Menace")

rich_presence_conditional_display(IsMultiplayer(), "The Raiden Duo are fighting the Extraterrestrial Menace | 🔴{0} | 🔵{1}",
    rich_presence_value("ScoreP1", Player["P1"]["Score"], "SCORE"),
    rich_presence_value("ScoreP2", Player["P2"]["Score"], "SCORE")
)

rich_presence_conditional_display(IsMultiplayerGameOver(), "The Raiden Duo failed to eradicate the Extraterrestrial Menace | 🔴{0} | 🔵{1}",
    rich_presence_value("ScoreP1", Player["P1"]["Score"], "SCORE"),
    rich_presence_value("ScoreP2", Player["P2"]["Score"], "SCORE")
)

rich_presence_display("Playing Raiden")