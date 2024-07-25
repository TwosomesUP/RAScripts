// In the Hunt
// #ID = 11869
// Author: TwosomesUP
// Retro Achievements - Achievement Script

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
    "Credits": byte(0x112b8),
    "TitleState": byte(0x1128c)
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

ActivePlayers = {
    "P1": bit2(0x11264),
    "P2": bit3(0x11264)
}

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
            "Type": byte(0x11110),
            "Power": byte(0x11112)
        },
        "Secondary": {
            "Type": byte(0x11114),
            "Power": byte(0x11116)
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
    "PrevScore": (
        prev(low4(Pointers["Score"] + Offsets["Score"][2])) * 100 +
        prev(high4(Pointers["Score"] + Offsets["Score"][3])) * 1000 +
        prev(low4(Pointers["Score"] + Offsets["Score"][4])) * 10000 +
        prev(high4(Pointers["Score"] + Offsets["Score"][5])) * 100000 +
        prev(low4(Pointers["Score"] + Offsets["Score"][6])) * 1000000 +
        prev(high4(Pointers["Score"] + Offsets["Score"][7])) * 10000000
    )
    ,
    "RPScore": [
        low4(Pointers["Score"] + Offsets["Score"][2]),
        high4(Pointers["Score"] + Offsets["Score"][3]),
        low4(Pointers["Score"] + Offsets["Score"][4]),
        high4(Pointers["Score"] + Offsets["Score"][5]),
        low4(Pointers["Score"] + Offsets["Score"][6]),
        high4(Pointers["Score"] + Offsets["Score"][7])
    ],
    "EntryScore": (
        low4(Pointers["EntryScore"] + Offsets["Score"][2]) * 100 +
        high4(Pointers["EntryScore"] + Offsets["Score"][3]) * 1000 +
        low4(Pointers["EntryScore"] + Offsets["Score"][4]) * 10000 +
        high4(Pointers["EntryScore"] + Offsets["Score"][5]) * 100000 +
        low4(Pointers["EntryScore"] + Offsets["Score"][6]) * 1000000 +
        high4(Pointers["EntryScore"] + Offsets["Score"][7]) * 10000000
    ),
    "RPEntryScore": [
        low4(Pointers["EntryScore"] + Offsets["Score"][2]),
        high4(Pointers["EntryScore"] + Offsets["Score"][3]),
        low4(Pointers["EntryScore"] + Offsets["Score"][4]),
        high4(Pointers["EntryScore"] + Offsets["Score"][5]),
        low4(Pointers["EntryScore"] + Offsets["Score"][6]),
        high4(Pointers["EntryScore"] + Offsets["Score"][7])
    ],
    "Continues": (low4(Pointers["Score"] + Offsets["Continues"][0]) + high4(Pointers["Score"] + Offsets["Continues"][1]) * 10),
    "EntryContinues": (low4(Pointers["EntryScore"] + Offsets["Continues"][0]) + high4(Pointers["EntryScore"] + Offsets["Continues"][1]) * 10)
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
    "TitleOut": 0x1f,
    "ScoreEntry": 0xc6,
    "HighScores": 0xc7,
    "Rankings": 0xc8,
    "StageResultsIn": 0x24,
    "StageResults": 0x25,
    "StageIntro": 0x22,
    "Ending": 0x35
}

