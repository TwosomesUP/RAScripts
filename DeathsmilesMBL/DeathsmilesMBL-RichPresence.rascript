// Deathsmiles: Mega Black Label
// #ID = 28669
// RetroAchievements - Rich Presence Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

GameState = byte(0x89baee)
TutorialState = byte(0x89bb22)
NumberOfPlayers = byte(0x89baf6)

Credits = byte(0x1e109e)

StageClearedFlag = byte(0x660a9e)
StagesCleared = byte(0x660a76)
StagesClearedLV3 = byte(0x660b9a)
StagesClearedLV999 = byte(0x660b9e)
Stage4ASelected = byte(0x660ba2)
Stage4BSelected = byte(0x660ba6)
SelectedStage = byte(0x8a097a)
StageState = byte(0x8a099d)
SelectedStageLevel = byte(0x8a0f6a)

DeathModeActive = byte(0x660baa)
DeathMode999Active = byte(0x660bae)

BossIndex = byte(0x660a82)
BossDefeatedFlag = byte(0x660a96)

GameSettings = {
    "CoinMode": byte(0x660972),
    "DemoSoundEnabled": byte(0x660974),
    "ContinuesEnabled": byte(0x660975),
    "ChuteType": byte(0x660976),
    "RankDisplayEnabled": byte(0x660977),
    "Extends": byte(0x660978),
    "Difficulty": byte(0x660979),
    "EnemyDamage": byte(0x66097a),
    "LifeCapacity": byte(0x66097b),
    "BulletDamage": byte(0x66097d)
}

BombCapacity = byte(0x660b66)

Player = {
    "P1": {
        "Active": byte(0x1e1086),
        "Life": byte(0x66145c),
        "Health": word(0x66145e),
        "Character": byte(0x661467),
        //Score is broken into two parts due to size limitations
        //A combination of the two will be used for achievement logic
        "Score": {
            "Billions": (byte(0x661498) + byte(0x66149b) * 10 + byte(0x66149a) * 100),
            "Millions": (
                byte(0x661491) + byte(0x661490) * 10 + byte(0x661493) * 100 + byte(0x661492) * 1000 +
                byte(0x661495) * 10000 + byte(0x661494) * 100000 + byte(0x661497) * 1000000 + 
                byte(0x661496) * 10000000 + byte(0x661499) * 100000000
            )
        },
        //Score broken into individual digits. 
        //Use for rich presence
        "ScoreParts": {
            "Ones": byte(0x661491),
            "Tens": byte(0x661490),
            "Hundreds": byte(0x661493),
            "Thousands": byte(0x661492),
            "TenThousands": byte(0x661495),
            "HundredThousands": byte(0x661494),
            "Millions": byte(0x661497),
            "TenMillions": byte(0x661496),
            "HundredMillions": byte(0x661499),
            "Billions": byte(0x661498),
            "TenBillions": byte(0x66149b),
            "HundredBillions": byte(0x66149a)
        },
        "Continues": word(0x66149e),
        "PlusValue": (word(0x661580) * 0x10000 + word(0x661582)),
        "ItemCounter": word(0x661586),
        "PowerUp": byte(0x6615a6),
        "Results": {
            "State": byte(0x8a1024),
            //Score is broken into two parts due to size limitations
            //Use for leaderboard logic.
            //Hundreds will not be used. Leaderboard score * 1000 will give an approximation of the actual amount
            "Score": {
                "Billions": (
                    byte(0x8a1016) + byte(0x8a1019) * 10 + byte(0x8a1018) * 100 +
                    byte(0x8a101b) * 1000 + byte(0x8a101a) * 10000 + byte(0x8a101d) * 100000 +
                    byte(0x8a101c) * 1000000 + byte(0x8a101f) * 10000000 + byte(0x8a101e) * 100000000
                ),
                "Hundreds": (byte(0x8a1015) + byte(0x8a1014) * 10 + byte(0x8a1017))
            },
            "Character": byte(0x8a1022)
        }
    },
    "P2": {
        "Active": byte(0x1e108a),
        "Life": byte(0x6615bc),
        "Health": word(0x6615be),
        "Character": byte(0x6615c7),
        "Score": {
            "Billions": (byte(0x6615f8) + byte(0x6615fb) * 10 + byte(0x6615fa) * 100),
            "Millions": (
                byte(0x6615f1) + byte(0x6615f0) * 10 + byte(0x6615f3) * 100 + byte(0x6615f2) * 1000 +
                byte(0x6615f5) * 10000 + byte(0x6615f4) * 100000 + byte(0x6615f7) * 1000000 + 
                byte(0x6615f6) * 10000000 + byte(0x6615f9) * 100000000
            )
        },
        "ScoreParts": {
            "Ones": byte(0x6615f1),
            "Tens": byte(0x6615f0),
            "Hundreds": byte(0x6615f3),
            "Thousands": byte(0x6615f2),
            "TenThousands": byte(0x6615f5),
            "HundredThousands": byte(0x6615f4),
            "Millions": byte(0x6615f7),
            "TenMillions": byte(0x6615f6),
            "HundredMillions": byte(0x6615f9),
            "Billions": byte(0x6615f8),
            "TenBillions": byte(0x6615fb),
            "HundredBillions": byte(0x6615fa)
        },
        "Continues": word(0x6615fe),
        "PlusValue": (word(0x6616e0) * 0x10000 + word(0x6616e2)),
        "ItemCounter": word(0x6616e6),
        "PowerUp": byte(0x661706),
        "Results": {
            "State": byte(0x8a1c54),
            "Score": {
                "Billions": (
                    byte(0x8a1c46) + byte(0x8a1c49) * 10 + byte(0x8a1c48) * 100 +
                    byte(0x8a1c4b) * 1000 + byte(0x8a1c4a) * 10000 + byte(0x8a1c4d) * 100000 +
                    byte(0x8a1c4c) * 1000000 + byte(0x8a1c4f) * 10000000 + byte(0x8a1c4e) * 100000000
                ),
                "Hundreds": (byte(0x8a1c45) + byte(0x8a1c44) * 10 + byte(0x8a1c47))
            },
            "Character": byte(0x8a1c52)
        }
    }
}

