// Deathsmiles
// #ID = 21889

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
StageSelectState = byte(0x540316)
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

StagesCompleted = byte(0x38871e)
StagesCompletedLV3 = byte(0x38881e)

BossIndex = byte(0x38872a)
BossState = byte(0x38873e)

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

function StageClear(stage){
    return
        IsValidSession() &&
        SelectedStage == Stages[stage] &&
        prev(StageClearState) < StageClearState
}

function GameClear(character){
    trigger = IsValidSession() &&
        prev(SelectedStage) == Stages["FINAL"] &&
        SelectedStage == 0

    if(character == "Windia")
        trigger = trigger && (ActivePlayers["P1"] == 1 && IsWindia("P1") || ActivePlayers["P2"] == 1 && IsWindia("P2"))
        
    if(character == "Casper")
        trigger = trigger && (ActivePlayers["P1"] == 1 && IsCasper("P1") || ActivePlayers["P2"] == 1 && IsCasper("P2"))
        
    if(character == "Follett")
        trigger = trigger && (ActivePlayers["P1"] == 1 && IsFollett("P1") || ActivePlayers["P2"] == 1 && IsFollett("P2"))
        
    if(character == "Rosa")
        trigger = trigger && (ActivePlayers["P1"] == 1 && IsRosa("P1") || ActivePlayers["P2"] == 1 && IsRosa("P2"))

    return trigger
}

function AllClear(character){
    return GameClear(character) && Continues["P1"] == 0 && Continues["P2"] == 0
}

function AllClearDeathModeEX(){
    return IsValidSession() &&
        prev(SelectedStage) == Stages["FINAL"] &&
        SelectedStage == 0 &&
        Continues["P1"] == 0 && 
        Continues["P2"] == 0 &&
        DeathMode == 1 &&
        EXCompleted == 1 &&
        StagesCompletedLV3 == 6
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
    trigger = always_false()
)

achievement(title = "[DRAFT] Strawberry Parfeit", description = "Collect a Medium Life-Up and replenish one life block", points = 3, id = 418216,
    trigger = always_false()
)

achievement(title = "[DRAFT] Decoration Cake", description = "Collect a Large Life-Up and replenish two life blocks", points = 3, id = 418217,
    trigger = always_false()
)

achievement(title = "[DRAFT] Magical Destruction", description = "College a Magic Item and increase your bomb stock", points = 3, id = 418218,
    trigger = always_false()
)

achievement(title = "[DRAFT] Four Course Dessert", description = "Collect 4 life recovery items in a single playthrough using 3 continues or less", points = 25, id = 418219,
    trigger = always_false()
)

achievement(title = "[DRAFT] Untouchable", description = "Complete any stage on Level 3 or higher without taking damage", points = 10, id = 418220,
    trigger = always_false()
)

achievement(title = "[DRAFT] Max Destruction", description = "Increase your bomb stock to 6", points = 50, id = 418221,
    trigger = always_false()
)

achievement(title = "[DRAFT] Max Restraint", description = "Complete the game without using any bombs in 3 continues or less", points = 25, id = 418222,
    trigger = always_false()
)

achievement(title = "[DRAFT] Extend 1", description = "Extend your life gauge to 4", points = 10, id = 418223,
    trigger = always_false()
)

achievement(title = "[DRAFT] Extend 2", description = "Extend your life gauge to 5", points = 25, id = 418224,
    trigger = always_false()
)

achievement(title = "[DRAFT] Power-Up Mode", description = "Enter Power-Up mode for the first time", points = 5, id = 418225,
    trigger = always_false()
)

achievement(title = "[DRAFT] Fever Mode", description = "Enter Fever mode for the first time", points = 10, id = 418226,
    trigger = always_false()
)

achievement(title = "[DRAFT] Death Mode", description = "Activate Death Mode for the first time", points = 3, id = 418227,
    trigger = always_false()
)

