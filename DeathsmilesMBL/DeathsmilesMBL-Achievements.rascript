// Deathsmiles: Mega Black Label
// #ID = 28669
// RetroAchievements - Achievements Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

ActivePlayer = byte(0x660b56)
NumberOfPlayers = byte(0x89baf6)
StageState = byte(0x8a099d)
StageClearedFlag = byte(0x660a9e)
CurrentStage = byte(0x6609ce)
EndingState = byte(0x660b92)
EndingChoice = byte(0x8a932a)
EndingChoiceState = byte(0x8a934e)
DeathMode999Active = byte(0x660bae)
BossIndex = byte(0x660a82)
BossDefeatedFlag = byte(0x660a96)
SelectedStageLevel = byte(0x8a0f6a)
BombActivatedState = byte(0x660b5e)

LifeUp = {
    "Bonus": byte(0x86d50c),
    "Collected": byte(0x86d50d),
    "Size": byte(0x86d50f)
}

MagicItem = {
    "Bonus": byte(0x86de8c),
    "Collected": byte(0x86de8d)
}

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
        "Inputs": {
          "ShootLeft": bit4(0x66148a),
          "ShootRight": bit5(0x66148a),
          "Bomb": bit6(0x66148a)
        },
        "Items": {
            "Hearts": word(0x66157a),
            "Crowns": word(0x66157e)
        },
        //Use for achievements
        "Score": {
            "Billions": (byte(0x661498) + byte(0x66149b) * 10 + byte(0x66149a) * 100),
            "Millions": (byte(0x661497) + byte(0x661496) * 10 + byte(0x661499) * 100)
        },
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
            //Use for leaderboards
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
        "Inputs": {
          "ShootLeft": bit4(0x6615ea),
          "ShootRight": bit5(0x6615ea),
          "Bomb": bit6(0x6615ea)
        },
        "Items": {
            "Hearts": word(0x6616da),
            "Crowns": word(0x6616de)
        },
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