LifeUp = {
    "Bonus": byte(0x86d50c),
    "Collected": byte(0x86d50d),
    "Size": byte(0x86d50f)
}

MagicItem = {
    "Bonus": byte(0x86de8c),
    "Collected": byte(0x86de8d)
}

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

DefaultGameSettings = {
    "Extends": 0,
    "Difficulty": 1,
    "EnemyDamage": 3,
    "LifeCapacity": 0,
    "BulletDamage": 4
}

Characters = {
    "Windia": 0,
    "Casper": 1,
    "Follett": 2,
    "Rosa": 3,
    "Sakura": 4
}

Stages = {
    "A1": 0, //Port Town
    "A2": 1, //Boneyard
    "B1": 2, //Forest
    "B2": 3, //Swamp
    "C1": 4, //Lakeside
    "C2": 5, //Volcano
    "4A": 6, //Canyon
    "51": 7, //Castle Part 1
    "52": 8, //Castle Part 2
    "4B": 9  //Ice Palace
}

Levels = {
    "LV1": 0,
    "LV2": 1,
    "LV3": 2,
    "LV999": 3
}

// ======================================================================= //
// Lookups
// ======================================================================= //

CharacterLookup = {
    0: "Windia",
    1: "Casper",
    2: "Follett",
    3: "Rosa",
    4: "Sakura"
}

LivesLookup = {
    0: "0",
    1: "½",
    2: "1",
    3: "1½",
    4: "2",
    5: "2½",
    6: "3",
    7: "3½",
    8: "4",
    9: "4½",
    10: "5"
}

StageLookup = {
    0: "Port Town", //Port Town
    1: "Boneyard", //Boneyard
    2: "Forest", //Forest
    3: "Swamp", //Swamp
    4: "Lakeside", //Lakeside
    5: "Volcano", //Volcano
    6: "Canyon", //Canyon
    7: "Castle", //Castle
    9: "Ice Palace"  //Ice Palace
}

