// Thexder
// #ID = 13709
// Retro Achievements - Achievement Script
// Author: TwosomesUP

//================================================================
// Accessors
//================================================================

Game = {
    "GameOver": byte(0x9c50),
    "Loaded": byte(0x9c51),
    "State": byte(0xf7f0),
    "Level": low4(0xfb04) + low4(0xfb05) * 10
}

Player = {
    "ShieldActive": byte(0xb484),
    "LaserActive": byte(0xfafd),
    "Transformed": byte(0xfaeb),
    "Energy": low4(0xb58c) + low4(0xb58b) * 10 + low4(0xb58a) * 100,
    "MaxEnergy": low4(0xfb06) + low4(0xfb07) * 10 + low4(0xfb08) * 100,
    "Position": word(0xfad8),
    "Score": low4(0xfb37) * 10 + low4(0xfb38) * 100 +
        low4(0xfb39) * 1000 + low4(0xfb3a) * 10000 + low4(0xfb3b) * 100000 +
        low4(0xfb3c) * 1000000 + low4(0xfb3d) * 10000000 + low4(0xfb3e) * 100000000
}

//================================================================
// Helper Functions
//================================================================

function GameIsLoaded() => Game["Loaded"] == 0xf3
function GameStarted() => Game["State"] != 0x80

function IsInGame() => GameIsLoaded() && GameStarted()
function IsGameOver() => Game["GameOver"] == 0xc9
function GotGameOver() => prev(Game["GameOver"]) == 0 && Game["GameOver"] == 0xc9

function PlayerGotGameOver(){
    return IsInGame() &&
        GotGameOver()
}

//================================================================
// Achievement Functions
//================================================================

function ClearedLevel(level){
    return IsInGame() &&
        prev(Game["Level"]) == level &&
        Game["Level"] == level + 1
}

function ReachEnergyLevel(energy){
    return IsInGame() &&
        prev(Player["MaxEnergy"]) < energy &&
        Player["MaxEnergy"] >= energy
}

function DestroyedSpecialEnemy(levels){
    trigger = IsInGame() && any_of(levels, level => Game["Level"] == level)
    score = 2000
    
    if (levels[0] == 1)
        score = 1500

    return IsInGame() &&
        any_of(levels, level => Game["Level"] == level) &&
        Player["Score"] == prev(Player["Score"]) + score
}

function NoShieldClear(){
    return prev(Game["Level"]) > 1 &&
        Game["Level"] == prev(Game["Level"]) + 1 &&
        disable_when(IsInGame() && Game["Level"] > 1 && prev(Player["ShieldActive"]) == 0x00 && Player["ShieldActive"] == 0xff && never(prev(Game["Level"]) != Game["Level"]) && never(!GameIsLoaded()))
}

function MinEnergyClear(){
    return Game["Level"] > 8 &&
        Game["Level"] == prev(Game["Level"]) + 1 &&
        disable_when(IsInGame() && Game["Level"] > 8 && prev(Player["Energy"]) > 100 && Player["Energy"] < 100 && never(prev(Game["Level"]) != Game["Level"]) && never(!GameIsLoaded()))
}

function ShieldKills(){
    return repeated(20, Player["ShieldActive"] > 0 && Player["Score"] > prev(Player["Score"])) &&
        disable_when(IsInGame() && Player["ShieldActive"] > 0 && Player["LaserActive"] == 0xff) &&
        (never(Player["ShieldActive"] == 0) || never(!GameIsLoaded()))
}

//================================================================
// Achievement Definitions - Progression
//================================================================

achievement("[DRAFT] Clear Level 1", "Clear Level 1", points = 5, type = "progression", id = 459544,
    trigger = ClearedLevel(1)
)

achievement("[DRAFT] Clear Level 2", "Clear Level 2", points = 10, type = "progression", id = 459545,
    trigger = ClearedLevel(2)
)

achievement("[DRAFT] Clear Level 3", "Clear Level 3", points = 10, type = "progression", id = 459546,
    trigger = ClearedLevel(3)
)

achievement("[DRAFT] Clear Level 4", "Clear Level 4", points = 10, type = "progression", id = 459547,
    trigger = ClearedLevel(4)
)

