// Cavern Creatures
// #ID = 31970
// Author: TwosomesUP
// Achievements Script

//===========================================================//
//  Memory Accessors                                         //
//===========================================================//

Game = {
    "State": {
        "InGame": byte(0x5),
        "InDemo": byte(0x2bf)
    },
    "ScreenID": byte(0x2e),
    "StoredScore": (
        low4(0x2c9) + 
        high4(0x2c9) * 10 +
        low4(0x2c8) * 100 + 
        high4(0x2c8) * 1000 +
        low4(0x2c7) * 10000 + 
        high4(0x2c7) * 100000 +
        low4(0x2c6) * 1000000 + 
        high4(0x2c6) * 10000000 +
        low4(0x2c5) * 100000000 + 
        high4(0x2c5) * 1000000000
    )
}

Player = {
    "Fuel": byte(0xc5),
    "Lives": low4(0x17) + high4(0x17) * 10,
    "Collision": byte(0x16),
    "Score": {
        "Zone1": ( 
            low4(0x54f4) + 
            high4(0x54f4) * 10 +
            low4(0x54f3) * 100 + 
            high4(0x54f3) * 1000 +
            low4(0x54f2) * 10000 + 
            high4(0x54f2) * 100000 +
            low4(0x54f1) * 1000000 + 
            high4(0x54f1) * 10000000 +
            low4(0x54f0) * 100000000 + 
            high4(0x54f0) * 1000000000
        ),
        "Zone2": ( 
            low4(0x15af) + 
            high4(0x15af) * 10 +
            low4(0x15ae) * 100 + 
            high4(0x15ae) * 1000 +
            low4(0x15ad) * 10000 + 
            high4(0x15ad) * 100000 +
            low4(0x15ac) * 1000000 + 
            high4(0x15ac) * 10000000 +
            low4(0x15ab) * 100000000 + 
            high4(0x15ab) * 1000000000
        ),
        "Zone3": ( 
            low4(0xd24) + 
            high4(0xd24) * 10 +
            low4(0xd23) * 100 + 
            high4(0xd23) * 1000 +
            low4(0xd22) * 10000 + 
            high4(0xd22) * 100000 +
            low4(0xd21) * 1000000 + 
            high4(0xd21) * 10000000 +
            low4(0xd20) * 100000000 + 
            high4(0xd20) * 1000000000
        ),
    }
}

//===========================================================//
//  Accessor Dictionaries                                    //
//===========================================================//

ScreenIDs = {
    "Zone1": 0x3,
    "Zone2": 0x20,
    "Zone3": 0x18,
    "ZoneEnd": 0x10,
    "ZoneTransition": 0x2,
    "Title": 0x9
}

//===========================================================//
//  Helper Functions                                         //
//===========================================================//

function IsInGame() => Game["State"]["InDemo"] == 0 && Player["Lives"] > 0

function CompletedZone(zone, challenge){
    trigger = IsInGame() && prev(Game["ScreenID"]) == ScreenIDs[zone]
    cleared =  Game["ScreenID"] == ScreenIDs["ZoneTransition"]
    
    if(challenge)
        cleared = trigger_when(cleared)
        
    return trigger && cleared
} 

function AchievedScore(amount){
    return (IsInGame() && Game["ScreenID"] == ScreenIDs["Zone1"] &&
        prev(Player["Score"]["Zone1"]) < amount &&
        Player["Score"]["Zone1"] >= amount &&
        prev(Player["Score"]["Zone1"]) != prev(Game["StoredScore"])) ||
        (IsInGame() && Game["ScreenID"] == ScreenIDs["Zone2"] &&
        prev(Player["Score"]["Zone2"]) < amount &&
        Player["Score"]["Zone2"] >= amount &&
        prev(Player["Score"]["Zone2"]) != prev(Game["StoredScore"])) ||
        (IsInGame() && Game["ScreenID"] == ScreenIDs["Zone3"] &&
        prev(Player["Score"]["Zone3"]) < amount &&
        Player["Score"]["Zone3"] >= amount &&
        prev(Player["Score"]["Zone3"]) != prev(Game["StoredScore"]))
}

function Zone1Challenge(){
    return CompletedZone("Zone1", true) &&
        disable_when(IsInGame() && Game["ScreenID"] == ScreenIDs["Zone1"] && prev(Player["Lives"]) > Player["Lives"], Game["ScreenID"] != ScreenIDs["Zone1"] && Game["ScreenID"] != ScreenIDs["ZoneTransition"]) &&
        disable_when(IsInGame() && Game["ScreenID"] == ScreenIDs["Zone1"] && prev(Player["Fuel"]) >= 0x14 && Player["Fuel"] < 0x14, Game["ScreenID"] != ScreenIDs["Zone1"] && Game["ScreenID"] != ScreenIDs["ZoneTransition"])
}

function Zone2Challenge(){
    return CompletedZone("Zone2", true) &&
        disable_when(repeated(3, IsInGame() && Game["ScreenID"] == ScreenIDs["Zone2"] && prev(Player["Lives"]) > Player["Lives"]), Game["ScreenID"] != ScreenIDs["Zone2"] && Game["ScreenID"] != ScreenIDs["ZoneTransition"])
}

function Zone3Challenge(){
    return CompletedZone("Zone3", true) &&
        disable_when(repeated(3, IsInGame() && Game["ScreenID"] == ScreenIDs["Zone3"] && prev(Player["Lives"]) > Player["Lives"]), Game["ScreenID"] != ScreenIDs["Zone3"] && Game["ScreenID"] != ScreenIDs["ZoneTransition"])
}

//===========================================================//
//  Achievement Definitions                                  //
//===========================================================//

achievement("Cave Crawler", "Survive Zone 1 and clear the Caverns", points = 5, type = "progression", id = 485616,
    trigger = CompletedZone("Zone1", false)
)

achievement("Capital Crusader", "Survive Zone 2 after discovering the Underground City", points = 10, type = "progression", id = 485617,
    trigger = CompletedZone("Zone2", false)
)

achievement("Contraption Conquerer", "Survive Zone 3 after facing the Ultimate Opponent", points = 25, type = "win_condition", id = 485618,
    trigger = CompletedZone("Zone3", false)
)

achievement("Adventurer", "Score 250,000 points or more", points = 5, id = 485619,
    trigger = AchievedScore(250000)
)

achievement("Explorer", "Score 500,000 points or more", points = 10, id = 485620,
    trigger = AchievedScore(500000)
)

achievement("Pathfinder", "Gain an extra life by scoring 1,000,000 points", points = 25, id = 485621,
    trigger = AchievedScore(1000000)
)

achievement("Conservation", "Clear Zone 1 without losing a life and without dropping below 50% fuel", points = 10, id = 485622,
    trigger = Zone1Challenge()
)

achievement("Survival", "Clear Zone 2 without losing more than 3 lives", points = 10, id = 485623,
    trigger = Zone2Challenge()
)

achievement("Perseverance", "Clear Zone 3 without losing more than 3 lives", points = 10, id = 485624,
    trigger = Zone3Challenge()
)
