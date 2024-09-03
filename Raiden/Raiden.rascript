// Raiden
// #ID = 15140

// ======================================================================= //
// Accessors
// ======================================================================= //

InGame = byte(0x6ff4)
PlayerCount = byte(0xce3) 
MultiplayerActive = byte(0x41a)
Stage = byte(0x402)
Loop = byte(0x41c)
GameOverState = byte(0xac2)
StageState = byte(0x4c06)

//Lives, Extends, and Difficulty are the only settings that affect gameplay
DIPSettings = {
    "CoinMode": bit0(0xb60),
    "Coinage": (bit1(0xb60) + bit2(0xb60) * 10 + bit3(0xb60) * 100 + bit4(0xb60) * 1000),
    "Credits": bit5(0xb60),
    "InvertScreen": bit7(0xb60),
    "Lives": (bit0(0xb62) + bit1(0xb62) * 10),
    "Extends": (bit2(0xb62) + bit3(0xb62) * 10),
    "Difficulty": (bit4(0xb62) + bit5(0xb62) * 10),
    "ContinuesEnabled": bit6(0xb62),
    "DemoSoundEnabled": bit7(0xb62)
}

Player = {
    "P1": {
        "Active": byte(0xb83),
        "Lives": byte(0xb85),
        "Vulcan": byte(0xb8b),
        "Laser": byte(0xb8d),
        "Missile": byte(0xb8f),
        "Homing": byte(0xb91),
        "Bombs": byte(0xb93),
        "Medals": byte(0xb95),
        "Fairies": byte(0xb97),
        "Score": (byte(0xba1) + byte(0xba2) * 0x100 + byte(0xba3) * 0x10000 + byte(0xba4) * 0x1000000)
    },
    "P2": {
        "Active": byte(0xba9),
        "Lives": byte(0xbab),
        "Vulcan": byte(0xbb1),
        "Laser": byte(0xbb3),
        "Missile": byte(0xbb5),
        "Homing": byte(0xbb7),
        "Bombs": byte(0xbb9),
        "Medals": byte(0xbbb),
        "Fairies": byte(0xbbd),
        "Score": (byte(0xbc7) + byte(0xbc8) * 0x100 + byte(0xbc9) * 0x10000 + byte(0xbca) * 0x1000000)
    }
}

Item = [
    {
        "State": byte(0x471a),
        "Collected": byte(0x472a),
        "Id": word(0x4732)
    },
    {
        "State": byte(0x478a),
        "Collected": byte(0x479a),
        "Id": word(0x47a2)
    },
    {
        "State": byte(0x47fa),
        "Collected": byte(0x480a),
        "Id": word(0x4812)
    },
    {
        "State": byte(0x486a),
        "Collected": byte(0x487a),
        "Id": word(0x4882)
    },
    {
        "State": byte(0x48da),
        "Collected": byte(0x48ea),
        "Id": word(0x48f2)
    },
    {
        "State": byte(0x494a),
        "Collected": byte(0x495a),
        "Id": word(0x4962)
    },
    {
        "State": byte(0x49ba),
        "Collected": byte(0x49ca),
        "Id": word(0x49d2)
    },
    {

        "Collected": byte(0x4a3a),
        "Id": word(0x4a42)
    },
]

// ======================================================================= //
// Helper Dictionaries
// ======================================================================= //

GameOverStates = {
    "Transition": 0x2,
    "Active": 0xe
}

ValidDIPSettings = {
    "Lives": 0,
    "Extends": 0,
    "Difficulty": 0
}

StageStates = {
    "InStage": 0,
    "BossActive": 1,
    "BossDefeated": 2,
    "PreResults": 3,
    "ResultsStart": 4,
    "ResultsEnd": 5
}

ItemIds = {
    "LaserUp": 0x2c8,
    "VulcanUp": 0x2c4,
    "Bomb": 0x2d4,
    "Missiles": 0x5dc,
    "Homing": 0x5e0,
    "Medal": 0x5ec,
    "Fairy": 0x92e,
    "MiclusRight": 0x3ac,
    "MiclusLeft": 0x3b0,
    "3000pts": 0x2e4
}

