// Raiden II
// #ID = 12860
// Author: TwosomesUP
// Achievements Script

//================================================================
// Accessors
//================================================================

GameState = byte(0x842)
TitleState = byte(0x9f54)
ScoreSubmitState = byte(0x00b158)

Credits = byte(0x9f4c)
NumberOfPlayers = byte(0x9f50)

Stage = byte(0x9ff8)
StageState = byte(0x9d64)
StageBonus = word(0x9fea)

Loop = byte(0x9f60)

Settings = {
    "P1Coinage": (bit0(0x9d98) + (bit1(0x9d98) * 10) + (bit2(0x9d98) * 100)),
    "P2Coinage": (bit3(0x9d98) + (bit4(0x9d98) * 10) + (bit5(0x9d98) * 100)),
    "StartCoin": bit6(0x9d98),
    "FlipScreen": bit7(0x9d98),
    "Difficulty": (bit0(0x9d99) + (bit1(0x9d99) * 10)),
    "Lives": (bit2(0x9d99) + (bit3(0x9d99) * 10)),
    "Extends": (bit4(0x9d99) + (bit5(0x9d99) * 10)),
    "DemoSound": bit6(0x9d99),
    "ServiceMode": bit7(0x9d99)
}

Player = {
    "State": byte(0xdb1),
    "Lives": byte(0x9eee),
    "Weapon": {
        "Vulcan": {
            "IsActive": (byte(0x9ed6) > 0),
            "Power": byte(0x9ed6)
        },
        "Laser": {
            "IsActive": (byte(0x9ed8) > 0),
            "Power": byte(0x9ed8)
        },
        "Plasma": {
            "IsActive": (byte(0x9eda) > 0),
            "Power": byte(0x9eda)
        }
    },
    "Missile": {
        "Standard": {
            "IsActive": (byte(0x9ede) > 0),
            "Power": byte(0x9ede)
        },
        "Homing": {
            "IsActive": (byte(0x9ee0) > 0),
            "Power": byte(0x9ee0)
        }
    },
    "Bombs": [
        byte(0x9ee6),
        byte(0x9ee7),
        byte(0x9ee8),
        byte(0x9ee9),
        byte(0x9eea),
        byte(0x9eeb),
        byte(0x9eec)
    ],
    "Medals": {
        "Gold": byte(0x9ef0),
        "Platinum": byte(0x9ef2)
    },
    "Fairies": byte(0x9ef4),
    "Score": (word(0x9ef6) + (word(0x9ef8) * 0x10000))
}

//================================================================
// Value Dictionaries
//================================================================

ValidSettings = {
    "Difficulty": 0,
    "Lives": 0,
    "Extends": 0
}

BombTypes = {
    "Standard": 1,
    "Cluster": 2
}

Stages = {
    "1": {
        "Start": 0,
        "End": 1
    },
    "2": {
        "Start": 1,
        "End": 2
    },
    "3": {
        "Start": 2,
        "End": 3
    },
    "4": {
        "Start": 3,
        "End": 4
    },
    "5": {
        "Start": 4,
        "End": 5
    },
    "6": {
        "Start": 5,
        "End": 7
    },
    "7": {
        "Start": 7,
        "End": 8
    },
    "8": {
        "Start": 9,
        "End": 10
    },
    "NextMission": {
        "Start": 10,
        "End": 1
    },
}

//================================================================
// Helper Functions
//================================================================

function IsInGame() => GameState == 1 && TitleState == 0
function IsOnTitle() => TitleState > 0
function IsSinglePlayer() => NumberOfPlayers == 1
function IsMultiplayer() => NumberOfPlayers == 2
function IsValidSession() {
    return all_of(ValidSettings, setting => Settings[setting] == ValidSettings[setting]) &&
    disable_when(NumberOfPlayers > 1, !IsInGame())
}

function PlayerUsedContinue() {
    return IsInGame() && prev(NumberOfPlayers) == 0 && NumberOfPlayers > 0
}

function PlayerSubmittedScore() {
    return once(prev(ScoreSubmitState) != 0x0a && ScoreSubmitState == 0x0a && never(!IsInGame()))
}

function CountBombs(type){
    return measured(tally_of(Player["Bombs"], 0, bomb => once(bomb == BombTypes[type] && never(bomb != BombTypes[type]))))
}

function GetTotalBombs(){
    return measured(tally_of(Player["Bombs"], 0, bomb => once(bomb > 0 && never(bomb < 1))))
}

function CountContinues(){
    return measured(tally(0, IsInGame() && PlayerUsedContinue() && never(IsOnTitle())))
}

function GetActiveWeapon(){
    return Player["Weapon"]["Vulcan"]["Power"] + (Player["Weapon"]["Laser"]["Power"] * 10) + (Player["Weapon"]["Plasma"]["Power"] * 100)
}