StageLevelLookup = {
    0: "LV1",
    1: "LV2",
    2: "LV3",
    3: "LV999"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => GameState == 1 && TutorialState == 0
function IsInTutorial() => GameState == 0 && TutorialState == 1
function IsOnTitle() => GameState == 0 && TutorialState == 0
function IsInStage() => StageState == 1
function IsPlayer1() => Player["P1"]["Active"] == 1 && Player["P2"]["Active"] == 0
function IsPlayer2() => Player["P1"]["Active"] == 0 && Player["P2"]["Active"] == 1
function IsMultiplayer() => Player["P1"]["Active"] == 1 && Player["P2"]["Active"] == 1

function IsUsingValidSettings() => all_of(GameSettings, setting => GameSettings[setting] == DefaultGameSettings[setting])

function IsValidSession() => IsInGame() && NumberOfPlayers == 1 && IsUsingValidSettings()

function IsBossActive() => BossIndex > 0
function IsTyrannosatanActive() => BossIndex == 2
function IsBloodyJitterbugActive() => BossIndex == 3

function GetExtends(player){
    return Player[player]["Life"] - 3
}

function GetLives(player){
    return Player[player]["Health"] / 0x40
}

function IsNormalMode() => DeathModeActive == 0 && DeathMode999Active == 0 && Stage4ASelected == 0 && Stage4BSelected == 0 && SelectedStage < 6
function IsNormalFINAL() => DeathModeActive == 0 && DeathMode999Active == 0 && Stage4ASelected == 0 && Stage4BSelected == 0 && SelectedStage == 7
function IsDeathMode() => DeathModeActive + Stage4ASelected + Stage4BSelected > 0 && DeathMode999Active == 0 && SelectedStage != 7
function IsDeathModeFINAL() => DeathModeActive == 1 && DeathMode999Active == 0 && Stage4ASelected == 0 && Stage4BSelected == 0 && SelectedStage == 7
function IsDeathMode999() => DeathMode999Active == 1
function IsDeathModeEX() => DeathModeActive + Stage4ASelected + Stage4BSelected >= 2 && DeathMode999Active == 0 && SelectedStage == 7

// ======================================================================= //
// Rich Presence Definitions
// ======================================================================= //

rich_presence_conditional_display(IsInGame() && IsPlayer1() && !IsInStage(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | Bombs: {13} | Lives: {14} | Extends: {15} | Continues: {16}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer1() && IsInStage() && IsNormalMode(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | {13} [{14}] | Bombs: {15} | Lives: {16} | Extends: {17} | Continues: {18}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_lookup("SelectedStageLevel", SelectedStageLevel, StageLevelLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer1() && IsInStage() && IsNormalFINAL(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | {13} [LV3] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer1() && IsInStage() && IsDeathMode(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | {13} [Death Mode] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer1() && IsInStage() && IsDeathModeFINAL(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | {13} [Death Mode] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer1() && IsInStage() && IsDeathModeEX(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | {13} [Death Mode EX] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer1() && IsInStage() && IsDeathMode999(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P1] | {13} [Death Mode 999] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P1Score1", Player["P1"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P1Score2", Player["P1"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P1Score3", Player["P1"]["ScoreParts"]["Billions"]),
    rich_presence_value("P1Score4", Player["P1"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P1Score5", Player["P1"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P1Score6", Player["P1"]["ScoreParts"]["Millions"]),
    rich_presence_value("P1Score7", Player["P1"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P1Score8", Player["P1"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P1Score9", Player["P1"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P1Score10", Player["P1"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P1Score11", Player["P1"]["ScoreParts"]["Tens"]),
    rich_presence_value("P1Score12", Player["P1"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P1Character",  Player["P1"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P1Lives", GetLives("P1"), LivesLookup),
    rich_presence_value("P1Extends", GetExtends("P1")),
    rich_presence_value("P1Continues", Player["P1"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer2() && !IsInStage(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | Bombs: {13} | Lives: {14} | Extends: {15} | Continues: {16}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer2() && IsInStage() && IsNormalMode(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | {13} [{14}] | Bombs: {15} | Lives: {16} | Extends: {17} | Continues: {18}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_lookup("SelectedStageLevel", SelectedStageLevel, StageLevelLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer2() && IsInStage() && IsNormalFINAL(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | {13} [LV3] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer2() && IsInStage() && IsDeathMode(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | {13} [Death Mode] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer2() && IsInStage() && IsDeathModeFINAL(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | {13} [Death Mode] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)


rich_presence_conditional_display(IsInGame() && IsPlayer2() && IsInStage() && IsDeathModeEX(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | {13} [Death Mode EX] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)

rich_presence_conditional_display(IsInGame() && IsPlayer2() && IsInStage() && IsDeathMode999(), "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11} | {12} [P2] | {13} [Death Mode 999] | Bombs: {14} | Lives: {15} | Extends: {16} | Continues: {17}",
    rich_presence_value("P2Score1", Player["P2"]["ScoreParts"]["HundredBillions"]),
    rich_presence_value("P2Score2", Player["P2"]["ScoreParts"]["TenBillions"]),
    rich_presence_value("P2Score3", Player["P2"]["ScoreParts"]["Billions"]),
    rich_presence_value("P2Score4", Player["P2"]["ScoreParts"]["HundredMillions"]),
    rich_presence_value("P2Score5", Player["P2"]["ScoreParts"]["TenMillions"]),
    rich_presence_value("P2Score6", Player["P2"]["ScoreParts"]["Millions"]),
    rich_presence_value("P2Score7", Player["P2"]["ScoreParts"]["HundredThousands"]),
    rich_presence_value("P2Score8", Player["P2"]["ScoreParts"]["TenThousands"]),
    rich_presence_value("P2Score9", Player["P2"]["ScoreParts"]["Thousands"]),
    rich_presence_value("P2Score10", Player["P2"]["ScoreParts"]["Hundreds"]),
    rich_presence_value("P2Score11", Player["P2"]["ScoreParts"]["Tens"]),
    rich_presence_value("P2Score12", Player["P2"]["ScoreParts"]["Ones"]),
    rich_presence_lookup("P2Character",  Player["P2"]["Character"], CharacterLookup),
    rich_presence_lookup("SelectedStage", SelectedStage, StageLookup),
    rich_presence_value("Bombs", BombCapacity),
    rich_presence_lookup("P2Lives", GetLives("P2"), LivesLookup),
    rich_presence_value("P2Extends", GetExtends("P2")),
    rich_presence_value("P2Continues", Player["P2"]["Continues"])
)

rich_presence_conditional_display(IsOnTitle(), "Preparing to face death with a smile")

rich_presence_conditional_display(IsInTutorial(), "Learning the ins and outs of demon slaying")

rich_presence_display("Playing Deathsmiles: Mega Black Label")