// Deathsmiles
// #ID = 21889

// Fix triggers so it's only 1cc challenges
// Add measured to life-up collection
// Finish testing Windia (clear, 3cc, and 1cc)
// Test Casper (clear, 3cc, 1cc)
// Finish testing Max Bomb

// ======================================================================= //
// Accessors
// ======================================================================= //

// Game Accessors //
GameState = byte(0x53b4bc)
Tutorial = byte(0x53b4f0)
Players = byte(0x38870e)

FollettUnlocked = byte(0x38861d)
RosaUnlocked = byte(0x38861c)
CanyonUnlocked = byte(0x38861f)

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

ActivePlayers = {
    "P1": byte(0x60b0a),
    "P2": byte(0x60b0e)
}

DeathMode = byte(0x388822)
EXCompleted = byte(0x388820)

// Player Accessors //
Bombs = byte(0x3887f6)
BombActive = byte(0x3887ee)

SelectedCharacter = {
    "P1": byte(0x53b546),
    "P2": byte(0x53b5ca)
}

Score = {
    "P1": (word(0x388f60) * 0x10000 + word(0x388f62)),
    "P2": (word(0x389090) * 0x10000 + word(0x389092))
}

Lives = {
    "P1": byte(0x388f38),
    "P2": byte(0x389068)
}

Health = {
    "P1": word(0x388f3a),
    "P2": word(0x38906a)
}

ItemCounter = {
    "P1": word(0x389036),
    "P2": word(0x389166)
}

PlusValueCounter = {
    "P1": word(0x389032),
    "P2": word(0x389162)
}

PowerUp = {
    "P1": byte(0x389054),
    "P2": byte(0x389184)
}

Continues = {
    "P1": byte(0x388f66),
    "P2": byte(0x389096)
}

// Result Screen Accessors //
ResultScreenState = {
    "P1": byte(0x540944),
    "P2": byte(0x54156c)
}

ResultScreenCharacter = {
    "P1": byte(0x540942),
    "P2": byte(0x54156a)
}

ResultScreenCharacters = {
    "Windia": 0,
    "Casper": 1,
    "Follett": 2,
    "Rosa": 3
}

ResultScreenScore = {
    "P1": (word(0x54093c) * 0x10000 + word(0x54093e)),
    "P2": (word(0x541564) * 0x10000 + word(0x541566))
}

ResultScreenContinues = {
    "P1": byte(0x540950),
    "P2": byte(0x541578)
}

ResultScreenEX = {
    "P1": byte(0x54094e),
    "P2": byte(0x541576)
}

// Stage Accessors //
InStage = byte(0x54030d)
SelectingStage = byte(0x540316)
StageClearState = byte(0x5402ce)
GameClearState = byte(0x5487a2)

Stages = {
    "A1": 0,
    "A2": 1,
    "B1": 2,
    "B2": 3,
    "C1": 4,
    "C2": 5,
    "EX": 6,
    "FINAL": 7
}

SelectedStage = byte(0x5402ea)
SelectedStageLevel = byte(0x5408a6)

StageLevels = {
    "LV1": 0,
    "LV2": 1, 
    "LV3": 2
}

StagesCompleted = byte(0x38871e)
StagesCompletedLV3 = byte(0x38881e)

BossIndex = byte(0x38872a)
BossState = byte(0x38873e)

BossIndexes = {
    "Devaria": 1,
    "Deathscyth": 1,
    "Jordan": 1,
    "Whroon": 1,
    "Sakura": 1,
    "Mary": 1,
    "Bavaria": 1,
    "Jitterbug": 1,
    "Tyrannosatan": 2
}

LifeUpCollected = word(0x50d660)
LifeUpSize = word(0x50d662)

LifeUpSizes = {
    "Small": 0x0000,
    "Medium": 0x0100,
    "Large": 0x0200
}

BombCollected = word(0x50dfa0)

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

function GetUnlockedCharacters() => FollettUnlocked + RosaUnlocked

function IsWindia(player){
    return 
        (GetUnlockedCharacters() == 0 && SelectedCharacter[player] == 0) || 
        (GetUnlockedCharacters() != 0 && SelectedCharacter[player] == 1)
}

function IsCasper(player){
    return 
        (GetUnlockedCharacters() == 0 && SelectedCharacter[player] == 1) || 
        (GetUnlockedCharacters() != 0 && SelectedCharacter[player] == 0)
}