LifeUpSizes = {
    "Small": 0,
    "Medium": 1,
    "Large": 2
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsPlayer1() => ActivePlayer == 1
function IsPlayer2() => ActivePlayer == 2
function IsCharacter(player, character) => Player[player]["Character"] == Characters[character]
function IsInStage() => StageState == 1
function IsInEnding() => EndingState == 1
function IsUsingValidSettings() => all_of(DefaultGameSettings, setting => GameSettings[setting] == DefaultGameSettings[setting])
function IsValidSession() => NumberOfPlayers == 1 && IsUsingValidSettings()
function IsBossActive() => BossIndex > 0
function IsFightingBoss(boss) => BossIndex == BossIndices[boss] && CurrentStage == BossStages[boss]

function CurrentStageIs(stage) => CurrentStage == Stages[stage]
function EndingChoiceIs(ending) => EndingChoice == EndingChoices[ending]

function GetExtends(player) => Player[player]["Life"] - 3
function GetPlayerHealth(player) => Player[player]["Health"]
function GetPlayerScore(player, type) => Player[player]["Score"][type]
function GetPlayerPlusValue(player) => Player[player]["PlusValue"]
function GetPlayerPowerUpStatus(player) => Player[player]["PowerUp"]
function GetPlayerItemCounter(player) => Player[player]["ItemCounter"]
function GetPlayerItemCount(player, type) => Player[player]["Items"][type]

function PlayerTookDamage(player) => prev(GetPlayerHealth(player)) > GetPlayerHealth(player)
function PlayerUsedContinue(player) => prev(Player[player]["Continues"]) < Player[player]["Continues"]
function PlayerUsedBomb() => prev(BombActivatedState) == 0 && BombActivatedState == 1
function PlayerDefeatedBoss() => prev(BossDefeatedFlag) == 0 && BossDefeatedFlag == 1
function PlayerClearedStage() => prev(StageClearedFlag) == 0 && StageClearedFlag == 1
function PlayerClearedGame() => prev(EndingState) == 0 && EndingState == 1
function PlayerChoseEnding() => prev(EndingChoiceState) == 1 && EndingChoiceState == 0
function PlayerPoweredUp(player) => prev(GetPlayerPowerUpStatus(player)) == 0 && GetPlayerPowerUpStatus(player) == 1
function PlayerActivatedDeathMode999() => prev(DeathMode999Active) == 0 && DeathMode999Active == 1
function PlayerUsedInput(player, type) => prev(Player[player]["Inputs"][type]) == 0 && Player[player]["Inputs"][type] == 1

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

function StageCleared(stage, challenge){
    trigger = IsValidSession() && CurrentStageIs(stage)
    cleared = PlayerClearedStage()
    
    if(challenge)
        cleared = trigger_when(cleared)
        
    return trigger && cleared
}

function GameCleared(character){
    return IsValidSession() &&
        (
            (IsPlayer1() && IsCharacter("P1", character)) ||
            (IsPlayer2() && IsCharacter("P2", character))
        ) &&
        PlayerClearedGame()
}

function SelectedEnding(character, ending){
    return IsValidSession() &&
        (
            (IsPlayer1() && IsCharacter("P1", character)) ||
            (IsPlayer2() && IsCharacter("P2", character))
        ) &&
        IsInEnding() &&
        EndingChoiceIs(ending) &&
        PlayerChoseEnding()
}

function ClearStageNoDamage(stage){
    return StageCleared(stage, true) &&
        (
            disable_when(IsPlayer1() && CurrentStageIs(stage) && PlayerTookDamage("P1"), !IsInStage()) ||
            disable_when(IsPlayer2() && CurrentStageIs(stage) && PlayerTookDamage("P2"), !IsInStage())
        )
}

function ClearFINALNoDamage(){
    return IsValidSession() &&
        trigger_when(PlayerClearedGame()) && 
        (
            disable_when(IsPlayer1() && CurrentStageIs("FINAL") && PlayerTookDamage("P1"), !IsInStage()) ||
            disable_when(IsPlayer2() && CurrentStageIs("FINAL") && PlayerTookDamage("P2"), !IsInStage())
        )
}

function GotScoreMillions(score){
    return IsValidSession() &&
        (
            (IsPlayer1() && prev(GetPlayerScore("P1", "Millions")) < score && GetPlayerScore("P1", "Millions") >= score) ||
            (IsPlayer2() && prev(GetPlayerScore("P2", "Millions")) < score && GetPlayerScore("P2", "Millions") >= score)
        )
}

function GotScoreBillions(score){
    return IsValidSession() &&
        (
            (IsPlayer1() && prev(GetPlayerScore("P1", "Billions")) < score && GetPlayerScore("P1", "Billions") >= score) ||
            (IsPlayer2() && prev(GetPlayerScore("P1", "Billions")) < score && GetPlayerScore("P1", "Billions") >= score)
        )
}

function BossDefeatedNoContinue(boss, standard){
    IsLevel999 = SelectedStageLevel == Levels["LV999"]
    
    if(!standard)
        level999 = DeathMode999Active == 1

    return IsValidSession() &&
        IsLevel999 &&
        IsFightingBoss(boss) &&
        trigger_when(PlayerDefeatedBoss()) &&
        disable_when(IsFightingBoss(boss) && IsPlayer1() && PlayerUsedContinue("P1"), !IsInStage()) &&
        disable_when(IsFightingBoss(boss) && IsPlayer2() && PlayerUsedContinue("P2"), !IsInStage()) &&
        disable_when(IsFightingBoss(boss) && PlayerUsedBomb(), !IsInStage())
}

function ActivatedFeverMode(){
    return IsValidSession() &&
        (
            (IsPlayer1() && prev(GetPlayerPlusValue("P1")) < 100000 && GetPlayerPlusValue("P1") >= 100000) ||
            (IsPlayer2() && prev(GetPlayerPlusValue("P2")) < 100000 && GetPlayerPlusValue("P2") >= 100000)
        )
}

function ActivatedPowerUpMode(times){
    return IsValidSession() &&
        (
            tally(times, IsPlayer1() && PlayerPoweredUp("P1")) ||
            tally(times, IsPlayer2() && PlayerPoweredUp("P2"))
        ) &&
        never(!IsInStage())
}

function ActivatedDeathMode999(){
    return IsValidSession() &&
        PlayerActivatedDeathMode999()
}

function GotExtend(number){
    return IsValidSession() &&
        (
            (IsPlayer1() && prev(GetExtends("P1")) < number && GetExtends("P1") >= number) ||
            (IsPlayer2() && prev(GetExtends("P2")) < number && GetExtends("P2") >= number)
        )
}

function SakuraBossChallenge(){
    return IsValidSession() &&
        IsFightingBoss("Sakura") &&
        trigger_when(PlayerDefeatedBoss()) &&
        (
            (IsPlayer1() && IsCharacter("P1", "Sakura")) ||
            (IsPlayer2() && IsCharacter("P2", "Sakura"))
        ) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer1() && PlayerUsedInput("P1", "ShootLeft"), !IsInStage()) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer1() && PlayerUsedInput("P1", "ShootRight"), !IsInStage()) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer2() && PlayerUsedInput("P2", "ShootLeft"), !IsInStage()) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer2() && PlayerUsedInput("P2", "ShootRight"), !IsInStage()) &&
        disable_when(IsFightingBoss("Sakura") && PlayerUsedBomb(), !IsInStage())
}