ScreenSubStates = {
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

function IsGameLoaded() => Game["State"] >= 0 && Game["State"] < 5
function IsInGame() => Game["State"] == 2
function IsOnTitle() => Game["State"] == 4 && Game["TitleState"] == 4
function IsInEnding() => Stage["Id"] > 5
function IsInDemo() => Game["TitleState"] == 1
function IsSinglePlayer() => ActivePlayers["P1"] == 1
function IsSecondPlayer() => ActivePlayers["P2"] == 1
function IsMultiplayer() => IsSinglePlayer() && IsSecondPlayer()
function IsFightingBoss() => Screen["ScrollState"] == ScreenScrollTypes["Boss"]
function IsOnResultScreen() => (Screen["State"] == ScreenStates["StageResultsIn"] || Screen["State"] == ScreenStates["StageResults"])
function IsOnNameEntry() => (Screen["State"] == ScreenStates["ScoreEntry"])
function IsOnStageIntro() => Screen["State"] == ScreenStates["StageIntro"]
function IsOnRankings() => Screen["State"] == ScreenStates["Rankings"]

function IsValidSettings(){
    return all_of(ValidSettings, setting => Settings[setting] == ValidSettings[setting])
}

function IsValidSession(checkGameState) {
    result = IsSinglePlayer() && IsValidSettings()
    
    if(checkGameState)
        result = IsInGame() && result
        
    //disable if player 2 is active at any time
    result = result && 
        disable_when(IsSecondPlayer(), IsOnTitle())

    return result
}

function GetActivePrimaryWeapon(){
    return Player["Weapon"]["Primary"]["Type"] + Player["Weapon"]["Primary"]["Power"] * 10
}

function GetActiveSecondaryWeapon(){
    return Player["Weapon"]["Secondary"]["Type"] + Player["Weapon"]["Secondary"]["Power"] * 10
}

function GetDefeatedEnemies(){
    return Stage["Enemies"]["Small"] + Stage["Enemies"]["Large"]
}

function SetStageTimerLimit(time, stage){
    return disable_when(repeated(time, Screen["ScrollState"] != ScreenScrollTypes["Boss"] && Stage["Timer"] < prev(Stage["Timer"])), Stage["Id"] != stage || !IsInGame())
}

function PlayerReachedEnemyGoal(count){
    return GetDefeatedEnemies() >= count
}

function PlayerSubmittedScore(){
    return IsOnNameEntry() && prev(Screen["SubState"]) == ScreenSubStates["NameEntry"] && Screen["SubState"] == ScreenSubStates["NameSubmitted"]
}

function PlayerClearedStage(stage){
    if (stage < 1)
        stage = 1
        
    if (stage > 6)
        stage = 6
        
    return prev(Stage["Id"]) == stage - 1 && Stage["Id"] == stage
}

function PlayerClearedGame(ending){
    StageCheck = Stage["Id"] == 10
    
    if(ending == "2")
        StageCheck = Stage["Id"] == 9
        
    if(ending == "Any")
        StageCheck = (StageCheck || Stage["Id"] == 9)
    
    return (prev(Game["State"]) == 0 && Game["State"] == 4 && StageCheck)
}

function PlayerReachedBoss(challenge){
    BossRoomCheck = Screen["ScrollState"] == ScreenScrollTypes["Boss"]
    
    if(challenge)
        BossRoomCheck = trigger_when(BossRoomCheck)
    
    return prev(Screen["ScrollState"]) != ScreenScrollTypes["Boss"] && BossRoomCheck
}

function PlayerDefeatedBoss(){
    return prev(Stage["Boss"]["Defeated"]) == 0 && Stage["Boss"]["Defeated"] == 1
}

function PlayerDestroyedObjects(count, value){
    return repeated(count, (Player["Score"] - prev(Player["Score"])) == value)
}

function PlayerDestroyedBossParts(count, value){
    return repeated(count, Stage["Boss"]["Defeated"] == 0 && Screen["ScrollState"] == ScreenScrollTypes["Boss"] && (Player["Score"] - prev(Player["Score"])) == value)
}

function PlayerFightingBoss(){
    return Screen["ScrollState"] == ScreenScrollTypes["Boss"]
}

//================================================================
// Achievement Functions
//================================================================

function ClearedStage(stage){
    return IsValidSession(true) && PlayerClearedStage(stage)
}

function ClearedGame(ending, continues){
    ContinueCheck = Player["Continues"] <= continues
    
    if(ending == "1")
        ContinueCheck = Player["Continues"] >= continues
        
    return IsValidSession(false) && ContinueCheck && PlayerClearedGame(ending)
}

function GotExtend(){
    return IsValidSession(true) && prev(Player["TreasureBalls"]) < 100 && Player["TreasureBalls"] >= 100
}

function GotMaxTorpedoes(){
    return IsValidSession(true) && prev(Player["Weapon"]["Primary"]["Power"]) < 3 && Player["Weapon"]["Primary"]["Power"] >= 3
}

function GotMaxMissiles(){
    return IsValidSession(true) && prev(Player["Weapon"]["Secondary"]["Power"]) < 3 && Player["Weapon"]["Secondary"]["Power"] >= 3
}

function GotScore(score){
    return IsValidSession(true) && prev(Player["Score"]) < score && Player["Score"] >= score
}

function DefeatedBossNoDamage(stage){
    if (stage < 1)
        stage = 1
        
    if (stage > 6)
        stage = 6

    return IsValidSession(true) && 
        Stage["Id"] == stage - 1 &&
        Screen["ScrollState"] == ScreenScrollTypes["Boss"] &&
        trigger_when(PlayerDefeatedBoss()) && 
        disable_when(Screen["ScrollState"] == ScreenScrollTypes["Boss"] && Player["Lives"] < prev(Player["Lives"]), Stage["Id"] != stage - 1 || !IsInGame())
}

function CompletedStage1Challenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage1"] &&
        trigger_when(PlayerReachedEnemyGoal(75)) &&
        PlayerReachedBoss(true) &&
        SetStageTimerLimit(120, Stages["Stage1"])
}