Stages = {
    "Stage1Begin": 0x00,
    "Stage1": 0x01,
    "Stage2": 0x02,
    "Stage3": 0x03,
    "Stage4": 0x04,
    "Stage5": 0x05,
    "Stage6Begin": 0x06,
    "Stage6": 0x07,
    "Stage7": 0x08,
    "Stage8Begin": 0x09,
    "Stage8": 0x0a
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => InGame == 0x0b
function IsOnTitle() => InGame == 0xfa

function IsPlaying(player){
    return IsInGame() && 
        Player[player]["Active"] > 0 &&
        MultiplayerActive == 0
}

function IsPlayingChallenge(player){
    return Player[player]["Active"] > 0 &&
        MultiplayerActive == 0
}

function IsGameOver(){
    return IsInGame() && 
    Player["P1"]["Active"] == 0 && 
    Player["P2"]["Active"] == 0 &&
    MultiplayerActive == 0
} 

function IsValidSession(){
    return all_of(ValidDIPSettings, setting => DIPSettings[setting] == ValidDIPSettings[setting])
}

function MaxContinues(max) {
    max = max + 1
    if(max < 1)
        max = 1
        
    return disable_when(tally(max, prev(GameOverState) == GameOverStates["Transition"] && GameOverState == GameOverStates["Active"]), IsOnTitle())
}

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

function ClearStage(stage){
    return IsValidSession() &&
        (IsPlaying("P1") || IsPlaying("P2")) &&
        Stage == Stages[stage] &&
        prev(StageState) == StageStates["PreResults"] &&
        StageState == StageStates["ResultsStart"]
}

function ClearGameChallenge(){
    return IsValidSession() &&
        (IsPlayingChallenge("P1") || IsPlayingChallenge("P2")) &&
        Stage == Stages["Stage8"] &&
        prev(StageState) == StageStates["PreResults"] &&
        StageState == StageStates["ResultsStart"]
}

function ClearStageWithMedals(stage, medals){
    return IsValidSession() &&
        ((IsPlaying("P1") && Player["P1"]["Medals"] >= medals) || 
        (IsPlaying("P2") && Player["P2"]["Medals"] >= medals)) &&
        Stage == Stages[stage] &&
        prev(StageState) == StageStates["PreResults"] &&
        StageState == StageStates["ResultsStart"]
}

function ClearStageWithMaxBombs(){
    return IsValidSession() &&
        ((IsPlaying("P1") && Player["P1"]["Bombs"] == 7) ||
        (IsPlaying("P2") && Player["P2"]["Bombs"] == 7)) &&
        prev(StageState) == StageStates["PreResults"] &&
        StageState == StageStates["ResultsStart"]
}

function MaxPrimaryWeapon(){
    return IsValidSession() &&
        ((IsPlaying("P1") && prev(Player["P1"]["Laser"]) != 0 && prev(Player["P1"]["Laser"]) < 8 && Player["P1"]["Laser"] == 8) || 
        (IsPlaying("P1") && prev(Player["P1"]["Vulcan"]) != 0 && prev(Player["P1"]["Vulcan"]) < 8 && Player["P1"]["Vulcan"] == 8) ||
        (IsPlaying("P2") && prev(Player["P2"]["Laser"]) != 0 && prev(Player["P2"]["Laser"]) < 8 && Player["P2"]["Laser"] == 8) ||
        (IsPlaying("P2") && prev(Player["P2"]["Vulcan"]) != 0 && prev(Player["P2"]["Vulcan"]) < 8 && Player["P2"]["Vulcan"] == 8))
}

//Fix/simplify logic to match Fiary
function MaxSecondaryWeapon(){
    return IsValidSession() &&
        ((IsPlaying("P1") && prev(Player["P1"]["Missile"]) != 0 && prev(Player["P1"]["Missile"]) < 4 && Player["P1"]["Missile"] == 4) || 
        (IsPlaying("P1") && prev(Player["P1"]["Homing"]) != 0 && prev(Player["P1"]["Homing"]) < 4 && Player["P1"]["Homing"] == 4) ||
        (IsPlaying("P2") && prev(Player["P2"]["Missile"]) != 0 && prev(Player["P2"]["Missile"]) < 4 && Player["P2"]["Missile"] == 4) ||
        (IsPlaying("P2") && prev(Player["P2"]["Homing"]) != 0 && prev(Player["P2"]["Homing"]) < 4 && Player["P2"]["Homing"] == 4))
}

function CollectedMiclus(){
    return IsValidSession() &&
        (IsPlaying("P1") || IsPlaying("P2")) &&
        (any_of(Item, item => prev(item["Id"]) == ItemIds["MiclusRight"] && item["Id"] == ItemIds["3000pts"]) ||
        any_of(Item, item => prev(item["Id"]) == ItemIds["MiclusLeft"] && item["Id"] == ItemIds["3000pts"]))
}

function CollectedFairy(){
    return IsValidSession() && 
        ((IsPlaying("P1") && prev(Player["P1"]["Fairies"]) < Player["P1"]["Fairies"]) ||
        (IsPlaying("P2") && prev(Player["P2"]["Fairies"]) < Player["P2"]["Fairies"]))
}

function Collected3Fairies(){
    return IsValidSession() &&
        Loop == 0 &&
        Stage < 0xa &&
        ((IsPlaying("P1") && prev(Player["P1"]["Fairies"]) == 2 && Player["P1"]["Fairies"] == 3 && disable_when(prev(Player["P1"]["Lives"]) > Player["P1"]["Lives"], IsOnTitle())) ||
        (IsPlaying("P2") && prev(Player["P2"]["Fairies"]) == 2 && Player["P2"]["Fairies"] == 3 && disable_when(prev(Player["P2"]["Lives"]) > Player["P2"]["Lives"], IsOnTitle())))
}

function ClearLoopWithRestrictedContinues(max_continues, loop){
    loop = loop - 1
    if(loop < 0)
        loop = 0

    return ClearGameChallenge() &&
        Loop == loop &&
        MaxContinues(max_continues)
}

function GotExtend(number){
    if(number < 1)
        number = 1
    if(number > 2)
        number = 2
        
    begin = 3 + (number / 2)
    end = 3 + number

    return IsValidSession() &&
        Loop == 0 &&
        Stage < 0xa &&
        ((IsPlaying("P1") && prev(Player["P1"]["Lives"]) == begin && Player["P1"]["Lives"] == end) ||
        (IsPlaying("P2") && prev(Player["P2"]["Lives"]) == begin && Player["P2"]["Lives"] == end))
}

function GotScore(score){
    return IsValidSession() &&
        Loop == 0 &&
        Stage < 0xa &&
        ((IsPlaying("P1") && prev(Player["P1"]["Score"]) < score && Player["P1"]["Score"] >= score) ||
        (IsPlaying("P2") && prev(Player["P2"]["Score"]) < score && Player["P2"]["Score"] >= score))
}

function DefeatBossNoDamage(stage){
    return IsValidSession() &&
        ((IsPlaying("P1") && 
        disable_when(Stage == Stages[stage] && StageState == StageStates["BossActive"] && prev(Player["P1"]["Lives"]) > Player["P1"]["Lives"], Stage != Stages[stage] || IsOnTitle())) ||
        (IsPlaying("P2") && 
        disable_when(Stage == Stages[stage] && StageState == StageStates["BossActive"] && prev(Player["P2"]["Lives"]) > Player["P2"]["Lives"], Stage != Stages[stage] || IsOnTitle()))) &&
        prev(StageState) == StageStates["BossActive"] && 
        trigger_when(StageState == StageStates["BossDefeated"])      
}

// ======================================================================= //
// Progression Achievement Definitions
// ======================================================================= //

achievement(title = "Backwater Boom", description = "Clear Stage 1", points = 1, type = "progression", id = 423481,
    trigger = ClearStage("Stage1")
)

achievement(title = "Metropolitan Mastery", description = "Clear Stage 2", points = 2, type = "progression", id = 423482,
    trigger = ClearStage("Stage2")
)

achievement(title = "Seaside Sweep", description = "Clear Stage 3", points = 2, type = "progression", id = 423483,
    trigger = ClearStage("Stage3")
)

achievement(title = "Detritus Defeat", description = "Clear Stage 4", points = 3, type = "progression", id = 423484,
    trigger = ClearStage("Stage4")
)

achievement(title = "Badlands Blitz", description = "Clear Stage 5", points = 3, type = "progression", id = 423485,
    trigger = ClearStage("Stage5")
)

achievement(title = "Empyrean Extermination", description = "Clear Stage 6", points = 4, type = "progression", id = 423486,
    trigger = ClearStage("Stage6")
)

achievement(title = "Cosmic Conquest", description = "Clear Stage 7", points = 4, type = "progression", id = 423487,
    trigger = ClearStage("Stage7")
)

achievement(title = "Titan Takedown", description = "Clear the game", points = 5, type = "win_condition", id = 423488,
    trigger = ClearStage("Stage8")
)

// ======================================================================= //
// Play Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "Backwater Bonus", description = "Clear Stage 1 with 10 or more medals", points = 10, id = 423489,
    trigger = ClearStageWithMedals("Stage1", 10)
)

