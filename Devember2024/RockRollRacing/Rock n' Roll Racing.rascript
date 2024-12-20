// Rock n' Roll Racing
// #ID = 5139

Game = {
    "Difficulty": byte(0x236),
    "World": byte(0x199),
    "Division": byte(0x19a),
    "Races": byte(0x19b),
    "StageFlag": byte(0x197),
    "ResultScreen": byte(0x5),
    "StartRaceSelected": byte(0x4),
    "VsMode": byte(0x21c),
    "WinState": byte(0x198),
    "RacingState": byte(0x17e)
}

Player = {
    "Hero": byte(0x1b0),
    "WeaponUsed": byte(0xd3f),
    "JumpUsed": byte(0xd40),
    "OilUsed": byte(0xd41),
    "PointsAcquired": byte(0x1a8)
}

function MojaveANoWeapons(){
    return Game["VsMode"] == 0 &&
        Game["Difficulty"] >= 1 &&
        Game["World"] == 3 &&
        Game["Division"] == 0 &&
        trigger_when(prev(Game["WinState"]) == 0 && Game["WinState"] == 2) &&
        once(Game["World"] == 3 && Game["Division"] == 0 && Game["Races"] == 0 && prev(Game["RacingState"]) == 0 && Game["RacingState"] == 1) &&
        disable_when(Game["World"] == 3 && Game["Division"] == 0 && prev(Player["WeaponUsed"]) > Player["WeaponUsed"]) &&
        disable_when(Game["World"] == 3 && Game["Division"] == 0 && prev(Player["JumpUsed"]) > Player["JumpUsed"]) &&
        disable_when(Game["World"] == 3 && Game["Division"] == 0 && prev(Player["OilUsed"]) > Player["OilUsed"]) &&
        (never(Game["World"] != 3 && Game["Division"] != 0) || always_false())
}

achievement(
    title = "Who Needs Arms?", points = 25,
    description = "Starting from the first race, beat Mojave Division A without using power ups on Veteran difficulty or higher",
    id = 23494, badge = "176418", published = "6/7/2015 4:03:58 PM", modified = "6/19/2021 9:21:14 PM",
    /* trigger = never(byte(0x000199) <= 2) && never(byte(0x000199) >= 4) && never(byte(0x000D3F) < prev(byte(0x000D3F))) &&
              never(byte(0x000D40) < prev(byte(0x000D40))) && never(byte(0x000D41) < prev(byte(0x000D41))) &&
              once(byte(0x00019B) == 0) && once(byte(0x00019B) == 1) && once(byte(0x0001A8) == 32) &&
              byte(0x000197) == 2 && once(byte(0x0001A8) == 0) && once(byte(0x0001A8) == 32) &&
              unless(byte(0x000005) == 37) && once(byte(0x000004) == 178) && byte(0x00019A) == 0 */
    trigger = MojaveANoWeapons()
)