function CompletedStage2Challenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage2"] &&
        trigger_when(Stage["Enemies"]["Large"] >= 8) &&
        PlayerReachedBoss(true) &&
        SetStageTimerLimit(120, Stages["Stage2"])
}

//If changed, double check sub source rows.
//May need to update logic manually
function CompletedStage3Challenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage3"] &&
        PlayerDestroyedObjects(50, 200) &&
        PlayerDestroyedObjects(12, 500) &&
        PlayerDestroyedObjects(3, 3000) &&
        PlayerReachedBoss(true) &&
        never(Stage["Id"] != Stages["Stage3"]) &&
        never(!IsInGame())
}

function CompletedStage4Challenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage4"] &&
        prev(Stage["Enemies"]["Large"]) < 2 && Stage["Enemies"]["Large"] >= 2
}

function CompletedStage5Challenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage5"] &&
        trigger_when(tally_of(range(0, 10), 25, 
            count => Stage["Id"] == Stages["Stage5"] &&
                IsInGame() &&
                Player["TreasureBalls"] > prev(Player["TreasureBalls"]) &&
                Player["TreasureBalls"] - prev(Player["TreasureBalls"]) > count
        )) &&
        PlayerReachedBoss(true) &&
        disable_when(Stage["Id"] == Stages["Stage5"] && IsInGame() && Player["Lives"] < prev(Player["Lives"]), Stage["Id"] != Stages["Stage5"] || !IsInGame())
}

function CompletedStage6Challenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage6"] &&
        trigger_when(PlayerReachedEnemyGoal(90)) &&
        PlayerReachedBoss(true) &&
        SetStageTimerLimit(120, Stages["Stage6"])
}

function CompletedStage1BossChallenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage1"] &&
        PlayerFightingBoss() &&
        PlayerDestroyedBossParts(2, 10000) &&
        never(Stage["Id"] != Stages["Stage1"]) &&
        never(!IsInGame())
}

function CompletedStage2BossChallenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage2"] &&
        PlayerFightingBoss() &&
        PlayerDefeatedBoss() &&
        disable_when
        (
            once
            (
                Stage["Boss"]["Defeated"] == 0 && 
                Screen["ScrollState"] == ScreenScrollTypes["Boss"] && 
                (Player["Score"] - prev(Player["Score"])) == 50000
            ) && 
            repeated
            (
                5, 
                Stage["Timer"] < prev(Stage["Timer"])
            ), 
            Stage["Id"] != Stages["Stage2"] || !IsInGame()
        )
}

function CompletedStage3BossChallenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage3"] &&
        PlayerFightingBoss() &&
        PlayerDestroyedBossParts(2, 10000) &&
        never(Stage["Id"] != Stages["Stage3"]) &&
        never(!IsInGame())
}

function CompletedStage6BossChallenge(){
    return IsValidSession(true) &&
        Stage["Id"] == Stages["Stage6"] &&
        PlayerFightingBoss() &&
        Stage["Boss"]["Defeated"] == 0 && 
        Screen["ScrollState"] == ScreenScrollTypes["Boss"] && 
        (Player["Score"] - prev(Player["Score"])) == 100000
}

//================================================================
// Progression Achievement Definitions
//================================================================

achievement("Polar Dip", "Clear Stage 1", points = 2, type = "progression", id = 449278,
    trigger = ClearedStage(1)
)

achievement("Undersea Sweep", "Clear Stage 2", points = 2, type = "progression", id = 449279,
    trigger = ClearedStage(2)
)

achievement("Current Conquest", "Clear Stage 3", points = 2, type = "progression", id = 449280,
    trigger = ClearedStage(3)
)

achievement("Depths Ascendancy", "Clear Stage 4", points = 3, type = "progression", id = 449281,
    trigger = ClearedStage(4)
)

achievement("Abyssal Reign", "Clear Stage 5", points = 3, type = "progression", id = 449282,
    trigger = ClearedStage(5)
)

achievement("Bedrock Bull's-Eye", "Clear Stage 6", points = 3, type = "win_condition", id = 449283,
    trigger = ClearedStage(6)
)

//================================================================
// Play Challenge Achievement Definitions
//================================================================