achievement(title = "[DRAFT] Windia All-Clear", description = "Clear the game with Windia without using a continue", points = 25, id = 418228,
    trigger = AllClear("Windia")
)

achievement(title = "[DRAFT] Casper All-Clear", description = "Clear the game with Casper without using a continue", points = 25, id = 418229,
    trigger = AllClear("Casper")
)

achievement(title = "[DRAFT] Follett All-Clear", description = "Clear the game with Follett without using a continue", points = 25, id = 418230,
    trigger = AllClear("Follett")
)

achievement(title = "[DRAFT] Rosa All-Clear", description = "Clear the game with Rosa without using a continue", points = 25, id = 418231,
    trigger = AllClear("Rosa")
)

achievement(title = "[DRAFT] Death Mode Level 2", description = "Activate Death Mode Level 2 and complete the game without using a continue", points = 100, id = 418232,
    trigger = AllClearDeathModeEX()
)

// ======================================================================= //
// Point Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "[DRAFT] 1 Million", description = "Score 1000000 points or more", points = 5, id = 418233,
    trigger = always_false()
)

achievement(title = "[DRAFT] 10 Million", description = "Score 10000000 points or more", points = 10, id = 418234,
    trigger = always_false()
)

achievement(title = "[DRAFT] 100 Million", description = "Score 100000000 points or more", points = 25, id = 418235,
    trigger = always_false()
)

achievement(title = "[DRAFT] 200 Million", description = "Score 200000000 points or more", points = 50, id = 418236,
    trigger = always_false()
)

achievement(title = "[DRAFT] 300 Million", description = "Score 300000000 points or more", points = 100, id = 418237,
    trigger = always_false()
)

// ======================================================================= //
// Boss Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "[DRAFT] Twin Dragon Kings", 
    description = "Defeat Devaria and Givaria and clear Stage EXTRA [Canyon]", points = 5, id = 418238,
    trigger = always_false()
)

achievement(title = "[DRAFT] Deathscyth No Damage", 
    description = "While playing Stage A-1 [Port Town] at Level 3, defeat Deathscyth without taking damage", points = 25, id = 418239,
    trigger = always_false()
)

achievement(title = "[DRAFT] Jordan No Damage", 
    description = "While playing Stage A-2 [Boneyard] at Level 3, defeat Jordan without taking damage", points = 25, id = 418240,
    trigger = always_false()
)

achievement(title = "[DRAFT] Whroon No Damage", 
    description = "While playing Stage B-1 [Forest] at Level 3, defeat Whroon without taking damage", points = 25,  id = 418241,
    trigger = always_false()
)

achievement(title = "[DRAFT] Sakura No Damage", 
    description = "While playing Stage B-2 [Swamp] at Level 3, defeat Sakura without taking damage", points = 25, id = 418242,
    trigger = always_false()
)

achievement(title = "[DRAFT] Mary No Damage", 
    description = "While playing Stage C-1 [Lakeside] at Level 3, defeat Mary without taking damage", points = 25, id = 418243,
    trigger = always_false()
)

achievement(title = "[DRAFT] Bavaria No Damage", 
    description = "While playing Stage C-2 [Volcano] at Level 3, defeat Bavaria without taking damage", points = 25, id = 418244,
    trigger = always_false()
)

achievement(title = "[DRAFT] Jitterbug No Damage", 
    description = "While playing Stage FINAL [Castle] on Death Mode or higher, defeat Jitterbug without taking damage", points = 50, id = 418245,
    trigger = always_false()
)

achievement(title = "[DRAFT] Tyrannosatan No Damage", 
    description = "While playing Stage FINAL [Castle] on Death Mode or higher, defeat Tyrannosatan without taking damage", points = 50, id = 418246,
    trigger = always_false()
)

achievement(title = "[DRAFT] Devaria & Givaria No Damage", 
    description = "While playing Stage EXTRA [Canyon] on Deah Mode or higher, defeat Devaria and Givaria without taking damage", points = 25, id = 418247,
    trigger = always_false()
)