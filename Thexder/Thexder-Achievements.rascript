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
    "Level": low4(0xfb04) + low4(0xfb05) * 10,
    "Paused": byte(0x87f1)
}

Player = {
    "EnergyCounter": byte(0xb58e),
    "MaxEnergyCounter": byte(0xb58f),
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
function IsPaused() => Game["Paused"] == 0x9d

function CheatUsed() => IsInGame() && IsPaused() && prev(Player["EnergyCounter"]) < Player["EnergyCounter"]
function NoCheats() => disable_when(CheatUsed(), !GameIsLoaded())

function PlayerGotGameOver(){
    return IsInGame() &&
        GotGameOver()
}

//================================================================
// Achievement Functions
//================================================================

function ClearedLevel(level){
    return NoCheats() &&
        IsInGame() &&
        prev(Game["Level"]) == level &&
        Game["Level"] == level + 1
}

/*
function ReachEnergyLevel(energy){
    return IsInGame() &&
        prev(Player["MaxEnergy"]) < energy &&
        Player["MaxEnergy"] >= energy
}
*/

function ReachEnergyLevel(energy){
    return NoCheats() &&
        IsInGame() &&
        prev(Player["MaxEnergyCounter"]) < energy &&
        Player["MaxEnergyCounter"] >= energy
}

function DestroyedSpecialEnemy(level, count){
    score = 2000
    
    if (level == 1)
        score = 1500

    return disable_when(CheatUsed()) &&
        measured(repeated(count, IsInGame() && Game["Level"] == level && Player["Score"] == prev(Player["Score"]) + score && never(Game["Level"] != level))) &&
        (never(!IsInGame()) || always_false())
}

function NoShieldClear(){
    return disable_when(CheatUsed()) && 
        prev(Game["Level"]) > 1 &&
        Game["Level"] == prev(Game["Level"]) + 1 &&
        all_of(range(2, 16), level => 
            disable_when(IsInGame() && Game["Level"] == level && prev(Player["ShieldActive"]) == 0 && Player["ShieldActive"] > 0, prev(Game["Level"]) != level)
        ) &&
        ((never(!GameIsLoaded()) && never(!GameStarted())) || always_false())
}

function MinEnergyClear(){
    return disable_when(CheatUsed()) && 
        prev(Game["Level"]) > 8 &&
        Game["Level"] == prev(Game["Level"]) + 1 &&
        all_of(range(9, 16), level => 
            disable_when(IsInGame() && Game["Level"] == level && prev(Player["EnergyCounter"]) >= 0x32 && Player["EnergyCounter"] < 0x32, prev(Game["Level"]) != level)
        ) &&
        ((never(!GameIsLoaded()) && never(!GameStarted())) || always_false())
}

function ShieldKills(){
    return disable_when(CheatUsed()) && 
        repeated(20, Player["ShieldActive"] > 0 && Player["Score"] > prev(Player["Score"])) &&
        disable_when(IsInGame() && Player["ShieldActive"] > 0 && Player["LaserActive"] == 0xff, Player["ShieldActive"] == 0) &&
        (never(!GameIsLoaded()) && never(IsGameOver()) || always_false())
}

//================================================================
// Achievement Definitions - Progression
//================================================================

achievement("Forbidden Advantage", "Clear Level 1", points = 5, type = "progression", id = 459544,
    trigger = ClearedLevel(1)
)

achievement("Forbidden Bounty", "Clear Level 2", points = 10, type = "progression", id = 459545,
    trigger = ClearedLevel(2)
)

achievement("Forbidden Conquest", "Clear Level 3", points = 10, type = "progression", id = 459546,
    trigger = ClearedLevel(3)
)

achievement("Forbidden Domination", "Clear Level 4", points = 10, type = "progression", id = 459547,
    trigger = ClearedLevel(4)
)

achievement("Forbidden Execution", "Clear Level 5", points = 10, type = "progression", id = 459548,
    trigger = ClearedLevel(5)
)

achievement("Forbidden Feat", "Clear Level 6", points = 10, type = "progression", id = 459549,
    trigger = ClearedLevel(6)
)

achievement("Forbidden Glory", "Clear Level 7", points = 10, type = "progression", id = 459550,
    trigger = ClearedLevel(7)
)

achievement("Forbidden Harmony", "Clear Level 8", points = 10, type = "progression", id = 459551,
    trigger = ClearedLevel(8)
)

achievement("Forbidden Ideal", "Clear Level 9", points = 10, type = "progression", id = 459552,
    trigger = ClearedLevel(9)
)

achievement("Forbidden Jubilation", "Clear Level 10", points = 10, type = "progression", id = 459553,
    trigger = ClearedLevel(10)
)

achievement("Forbidden Knockout", "Clear Level 11", points = 10, type = "progression", id = 459554,
    trigger = ClearedLevel(11)
)

achievement("Forbidden Legend", "Clear Level 12", points = 10, type = "progression", id = 459555,
    trigger = ClearedLevel(12)
)

achievement("Forbidden Miracle", "Clear Level 13", points = 10, type = "progression", id = 459556,
    trigger = ClearedLevel(13)
)

achievement("Forbidden Nonpareil", "Clear Level 14", points = 10, type = "progression", id = 459557,
    trigger = ClearedLevel(14)
)

achievement("Forbidden Obliteration", "Clear Level 15", points = 10, type = "progression", id = 459558,
    trigger = ClearedLevel(15)
)

achievement("Forbidden Prosperity", "Clear Level 16", points = 25, type = "win_condition", id = 459559,
    trigger = ClearedLevel(16)
)

//================================================================
// Achievement Definitions - Challenges
//================================================================

// This would be 0x7D in hex when using the energy counter
achievement("Teeming with Energy", "Increase Max Energy to 250", points = 10, id = 459560,
    // trigger = ReachEnergyLevel(250)
    trigger = ReachEnergyLevel(0x7d)
)

// This would be 0xfa in hex when using the energy counter
achievement("Awash with Energy", "Increase Max Energy to 500", points = 25, id = 459561,
    // trigger = ReachEnergyLevel(500)
    trigger = ReachEnergyLevel(0xfa)
)

achievement("Eradicated", "Find and destroy 1 high valued enemy on Level 1", points = 5, id = 459562,
    trigger = DestroyedSpecialEnemy(1, 1)
)

achievement("Demolished", "Find and destroy 2 high valued enemies on Level 2", points = 5, id = 459563,
    trigger = DestroyedSpecialEnemy(2, 2)
)

achievement("Ravaged", "Find and destroy 1 high valued enemy on Level 3", points = 5, id = 459564,
    trigger = DestroyedSpecialEnemy(3, 1)
)

achievement("Annihilated", "Find and destroy 1 high valued enemy on Level 4", points = 5, id = 459565,
    trigger = DestroyedSpecialEnemy(4, 1)
)

achievement("Shattered", "Find and destroy 12 high valued enemies on Level 5", points = 5, id = 459566,
    trigger = DestroyedSpecialEnemy(5, 12)
)

achievement("Devastated", "Find and destroy 6 high valued enemies on Level 6", points = 5, id = 459567,
    trigger = DestroyedSpecialEnemy(6, 6)
)

achievement("Incinerated", "Find and destroy 5 high valued enemies on Level 7", points = 5, id = 459568,
    trigger = DestroyedSpecialEnemy(7, 5)
)

achievement("Abolished", "Find and destroy 4 high valued enemies on Level 8", points = 5, id = 459569,
    trigger = DestroyedSpecialEnemy(8, 4)
)

achievement("Pulverized", "Find and destroy 3 high valued enemies on Level 9", points = 5, id = 459570,
    trigger = DestroyedSpecialEnemy(9, 3)
)

achievement("Disintegrated", "Find and destroy 4 high valued enemies on Level 11", points = 5, id = 459656,
    trigger = DestroyedSpecialEnemy(11, 4)
)

achievement("Sacked", "Find and destroy 10 high valued enemies on Level 13", points = 5, id = 459874,
    trigger = DestroyedSpecialEnemy(13, 10)
)

achievement("Totaled", "Find and destroy 6 high valued enemies on Level 14", points = 5, id = 459875,
    trigger = DestroyedSpecialEnemy(14, 6)
)

achievement("Felled", "Find and destroy 7 high valued enemies on Level 15", points = 5, id = 459876,
    trigger = DestroyedSpecialEnemy(15, 7)
)

achievement("Profuse Protection", "Clear any level after Level 1 without using the Shield", points = 25, id = 459877,
    trigger = NoShieldClear()
)

// This would be 0x32 in hex if using the energy counter byte
achievement("Energy Efficient", "Clear any level after Level 8 without dropping below 100 Energy", points = 25, id = 459878,
    trigger = MinEnergyClear()
)

achievement("Offensive Safeguards", "With the Shield active, destroy 20 enemies without firing the Laser on any Level", points = 5, id = 459879,
    trigger = ShieldKills()
)