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
ActivePlayers = byte(0x9f52)

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
    "Score": (word(0x9ef6) + (word(0x9ef8) * 0x10000)),
    "Bonus": word(0x9fea) * 1000
}

ItemStateOffset = 0x00
ItemCollectedOffset = 0x18
ItemSpriteIDOffset = 0x58
Items = [
    {
        "State": word(0x37b0 + ItemStateOffset),
        "Collected": word(0x37b0 + ItemCollectedOffset),
        "Sprite": word(0x37b0 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3890 + ItemStateOffset),
        "Collected": word(0x3890 + ItemCollectedOffset),
        "Sprite": word(0x3890 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3970 + ItemStateOffset),
        "Collected": word(0x3970 + ItemCollectedOffset),
        "Sprite": word(0x3970 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3a50 + ItemStateOffset),
        "Collected": word(0x3a50 + ItemCollectedOffset),
        "Sprite": word(0x3a50 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3b30 + ItemStateOffset),
        "Collected": word(0x3b30 + ItemCollectedOffset),
        "Sprite": word(0x3b30 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3c10 + ItemStateOffset),
        "Collected": word(0x3c10 + ItemCollectedOffset),
        "Sprite": word(0x3c10 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3cf0 + ItemStateOffset),
        "Collected": word(0x3cf0 + ItemCollectedOffset),
        "Sprite": word(0x3cf0 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3dd0 + ItemStateOffset),
        "Collected": word(0x3dd0 + ItemCollectedOffset),
        "Sprite": word(0x3dd0 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3eb0 + ItemStateOffset),
        "Collected": word(0x3eb0 + ItemCollectedOffset),
        "Sprite": word(0x3eb0 + ItemSpriteIDOffset)
    },
    {
        "State": word(0x3f90 + ItemStateOffset),
        "Collected": word(0x3f90 + ItemCollectedOffset),
        "Sprite": word(0x3f90 + ItemSpriteIDOffset)
    }
]  

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
        "Start": 8,
        "End": 9
    }
}

ItemIDs = {
    "RedWeapon": 0x278,
    "BlueWeapon": 0x27c,
    "PurpleWeapon": 0x280,
    "Missile": 0x288,
    "Homing": 0x28c,
    "GoldMedal": 0x356,
    "PlatinumMedal": 0x35a,
    "Miclus": 0x376,
    "1UP": 0x298,
    "Fairy": 0x36a,
    "500": 0x38a,
    "3000": 0x3a6,
    "10000": 0x3c2
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
    disable_when(NumberOfPlayers > 1, !IsInGame()) &&
    disable_when(ActivePlayers > 1, !IsInGame())
}

function PlayerUsedContinue() {
    return IsInGame() && prev(NumberOfPlayers) == 0 && NumberOfPlayers > 0
}

