// Deathsmiles: Mega Black Label
// #ID = 28669
// RetroAchievements - Achievements Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

ActivePlayer = byte(0x660b56)
TutorialState = byte(0x660b5a)
CharacterSelectState = byte(0x660aaa)
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
BombCapacity = byte(0x660b66)

CurrentStage = byte(0x6609ce)
EndingState = byte(0x660b92)
EndingChoice = byte(0x8a932a)
EndingChoiceState = byte(0x8a934e)

DeathMode999Active = byte(0x660bae)
BossIndex = byte(0x660a82)
BossDefeatedFlag = byte(0x660a96)
SelectedStageLevel = byte(0x8a0f6a)

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
            "Millions": (byte(0x661497) + byte(0x661496) * 10 + byte(0x661499) * 100)
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
            "Millions": (byte(0x6615f7) + byte(0x6615f6) * 10 + byte(0x6615f9) * 100)
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
    "FINAL": 7, //Castle Part
    "4B": 9  //Ice Palace
}

Levels = {
    "LV1": 0,
    "LV2": 1,
    "LV3": 2,
    "LV999": 3
}

ActivePlayers = {
    "None": 0,
    "Player1": 1,
    "Player2": 2,
    "Multiplayer": 3
}

EndingChoices = {
    "Return": 0,
    "Stay": 1
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

BossStages = {
    "Deathscythe": 0,
    "Jordan": 1,
    "Whroon": 2,
    "Sakura": 3,
    "Mary": 4,
    "Bavaria": 5,
    "Devaria": 6,
    "Jitterbug": 7,
    "Tyrannosatan": 7,
    "BloodyJitterbug": 7,
    "Ozier": 9
}

BossIndices = {
    "Deathscythe": 1,
    "Jordan": 1,
    "Whroon": 1,
    "Sakura": 1,
    "Mary": 1,
    "Bavaria": 1,
    "Devaria": 1,
    "Jitterbug": 1,
    "Tyrannosatan": 2,
    "BloodyJitterbug": 3,
    "Ozier": 1
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsOnTitle() => ActivePlayer == 0
function IsPlayer1() => ActivePlayer == 1
function IsPlayer2() => ActivePlayer == 2
function IsOnCharacterSelect() => CharacterSelectState == 1
function IsMultiplayer() => ActivePlayer == 3
function IsInEnding() => EndingState == 1
function IsInTutorial() => TutorialState == 1
function IsInStage() => StageState == 1
function IsInResults(player) => Player[player]["Results"]["State"] == 1

function IsUsingValidSettings() => all_of(DefaultGameSettings, setting => GameSettings[setting] == DefaultGameSettings[setting])

function IsValidSession() => NumberOfPlayers == 1 && IsUsingValidSettings()

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
// Achievement Functions
// ======================================================================= //

function StageCleared(stage, challenge){
    trigger = IsValidSession() && CurrentStage == Stages[stage]
    cleared = prev(StageClearedFlag) == 0 && StageClearedFlag == 1 
    
    if(challenge)
        cleared = trigger_when(cleared)
        
    return trigger && cleared
}

function GameCleared(character){
    return IsValidSession() &&
        ((ActivePlayer == ActivePlayers["Player1"] && Player["P1"]["Character"] == Characters[character]) ||
        (ActivePlayer == ActivePlayers["Player2"] && Player["P2"]["Character"] == Characters[character])) &&
        prev(EndingState) == 0 &&
        EndingState == 1
}

function SelectedEnding(character, ending){
    return IsValidSession() &&
        ((ActivePlayer == ActivePlayers["Player1"] && Player["P1"]["Character"] == Characters[character]) ||
        (ActivePlayer == ActivePlayers["Player2"] && Player["P2"]["Character"] == Characters[character])) &&
        EndingState == 1 &&
        EndingChoice == EndingChoices[ending] &&
        prev(EndingChoiceState) == 1 &&
        EndingChoiceState == 0
}

function ClearStageNoDamage(stage){
    return StageCleared(stage, true) &&
        (disable_when(ActivePlayer == ActivePlayers["Player1"] && prev(Player["P1"]["Health"]) > Player["P1"]["Health"], !IsInStage()) ||
        disable_when(ActivePlayer == ActivePlayers["Player2"] && prev(Player["P2"]["Health"]) > Player["P2"]["Health"], !IsInStage()))
}

function ClearFINALNoDamage(){
    return IsValidSession() &&
        trigger_when(prev(EndingState) == 0 &&
        EndingState == 1) && 
        (disable_when(ActivePlayer == ActivePlayers["Player1"] && prev(Player["P1"]["Health"]) > Player["P1"]["Health"], !IsInStage()) ||
        disable_when(ActivePlayer == ActivePlayers["Player2"] && prev(Player["P2"]["Health"]) > Player["P2"]["Health"], !IsInStage()))
}

function GotScoreMillions(score){
    return IsValidSession() &&
        ((ActivePlayer == ActivePlayers["Player1"] && prev(Player["P1"]["Score"]["Millions"]) < score && Player["P1"]["Score"]["Millions"] >= score) ||
        (ActivePlayer == ActivePlayers["Player2"] && prev(Player["P2"]["Score"]["Millions"]) < score && Player["P2"]["Score"]["Millions"] >= score))
}

function GotScoreBillions(score){
    return IsValidSession() &&
        ((ActivePlayer == ActivePlayers["Player1"] && prev(Player["P1"]["Score"]["Billions"]) < score && Player["P1"]["Score"]["Billions"] >= score) ||
        (ActivePlayer == ActivePlayers["Player2"] && prev(Player["P2"]["Score"]["Billions"]) < score && Player["P2"]["Score"]["Billions"] >= score))
}

function BossDefeatedNoContinue(boss, standard){
    IsLevel999 = SelectedStageLevel == Levels["LV999"]
    
    if(!standard)
        level999 = DeathMode999Active == 1

    return IsValidSession() &&
        IsLevel999 &&
        BossIndex == BossIndices[boss] &&
        CurrentStage == BossStages[boss] &&
        prev(BossDefeatedFlag) == 0 &&
        BossDefeatedFlag == 1 &&
        (disable_when(BossIndex == BossIndices[boss] && ActivePlayer == ActivePlayers["Player1"] && prev(Player["P1"]["Continues"]) < Player["P1"]["Continues"], !IsInStage()) ||
        disable_when(BossIndex == BossIndices[boss] && ActivePlayer == ActivePlayers["Player2"] && prev(Player["P2"]["Continues"]) < Player["P2"]["Continues"], !IsInStage()))
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //

achievement(title = "[Draft] Clear Stage A-1", description = "Clear Stage A-1", points = 3, type = "progression", id = 433348,
    trigger = StageCleared("A1", false)
)

achievement(title = "[Draft] Clear Stage A-2", description = "Clear Stage A-2", points = 3, type = "progression", id = 433349,
    trigger = StageCleared("A2", false)
)

achievement(title = "[Draft] Clear Stage B-1", description = "Clear Stage B-1", points = 3, type = "progression", id = 433350,
    trigger = StageCleared("B1", false)
)

achievement(title = "[Draft] Clear Stage B-2", description = "Clear Stage B-2", points = 3, type = "progression", id = 433351,
    trigger = StageCleared("B2", false)
)

achievement(title = "[Draft] Clear Stage C-1", description = "Clear Stage C-1", points = 3, type = "progression", id = 433352,
    trigger = StageCleared("C1", false)
)

achievement(title = "[Draft] Clear Stage C-2", description = "Clear Stage C-2", points = 4, type = "progression", id = 433353,
    trigger = StageCleared("C2", false)
)

achievement(title = "[Draft] Clear the game as Sakura", description = "[Draft] Clear the game as Sakura", points = 5, type = "win_condition", id = 433354,
    trigger = GameCleared("Sakura")
)

achievement(title = "[Draft] Clear the game as Windia", description = "[Draft] Clear the game as Windia", points = 5, type = "win_condition", id = 433355,
    trigger = GameCleared("Windia")
)

achievement(title = "[Draft] Clear the game as Casper", description = "[Draft] Clear the game as Casper", points = 5, type = "win_condition", id = 433356,
    trigger = GameCleared("Casper")
)

achievement(title = "[Draft] Clear the game as Follett", description = "[Draft] Clear the game as Follett", points = 5, type = "win_condition", id = 433357,
    trigger = GameCleared("Follett")
)

achievement(title = "[Draft] Clear the game as Rosa", description = "[Draft] Clear the game as Rosa", points = 5, type = "win_condition", id = 433358,
    trigger = GameCleared("Rosa")
)

// ======================================================================= //
// Achievement Definitions - Play Challenges
// ======================================================================= //

achievement(title = "[Draft] Clear Stage 4-A", description = "Clear Stage 4-A", points = 5, id = 433359,
    trigger = StageCleared("4A", false)
)

achievement(title = "[Draft] Clear Stage 4-B", description = "Clear Stage 4-B", points = 5, id = 433360,
    trigger = StageCleared("4B", false)
)

achievement(title = "[Draft] Real World - Sakura", description = "Decide to return to the real world as Sakura", points = 1, id = 433361,
    trigger = SelectedEnding("Sakura", "Return")
)

achievement(title = "[Draft] Gilverado - Sakura", description = "Decide to stay in Gilverado as Sakura", points = 1, id = 433362,
    trigger = SelectedEnding("Sakura", "Stay")
)

achievement(title = "[Draft] Real World - Windia", description = "Decide to return to the real world as Windia", points = 1, id = 433363,
    trigger = SelectedEnding("Windia", "Return")
)

achievement(title = "[Draft] Gilverado - Windia", description = "Decide to stay in Gilverado as Windia", points = 1, id = 433364,
    trigger = SelectedEnding("Windia", "Stay")
)

achievement(title = "[Draft] Real World - Casper", description = "Decide to return to the real world as Casper", points = 1, id = 433365,
    trigger = SelectedEnding("Casper", "Return")
)

achievement(title = "[Draft] Gilverado - Casper", description = "Decide to stay in Gilverado as Casper", points = 1, id = 433366,
    trigger = SelectedEnding("Casper", "Stay")
)

achievement(title = "[Draft] Real World - Follett", description = "Decide to return to the real world as Follett", points = 1, id = 433367,
    trigger = SelectedEnding("Follett", "Return")
)

achievement(title = "[Draft] Gilverado - Follett", description = "Decide to stay in Gilverado as Follett", points = 1, id = 433368,
    trigger = SelectedEnding("Follett", "Stay")
)

achievement(title = "[Draft] Real World - Rosa", description = "Decide to return to the real world as Rosa", points = 1, id = 433369,
    trigger = SelectedEnding("Rosa", "Return")
)

achievement(title = "[Draft] Gilverado - Rosa", description = "Decide to stay in Gilverado as Rosa", points = 1, id = 433370,
    trigger = SelectedEnding("Rosa", "Stay")
)

achievement(title = "[Draft] Clear Stage A-1 - No Damage", description = "Clear Stage A-1 without taking damage", points = 10, id = 433371,
    trigger = ClearStageNoDamage("A1")
)

achievement(title = "[Draft] Clear Stage A-2 - No Damage", description = "Clear Stage A-2 without taking damage", points = 10, id = 433372,
    trigger = ClearStageNoDamage("A2")
)

achievement(title = "[Draft] Clear Stage B-1 - No Damage", description = "Clear Stage B-1 without taking damage", points = 10, id = 433373,
    trigger = ClearStageNoDamage("B1")
)

achievement(title = "[Draft] Clear Stage B-2 - No Damage", description = "Clear Stage B-2 without taking damage", points = 10, id = 433374,
    trigger = ClearStageNoDamage("B2")
)

achievement(title = "[Draft] Clear Stage C-1 - No Damage", description = "Clear Stage C-1 without taking damage", points = 10, id = 433375,
    trigger = ClearStageNoDamage("C1")
)

achievement(title = "[Draft] Clear Stage C-2 - No Damage", description = "Clear Stage C-2 without taking damage", points = 10, id = 433376,
    trigger = ClearStageNoDamage("C2")
)

achievement(title = "[Draft] Clear Stage 4-A - No Damage", description = "Clear Stage 4-A without taking damage", points = 50, id = 433377,
    trigger = ClearStageNoDamage("4A")
)

achievement(title = "[Draft] Clear Stage 4-B - No Damage", description = "Clear Stage 4-B without taking damage", points = 50, id = 433378,
    trigger = ClearStageNoDamage("4B")
)

achievement(title = "[Draft] Clear Stage FINAL - No Damage", description = "Clear Stage FINAL without taking damage", points = 50, id = 433379,
    trigger = ClearFINALNoDamage()
)

// ======================================================================= //
// Achievement Definitions - Point Challenges
// ======================================================================= //

achievement(title = "[Draft] 100 Million", description = "Score 100,000,000 points or more", points = 5, id = 433380,
    trigger = GotScoreMillions(100)
)

achievement(title = "[Draft] 250 Million", description = "Score 250,000,000 points or more", points = 10, id = 433381,
    trigger = GotScoreMillions(250)
)

achievement(title = "[Draft] 500 Million", description = "Score 500,000,000 points or more", points = 25, id = 433382,
    trigger = GotScoreMillions(500)
)

achievement(title = "[Draft] 1 Billion", description = "Score 1,000,000,000 points or more", points = 50, id = 433383,
    trigger = GotScoreMillions(1)
)

achievement(title = "[Draft] 2 Billion", description = "Score 2,000,000,000 points or more", points = 100, id = 433384,
    trigger = GotScoreMillions(2)
)

// ======================================================================= //
// Achievement Definitions - Other Challenges
// ======================================================================= //

achievement(title = "[Draft] Fever Mode", description = "Activate Fever Mode with a +Value of 100,000", points = 10, id = 433385,
    trigger = always_false()
)

achievement(title = "[Draft] Power Up x 3", description = "Activate Power Up mode 3 or more times in a single stage", points = 10, id = 433386,
    trigger = always_false()
)

achievement(title = "[Draft] Death Mode 999", description = "Activate Death Mode 999 for the first time", points = 5, id = 433387,
    trigger = always_false()
)

achievement(title = "[Draft] Extend 1", description = "Extend your life gauge to 4", points = 5, id = 433388,
    trigger = always_false()
)

achievement(title = "[Draft] Extend 2", description = "Extend your life gauge to 5", points = 10, id = 433389,
    trigger = always_false()
)

achievement(title = "[Draft] Sakura x Sakura", description = "Defeat Sakura while playing as Sakura on Stage B-2 without firing a shot and without using a continue", points = 10, id = 433390,
    trigger = always_false()
)

achievement(title = "[Draft] Small Life Bonus", description = "Score bonus points by collecting a Small Life-Up while at max health", points = 5, id = 433391,
    trigger = always_false()
)

achievement(title = "[Draft] Medium Life Bonus", description = "Score bonus points by collecting a Medium Life-Up while at max health", points = 5, id = 433392,
    trigger = always_false()
)

achievement(title = "[Draft] Large Life Bonus", description = "Score bonus points by collecting a Large Life-Up while at max health", points = 5, id = 433393,
    trigger = always_false()
)

achievement(title = "[Draft] Magix x 3", description = "Collect a 3 Magic Items in one playthrough without using a continue", points = 10, id = 433394,
    trigger = always_false()
)

achievement(title = "[Draft] 500 Counter Boss", description = "Increase your item counter by 500 or more during a boss fight", points = 10, id = 433395,
    trigger = always_false()
)

achievement(title = "[Draft] 2500 Hearts and Skulls", description = "Increase your item counter by 500 or more during a boss fight", points = 5, id = 433396,
    trigger = always_false()
)

achievement(title = "[Draft] 1000 Crowns", description = "Collect 1000 Crowns in any stage", points = 10, id = 433397,
    trigger = always_false()
)

// ======================================================================= //
// Achievement Definitions - Boss Challenges
// ======================================================================= //

achievement(title = "[Draft] No Continue Deathscythe", description = "While playing Stage A-1 on Level 999, defeat Deathscythe without using a continue and without using a bomb", points = 10, id = 433398,
    trigger = BossDefeatedNoContinue("Deathscythe", true)
)

achievement(title = "[Draft] No Continue Jordan", description = "While playing Stage A-2 on Level 999, defeat Jordan without using a continue and without using a bomb", points = 25, id = 433399,
    trigger = BossDefeatedNoContinue("Jordan", true)
)

achievement(title = "[Draft] No Continue Whroon", description = "While playing Stage B-1 on Level 999, defeat Whroon without using a continue and without using a bomb", points = 25, id = 433400,
    trigger = BossDefeatedNoContinue("Whroon", true)
)

achievement(title = "[Draft] No Continue Sakura", description = "While playing Stage B-2 on Level 999, defeat Sakura without using a continue and without using a bomb", points = 25, id = 433401,
    trigger = BossDefeatedNoContinue("Sakura", true)
)

achievement(title = "[Draft] No Continue Mary", description = "While playing Stage C-1 on Level 999, defeat Mary without using a continue and without using a bomb", points = 25, id = 433402,
    trigger = BossDefeatedNoContinue("Mary", true)
)

achievement(title = "[Draft] No Continue Bavaria", description = "While playing Stage C-2 on Level 999, defeat Bavaria without using a continue and without using a bomb", points = 25, id = 433403,
    trigger = BossDefeatedNoContinue("Bavaria", true)
)

achievement(title = "[Draft] No Continue Devaria & Givaria", description = "While playing Stage 4-A on Level 999, defeat Devaria & Givaria without using a continue and without using a bomb", points = 50, id = 433404,
    trigger = BossDefeatedNoContinue("Devaria", true)
)

achievement(title = "[Draft] No Continue Ozier", description = "While playing Stage 4-B on Level 999, defeat Ozier without using a continue and without using a bomb", points = 50, id = 433405,
    trigger = BossDefeatedNoContinue("Ozier", true)
)

achievement(title = "[Draft] No Continue Jitterbug", description = "While playing Stage FINAL on Level 999, defeat Jitterbug without using a continue and without using a bomb", points = 50, id = 433406,
    trigger = BossDefeatedNoContinue("Jitterbug", true)
)

achievement(title = "[Draft] No Continue Tyrannosatan", description = "While playing Stage FINAL on Level 999, defeat Tyrannosatan without using a continue and without using a bomb", points = 50, id = 433407,
    trigger = BossDefeatedNoContinue("Tyrannosatan", true)
)

achievement(title = "[Draft] No Continue Bloody Jitterbug", description = "While playing Stage FINAL on Level 999, defeat Bloody Jitterbug and clear the game", points = 100, id = 433408,
    trigger = BossDefeatedNoContinue("BloodyJitterbug", true)
)