achievement("Ternary Triumph", "Clear the game using 3 continues or less", points = 10, id = 449284,
    trigger = ClearedGame("Any", 3)
)

achievement("Justice For All", "Clear the game using at least 1 continue and unlock Ending 1", points = 5, id = 449285,
    trigger = ClearedGame("1", 1)
)

achievement("Justice For One", "Clear the game without using a continue and unlock Ending 2", points = 25, id = 449286,
    trigger = ClearedGame("2", 0)
)

achievement("Golden Centuplicate", "Extend your life by collecting 100 Treasure Balls", points = 5, id = 449287,
    trigger = GotExtend()
)

achievement("Frigid Fleetness", "While playing Stage 1, destroy 75 or more enemies and reach the boss in less than 2 minutes", points = 10, id = 449288,
    trigger = CompletedStage1Challenge()
)

achievement("Sunken Swiftness", "While playing Stage 2 destroy 8 or more large subs and reach the boss in less than 2 minutes", points = 10, id = 449289,
    trigger = CompletedStage2Challenge()
)

achievement("Riverbed Rampage", "While playing Stage 3, cause a significant amount of collateral damage before reaching the boss", points = 10, id = 449290,
    trigger = CompletedStage3Challenge()
)

achievement("Scatheless Scales", "While playing Stage 4, kill 2 of the giant fish", points = 10, id = 449291,
    trigger = CompletedStage4Challenge()
)

achievement("Indestructible Dark", "While playing Stage 5, collect 25 or more Treasure Balls and reach the boss without losing a life", points = 10, id = 449292,
    trigger = CompletedStage5Challenge()
)

achievement("Deep Down Dash", "While playing Stage 6, destroy 90 or more enemies and reach the boss in less than 2 minutes", points = 10, id = 449293,
    trigger = CompletedStage6Challenge()
)

achievement("Topped Up Torpedoes", "Upgrade the Torpedoes to max firepower", points = 5, id = 449294,
    trigger = GotMaxTorpedoes()
)

achievement("Maxed Out Missiles", "Upgrade the Missiles to max firepower", points = 5, id = 449295,
    trigger = GotMaxMissiles()
)

//================================================================
// Point Challenge Achievement Definitions
//================================================================

achievement("Down Periscope", "Score 300,000 points or more", points = 10, id = 449296,
    trigger = GotScore(300000)
)

achievement("Hard Dive", "Score 600,000 points or more", points = 25, id = 449297,
    trigger = GotScore(600000)
)

achievement("Going Hot", "Score 900,000 points or more", points = 50, id = 449298,
    trigger = GotScore(900000)
)

//================================================================
// Boss Challenge Achievement Definitions
//================================================================

achievement("Arctic Extermination", "Defeat Argok on Stage 1 without losing a life", points = 10, id = 449299,
    trigger = DefeatedBossNoDamage(1)
)

achievement("Soggy Score", "Defeat Trumpet Release on Stage 2 without losing a life", points = 10, id = 449300,
    trigger = DefeatedBossNoDamage(2)
)

achievement("Aqueduct Overthrow", "Defeat Manriki on Stage 3 without losing a life", points = 25, id = 449301,
    trigger = DefeatedBossNoDamage(3)
)

achievement("Perfect Dark", "Defeat J3 on Stage 4 without losing a life", points = 25, id = 449302,
    trigger = DefeatedBossNoDamage(4)
)

achievement("Midnight Paragon", "Defeat Sogon on Stage 5 without losing a life", points = 25, id = 449303,
    trigger = DefeatedBossNoDamage(5)
)

achievement("Indefectible Depths", "Defeat Yugskure on Stage 6 without losing a life", points = 50, id = 449304,
    trigger = DefeatedBossNoDamage(6)
)

achievement("Anchors Away", "While fighting Argok on Stage 1, expose its innards and gain bonus points by destroying its anchors", points = 10, id = 449305,
    trigger = CompletedStage1BossChallenge()
)

achievement("Two for One", "While fighting Trumpet Release on Stage 2, destroy both subs within 5 seconds of each other", points = 10, id = 449306,
    trigger = CompletedStage2BossChallenge()
)

achievement("Double Fist", "While fighting Manriki on Stage 3, pacify the boss and gain bonus points by destroying both laser reattachment arms", points = 10, id = 449307,
    trigger = CompletedStage3BossChallenge()
)

achievement("On The Nose", "While fighting Yugskure on Stage 6, While fighting Yugskure on Stage 6, gain bonus points by destroying its nose cap before it destroys it itself", points = 10, id = 449308,
    trigger = CompletedStage6BossChallenge()
)