function IsFollett(player) => SelectedCharacter[player] == 2
function IsRosa(player) => SelectedCharacter[player] == 3

// ======================================================================= //
// Achievement Logic Functions
// ======================================================================= //

function StageClear(stage){
    return
        IsValidSession() &&
        SelectedStage == Stages[stage] &&
        prev(StageClearState) < StageClearState
}

function GameClear(character, isChallenge = false, continues = 100){
    trigger = IsValidSession()
    
    if(isChallenge && continues == 0)
        trigger = trigger && trigger_when(prev(SelectedStage) == Stages["FINAL"] && SelectedStage == 0)
    else
        trigger = trigger && prev(SelectedStage) == Stages["FINAL"] && SelectedStage == 0

    if(character == "Windia"){
        if(isChallenge){
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsWindia("P1") && Continues["P1"] <= continues || ActivePlayers["P2"] == 1 && IsWindia("P2") && Continues["P2"] <= continues)
        } else {
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsWindia("P1") || ActivePlayers["P2"] == 1 && IsWindia("P2"))
        }
    }
       
    if(character == "Casper"){
        if(isChallenge){
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsCasper("P1") && Continues["P1"] <= continues || ActivePlayers["P2"] == 1 && IsCasper("P2") && Continues["P2"] <= continues)
        } else {
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsCasper("P1") || ActivePlayers["P2"] == 1 && IsCasper("P2"))
        }
    }
        
    if(character == "Follett"){
        if(isChallenge){
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsFollett("P1") && Continues["P1"] <= continues || ActivePlayers["P2"] == 1 && IsFollett("P2") && Continues["P2"] <= continues)
        } else {
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsFollett("P1") || ActivePlayers["P2"] == 1 && IsFollett("P2"))
        }
    }
        
    if(character == "Rosa"){
        if(isChallenge){
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsRosa("P1") && Continues["P1"] <= continues || ActivePlayers["P2"] == 1 && IsRosa("P2") && Continues["P2"] <= continues)
        } else {
            trigger = trigger && (ActivePlayers["P1"] == 1 && IsRosa("P1") || ActivePlayers["P2"] == 1 && IsRosa("P2"))
        }
    }
        
    return trigger
}

function AllClear(character){
    return GameClear(character, true, 0)
}

function AllClearDeathModeEX(continues){
    trigger = IsValidSession()
    
    if(continues == 0){
        trigger = trigger && trigger_when(prev(SelectedStage) == Stages["FINAL"] && SelectedStage == 0)
    } else {
        trigger = trigger && prev(SelectedStage) == Stages["FINAL"] && SelectedStage == 0
    }
        
    trigger = trigger && 
        ((ActivePlayers["P1"] == 1 && Continues["P1"] <= continues) ||
        (ActivePlayers["P2"] == 1 && Continues["P2"] <= continues)) &&
        DeathMode == 1 &&
        EXCompleted == 1 &&
        StagesCompletedLV3 == 6
    
    return trigger
}

function LifeUpCollected(size){
    trigger = IsValidSession() &&
        prev(LifeUpCollected) != 0xff00 && 
        LifeUpCollected == 0xff00
        
    if(size != "Any")
        trigger = trigger && LifeUpSize == LifeUpSizes[size]

    return trigger
}

function BombCollected(){
    return IsValidSession() &&
        prev(BombCollected) != 0xff00 && 
        BombCollected == 0xff00
}

function Collect4LifeUp(){
    return repeated(4, LifeUpCollected("Any")) && never(GameState == 0 || Continues["P1"] + Continues["P2"] > 3)
}

function Level3NoDamage(){
    return IsValidSession() &&
        //Stage info is wiped out when beating the game - check the previous frame
        prev(InStage) == 1 &&
        (DeathMode + EXCompleted > 0 || SelectedStageLevel == StageLevels["LV3"]) &&
        trigger_when((prev(StageClearState) < StageClearState) || (prev(SelectedStage) == 7 && SelectedStage == 0)) &&
        disable_when(ActivePlayers["P1"] == 1 && Health["P1"] < prev(Health["P1"]), SelectingStage == 1 || GameState == 0) &&
        disable_when(ActivePlayers["P2"] == 1 && Health["P2"] < prev(Health["P2"]), SelectingStage == 1 || GameState == 0)
}

