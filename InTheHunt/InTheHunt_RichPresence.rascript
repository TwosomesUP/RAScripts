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
    "State": byte(0x11608),
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

Pointers = {
    "Score": word(0x11254),
    "EntryScore": word(0x11258)
}

Offsets = {
    "Score": [
        0x11000, 
        0x11000, 
        0x11001, 
        0x11001, 
        0x11002, 
        0x11002, 
        0x11003, 
        0x11003  
    ],
    "Continues": [
        0x11000, 
        0x11000  
    ],
    "TreasureBalls": 0x11004,
    "Stage": 0x11006
}

Player = {
    "Active": bit2(0x11264),
    "Alive": bit0(0x11264),
    "Weapon": {
        "Primary": {
            "Type": byte(0x11112),
            "Power": byte(0x11110)
        },
        "Secondary": {
            "Type": byte(0x11116),
            "Power": byte(0x11114)
        }
    },
    "Lives": byte(0x11118),
    "TreasureBalls": word(0x1111c),
    "Score": (
        low4(Pointers["Score"] + Offsets["Score"][2]) * 100 +
        high4(Pointers["Score"] + Offsets["Score"][3]) * 1000 +
        low4(Pointers["Score"] + Offsets["Score"][4]) * 10000 +
        high4(Pointers["Score"] + Offsets["Score"][5]) * 100000 +
        low4(Pointers["Score"] + Offsets["Score"][6]) * 1000000 +
        high4(Pointers["Score"] + Offsets["Score"][7]) * 10000000
    ),
    "RPScore": [
        low4(Pointers["Score"] + Offsets["Score"][2]),
        high4(Pointers["Score"] + Offsets["Score"][3]),
        low4(Pointers["Score"] + Offsets["Score"][4]),
        high4(Pointers["Score"] + Offsets["Score"][5]),
        low4(Pointers["Score"] + Offsets["Score"][6]),
        high4(Pointers["Score"] + Offsets["Score"][7])
    ],
    "EntryScore": [
        low4(Pointers["EntryScore"] + Offsets["Score"][2]) * 100 +
        high4(Pointers["EntryScore"] + Offsets["Score"][3]) * 1000 +
        low4(Pointers["EntryScore"] + Offsets["Score"][4]) * 10000 +
        high4(Pointers["EntryScore"] + Offsets["Score"][5]) * 100000 +
        low4(Pointers["EntryScore"] + Offsets["Score"][6]) * 1000000 +
        high4(Pointers["EntryScore"] + Offsets["Score"][7]) * 10000000
    ],
    "RPEntryScore": [
        low4(Pointers["EntryScore"] + Offsets["Score"][2]),
        high4(Pointers["EntryScore"] + Offsets["Score"][3]),
        low4(Pointers["EntryScore"] + Offsets["Score"][4]),
        high4(Pointers["EntryScore"] + Offsets["Score"][5]),
        low4(Pointers["EntryScore"] + Offsets["Score"][6]),
        high4(Pointers["EntryScore"] + Offsets["Score"][7])
    ],
    "Continues": (low4(Pointers["Score"] + Offsets["Continues"][0]) + high4(Pointers["Score"] + Offsets["Continues"][1]) * 10),
    "ResultsContinues": (low4(Pointers["EntryScore"] + Offsets["Continues"][0]) + high4(Pointers["EntryScore"] + Offsets["Continues"][1]) * 10)
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
    "StageResultsIn": 0x24,
    "StageResults": 0x25,
    "StageIntro": 0x22,
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
// Lookup Dictionaries
//================================================================

StageLookup = {
    0: "Stage 1 [The South Pole]",
    1: "Stage 2 [Sunken Town]",
    2: "Stage 3 [The Channel]",
    3: "Stage 4 [Deep Dark Sea]",
    4: "Stage 5 [Seabed Ruins]",
    5: "Stage 6 [The Enemy Base]"
}

ResultsStageLookup = {
    1: "Stage 1 [The South Pole]",
    2: "Stage 2 [Sunken Town]",
    3: "Stage 3 [The Channel]",
    4: "Stage 4 [Deep Dark Sea]",
    5: "Stage 5 [Seabed Ruins]",
    6: "Stage 6 [The Enemy Base]"
}

BossLookup = {
    0: "caveman-class submarine attack craft [Argok]",
    1: "SICBM control unit [Trumpet Release]",
    2: "automatic machine tool master device [Manriki]",
    3: "master of the Rock Palace [J3]",
    4: "defender subhuman [Sogon]",
    5: "Humanity Extermination System [Yugskure]"
}

PrimaryWeaponLookup = {
    0: "Default",
    21: "Torpedoes LV1",
    22: "Torpedoes LV2",
    23: "Torpedoes LV3",
    41: "Supersonic LV1",
    42: "Supersonic LV2",
    43: "Supersonic LV3",
    61: "Cracker LV1",
    62: "Cracker LV2",
    63: "Cracker LV3",
}

SecondaryWeaponLookup = {
    0: "Default",
    21: "Missiles LV1",
    22: "Missiles LV2",
    23: "Missiles LV3",
    41: "Mines LV1",
    42: "Mines LV2",
    43: "Mines LV3",
}

//================================================================
// Helper Functions
//================================================================

function IsInGame() => Game["State"] == 2
function IsOnTitle() => Game["State"] == 4
function IsInEnding() => Stage["Id"] > 5
function IsSinglePlayer() => ActivePlayer == 1
function IsFightingBoss() => Screen["ScrollState"] == ScreenScrollTypes["Boss"]
function IsOnResultScreen() => (Screen["State"] == ScreenStates["StageResultsIn"] || Screen["State"] == ScreenStates["StageResults"])
function IsOnNameEntry() => (Screen["State"] == ScreenStates["ScoreEntry"])
function IsOnStageIntro() => Screen["State"] == ScreenStates["StageIntro"]

function IsValidSettings(){
    return all_of(ValidSettings, settings => Settings[setting] == ValidSettings[setting])
}

function IsValidSession() {
    return IsInGame() && IsSinglePlayer() && IsValidSettings()
}

function GetActivePrimaryWeapon(){
    return Player["Weapon"]["Primary"]["Type"] + Player["Weapon"]["Primary"]["Power"] * 10
}

function GetActiveSecondaryWeapon(){
    return Player["Weapon"]["Secondary"]["Type"] + Player["Weapon"]["Secondary"]["Power"] * 10
}

rich_presence_conditional_display(IsInGame() && !IsOnStageIntro() && !IsFightingBoss() && !IsOnResultScreen() && !IsInEnding(), 
    "The Granvia is infiltrating the D.A.S. on {0} | {1} • {2} | Lives: {3} • Continues: {4} | Score: {5}{6}{7}{8}{9}{10}00 * {11}",
    rich_presence_lookup("StageLookup", Stage["Id"], StageLookup),
    rich_presence_lookup("PrimaryLookup", GetActivePrimaryWeapon(), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryLookup", GetActiveSecondaryWeapon(), SecondaryWeaponLookup),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Score8", Player["RPScore"][5]),
    rich_presence_value("Score7", Player["RPScore"][4]),
    rich_presence_value("Score6", Player["RPScore"][3]),
    rich_presence_value("Score5", Player["RPScore"][2]),
    rich_presence_value("Score4", Player["RPScore"][1]),
    rich_presence_value("Score3", Player["RPScore"][0]),
    rich_presence_value("TreasureBalls", Player["TreasureBalls"])
)

rich_presence_conditional_display(IsInGame() && !IsOnStageIntro() && IsFightingBoss() && !IsOnResultScreen() && !IsInEnding(), 
    "Battling the {0} on {1} | {2} • {3} | Lives: {4} • Continues: {5} | Score: {6}{7}{8}{9}{10}{11}00 * {12}",
    rich_presence_lookup("BossLookup", Stage["Id"], BossLookup),
    rich_presence_lookup("StageLookup", Stage["Id"], StageLookup),
    rich_presence_lookup("PrimaryLookup", GetActivePrimaryWeapon(), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryLookup", GetActiveSecondaryWeapon(), SecondaryWeaponLookup),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Score8", Player["RPScore"][5]),
    rich_presence_value("Score7", Player["RPScore"][4]),
    rich_presence_value("Score6", Player["RPScore"][3]),
    rich_presence_value("Score5", Player["RPScore"][2]),
    rich_presence_value("Score4", Player["RPScore"][1]),
    rich_presence_value("Score3", Player["RPScore"][0]),
    rich_presence_value("TreasureBalls", Player["TreasureBalls"])
)

rich_presence_conditional_display(!IsInGame() && !IsOnStageIntro() && !IsFightingBoss() && IsOnResultScreen() && !IsInEnding(), 
    "The Granvia is getting debreifed on its exploits in {0} | {1} • {2} | Lives: {3} • Continues: {4} | Score: {5}{6}{7}{8}{9}{10}00 * {11}",
    rich_presence_lookup("ResultsStageLookup", Stage["Id"], ResultsStageLookup),
    rich_presence_lookup("PrimaryLookup", GetActivePrimaryWeapon(), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryLookup", GetActiveSecondaryWeapon(), SecondaryWeaponLookup),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Score8", Player["RPScore"][5]),
    rich_presence_value("Score7", Player["RPScore"][4]),
    rich_presence_value("Score6", Player["RPScore"][3]),
    rich_presence_value("Score5", Player["RPScore"][2]),
    rich_presence_value("Score4", Player["RPScore"][1]),
    rich_presence_value("Score3", Player["RPScore"][0]),
    rich_presence_value("TreasureBalls", Player["TreasureBalls"])
)

rich_presence_conditional_display(IsInGame() && !IsOnStageIntro() && !IsFightingBoss() && !IsOnResultScreen() && IsInEnding() && !IsOnNameEntry(), 
    "The Granvia successfully foiled the D.A.S.'s plot to rule the world! | Continues: {0} | Score: {1}{2}{3}{4}{5}{6}00",
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Score8", Player["RPScore"][5]),
    rich_presence_value("Score7", Player["RPScore"][4]),
    rich_presence_value("Score6", Player["RPScore"][3]),
    rich_presence_value("Score5", Player["RPScore"][2]),
    rich_presence_value("Score4", Player["RPScore"][1]),
    rich_presence_value("Score3", Player["RPScore"][0])
)

rich_presence_conditional_display(IsInGame() && !IsOnStageIntro() && !IsFightingBoss() && !IsOnResultScreen() && IsInEnding() && IsOnNameEntry(), 
    "The Granvia successfully foiled the D.A.S.'s plot to rule the world! | Continues: {0} | Score: {1}{2}{3}{4}{5}{6}00",
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Score8", Player["RPEntryScore"][5]),
    rich_presence_value("Score7", Player["RPEntryScore"][4]),
    rich_presence_value("Score6", Player["RPEntryScore"][3]),
    rich_presence_value("Score5", Player["RPEntryScore"][2]),
    rich_presence_value("Score4", Player["RPEntryScore"][1]),
    rich_presence_value("Score3", Player["RPEntryScore"][0])
)

rich_presence_conditional_display(IsInGame() && Stage["Id"] == Stages["Stage1"] && IsOnStageIntro() && !IsFightingBoss() && !IsOnResultScreen() && !IsInEnding(), 
    "The Granvia is traveling to {0} | {1} • {2} | Lives: {3} • Continues: 0 | Score: 00000000 * 0",
    rich_presence_lookup("StageLookup", Stage["Id"], StageLookup),
    rich_presence_lookup("PrimaryLookup", GetActivePrimaryWeapon(), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryLookup", GetActiveSecondaryWeapon(), SecondaryWeaponLookup),
    rich_presence_value("Lives", Player["Lives"])
)

rich_presence_conditional_display(IsInGame() && Stage["Id"] != Stages["Stage1"] && IsOnStageIntro() && !IsFightingBoss() && !IsOnResultScreen() && !IsInEnding(), 
    "The Granvia is traveling to {0} | {1} • {2} | Lives: {3} • Continues: {4} | Score: {5}{6}{7}{8}{9}{10}00 * {11}",
    rich_presence_lookup("StageLookup", Stage["Id"], StageLookup),
    rich_presence_lookup("PrimaryLookup", GetActivePrimaryWeapon(), PrimaryWeaponLookup),
    rich_presence_lookup("SecondaryLookup", GetActiveSecondaryWeapon(), SecondaryWeaponLookup),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Score8", Player["RPScore"][5]),
    rich_presence_value("Score7", Player["RPScore"][4]),
    rich_presence_value("Score6", Player["RPScore"][3]),
    rich_presence_value("Score5", Player["RPScore"][2]),
    rich_presence_value("Score4", Player["RPScore"][1]),
    rich_presence_value("Score3", Player["RPScore"][0]),
    rich_presence_value("TreasureBalls", Player["TreasureBalls"])
)

rich_presence_display("On the hunt in In the Hunt")

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