function PlayerSubmittedScore() {
    return once(prev(ScoreSubmitState) != 0x0a && ScoreSubmitState == 0x0a && never(!IsInGame()))
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

function PlayerDefeatedBoss(){
    return prev(StageState) == 1 && trigger_when(StageState == 2)
}

function PlayerClearedStage(){
    return prev(StageState) == 2 && StageState == 3
}

//================================================================
// Achievement Trigger Functions
//================================================================

function ClearedStage(stage, challenge){
    return IsValidSession() && Stage == Stages[stage]["End"] && PlayerClearedStage()
}

function ClearedStageNoContinue(stage){
    trigger = ClearedStage(stage, true) &&
        disable_when(Stage == Stages[stage]["Start"] && PlayerUsedContinue(), !IsInGame())
        
    if(stage == "1"){
        trigger = trigger &&
        disable_when(Loop > 0 && Stage == 0xa && PlayerUsedContinue(), !IsInGame()) 
    }
        
    return trigger 
}

function ClearedStageWithPlatinum(){
    return IsValidSession() &&
        PlayerClearedStage() &&
        Player["Medals"]["Platinum"] > 0
}

function ClearedStageWith5Bombs(){
    return IsValidSession() &&
        PlayerClearedStage() &&
        (
            Player["Bombs"][4] > 0 ||
            Player["Bombs"][5] > 0 ||
            Player["Bombs"][6] > 0
        )
}

function ClearedStageWithBonus(){
    return IsValidSession() &&
    PlayerClearedStage() &&
    Player["Bonus"] >= 125000
}

function ClearedGameWithFairy(){
    return ClearedStage("8", false) &&
        Loop == 0 &&
        Player["Fairies"] > 0
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
    return IsValidSession() &&
        Stage == Stages[stage]["Start"] &&
        prev(Player["Lives"]) < Player["Lives"] && 
        any_of(Items, item => 
            prev(item["Collected"]) == 0 && 
            item["Collected"] == 4 &&
            item["Sprite"] == ItemIDs["1UP"]
        )
}

function GotFairy(stage){
    StageCheck = Stage == Stages[stage]["Start"]
    
    if(stage == "1"){
        StageCheck = StageCheck || (Loop > 0 && Stage == 0xa)
    }

    return IsValidSession() &&
        StageCheck &&
        prev(Player["Fairies"]) < Player["Fairies"]
}

function GotMedals(count){
    return IsValidSession() &&
        measured(repeated(count, Loop == 0 && prev(Player["Medals"]["Gold"]) < Player["Medals"]["Gold"] && never(!IsInGame()))) &&
        disable_when(repeated(3, PlayerUsedContinue()), !IsInGame())
}

function GotScore(score){
    return IsValidSession() &&
        Loop == 0 &&
        Stage < 0xa &&
        prev(Player["Score"]) < score &&
        Player["Score"] >= score
}

function DefeatedBossWithWeapon(stage, weapon){
    StageCheck = Stage == Stages[stage]["Start"]
    
    if(stage == "1"){
        StageCheck = (StageCheck || (Loop > 0 && Stage == 0xa))
    }

    return IsValidSession() &&
        StageCheck &&
        Player["Weapon"][weapon]["IsActive"] &&
        PlayerDefeatedBoss() &&
        disable_when(StageState == 1 && Stage == Stages[stage]["Start"] && prev(Player["Lives"]) > Player["Lives"], !IsInGame())
}

//================================================================
// Progression Achievement Definitions
//================================================================

achievement(title = "Arcadian Overthrow", description = "Clear Stage 1 [P1 Only]", points = 1, type = "progression", id = 443796,
    trigger = ClearedStage("1", false)
)

achievement(title = "Urban Reign", description = "Clear Stage 2 [P1 Only]", points = 2, type = "progression", id = 443797,
    trigger = ClearedStage("2", false)
)

achievement(title = "Tidal Crush", description = "Clear Stage 3 [P1 Only]", points = 2, type = "progression", id = 443798,
    trigger = ClearedStage("3", false)
)

achievement(title = "Wreckage Raze", description = "Clear Stage 4 [P1 Only]", points = 3, type = "progression", id = 443799,
    trigger = ClearedStage("4", false)
)

achievement(title = "Garrison Purge", description = "Clear Stage 5 [P1 Only]", points = 3, type = "progression", id = 443800,
    trigger = ClearedStage("5", false)
)

achievement(title = "Tussocks Takedown", description = "Clear Stage 6 [P1 Only]", points = 4, type = "progression", id = 443801,
    trigger = ClearedStage("6", false)
)

achievement(title = "Flotilla Override", description = "Clear Stage 7 [P1 Only]", points = 4, type = "progression", id = 443802,
    trigger = ClearedStage("7", false)
)

achievement(title = "Mothership Massacre", description = "Clear Stage 8 [P1 Only]", points = 5, type = "win_condition", id = 443803,
    trigger = ClearedStage("8", false)
)

//================================================================
// Play Challenge Achievement Definitions
//================================================================

achievement(title = "Perpetual Countryside", description = "Clear Stage 1 without using a continue [P1 Only]", points = 10, id = 443804,
    trigger = ClearedStageNoContinue("1")
)

achievement(title = "Abiding Borough", description = "Clear Stage 2 without using a continue [P1 Only]", points = 10, id = 443805,
    trigger = ClearedStageNoContinue("2")
)

achievement(title = "Everlasting Surf", description = "Clear Stage 3 without using a continue [P1 Only]", points = 10, id = 443806,
    trigger = ClearedStageNoContinue("3")
)

achievement(title = "Steadfast Rubble", description = "Clear Stage 4 without using a continue [P1 Only]", points = 25, id = 443807,
    trigger = ClearedStageNoContinue("4")
)

achievement(title = "Timeless Citadel", description = "Clear Stage 5 without using a continue [P1 Only]", points = 25, id = 443808,
    trigger = ClearedStageNoContinue("5")
)

achievement(title = "Enduring Archipelago", description = "Clear Stage 6 without using a continue [P1 Only]", points = 25, id = 443809,
    trigger = ClearedStageNoContinue("6")
)

achievement(title = "Eternal Squadron", description = "Clear Stage 7 without using a continue [P1 Only]", points = 25, id = 443810,
    trigger = ClearedStageNoContinue("7")
)

achievement(title = "Unbroken Overseer", description = "Clear Stage 8 without using a continue [P1 Only]", points = 50, id = 443811,
    trigger = ClearedStageNoContinue("8")
)

achievement(title = "Optimal Offense", description = "Upgrade the Vulcan, Laser, or Plasma weapon to max firepower [P1 Only]", points = 3, id = 443812,
    trigger = MaxedPrimary()
)

achievement(title = "Ordnance Overdrive", description = "Upgrade the Missiles or Homing Missiles to max firepower [P1 Only]", points = 3, id = 443813,
    trigger = MaxedMissiles()
)

achievement(title = "High Seas Hardiness", description = "Collect a 1UP on Stage 3 [P1 Only]", points = 5, id = 443814,
    trigger = Got1UP("3")
)

achievement(title = "Isle Viability", description = "Collect a 1UP on Stage 6 [P1 Only]", points = 5, id = 443815,
    trigger = Got1UP("6")
)

achievement(title = "Outland Aid", description = "Collect a Fairy on Stage 1 [P1 Only]", points = 5, id = 443816,
    trigger = GotFairy("1")
)

achievement(title = "Relic Reinforcements", description = "Collect a Fairy on Stage 4 [P1 Only]", points = 5, id = 443817,
    trigger = GotFairy("4")
)

achievement(title = "Top Tier Triumph", description = "Clear any stage with a Platinum Medal [P1 Only]", points = 5, id = 443818,
    trigger = ClearedStageWithPlatinum()
)

achievement(title = "Climb the Ladder", description = "Collect 25 medals in the first loop using 3 continues or less [P1 Only]", points = 5, id = 443819,
    trigger = GotMedals(25)
)

achievement(title = "Crest the Summit", description = "Collect 50 medals in the first loop using 3 continues or less [P1 Only]", points = 10, id = 443820,
    trigger = GotMedals(50)
)

achievement(title = "Breach Outerspace", description = "Collect 100 medals in the first loop using 3 continues or less [P1 Only]", points = 25, id = 443821,
    trigger = GotMedals(100)
)

achievement(title = "Spare Shells", description = "Clear any stage with 5 or more bombs [P1 Only]", points = 10, id = 443822,
    trigger = ClearedStageWith5Bombs()
)

achievement(title = "Addition Fruition", description = "Clear any stage with an end of level bonus of 125,000 points or more [P1 Only]", points = 25, id = 443823,
    trigger = ClearedStageWithBonus()
)

achievement(title = "Stockpiled", description = "Clear the game on the first loop with a stock of 1 or more Fairies [P1 Only]", points = 100, id = 443824,
    trigger = ClearedGameWithFairy()
)

//================================================================
// Point Challenge Achievement Definitions
//================================================================

achievement(title = "Wild!", description = "Score 100,000 points or more before the end of the first loop [P1 Only]", points = 5, id = 443825,
    trigger = GotScore(100000)
)

achievement(title = "Stormy!", description = "Score 250,000 points or more before the end of the first loop [P1 Only]", points = 10, id = 443826,
    trigger = GotScore(250000)
)

achievement(title = "Frenzied!", description = "Score 500,000 points or more before the end of the first loop [P1 Only]", points = 25, id = 443827,
    trigger = GotScore(500000)
)

achievement(title = "Tempestuous!", description = "Score 1,000,000 points or more before the end of the first loop [P1 Only]", points = 50, id = 443828,
    trigger = GotScore(1000000)
)

//================================================================
// Boss Challenge Achievement Definitions
//================================================================

achievement(title = "Run the Extra Mile", description = "Defeat the Walkers on Stage 1 using the Plasma weapon without losing a life [P1 Only]", points = 10, id = 443829,
    trigger = DefeatedBossWithWeapon("1", "Plasma")
)

achievement(title = "With Flying Colors", description = "Defeat the Albatross on Stage 2 using the Vulcan weapon without losing a life [P1 Only]", points = 10, id = 443830,
    trigger = DefeatedBossWithWeapon("2", "Vulcan")
)

achievement(title = "Make the Cut", description = "Defeat the Battle Axe on Stage 3 using the Laser weapon without losing a life [P1 Only]", points = 10, id = 443831,
    trigger = DefeatedBossWithWeapon("3", "Laser")
)

achievement(title = "Strike Gold", description = "Defeat the Thunder Fortress on Stage 4 using the Plasma weapon without losing a life [P1 Only]", points = 25, id = 443832,
    trigger = DefeatedBossWithWeapon("4", "Plasma")
)

achievement(title = "Feather in Your Cap", description = "Defeat the Black Bird on Stage 5 using the Vulcan weapon without losing a life [P1 Only]", points = 25, id = 443833,
    trigger = DefeatedBossWithWeapon("5", "Vulcan")
)

achievement(title = "Raise the Bar", description = "Defeat the Graphite on Stage 6 using the Laser weapon without losing a life [P1 Only]", points = 25, id = 443834,
    trigger = DefeatedBossWithWeapon("6", "Laser")
)

achievement(title = "On Fire", description = "Defeat the Huge Satellite on Stage 7 using the Plasma weapon without losing a life [P1 Only]", points = 25, id = 443835,
    trigger = DefeatedBossWithWeapon("7", "Plasma")
)

achievement(title = "Top of the World", description = "Defeat the Mother Haven on Stage 8 using the Laser weapon without losing a life [P1 Only]", points = 50, id = 443836,
    trigger = DefeatedBossWithWeapon("8", "Laser")
)