function GetActiveMissile(){
    return Player["Missile"]["Standard"]["Power"] + (Player["Missile"]["Homing"]["Power"] * 10)
}


//================================================================
// Achievement Trigger Functions
//================================================================

function ClearedStage(stage, challenge){
    ToNextStage = prev(Stage) == Stages[stage]["Start"] && Stage == Stages[stage]["End"]
    
    if(stage == "1"){
        ToNextStage = ((ToNextStage) || (Loop > 0 && prev(Stage) == Stages["NextMission"]["Start"] && Stage == Stages["NextMission"]["End"]))
    }
    
    if(challenge){
        ToNextStage = trigger_when(ToNextStage)
    }
    
    return IsValidSession() && ToNextStage
}

function ClearedStageNoContinue(stage){
    trigger = ClearedStage(stage, true) &&
        disable_when(Stage == Stages[stage]["Start"] && PlayerUsedContinue(), !IsInGame())
        
    if(stage == "1"){
        trigger = trigger &&
        disable_when(Loop > 0 && Stage == Stages["NextMission"]["Start"] && PlayerUsedContinue(), !IsInGame()) 
    }

    return trigger 
}

function MaxedPrimary(){
    return IsValidSession() &&
        ((prev(Player["Weapon"]["Vulcan"]["Power"]) > 0 &&
        prev(Player["Weapon"]["Vulcan"]["Power"]) < 8 &&
        Player["Weapon"]["Vulcan"]["Power"] >= 8) ||
        (prev(Player["Weapon"]["Laser"]["Power"]) > 0 &&
        prev(Player["Weapon"]["Laser"]["Power"]) < 8 &&
        Player["Weapon"]["Laser"]["Power"] >= 8) ||
        (prev(Player["Weapon"]["Plasma"]["Power"]) > 0 &&
        prev(Player["Weapon"]["Plasma"]["Power"]) < 8 &&
        Player["Weapon"]["Plasma"]["Power"] >= 8))
}

function MaxedMissiles(){
    return IsValidSession() &&
        ((prev(Player["Missile"]["Standard"]["Power"]) > 0 &&
        prev(Player["Missile"]["Standard"]["Power"]) < 4 &&
        Player["Missile"]["Standard"]["Power"] >= 4) ||
        (prev(Player["Missile"]["Homing"]["Power"]) > 0 &&
        prev(Player["Missile"]["Homing"]["Power"]) < 4 &&
        Player["Missile"]["Homing"]["Power"] >= 4))
}

function Got1UP(stage){
    
}

//================================================================
// Progression Achievement Definitions
//================================================================

achievement(title = "[Draft] Clear Stage 1", description = "Clear Stage 8", points = 1, type = "progression", id = 443796,
    trigger = ClearedStage("1", false)
)

achievement(title = "[Draft] Clear Stage 2", description = "Clear Stage 8", points = 2, type = "progression", id = 443797,
    trigger = ClearedStage("2", false)
)

achievement(title = "[Draft] Clear Stage 3", description = "Clear Stage 8", points = 2, type = "progression", id = 443798,
    trigger = ClearedStage("3", false)
)

achievement(title = "[Draft] Clear Stage 4", description = "Clear Stage 8", points = 3, type = "progression", id = 443799,
    trigger = ClearedStage("4", false)
)

achievement(title = "[Draft] Clear Stage 5", description = "Clear Stage 8", points = 3, type = "progression", id = 443800,
    trigger = ClearedStage("5", false)
)

achievement(title = "[Draft] Clear Stage 6", description = "Clear Stage 8", points = 4, type = "progression", id = 443801,
    trigger = ClearedStage("6", false)
)

achievement(title = "[Draft] Clear Stage 7", description = "Clear Stage 8", points = 4, type = "progression", id = 443802,
    trigger = ClearedStage("7", false)
)

achievement(title = "[Draft] Clear Stage 8", description = "Clear Stage 8", points = 5, type = "win_condition", id = 443803,
    trigger = ClearedStage("8", false)
)

//================================================================
// Play Challenge Achievement Definitions
//================================================================

achievement(title = "[Draft] No Continue Stage 1", description = "Clear Stage 1 without using a continue", points = 10, id = 443804,
    trigger = ClearedStageNoContinue("1")
)

achievement(title = "[Draft] No Continue Stage 2", description = "Clear Stage 2 without using a continue", points = 10, id = 443805,
    trigger = ClearedStageNoContinue("2")
)

achievement(title = "[Draft] No Continue Stage 3", description = "Clear Stage 3 without using a continue", points = 10, id = 443806,
    trigger = ClearedStageNoContinue("3")
)

achievement(title = "[Draft] No Continue Stage 4", description = "Clear Stage 4 without using a continue", points = 25, id = 443807,
    trigger = ClearedStageNoContinue("4")
)