achievement("[DRAFT] Clear Level 5", "Clear Level 5", points = 10, type = "progression", id = 459548,
    trigger = ClearedLevel(5)
)

achievement("[DRAFT] Clear Level 6", "Clear Level 6", points = 10, type = "progression", id = 459549,
    trigger = ClearedLevel(6)
)

achievement("[DRAFT] Clear Level 7", "Clear Level 7", points = 10, type = "progression", id = 459550,
    trigger = ClearedLevel(7)
)

achievement("[DRAFT] Clear Level 8", "Clear Level 8", points = 10, type = "progression", id = 459551,
    trigger = ClearedLevel(8)
)

achievement("[DRAFT] Clear Level 9", "Clear Level 9", points = 10, type = "progression", id = 459552,
    trigger = ClearedLevel(9)
)

achievement("[DRAFT] Clear Level 10", "Clear Level 10", points = 10, type = "progression", id = 459553,
    trigger = ClearedLevel(10)
)

achievement("[DRAFT] Clear Level 11", "Clear Level 11", points = 10, type = "progression", id = 459554,
    trigger = ClearedLevel(11)
)

achievement("[DRAFT] Clear Level 12", "Clear Level 12", points = 10, type = "progression", id = 459555,
    trigger = ClearedLevel(12)
)

achievement("[DRAFT] Clear Level 13", "Clear Level 13", points = 10, type = "progression", id = 459556,
    trigger = ClearedLevel(13)
)

achievement("[DRAFT] Clear Level 14", "Clear Level 14", points = 10, type = "progression", id = 459557,
    trigger = ClearedLevel(14)
)

achievement("[DRAFT] Clear Level 15", "Clear Level 15", points = 10, type = "progression", id = 459558,
    trigger = ClearedLevel(15)
)

achievement("[DRAFT] Clear Level 16", "Clear Level 16", points = 25, type = "win_condition", id = 459559,
    trigger = ClearedLevel(16)
)

//================================================================
// Achievement Definitions - Challenges
//================================================================

achievement("[DRAFT] MAX Energy 250", "Increase Max Energy to 250", points = 10, id = 459560,
    trigger = ReachEnergyLevel(250)
)

achievement("[DRAFT] MAX Energy 500", "Increase Max Energy to 500", points = 25, id = 459561,
    trigger = ReachEnergyLevel(500)
)

achievement("[DRAFT] High Value 1", "Find and destroy a high valued enemy on Level 1", points = 5, id = 459562,
    trigger = DestroyedSpecialEnemy([1])
)

achievement("[DRAFT] High Value 2", "Find and destroy a high valued enemy on Level 2", points = 5, id = 459563,
    trigger = DestroyedSpecialEnemy([2])
)

achievement("[DRAFT] High Value 3", "Find and destroy a high valued enemy on either Levels 3 or 4", points = 5, id = 459564,
    trigger = DestroyedSpecialEnemy([3, 4])
)

achievement("[DRAFT] High Value 4", "Find and destroy a high valued enemy on any level between Levels 5 and 8", points = 5, id = 459565,
    trigger = DestroyedSpecialEnemy([5, 6, 7, 8])
)

achievement("[DRAFT] High Value 5", "Find and destroy a high valued enemy on any level between Levels 9 and 11", points = 5, id = 459566,
    trigger = DestroyedSpecialEnemy([9, 10, 11])
)

achievement("[DRAFT] High Value 6", "Find and destroy a high valued enemy on any level between Levels 12 and 14", points = 5, id = 459567,
    trigger = DestroyedSpecialEnemy([12, 13, 14])
)

achievement("[DRAFT] High Value 7", "Find and destroy a high valued enemy on Level 15", points = 5, id = 459656,
    trigger = DestroyedSpecialEnemy([15])
)

achievement("[DRAFT] No Shield", "Clear any level after Level 1 without using the Shield", points = 25, id = 459568,
    trigger = NoShieldClear()
)

achievement("[DRAFT] Minimum Energy", "Clear any level after Level 8 without dropping below 100 Energy", points = 25, id = 459569,
    trigger = MinEnergyClear()
)

achievement("[DRAFT] Shield Kills", "With the Shield active, destroy 20 enemies without firing the Laser on any Level", points = 5, id = 459570,
    trigger = ShieldKills()
)
