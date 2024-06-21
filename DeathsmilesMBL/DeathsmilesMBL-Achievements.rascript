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
StagesCleared = byte(0x660a76)
StageClearedFlag = byte(0x660a9e)
StageSelectState = byte(0x8a09a6)
CurrentStage = byte(0x6609ce)
EndingState = byte(0x660b92)
EndingChoice = byte(0x8a932a)
EndingChoiceState = byte(0x8a934e)
TutorialState = byte(0x660b5a)
CharacterSelectState = byte(0x660aaa)
DeathMode999Active = byte(0x660bae)
BossIndex = byte(0x660a82)
BossDefeatedFlag = byte(0x660a96)
SelectedStageLevel = byte(0x8a0f6a)
BombActivatedState = byte(0x660b5e)
ContinueScreenState = byte(0x660986)

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

BossStageNames = {
    "Deathscythe": "A1",
    "Jordan": "A2",
    "Whroon": "B1",
    "Sakura": "B2",
    "Mary": "C1",
    "Bavaria": "C2",
    "Devaria": "4A" ,
    "Jitterbug": "FINAL",
    "Tyrannosatan": "FINAL",
    "BloodyJitterbug": "FINAL",
    "Ozier": "4B"
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

function IsOnTitle() => ActivePlayer == 0
function IsPlayer1() => ActivePlayer == 1
function IsPlayer2() => ActivePlayer == 2
function IsCharacter(player, character) => Player[player]["Character"] == Characters[character]
function IsInStage() => StageState == 1
function IsOnStageSelect() => StageSelectState == 1
function IsOnCharacterSelect() => CharacterSelectState == 1
function IsInTutorial() => TutorialState == 1
function IsInEnding() => EndingState == 1
function IsUsingValidSettings() => all_of(DefaultGameSettings, setting => GameSettings[setting] == DefaultGameSettings[setting])
function IsValidSession() => NumberOfPlayers == 1 && IsUsingValidSettings() && !IsOnCharacterSelect() && !IsInTutorial()
function IsBossActive() => BossIndex > 0
function IsBossDefeated() => BossDefeatedFlag == 1
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
function PlayerUsedContinue() => prev(ContinueScreenState) < ContinueScreenState
function PlayerUsedBomb() => prev(BombActivatedState) == 0 && BombActivatedState == 1
function PlayerDefeatedBoss() => prev(BossDefeatedFlag) == 0 && BossDefeatedFlag == 1
function PlayerClearedStage() => prev(StageClearedFlag) == 0 && StageClearedFlag == 1
function PlayerClearedGame() => prev(EndingState) == 0 && EndingState == 1
function PlayerChoseEnding() => prev(EndingChoiceState) == 1 && EndingChoiceState == 0
function PlayerPoweredUp(player) => prev(GetPlayerPowerUpStatus(player)) == 0 && GetPlayerPowerUpStatus(player) == 1
function PlayerActivatedDeathMode999() => prev(DeathMode999Active) == 0 && DeathMode999Active == 1
function PlayerUsedInput(player, type) => Player[player]["Inputs"][type] == 1

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

function StageCleared(stage, challenge){
    trigger = IsValidSession() && CurrentStageIs(stage)
         
    cleared = prev(IsInStage()) && PlayerClearedStage()
    
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
        CurrentStageIs("FINAL") &&
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
        disable_when(IsPlayer1() && CurrentStageIs(stage) && PlayerTookDamage("P1"), IsOnStageSelect() || IsOnTitle()) &&
        disable_when(IsPlayer2() && CurrentStageIs(stage) && PlayerTookDamage("P2"), IsOnStageSelect() || IsOnTitle())
}

function ClearFINALNoDamage(){
    return IsValidSession() &&
        CurrentStageIs("FINAL") &&
        trigger_when(PlayerClearedGame()) && 
        disable_when(IsPlayer1() && CurrentStageIs("FINAL") && PlayerTookDamage("P1"), IsOnStageSelect() || IsOnTitle()) &&
        disable_when(IsPlayer2() && CurrentStageIs("FINAL") && PlayerTookDamage("P2"), IsOnStageSelect() || IsOnTitle())
}

function GotScoreMillions(score){
    return IsValidSession() &&
        (
            (IsPlayer1() && GetPlayerScore("P1", "Billions") == 0 && prev(GetPlayerScore("P1", "Millions")) < score && GetPlayerScore("P1", "Millions") >= score) ||
            (IsPlayer2() && GetPlayerScore("P2", "Billions") == 0 && prev(GetPlayerScore("P2", "Millions")) < score && GetPlayerScore("P2", "Millions") >= score)
        )
}

function GotScoreBillions(score){
    return IsValidSession() &&
        (
            (IsPlayer1() && prev(GetPlayerScore("P1", "Billions")) < score && GetPlayerScore("P1", "Billions") >= score) ||
            (IsPlayer2() && prev(GetPlayerScore("P2", "Billions")) < score && GetPlayerScore("P2", "Billions") >= score)
        )
}

function BossDefeated(boss, challenge){
    defeated = PlayerDefeatedBoss()
    
    if(challenge)
        defeated = trigger_when(defeated)

    return IsValidSession() &&
        IsFightingBoss(boss) &&
        defeated
}

function BossDefeatedNoContinue(boss, standard){
    IsLevel999 = SelectedStageLevel == Levels["LV999"]
    FightingBoss = IsFightingBoss(boss) && IsLevel999
    
    //Level 999 resets if you lose a full life in 4A, 4B, or 5
    //Achievement is valid if player starts stage at 999 and remains valid
    //even if they take damage. This should make it a bit more fair.
    if(!standard) {
        IsLevel999 = once(CurrentStageIs(BossStageNames[boss]) && DeathMode999Active == 1)
        FightingBoss = IsFightingBoss(boss)
    }

    return IsLevel999 &&
        BossDefeated(boss, true) &&
        disable_when(FightingBoss && PlayerUsedContinue()) &&
        (never(IsOnStageSelect()) || never(IsOnTitle()))
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
        never(IsOnStageSelect()) &&
        never(IsOnTitle())
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
        (
            (
                trigger_when(IsPlayer1() && IsCharacter("P1", "Sakura") && PlayerDefeatedBoss()) &&
                never(IsOnStageSelect()) && 
                never(IsOnTitle()) 
            ) ||
            (
                trigger_when(IsPlayer2() && IsCharacter("P2", "Sakura") && PlayerDefeatedBoss()) &&
                never(IsOnStageSelect()) && 
                never(IsOnTitle()) 
            )
        ) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer1() && PlayerUsedInput("P1", "ShootLeft")) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer1() && PlayerUsedInput("P1", "ShootRight")) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer2() && PlayerUsedInput("P2", "ShootLeft")) &&
        disable_when(IsFightingBoss("Sakura") && IsPlayer2() && PlayerUsedInput("P2", "ShootRight")) &&
        disable_when(IsFightingBoss("Sakura") && PlayerUsedBomb()) &&
        disable_when(IsFightingBoss("Sakura") && PlayerUsedContinue())
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
        measured(
            repeated(3, 
                prev(MagicItem["Collected"]) != 0xff && 
                MagicItem["Collected"] == 0xff && 
                never(IsOnTitle())
            ),
            IsValidSession()
        ) &&
        disable_when(PlayerUsedContinue(), IsOnTitle())
}