function MaxBombStock(){
    return IsValidSession() &&
        prev(Bombs) == 5 && Bombs == 6
}

function NoBombClear(continues){
    trigger = IsValidSession()
    
    if(continues == 0){
        trigger = trigger && trigger_when(prev(SelectedStage) == Stages["FINAL"] && SelectedStage == 0)
    } else {
        trigger = trigger && prev(SelectedStage) == Stages["FINAL"] && SelectedStage == 0
    }
    
    trigger = trigger && 
        disable_when(Continues["P1"] > 3 || Continues["P2"] > 3 || BombActive == 1, GameState == 0)

    return trigger
}

function GotExtend(number){
    if(number < 1 || number > 2)
        number = 1

    return IsValidSession() &&
        ((ActivePlayers["P1"] == 1 && prev(Lives["P1"]) == 3 + number / 2 && Lives["P1"] == 3 + number) ||
        (ActivePlayers["P2"] == 1 && prev(Lives["P2"]) == 3 + number / 2 && Lives["P2"] == 3 + number))
}

function ActivatedPowerUp(){
    return IsValidSession() &&
    ((ActivePlayers["P1"] == 1 && prev(PowerUp["P1"]) == 0 && PowerUp["P1"] == 1) ||
    (ActivePlayers["P2"] == 1 && prev(PowerUp["P2"]) == 0 && PowerUp["P2"] == 1))
}


function ActivatedFeverMode(){
    return IsValidSession() &&
    ((ActivePlayers["P1"] == 1 && prev(PlusValueCounter["P1"]) < 10000 && PlusValueCounter["P1"] >= 10000) ||
    (ActivePlayers["P2"] == 1 && prev(PlusValueCounter["P2"]) < 10000 && PlusValueCounter["P2"] >= 10000))
}

function ActivatedDeathMode(){
    return IsValidSession() && prev(DeathMode) == 0 && DeathMode == 1
}

function AchievedScore(points){
    return IsValidSession() &&
    ((ActivePlayers["P1"] == 1 && prev(Score["P1"]) < points && Score["P1"] > points) ||
    (ActivePlayers["P2"] == 1 && prev(Score["P2"]) < points && Score["P2"] > points))
}

function NoDamageBoss(stage, boss){
    return IsValidSession() &&
        SelectedStage == Stages[stage] &&
        BossIndex == BossIndexes[boss] &&
        prev(BossState) == 1 && BossState == 0 &&
        disable_when(ActivePlayers["P1"] == 1 && Health["P1"] < prev(Health["P1"]), SelectingStage == 1 || GameState == 0) &&
        disable_when(ActivePlayers["P2"] == 1 && Health["P2"] < prev(Health["P2"]), SelectingStage == 1 || GameState == 0)
}

// ======================================================================= //
// Progression Achievement Definitions
// ======================================================================= //

achievement(title = "[DRAFT] Wandering Grim Reaper", description = "Defeat Deathscyth and clear Stage A-1 [Port Town]", points = 3, type = "progression", id = 418205,
    trigger = StageClear("A1")
)

achievement(title = "[DRAFT] Buried Baron", description = "Defeat Jordan and clear Stage A-2 [Boneyard]", points = 3, type = "progression", id = 418206,
    trigger = StageClear("A2")
)

achievement(title = "[DRAFT] Forest Illusionist", description = "Defeat Whroon and clear Stage B-1 [Forest]", points = 3, type = "progression", id = 418207,
    trigger = StageClear("B1")
)

achievement(title = "[DRAFT] Swamp Witch", description = "Defeat Sakura and clear Stage B-2 [Swamp]", points = 3, type = "progression", id = 418208,
    trigger = StageClear("B2")
)

achievement(title = "[DRAFT] Colossal Bovine", description = "Defeat Mary and clear Stage C-1 [Lakeside]", points = 3, type = "progression", id = 418209,
    trigger = StageClear("C1")
)

achievement(title = "[DRAFT] God of Flame", description = "Defeat Bavaria and clear Stage C-2 [Volcano]", points = 3, type = "progression", id = 418210,
    trigger = StageClear("C2")
)

achievement(title = "[DRAFT] Demon Hunter Windia", description = "Defeat Tyrannosatan and clear the game as Windia", points = 5, type = "win_condition", id = 418211,
    trigger = GameClear("Windia")
)

