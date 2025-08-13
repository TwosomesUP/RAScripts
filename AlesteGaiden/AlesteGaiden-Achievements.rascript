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

// Achievement Helpers

function IsInGame(ending = false){
    state = Game["State"]
    inGame = GameStates["InGame"]
    transition = GameStates["EndingTransition2"]
    
    inGameCheck = state == inGame
    
    if (ending)
        inGameCheck = state == transition
    
    return inGameCheck
}

function TriggeredScene(scene){
    index = Game["Scene"]["Index"]
    scenes = Scenes[scene]
    start = scenes["Start"]
    end = scenes["End"]
    state = Game["State"]
    stateId = scenes["State"]
    
    return state == stateId &&
        prev(index) == start &&
        index == end
}

function ClearedRound(round){
    level = Game["Round"]["Level"]
    ending = round == 5
    
    return IsInGame(ending) &&
        prev(level) == round &&
        level == round + 1
}

function DefeatedBoss(round){
    level = Game["Round"]["Level"]
    state = Game["Round"]["State"]
    bossCount = Game["Boss"]["Count"]
    bossState = Game["Boss"]["State"]
    bossDefeated = BossStates["Defeated"]
    bossActive = RoundStates["BossActive"]
    lives = Player["Lives"]
    
    trigger = IsInGame() &&
        level == round &&
        state == bossActive
        
    if (round == 1)
        defeatCheck = trigger_when(prev(bossCount) > 0 && bossCount == 0)
    else
        defeatCheck = trigger_when(prev(bossState) != bossDefeated && bossState == bossDefeated)

    return trigger && 
        defeatCheck &&
        disable_when(trigger && prev(lives) > lives) &&
        (
            always_false() || 
            (
                never(level != round) &&
                never(bossState != bossActive)
            )
        )
}

function MaxedWeapon(){
    weaponPower = Player["Weapon"]["Power"]
    return IsInGame() &&
        prev(weaponPower) < 0x03 &&
        weaponPower == 0x03
}

function EquippedShadow(){
    shadow1 = Player["Shadows"][0]
    shadow2 = Player["Shadows"][1]
    
    return IsInGame() &&
        prev(shadow1) + prev(shadow2) <
        shadow1 + shadow2
}

function EquippedBothShadows(){
    shadow1 = Player["Shadows"][0]
    shadow2 = Player["Shadows"][1]
    
    return IsInGame() &&
        prev(shadow1) + prev(shadow2) < 2 &&
        shadow1 + shadow2 == 2
}

function MaxedEverything(){
    weaponPower = Player["Weapon"]["Power"]
    shadow1 = Player["Shadows"][0]
    shadow2 = Player["Shadows"][1]
    
    weaponTrigger = weaponPower == 0x03 &&
        EquippedBothShadows()
        
    shadowTrigger = shadow1 + shadow2 == 2 &&
        MaxedWeapon()
        
    return IsInGame() && 
        (
            (weaponTrigger) ||
            (shadowTrigger)
        )
}

function AchievedScore(target){
    score = Player["Score"]
    return IsInGame() &&
        prev(score) < target &&
        score >= target
}

// Achievement Definitions

// Round 1

achievement("Intro", "Watch the intro cutscene to the end", points = 1,
    trigger = TriggeredScene("Intro")
)

achievement("Round 1 - Clear", "Clear Round 1", points = 3, type = "progression",
    trigger = ClearedRound(1)
)

achievement("Round 1 - Boss Challenge", "Defeat the Round 1 boss without dying", points = 5,
    trigger = DefeatedBoss(1)
)

// Round 2

achievement("Round 2 - Clear", "Clear Round 2", points = 3, type = "progression",
    trigger = ClearedRound(2)
)

achievement("Round 2 - Boss Challenge", "Defeat the Round 2 boss without dying", points = 5,
    trigger = DefeatedBoss(2)
)

// Round 3

achievement("Round 3 - Clear", "Clear Round 3", points = 3, type = "progression",
    trigger = ClearedRound(3)
)

achievement("Round 3 - Boss Challenge", "Defeat the Round 3 boss without dying", points = 5,
    trigger = DefeatedBoss(3)
)

// Round 4

achievement("Round 4 - Clear", "Clear Round 4", points = 3, type = "progression",
    trigger = ClearedRound(4)
)

achievement("Round 4 - Boss Challenge", "Defeat the Round 4 boss without dying", points = 5,
    trigger = DefeatedBoss(4)
)

// Round 5

achievement("Round 5 - Clear", "Clear Round 5", points = 5, type = "win_condition",
    trigger = ClearedRound(5)
)

achievement("Round 5 - Boss Challenge", "Defeat the Round 5 boss without dying", points = 10,
    trigger = DefeatedBoss(5)
)

achievement("Ending", "Watch the ending cutscene to the end", points = 1,
    trigger = TriggeredScene("Ending")
)

// Other

achievement("Max Chikara", "Reach maximum power with any Chikara", points = 5,
    trigger = MaxedWeapon()
)

achievement("Shadow Double", "Collect a Shadow Double", points = 1,
    trigger = EquippedShadow()
)

achievement("Double Shadow Double", "Have 2 Shadow Doubles equipped at once", points = 3,
    trigger = EquippedBothShadows()
)

achievement("Max Chikara Doubles", "Reach maximum power for any Chikara while equipped with 2 Shadow Doubles", points = 5,
    trigger = MaxedEverything()
)

achievement("10k Points", "Reach a score of 10 thousand points or more", points = 3,
    trigger = AchievedScore(10000)
)

achievement("50k Points", "Reach a score of 50 thousand points or more", points = 5,
    trigger = AchievedScore(50000)
)

achievement("100k Points", "Reach a score of 100 thousand points or more", points = 10,
    trigger = AchievedScore(100000)
)