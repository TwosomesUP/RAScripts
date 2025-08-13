// Aleste Gaiden
// #ID = 34400
// BacklogOddy - Achievement Script

// Accessors

Player = {
    "State": byte(0x800),
    "Lives": byte(0x1080),
    "Sprite": {
        "Index": byte(0x812)
    },
    "Shadows": [
        bit0(0x1013),
        bit1(0x1013)
    ],
    "Weapon": {
        "Type": byte(0x100c),
        "Power": byte(0x100d)
    },
    "Score": word(0x107c) * 100
}

Game = {
    "State": byte(0x71b),
    "Round": {
        "Level": byte(0x100b),
        "State": byte(0x100a)
    },
    "Boss": {
        "Count": byte(0xce2),
        "State": byte(0xce8)
    },
    "Scene": {
        "Index": word(0x1500)
    }
}

// Accessor Dictionaries

GameStates = {
    "InGame": 0x95,
    "Intro": 0x97,
    "Ending": 0x99,
    "EndingTransition1": 0x9f,
    "EndingTransition2": 0xa1
}

PlayerStates = {
    "Active": 0x01,
    "Dead": 0x02
}

BossStates = {
    "Damaged": 0x01,
    "Defeated": 0x03
}

RoundStates = {
    "InStage": 0x00,
    "BossActive": 0x01,
    "NextRound": 0x03,
    "StageGameOver": 0x08,
    "BossGameOver": 0x09,
    "StageContinue": 0x48,
    "BossContinue": 0x49
}

WeaponTypes = {
    "Yellow": 0x00,
    "Blue": 0x01,
    "Red": 0x02
}

Scenes = {
    "Intro": {
        "Start": 0x776f,
        "End": 0x7773,
        "State": 0x97
    },
    "Ending": {
        "Start": 0x5047,
        "End": 0x5058,
        "State": 0x99
    }
}

// RP Lookups

ChikaraLookup = {
    0x00: "🟡◯◯◯",
    0x01: "🟡🟡◯◯",
    0x02: "🟡🟡🟡◯",
    0x03: "🟡🟡🟡🟡",
    0x10: "🔵◯◯◯",
    0x11: "🔵🔵◯◯",
    0x12: "🔵🔵🔵◯",
    0x13: "🔵🔵🔵🔵",
    0x20: "🔴◯◯◯",
    0x21: "🔴🔴◯◯",
    0x22: "🔴🔴🔴◯",
    0x23: "🔴🔴🔴🔴"
}

ShadowLookup = {
    0x01: "👤"
}

// Helpers

function IsOnScreen(screen){
    state = Game["State"]
    screenId = GameStates[screen]
    transition1 = GameStates["EndingTransition1"]
    transition2 = GameStates["EndingTransition2"]
    
    screenCheck = state == screenId
    
    if (screen == "Ending")
        screenCheck = screenCheck ||
            state == transition1 ||
            state == transition2
            
    return screenCheck
}

function GetWeaponAndLevel(){
    weapon = Player["Weapon"]["Type"]
    power = Player["Weapon"]["Power"]
    lookup = weapon * 0x10 + power
    return lookup
}

// RP Definitions

rich_presence_conditional_display(IsOnScreen("Intro"), "Ray is suiting up for his next mission!")
rich_presence_conditional_display(IsOnScreen("InGame"), "Ray is fighting the Vegant in Round {0} | 🖤 {1} | {2} | {3} {4} | 🏆 {5}",
    rich_presence_value("Round", Game["Round"]["Level"]),
    rich_presence_value("Lives", Player["Lives"]),
    rich_presence_lookup("Chikara", GetWeaponAndLevel(), ChikaraLookup),
    rich_presence_lookup("Shadow", Player["Shadows"][0], ShadowLookup, "_"),
    rich_presence_lookup("Shadow", Player["Shadows"][1], ShadowLookup, "_"),
    rich_presence_value("Score", Player["Score"], "SCORE")
)
rich_presence_conditional_display(IsOnScreen("Ending"), "Ray is basking in his victory over the Vegant!")
rich_presence_display("Ray is gearing up to fight the Vegant in Aleste Gaiden!")