achievement(title = "[Draft] No Continue Stage 5", description = "Clear Stage 5 without using a continue", points = 25, id = 443808,
    trigger = ClearedStageNoContinue("5")
)

achievement(title = "[Draft] No Continue Stage 6", description = "Clear Stage 6 without using a continue", points = 25, id = 443809,
    trigger = ClearedStageNoContinue("6")
)

achievement(title = "[Draft] No Continue Stage 7", description = "Clear Stage 7 without using a continue", points = 25, id = 443810,
    trigger = ClearedStageNoContinue("7")
)

achievement(title = "[Draft] No Continue Stage 8", description = "Clear Stage 8 without using a continue", points = 50, id = 443811,
    trigger = ClearedStageNoContinue("8")
)

achievement(title = "[Draft] MAX Primary", description = "Upgrade the Vulcan, Laser, or Plasma weapon to max firepower", points = 3, id = 443812,
    trigger = MaxedPrimary()
)

achievement(title = "[Draft] MAX Missiles", description = "Upgrade the Missiles or Homing Missiles to max firepower", points = 3, id = 443813,
    trigger = MaxedMissiles()
)

achievement(title = "[Draft] Stage 3 1UP", description = "Collect a 1UP on Stage 3", points = 5, id = 443814,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 6 1UP", description = "Collect a 1UP on Stage 6", points = 5, id = 443815,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 1 Fairy", description = "Collect a Fairy on Stage 1", points = 5, id = 443816,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 4 Fairy", description = "Collect a Fairy on Stage 4", points = 5, id = 443817,
    trigger = always_false()
)

achievement(title = "[Draft] Platinum Clear", description = "Clear any stage with a Platinum Medal", points = 5, id = 443818,
    trigger = always_false()
)

achievement(title = "[Draft] 25 Medals", description = "Collect 25 medals in the first loop using 3 continues or less", points = 5, id = 443819,
    trigger = always_false()
)

achievement(title = "[Draft] 50 Medals", description = "Collect 50 medals in the first loop using 3 continues or less", points = 10, id = 443820,
    trigger = always_false()
)

achievement(title = "[Draft] 100 Medals", description = "Collect 100 medals in the first loop using 3 continues or less", points = 25, id = 443821,
    trigger = always_false()
)

achievement(title = "[Draft] 5 Bomb Clear", description = "Clear any stage with 5 or more bombs", points = 10, id = 443822,
    trigger = always_false()
)

achievement(title = "[Draft] Clear Bonus", description = "Clear any stage with an end of level bonus of 150,000 points or more", points = 25, id = 443823,
    trigger = always_false()
)

achievement(title = "[Draft] Fairy Clear", description = "Clear the game on the first loop with a stock of at least 1 Fairy", points = 50, id = 443824,
    trigger = always_false()
)

//================================================================
// Point Challenge Achievement Definitions
//================================================================

achievement(title = "[Draft] 100K Points", description = "Score 100,000 points or more before the end of the first loop", points = 5, id = 443825,
    trigger = always_false()
)

achievement(title = "[Draft] 250K Points", description = "Score 250,000 points or more before the end of the first loop", points = 10, id = 443826,
    trigger = always_false()
)

achievement(title = "[Draft] 500K Points", description = "Score 500,000 points or more before the end of the first loop", points = 25, id = 443827,
    trigger = always_false()
)

achievement(title = "[Draft] 1M Points", description = "Score 1,000,000 points or more before the end of the first loop", points = 50, id = 443828,
    trigger = always_false()
)

//================================================================
// Boss Challenge Achievement Definitions
//================================================================

achievement(title = "[Draft] Stage 1 Boss Plasma", description = "Defeat the Walkers on Stage 1 using the Plasma weapon without losing a life", points = 10, id = 443829,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 2 Boss Vulcan", description = "Defeat the Albatross on Stage 2 using the Vulcan weapon without losing a life", points = 10, id = 443830,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 3 Boss Laser", description = "Defeat the Battle Axe on Stage 3 using the Laser weapon without losing a life", points = 10, id = 443831,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 4 Boss Plasma", description = "Defeat the Thunder Fortress on Stage 4 using the Plasma weapon without losing a life", points = 25, id = 443832,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 5 Boss Vulcan", description = "Defeat the Black Bird on Stage 5 using the Vulcan weapon without losing a life", points = 25, id = 443833,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 6 Boss Laser", description = "Defeat the Graphite on Stage 6 using the Laser weapon without losing a life", points = 25, id = 443834,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 7 Boss Plasma", description = "Defeat the Huge Satellite on Stage 7 using the Plasma weapon without losing a life", points = 25, id = 443835,
    trigger = always_false()
)

achievement(title = "[Draft] Stage 8 Boss Laser", description = "Defeat the Mother Haven on Stage 8 using the Laser weapon without losing a life", points = 50, id = 443836,
    trigger = always_false()
)