function Got500CounterDuringBoss(){
    return IsValidSession() &&
        (
            measured(
                tally_of(
                    range(0, 20), 500, 
                    count => !IsBossDefeated() && 
                        IsPlayer1() && 
                        GetPlayerItemCounter("P1") > prev(GetPlayerItemCounter("P1")) && 
                        GetPlayerItemCounter("P1") - prev(GetPlayerItemCounter("P1")) > count && 
                        never(!IsBossActive())
                ),
                IsValidSession()
            ) ||
            measured(
                tally_of(
                    range(0, 20), 500, 
                    count => !IsBossDefeated() && 
                        IsPlayer2() && 
                        GetPlayerItemCounter("P2") > prev(GetPlayerItemCounter("P2")) && 
                        GetPlayerItemCounter("P2") - prev(GetPlayerItemCounter("P2")) > count && 
                        never(!IsBossActive())
                ),
                IsValidSession()
            )
        ) &&
        disable_when(IsBossActive() && PlayerUsedContinue(), !IsBossActive())
}

function GotItemChallenge(type, number){
    return IsValidSession() &&
        (
            measured(
                tally_of(
                    range(0, 40), number, 
                    count => IsPlayer1() && 
                        GetPlayerItemCount("P1", type) > prev(GetPlayerItemCount("P1", type)) && 
                        GetPlayerItemCount("P1", type) - prev(GetPlayerItemCount("P1", type)) > count
                 ),
                 IsValidSession()
            ) ||
            measured(
                tally_of(
                    range(0, 40), number, 
                    count => IsPlayer2() && 
                        GetPlayerItemCount("P2", type) > prev(GetPlayerItemCount("P2", type)) && 
                        GetPlayerItemCount("P2", type) - prev(GetPlayerItemCount("P2", type)) > count
                        
                 ),
                 IsValidSession()
            )
        ) &&
        never(IsOnStageSelect()) &&
        never(IsOnTitle())
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //

achievement(title = "Dreary Port Town", description = "Clear Stage A-1", points = 3, type = "progression", id = 433348,
    trigger = StageCleared("A1", false)
)

achievement(title = "Blackened Boneyard", description = "Clear Stage A-2", points = 3, type = "progression", id = 433349,
    trigger = StageCleared("A2", false)
)

achievement(title = "Fetid Forest", description = "Clear Stage B-1", points = 3, type = "progression", id = 433350,
    trigger = StageCleared("B1", false)
)

achievement(title = "Sinister Swamp", description = "Clear Stage B-2", points = 3, type = "progression", id = 433351,
    trigger = StageCleared("B2", false)
)

achievement(title = "Lurid Lakeside", description = "Clear Stage C-1", points = 3, type = "progression", id = 433352,
    trigger = StageCleared("C1", false)
)

achievement(title = "Morose Volcano", description = "Clear Stage C-2", points = 4, type = "progression", id = 433353,
    trigger = StageCleared("C2", false)
)

achievement(title = "Sakura Beams", description = "Clear the game as Sakura", points = 5, type = "win_condition", id = 433354,
    trigger = GameCleared("Sakura")
)

achievement(title = "Windia Beams", description = "Clear the game as Windia", points = 5, type = "win_condition", id = 433355,
    trigger = GameCleared("Windia")
)

achievement(title = "Casper Beams", description = "Clear the game as Casper", points = 5, type = "win_condition", id = 433356,
    trigger = GameCleared("Casper")
)

achievement(title = "Follett Beams", description = "Clear the game as Follett", points = 5, type = "win_condition", id = 433357,
    trigger = GameCleared("Follett")
)

achievement(title = "Rosa Beams", description = "Clear the game as Rosa", points = 5, type = "win_condition", id = 433358,
    trigger = GameCleared("Rosa")
)

// ======================================================================= //
// Achievement Definitions - Play Challenges
// ======================================================================= //

achievement(title = "Cursed Canyon", description = "Clear Stage 4-A", points = 5, id = 433359,
    trigger = StageCleared("4A", false)
)

achievement(title = "Fridged Ice Palace", description = "Clear Stage 4-B", points = 5, id = 433360,
    trigger = StageCleared("4B", false)
)

achievement(title = "Sakura Restored", description = "Decide to return to the real world as Sakura", points = 1, id = 433361,
    trigger = SelectedEnding("Sakura", "Return")
)

achievement(title = "Sakura Remains", description = "Decide to stay in Gilverado as Sakura", points = 1, id = 433362,
    trigger = SelectedEnding("Sakura", "Stay")
)

achievement(title = "Windia Restored", description = "Decide to return to the real world as Windia", points = 1, id = 433363,
    trigger = SelectedEnding("Windia", "Return")
)

achievement(title = "Windia Remains", description = "Decide to stay in Gilverado as Windia", points = 1, id = 433364,
    trigger = SelectedEnding("Windia", "Stay")
)

achievement(title = "Casper Restored", description = "Decide to return to the real world as Casper", points = 1, id = 433365,
    trigger = SelectedEnding("Casper", "Return")
)

achievement(title = "Casper Remains", description = "Decide to stay in Gilverado as Casper", points = 1, id = 433366,
    trigger = SelectedEnding("Casper", "Stay")
)

achievement(title = "Follett Restored", description = "Decide to return to the real world as Follett", points = 1, id = 433367,
    trigger = SelectedEnding("Follett", "Return")
)

achievement(title = "Follett Remains", description = "Decide to stay in Gilverado as Follett", points = 1, id = 433368,
    trigger = SelectedEnding("Follett", "Stay")
)

achievement(title = "Rosa Restored", description = "Decide to return to the real world as Rosa", points = 1, id = 433369,
    trigger = SelectedEnding("Rosa", "Return")
)

achievement(title = "Rosa Remains", description = "Decide to stay in Gilverado as Rosa", points = 1, id = 433370,
    trigger = SelectedEnding("Rosa", "Stay")
)

achievement(title = "Impenetrable Port Town", description = "Clear Stage A-1 without taking damage", points = 10, id = 433371,
    trigger = ClearStageNoDamage("A1")
)

achievement(title = "Bulletproof Boneyard", description = "Clear Stage A-2 without taking damage", points = 10, id = 433372,
    trigger = ClearStageNoDamage("A2")
)

achievement(title = "Eternal Forest", description = "Clear Stage B-1 without taking damage", points = 10, id = 433373,
    trigger = ClearStageNoDamage("B1")
)

achievement(title = "Steel-plated Swamp", description = "Clear Stage B-2 without taking damage", points = 10, id = 433374,
    trigger = ClearStageNoDamage("B2")
)

achievement(title = "Everlasting Lakeside", description = "Clear Stage C-1 without taking damage", points = 10, id = 433375,
    trigger = ClearStageNoDamage("C1")
)

achievement(title = "Inviolable Volcano", description = "Clear Stage C-2 without taking damage", points = 10, id = 433376,
    trigger = ClearStageNoDamage("C2")
)

achievement(title = "Ironclad Canyon", description = "Clear Stage 4-A without taking damage", points = 50, id = 433377,
    trigger = ClearStageNoDamage("4A")
)

achievement(title = "Impervious Ice Palace", description = "Clear Stage 4-B without taking damage", points = 50, id = 433378,
    trigger = ClearStageNoDamage("4B")
)

achievement(title = "Unbending Stronghold", description = "Clear Stage FINAL without taking damage", points = 50, id = 433379,
    trigger = ClearFINALNoDamage()
)

// ======================================================================= //
// Achievement Definitions - Point Challenges
// ======================================================================= //

achievement(title = "Fantastic", description = "Score 100,000,000 points or more", points = 5, id = 433380,
    trigger = GotScoreMillions(100)
)

achievement(title = "Tremendous", description = "Score 250,000,000 points or more", points = 10, id = 433381,
    trigger = GotScoreMillions(250)
)

achievement(title = "Collosal", description = "Score 500,000,000 points or more", points = 25, id = 433382,
    trigger = GotScoreMillions(500)
)

achievement(title = "Prodigious", description = "Score 1,000,000,000 points or more", points = 50, id = 433383,
    trigger = GotScoreBillions(1)
)

achievement(title = "Monumental", description = "Score 2,000,000,000 points or more", points = 100, id = 433384,
    trigger = GotScoreBillions(2)
)

// ======================================================================= //
// Achievement Definitions - Other Challenges
// ======================================================================= //

achievement(title = "Mega Fever", description = "Activate Fever Mode by reaching a +Value of 100,000", points = 10, id = 433385,
    trigger = ActivatedFeverMode()
)

achievement(title = "Triple Up", description = "Activate Power Up mode 3 or more times in a single stage", points = 10, id = 433386,
    trigger = ActivatedPowerUpMode(3)
)

achievement(title = "Deadly Trigger", description = "Activate Death Mode 999 for the first time", points = 5, id = 433387,
    trigger = ActivatedDeathMode999()
)

achievement(title = "Gloaming Growth", description = "Extend your life gauge to 4", points = 5, id = 433388,
    trigger = GotExtend(1)
)

achievement(title = "Gloomy Growth", description = "Extend your life gauge to 5", points = 10, id = 433389,
    trigger = GotExtend(2)
)

achievement(title = "Doppelganger Dilemma", description = "Defeat Sakura while playing as Sakura on Stage B-2 without firing a shot or using a bomb, and without using a continue", points = 10, id = 433390,
    trigger = SakuraBossChallenge()
)

achievement(title = "Bonus Treat", description = "Score bonus points by collecting a Small Life-Up while at max health", points = 5, id = 433391,
    trigger = GotLifeUpBonus("Small")
)

achievement(title = "Bonus Snack", description = "Score bonus points by collecting a Medium Life-Up while at max health", points = 5, id = 433392,
    trigger = GotLifeUpBonus("Medium")
)

achievement(title = "Bonus Feast", description = "Score bonus points by collecting a Large Life-Up while at max health", points = 5, id = 433393,
    trigger = GotLifeUpBonus("Large")
)

achievement(title = "Alchemical Assortment", description = "Collect 3 Magic Items in one playthrough without using a continue", points = 10, id = 433394,
    trigger = Got3Bombs()
)

achievement(title = "Precarious Power", description = "Increase your item counter by 500 or more during a boss fight without using a continue", points = 10, id = 433395,
    trigger = Got500CounterDuringBoss()
)

achievement(title = "Heaps of Heart", description = "Collect 2500 Hearts and/or Skulls in any stage", points = 5, id = 433396,
    trigger = GotItemChallenge("Hearts", 2500)
)

achievement(title = "Copious Crowns", description = "Collect 1000 Crowns in any stage", points = 10, id = 433397,
    trigger = GotItemChallenge("Crowns", 1000)
)

// ======================================================================= //
// Achievement Definitions - Boss Challenges
// ======================================================================= //

achievement(title = "Transient Grim Reaper", description = "While playing Stage A-1 on Level 999, defeat Deathscythe without using a continue", points = 10, id = 433398,
    trigger = BossDefeatedNoContinue("Deathscythe", true)
)

achievement(title = "Entombed Baron", description = "While playing Stage A-2 on Level 999, defeat Jordan without using a continue", points = 25, id = 433399,
    trigger = BossDefeatedNoContinue("Jordan", true)
)

achievement(title = "Arborial Abomination", description = "While playing Stage B-1 on Level 999, defeat Whroon without using a continue", points = 25, id = 433400,
    trigger = BossDefeatedNoContinue("Whroon", true)
)

achievement(title = "Enshrouded Soothsayer", description = "While playing Stage B-2 on Level 999, defeat Sakura without using a continue", points = 25, id = 433401,
    trigger = BossDefeatedNoContinue("Sakura", true)
)

achievement(title = "Towering Taurus", description = "While playing Stage C-1 on Level 999, defeat Mary without using a continue", points = 25, id = 433402,
    trigger = BossDefeatedNoContinue("Mary", true)
)

achievement(title = "Sizzling Salamander", description = "While playing Stage C-2 on Level 999, defeat Bavaria without using a continue", points = 25, id = 433403,
    trigger = BossDefeatedNoContinue("Bavaria", true)
)

achievement(title = "Wicked Wyrms", description = "While playing Stage 4-A on Level 999, defeat Devaria & Givaria without using a continue", points = 50, id = 433404,
    trigger = BossDefeatedNoContinue("Devaria", false)
)

achievement(title = "Crystalline Golem", description = "While playing Stage 4-B on Level 999, defeat Ozier without using a continue", points = 50, id = 433405,
    trigger = BossDefeatedNoContinue("Ozier", false)
)

achievement(title = "Satanic Sentinal", description = "While playing Stage FINAL on Level 999, defeat Jitterbug without using a continue", points = 50, id = 433406,
    trigger = BossDefeatedNoContinue("Jitterbug", false)
)

achievement(title = "Malignant Overlord", description = "While playing Stage FINAL on Level 999, defeat Tyrannosatan without using a continue", points = 50, id = 433407,
    trigger = BossDefeatedNoContinue("Tyrannosatan", false)
)

achievement(title = "Crazed Warden", description = "While playing Stage FINAL on Level 999 as Sakura, Defeat Bloody Jitterbug", points = 100, id = 433408,
    trigger = BossDefeated("BloodyJitterbug", false)
)