achievement(title = "[DRAFT] Demon Hunter Casper", description = "Defeat Tyrannosatan and clear the game as Casper", points = 5, type = "win_condition", id = 418212,
    trigger = GameClear("Casper")
)

achievement(title = "[DRAFT] Demon Hunter Follett", description = "Defeat Tyrannosatan and clear the game as Follett", points = 5, type = "win_condition", id = 418213,
    trigger = GameClear("Follett")
)

achievement(title = "[DRAFT] Demon Hunter Rosa", description = "Defeat Tyrannosatan and clear the game as Rosa", points = 5, type = "win_condition", id = 418214,
    trigger = GameClear("Rosa")
)

// ======================================================================= //
// Play Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "[DRAFT] Prine a la mode", description = "Collect a Small Life-Up and replenish half a life block", points = 3, id = 418215,
    trigger = LifeUpCollected("Small")
)

achievement(title = "[DRAFT] Strawberry Parfeit", description = "Collect a Medium Life-Up and replenish one life block", points = 3, id = 418216,
    trigger = LifeUpCollected("Medium")
)

achievement(title = "[DRAFT] Decoration Cake", description = "Collect a Large Life-Up and replenish two life blocks", points = 3, id = 418217,
    trigger = LifeUpCollected("Large")
)

achievement(title = "[DRAFT] Magical Destruction", description = "College a Magic Item and increase your bomb stock", points = 3, id = 418218,
    trigger = BombCollected()
)

achievement(title = "[DRAFT] Four Course Dessert", description = "Collect 4 life recovery items in a single playthrough using 3 continues or less", points = 25, id = 418219,
    trigger = Collect4LifeUp()
)

achievement(title = "[DRAFT] Untouchable", description = "Complete any stage on Level 3 or higher without taking damage", points = 10, id = 418220,
    trigger = Level3NoDamage()
)

achievement(title = "[DRAFT] Max Destruction", description = "Increase your bomb stock to 6", points = 50, id = 418221,
    trigger = MaxBombStock()
)

achievement(title = "[DRAFT] Max Restraint", description = "Complete the game without using any bombs in 3 continues or less", points = 25, id = 418222,
    trigger = NoBombClear(3)
)

achievement(title = "[DRAFT] Ultra Restraint", description = "Complete the game without using any bombs and without using a continue", points = 50, id = 419773,
    trigger = NoBombClear(0)
)

achievement(title = "[DRAFT] Extend 1", description = "Extend your life gauge to 4", points = 10, id = 418223,
    trigger = GotExtend(1)
)

achievement(title = "[DRAFT] Extend 2", description = "Extend your life gauge to 5", points = 25, id = 418224,
    trigger = GotExtend(2)
)

achievement(title = "[DRAFT] Power-Up Mode", description = "Enter Power-Up mode for the first time", points = 5, id = 418225,
    trigger = ActivatedPowerUp()
)

achievement(title = "[DRAFT] Fever Mode", description = "Enter Fever mode for the first time", points = 10, id = 418226,
    trigger = ActivatedFeverMode()
)

achievement(title = "[DRAFT] Death Mode", description = "Activate Death Mode for the first time", points = 3, id = 418227,
    trigger = ActivatedDeathMode()
)

achievement(title = "[DRAFT] Windia 3cc", description = "Clear the game with Windia using 3 continues or less", points = 10, id = 419772,
    trigger = GameClear("Windia", true, 3)
)

achievement(title = "[DRAFT] Windia All-Clear", description = "Clear the game with Windia without using a continue", points = 25, id = 418228,
    trigger = AllClear("Windia")
)

achievement(title = "[DRAFT] Casper 3cc", description = "Clear the game with Casper using 3 continues or less", points = 10, id = 419776,
    trigger = GameClear("Casper", true, 3)
)

achievement(title = "[DRAFT] Casper All-Clear", description = "Clear the game with Casper without using a continue", points = 25, id = 418229,
    trigger = AllClear("Casper")
)

achievement(title = "[DRAFT] Follett 3cc", description = "Clear the game with Follett using 3 continues or less", points = 10, id = 419775,
    trigger = GameClear("Follett", true, 3)
)

achievement(title = "[DRAFT] Follett All-Clear", description = "Clear the game with Follett without using a continue", points = 25, id = 418230,
    trigger = AllClear("Follett")
)

