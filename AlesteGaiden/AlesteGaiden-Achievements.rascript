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

// Achievement Helpers

// Achievement Definitions

// Round 1

achievement("Intro", "Watch the intro cutscene to the end", points = 1,
    trigger = always_false()
)

achievement("Round 1 - Clear", "Clear Round 1", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Round 1 - Boss Challenge", "Defeat the Round 1 boss without dying", points = 5,
    trigger = always_false()
)

// Round 2

achievement("Round 2 - Clear", "Clear Round 2", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Round 2 - Boss Challenge", "Defeat the Round 2 boss without dying", points = 5,
    trigger = always_false()
)

// Round 3

achievement("Round 3 - Clear", "Clear Round 3", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Round 3 - Boss Challenge", "Defeat the Round 3 boss without dying", points = 5,
    trigger = always_false()
)

// Round 4

achievement("Round 4 - Clear", "Clear Round 4", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Round 4 - Boss Challenge", "Defeat the Round 4 boss without dying", points = 5,
    trigger = always_false()
)

// Round 5

achievement("Round 5 - Clear", "Clear Round 5", points = 5, type = "win_condition",
    trigger = always_false()
)

achievement("Round 5 - Boss Challenge", "Defeat the Round 5 boss without dying", points = 10,
    trigger = always_false()
)

achievement("Ending", "Watch the ending cutscene to the end", points = 1,
    trigger = always_false()
)

// Other

achievement("Max Chikara", "Reach maximum power with any Chikara", points = 5,
    trigger = always_false()
)

achievement("Shadow Double", "Collect a Shadow Double", points = 1,
    trigger = always_false()
)

achievement("Double Shadow Double", "Have 2 Shadow Doubles equipped at once", points = 3,
    trigger = always_false()
)

achievement("Max Chikara Doubles", "Reach maximum power for any Chikara while equipped with 2 Shadow Doubles", points = 5,
    trigger = always_false()
)

achievement("10k Points", "Reach a score of 10 thousand points or more", points = 3,
    trigger = always_false()
)

achievement("50k Points", "Reach a score of 50 thousand points or more", points = 5,
    trigger = always_false()
)

achievement("100k Points", "Reach a score of 100 thousand points or more", points = 10,
    trigger = always_false()
)