function GotLifeUpBonus(size){
    return IsValidSession() &&
        LifeUp["Size"] == LifeUpSizes[size] &&
        LifeUp["Collected"] == 0xff &&
        prev(LifeUp["Bonus"]) == 1 &&
        LifeUp["Bonus"] == 2
}

function Got3Bombs(){
    return IsValidSession() &&
        measured(repeated(3, prev(MagicItem["Collected"]) != 0xff && MagicItem["Collected"] == 0xff && never(NumberOfPlayers == 0))) &&
        disable_when(IsPlayer1() && PlayerUsedContinue("P1"), NumberOfPlayers == 0) &&
        disable_when(IsPlayer2() && PlayerUsedContinue("P2"), NumberOfPlayers == 0)
}

function Got500CounterDuringBoss(){
    return IsValidSession() &&
        (
            measured(tally_of(range(0, 20), 500, count => IsPlayer1() && GetPlayerItemCounter("P1") - prev(GetPlayerItemCounter("P1")) > count && never(!IsBossActive()))) ||
            measured(tally_of(range(0, 20), 500, count => IsPlayer2() && GetPlayerItemCounter("P2") - prev(GetPlayerItemCounter("P2")) > count && never(!IsBossActive())))
        ) &&
        disable_when(IsBossActive() && IsPlayer1() && PlayerUsedContinue("P1"), !IsBossActive()) &&
        disable_when(IsBossActive() && IsPlayer2() && PlayerUsedContinue("P2"), !IsBossActive())
}

function GotItemChallenge(type, number){
    return IsValidSession() &&
        (
            (prev(GetPlayerItemCount("P1", type)) < number && measured(GetPlayerItemCount("P1", type) >= number)) ||
            (prev(GetPlayerItemCount("P2", type)) < number && measured(GetPlayerItemCount("P2", type) >= number))
        )
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

achievement(title = "[Draft] Fever Mode", description = "Activate Fever Mode by reaching a +Value of 100,000", points = 10, id = 433385,
    trigger = ActivatedFeverMode()
)

achievement(title = "[Draft] Power Up x 3", description = "Activate Power Up mode 3 or more times in a single stage", points = 10, id = 433386,
    trigger = ActivatedPowerUpMode(3)
)

achievement(title = "[Draft] Death Mode 999", description = "Activate Death Mode 999 for the first time", points = 5, id = 433387,
    trigger = ActivatedDeathMode999()
)

achievement(title = "[Draft] Extend 1", description = "Extend your life gauge to 4", points = 5, id = 433388,
    trigger = GotExtend(1)
)

achievement(title = "[Draft] Extend 2", description = "Extend your life gauge to 5", points = 10, id = 433389,
    trigger = GotExtend(2)
)

achievement(title = "[Draft] Sakura x Sakura", description = "Defeat Sakura while playing as Sakura on Stage B-2 without firing a shot or using a bomb, and without using a continue", points = 10, id = 433390,
    trigger = SakuraBossChallenge()
)

achievement(title = "[Draft] Small Life Bonus", description = "Score bonus points by collecting a Small Life-Up while at max health", points = 5, id = 433391,
    trigger = GotLifeUpBonus("Small")
)

achievement(title = "[Draft] Medium Life Bonus", description = "Score bonus points by collecting a Medium Life-Up while at max health", points = 5, id = 433392,
    trigger = GotLifeUpBonus("Medium")
)

achievement(title = "[Draft] Large Life Bonus", description = "Score bonus points by collecting a Large Life-Up while at max health", points = 5, id = 433393,
    trigger = GotLifeUpBonus("Large")
)

achievement(title = "[Draft] Magic x 3", description = "Collect a 3 Magic Items in one playthrough without using a continue", points = 10, id = 433394,
    trigger = Got3Bombs()
)

achievement(title = "[Draft] 500 Counter Boss", description = "Increase your item counter by 500 or more during a boss fight without using a continue", points = 10, id = 433395,
    trigger = Got500CounterDuringBoss()
)

achievement(title = "[Draft] 2500 Hearts and Skulls", description = "Collect 2500 Hearts and/or Skulls in any stage without taking damage", points = 5, id = 433396,
    trigger = GotItemChallenge("Hearts", 2500)
)

achievement(title = "[Draft] 1000 Crowns", description = "Collect 1000 Crowns in any stage without taking damage", points = 10, id = 433397,
    trigger = GotItemChallenge("Crowns", 1000)
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