achievement(title = "[DRAFT] Rosa 3cc", description = "Clear the game with Rosa using 3 continues or less", points = 10, id = 419774,
    trigger = GameClear("Rosa", true, 3)
)

achievement(title = "[DRAFT] Rosa All-Clear", description = "Clear the game with Rosa without using a continue", points = 25, id = 418231,
    trigger = AllClear("Rosa")
)

achievement(title = "[DRAFT] 3cc Death Mode Level 2", description = "Activate Death Mode Level 2 and clear the game using 3 continues or less", points = 50, id = 419821,
    trigger = AllClearDeathModeEX(3)
)

achievement(title = "[DRAFT] 1cc Death Mode Level 2", description = "Activate Death Mode Level 2 and clear the game without using a continue", points = 100, id = 418232,
    trigger = AllClearDeathModeEX(0)
)

// ======================================================================= //
// Point Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "[DRAFT] 1 Million", description = "Score 1000000 points or more", points = 5, id = 418233,
    trigger = AchievedScore(1000000)
)

achievement(title = "[DRAFT] 10 Million", description = "Score 10000000 points or more", points = 10, id = 418234,
    trigger = AchievedScore(10000000)
)

achievement(title = "[DRAFT] 100 Million", description = "Score 100000000 points or more", points = 25, id = 418235,
    trigger = AchievedScore(100000000)
)

achievement(title = "[DRAFT] 200 Million", description = "Score 200000000 points or more", points = 50, id = 418236,
    trigger = AchievedScore(200000000)
)

achievement(title = "[DRAFT] 300 Million", description = "Score 300000000 points or more", points = 100, id = 418237,
    trigger = AchievedScore(300000000)
)

// ======================================================================= //
// Boss Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "[DRAFT] Twin Dragon Kings", 
    description = "Defeat Devaria and Givaria and clear Stage EXTRA [Canyon]", points = 5, id = 418238,
    trigger = StageClear("EX")
)

achievement(title = "[DRAFT] Deathscyth No Damage", 
    description = "While playing Stage A-1 [Port Town] at Level 3, defeat Deathscyth without taking damage", points = 25, id = 418239,
    trigger = NoDamageBoss("A1", "Deathscyth")
)

achievement(title = "[DRAFT] Jordan No Damage", 
    description = "While playing Stage A-2 [Boneyard] at Level 3, defeat Jordan without taking damage", points = 25, id = 418240,
    trigger = NoDamageBoss("A2", "Jordan")
)

achievement(title = "[DRAFT] Whroon No Damage", 
    description = "While playing Stage B-1 [Forest] at Level 3, defeat Whroon without taking damage", points = 25,  id = 418241,
    trigger = NoDamageBoss("B1", "Whroon")
)

achievement(title = "[DRAFT] Sakura No Damage", 
    description = "While playing Stage B-2 [Swamp] at Level 3, defeat Sakura without taking damage", points = 25, id = 418242,
    trigger = NoDamageBoss("B2", "Sakura")
)

achievement(title = "[DRAFT] Mary No Damage", 
    description = "While playing Stage C-1 [Lakeside] at Level 3, defeat Mary without taking damage", points = 25, id = 418243,
    trigger = NoDamageBoss("C1", "Mary")
)

achievement(title = "[DRAFT] Bavaria No Damage", 
    description = "While playing Stage C-2 [Volcano] at Level 3, defeat Bavaria without taking damage", points = 25, id = 418244,
    trigger = NoDamageBoss("C2", "Bavaria")
)

achievement(title = "[DRAFT] Jitterbug No Damage", 
    description = "While playing Stage FINAL [Castle] on Death Mode or higher, defeat Jitterbug without taking damage", points = 50, id = 418245,
    trigger = NoDamageBoss("FINAL", "Jitterbug")
)

achievement(title = "[DRAFT] Tyrannosatan No Damage", 
    description = "While playing Stage FINAL [Castle] on Death Mode or higher, defeat Tyrannosatan without taking damage", points = 50, id = 418246,
    trigger = NoDamageBoss("FINAL", "Tyrannosatan")
)

achievement(title = "[DRAFT] Devaria & Givaria No Damage", 
    description = "While playing Stage EXTRA [Canyon] on Deah Mode or higher, defeat Devaria and Givaria without taking damage", points = 25, id = 418247,
    trigger = NoDamageBoss("EX", "Devaria")
)