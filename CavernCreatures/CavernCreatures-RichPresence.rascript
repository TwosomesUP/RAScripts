// Cavern Creatures
// #ID = 31970
// Author: TwosomesUP
// Leaderboards Script

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
//  Functions                                                //
//===========================================================//

function start(){
    return Game["State"]["InDemo"] == 0 && prev(Player["Lives"]) > 0 && Player["Lives"] == 0
}

function value() {
    return 
        max_of
        (
            measured(Player["Score"]["Zone1"], Game["ScreenID"] == ScreenIDs["Zone1"]),
            measured(Player["Score"]["Zone2"], Game["ScreenID"] == ScreenIDs["Zone2"]),
            measured(Player["Score"]["Zone3"], Game["ScreenID"] == ScreenIDs["Zone3"]),
            measured(Game["StoredScore"])
        )
}

//===========================================================//
//  Rich Presence Definitions                                  //
//===========================================================//

rich_presence_conditional_display(Game["ScreenID"] == ScreenIDs["Zone1"] && Player["Lives"] > 0 && Game["State"]["InDemo"] == 0, "Spelunking in the Caverns | Lives: {0} Score: {1}",
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Score", value())
)

rich_presence_conditional_display(Game["ScreenID"] == ScreenIDs["Zone2"] && Player["Lives"] > 0 && Game["State"]["InDemo"] == 0, "Spelunking in the Underground City | Lives: {0} Score: {1}",
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Score", value())
)

rich_presence_conditional_display(Game["ScreenID"] == ScreenIDs["Zone3"] && Player["Lives"] > 0 && Game["State"]["InDemo"] == 0, "Facing the Ultimate Opponent | Lives: {0} Score: {1}",
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Score", value())
)

rich_presence_conditional_display(Player["Lives"] > 0 && Game["State"]["InDemo"] == 0,"Mapping out the next steps | Lives: {0} Score: {1}",
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_value("Score", value())
)

rich_presence_display("Preparing for the next creature filled spelunking adventure!")