achievement(title = "Metropolitan Merits", description = "Clear Stage 2 with 15 or more medals", points = 10, id = 423490,
    trigger = ClearStageWithMedals("Stage2", 15)
)

achievement(title = "Seaside Spoils", description = "Clear Stage 3 with 15 or more medals", points = 10, id = 423491,
    trigger = ClearStageWithMedals("Stage3", 15)
)

achievement(title = "Detritus Dividend", description = "Clear Stage 4 with 15 or more medals", points = 10, id = 423492,
    trigger = ClearStageWithMedals("Stage4", 15)
)

achievement(title = "Badlands Bounty", description = "Clear Stage 5 with 15 or more medals", points = 10, id = 423493,
    trigger = ClearStageWithMedals("Stage5", 15)
)

achievement(title = "Empyrean Extra", description = "Clear Stage 6 with 15 or more medals", points = 10, id = 423494,
    trigger = ClearStageWithMedals("Stage6", 15)
)

achievement(title = "Cosmic Cache", description = "Clear Stage 7 with 15 or more medals", points = 10, id = 423495,
    trigger = ClearStageWithMedals("Stage7", 15)
)

achievement(title = "Titan Treasures", description = "Clear Stage 8 with 15 or more medals", points = 10, id = 423496,
    trigger = ClearStageWithMedals("Stage8Begin", 15)
)

