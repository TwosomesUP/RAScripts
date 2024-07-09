// In the Hunt
// #ID = 11869
// Retro Achievements - Rich Presence Script
// Author: TwosomesUP

//================================================================
// Accessors
//================================================================

Settings = {
    "Lives": (bit0(0x11278) + bit1(0x11278) * 10),
    "Difficulty": (bit2(0x11278) + bit3(0x11278) * 10),
    "StartButton": bit5(0x11278),
    "DemoSound": bit6(0x11278),
    "ServiceMode": bit7(0x11278), 
    "FlipScreen": bit0(0x11279),
    "CoinSlot": bit2(0x11279),
    "CoinMode": bit3(0x11279),
    "Coinage": (bit4(0x11279) + bit5(0x11279) * 10 + bit6(0x11279) * 100 + bit7(0x11279) * 1000)
}

Game = {
    "State": byte(0x11284),
    "Credits": byte(0x112b8)
}

Screen = {
    "State": byte(0x11081),
    "SubState": byte(0x11080),
    "ScrollState": byte(0x118cd)
}

Stage = {
    "Id": byte(0x11084),
    "Enemies": {
        "Small": word(0x11120),
        "Large": word(0x11122)
    },
    "Boss": {
        "Defeated": bit7(0x11262)
    },
    "Timer": byte(0x1c8a0)
}

ActivePlayer = byte(0x11266)

Player = {
    "Active": bit2(0x11264),
    "Alive": bit0(0x11264),
    "Weapon": {
        "Primary": {
            "Type": byte(0x11110),
            "Power": byte(0x11112)
        },
        "Secondary": {
            "Type": byte(0x11114),
            "Power": byte(0x11116)
        }
    },
    "Lives": byte(0x11118),
    "TreasureBalls": byte(0x1111a),
    "Score": (
        low4(0x11220) +
        high4(0x11220) * 10 +
        low4(0x11221) * 100 +
        high4(0x11221) * 1000 +
        low4(0x11222) * 10000 +
        high4(0x11222) * 100000 +
        low4(0x11223) * 1000000 +
        high4(0x11223) * 10000000
    )
}

//================================================================
// Value Dictionaries
//================================================================

ValidSettings = {
    "Lives": 0,
    "Difficulty": 0,
    "ServiceMode": 0,
}

ScreenStates = {
    "InGame": 0x0b,
    "Demo": 0x0b,
    "Title": 0x1e,
    "ScoreEntry": 0xc6,
    "HighScores": 0xc7,
    "StageResults": 0x25,
    "StateIntro": 0x22,
    "Ending": 0x35
}

ScreeSubStates = {
    "NameEntry": 0x1a,
    "NameSubmitted": 0x42
}

ScreenScrollTypes = {
    "Horizontal": 0x00,
    "Vertical": 0x01,
    "Boss": 0xff
}

Stages = {
    "Stage1": 0x00,
    "Stage2": 0x01,
    "Stage3": 0x02,
    "Stage4": 0x03,
    "Stage5": 0x04,
    "Stage6": 0x05,
    "End": 0x06,
    "Ending1": 0x0a, //Continues Used
    "Ending2": 0x09  //No Continues Used
}

PrimaryWeapons = {
    "Default": 0x00,
    "Torpedo": 0x02,
    "Supersonic": 0x04,
    "Cracker": 0x06
}

MaxPrimaryPower = 3

SecondaryWeapons = {
    "Default": 0x00,
    "Missiles": 0x02,
    "Mines": 0x04
}

MaxSecondaryPower = 3

//================================================================
// Helper Functions
//================================================================

function IsInGame() => Game["State"] == 1
function IsOnTitle() => Game["State"] == 0
function IsSinglePlayer() => ActivePlayer == 1

function IsValidSettings(){
    return all_of(ValidSettings, settings => Settings[setting] == ValidSettings[setting])
}

function IsValidSession() {
    return IsInGame() && IsSinglePlayer() && IsValidSettings()
}


/*
achievement("Test Treasure Balls", "Test Treasure Balls", points = 0,
    trigger = Stage == 0x04 && 
        ActivePlayer == 0x01 && 
        Stage["State"] == 0x0b && 
        prev(ScreenScrollState) != 0xff && 
        ScreenScrollState == 0xff &&
        measured(repeated(15, Stage == 0x04 && StageState == 0x0b && prev(TreasureBalls) != TreasureBalls))
)

achievement("Test Timer", "Test Timer", points = 0,
    trigger = prev(ScreenScrollState) != 0xff && ScreenScrollState == 0xff &&
        measured(SmallEnemyCount + LargeEnemyCount >= 75, Stage == 0x00 && StageState == 0x0b && ActivePlayer == 0x01) &&
        disable_when(repeated(120, Timer < prev(Timer)), StageState != 0x0b || Stage != 0x00 || ActivePlayer != 0x01)
)

achievement(
    title = "Anchors Away!", points = 0,
    description = "While fighting Argok on Stage 1, expose its innards by destroying its anchors",
    trigger = Stage == 0x00 && 
              StageState == 0x0b &&
              ActivePlayer == 0x01 && 
              ScreenScrollState == 0xFF &&
              (GetScore() - prev(GetScore())) == 10000
)

achievement(
    title = "Call to Arms!", points = 0,
    description = "While fighting Manriki on Stage 3, pacify the boss by destroying both laser reattachment arms",
    trigger = repeated(2, (GetScore() - prev(GetScore())) == 10000) && 
              never(Stage != 2) && 
              never(ActivePlayer != 1) &&
              never(ScreenScrollState != 0xff) &&
              never(StageState != 0x0b)
)

//Aiming for 80% destruction in Stage 3
//This accounts for potential false positives:
//  - if multiple small enemies are killed on the same frame
//  - if a small enemy is killed on the same frame as a small building
//  - if the large ship at the beginning is shot and its aux parts are destroyed
//False positives will only count toward the small building count
achievement(
    title = "Destroy it All!", points = 0,
    description = "While playing Stage 3, gain bonus points by causing a significant amount of collateral damage",
    trigger = repeated(50, (GetScore() - prev(GetScore())) == 200) && 
              repeated(12, (GetScore() - prev(GetScore())) == 500) &&  
              repeated(3, (GetScore() - prev(GetScore())) == 3000) &&
              prev(ScreenScrollState) != 0xff && ScreenScrollState == 0xff &&
              never(Stage != 2) && 
              never(ActivePlayer != 1) &&
              never(StageState != 0x0b)
)
*/