achievement(title = "Surplus Ordnance ", description = "Clear any stage with a max bomb bonus", points = 10, id = 423497,
    trigger = ClearStageWithMaxBombs()
)

achievement(title = "Optimum Arms", description = "Upgrade the Vulcan or Laser to max firepower", points = 5, id = 423498,
    trigger = MaxPrimaryWeapon()
)

achievement(title = "Maximum Munitions", description = "Upgrade the Missiles or Homing Missiles to max firepower", points = 5, id = 423499,
    trigger = MaxSecondaryWeapon()
)

achievement(title = "Tame the Dragon", description = "Collect a Miclus for the first time", points = 3, id = 423500,
    trigger = CollectedMiclus()
)

achievement(title = "Solitary Fairy", description = "Collect a Fairy for the first time", points = 10, id = 423501,
    trigger = CollectedFairy()
)

achievement(title = "Airy Fairy", description = "Collect 3 Fairies in the first loop without losing a life", points = 50, id = 423502,
    trigger = Collected3Fairies()
)

achievement(title = "Legendary Fighter", description = "Clear the first loop without using a continue", points = 25, id = 423503,
    trigger = ClearLoopWithRestrictedContinues(0, 1)
)

achievement(title = "Mythic Fighter", description = "Clear the second loop using 3 continues or less", points = 50, id = 423504,
    trigger = ClearLoopWithRestrictedContinues(3, 2)
)

achievement(title = "Eternal", description = "Extend your lives to 4 before the end of the first loop", points = 10, id = 423505,
    trigger = GotExtend(1)
)

achievement(title = "Immortal", description = "Extend your lives to 5 before the end of the first loop", points = 25, id = 423506,
    trigger = GotExtend(2)
)

// ======================================================================= //
// Play Challenge Achievement Definitions
// ======================================================================= //

achievement(title = "Feverish", description = "Score 50000 points or more before the end of the first loop", points = 3, id = 423507,
    trigger = GotScore(50000)
)

achievement(title = "Sweltering", description = "Score 100000 points or more before the end of the first loop", points = 5, id = 423508,
    trigger = GotScore(100000)
)

achievement(title = "Sizzling", description = "Score 250000 points or more before the end of the first loop", points = 10, id = 423509,
    trigger = GotScore(250000)
)

achievement(title = "Scorching", description = "Score 500000 points or more before the end of the first loop", points = 25, id = 423510,
    trigger = GotScore(500000)
)

achievement(title = "Incandescent", description = "Score 1000000 points or more before the end of the first loop", points = 50, id = 423511,
    trigger = GotScore(1000000)
)

// ======================================================================= //
// Boss Achievement Definitions
// ======================================================================= //

achievement(title = "Crushed Spider", description = "Defeat Desert Spider on Stage 1 without losing a life and without using bombs", points = 10, id = 423512,
    trigger = DefeatBossNoDamage("Stage1")
)

achievement(title = "Subdued Fox", description = "Defeat Flying Fox on Stage 2 without losing a life and without using bombs", points = 25, id = 423513,
    trigger = DefeatBossNoDamage("Stage2")
)

achievement(title = "Vanquished Phalanx", description = "Defeat Phalanx MK-III on Stage 3 without losing a life and without using bombs", points = 25, id = 423514,
    trigger = DefeatBossNoDamage("Stage3")
)

achievement(title = "Demolished Gijido", description = "Defeat Gijido on Stage 4 without losing a life and without using bombs", points = 25, id = 423515,
    trigger = DefeatBossNoDamage("Stage4")
)

achievement(title = "Wrecked Land Crown", description = "Defeat Land Crown on Stage 5 without losing a life and without using bombs", points = 25, id = 423516,
    trigger = DefeatBossNoDamage("Stage5")
)

achievement(title = "Abolished Guardian", description = "Defeat Guardian on Stage 6 without losing a life and without using bombs", points = 25, id = 423517,
    trigger = DefeatBossNoDamage("Stage6")
)

achievement(title = "Eradicated Antonov", description = "Defeat Antonov Ma-27 on Stage 7 without losing a life and without using bombs", points = 25, id = 423518,
    trigger = DefeatBossNoDamage("Stage7")
)

achievement(title = "Decimated Doreineji", description = "Defeat Doreineji on Stage 8 without losing a life and without using bombs", points = 50, id = 423519,
    trigger = DefeatBossNoDamage("Stage8Begin")
)

