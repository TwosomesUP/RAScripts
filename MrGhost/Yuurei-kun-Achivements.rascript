// Yuurei-kun
// #ID = 34012
// BacklogOddy
// Achievement Script

// Accessors

Game = {
    "Stage": {
        "Number": byte(0x10) + 1,
        "EventFlag": byte(0x2a9),
        "BonusTimer": byte(0x2aa) 
    },
    "Screen": {
        "Number": byte(0x287),
        "Id": byte(0x2a2),
        "AltId": byte(0x2a1)
    },
    "State": byte(0x3af)
}

Player = {
    "Score": ((byte(0x19) * 5) + (byte(0x1a) * 1280)) * 10,
    "Yen": (byte(0x1d) * 5) + (byte(0x1e) * 1280),
    "Lives": byte(0x1f) - 1,
    "Life": byte(0x3a6),
    "Attack": byte(0x28e),
    "Items": {
        "Stopwatch": {
            "Timer": byte(0x2a4)
        },
        "Barrier": {
            "Energy": byte(0x3a0)
        },
        "Refill": {
            "Count": byte(0x3a3)
        }
    }
}

EnemyList = {
    "Start": 0x40,
    "Size": 0x10,
    "Offsets": {
        "Health": 0x06,
        "State": 0x07
    }
}

// Accessor Values

EnemyStates = {
    "Combo": [
        0xc0,
        0xc1,
        0xc2,
        0xc3,
        0xc4
    ]
}

SoundIndices = {
    "YenBlock": 0xd5
}

GameStates = {
    "Playing": 0x00,
    "Demo": 0x87,
    "GameOver": 0x88,
    "Title": 0x80,
    "Menu": 0x98
}

ScreenIds = {
    "Title": 0x00,
    "Stage1": 0x01,
    "Stage2": 0x02,
    "Stage3": 0x03,
    "Stage4": 0x04,
    "Stage5": 0x05,
    "Stage6": 0x06,
    "Stage7": 0x07,
    "MidBoss": 0x08,
    "Boss": 0x09,
    "BossTransition": 0x0a,
    "GameOver": 0x0b,
    "Intro": 0x0c,
    "Ending": 0x0d,
    "Credits": 0x0e
}

StageInfo = {
    "Stage1": 
    {
        "Yen": 12,
        "Screens": 
        {
            "Bosses": {
                "Mid": {
                    "Attacks": 10,
                    "Screen": [17],
                    "Health": [0x46],
                    "UseScreenId": false
                },
                "End": {
                    "Attacks": 14,
                    "Screen": [19],
                    "Health": [0x46],
                    "UseScreenId": false
                }
            },
            "Checkpoints": [0, 8, 17, 19],
            "Secrets": {
                "First": {
                    "AltValue": false,
                    "Checkpoint": 8,
                    "Rooms":[7],
                    "Blocks": [0x556, 0x559]
                },
                "Second": {
                    "AltValue": false,
                    "Checkpoint": 17,
                    "Rooms": [11],
                    "Blocks": [0x59c]
                }
            }
        }
    },
    "Stage2": 
    {
        "Yen": 7,
        "Screens": 
        {
            "Bosses": {
                "Mid": {
                    "Attacks": 16,
                    "Screen": [14],
                    "Health": [],
                    "UseScreenId": true // 0x8 -> 0x2
                },
                "End": {
                    "Attacks": 10,
                    "Screen": [20],
                    "Health": [0xe6],
                    "UseScreenId": false // 0x9 -> 0x0
                }
            },
            "Checkpoints": [1, 12, 14, 20],
            "Secrets": {
                "First": {
                    "AltValue": false,
                    "Checkpoint": 13,
                    "Rooms": [9, 10],
                    "Blocks": []
                },
                "Second": {
                    "AltValue": false,
                    "Checkpoint": 20,
                    "Rooms": [16, 17],
                    "Blocks": [0x53a, 0x55c]
                }
            }
        }
    },
    "Stage3": 
    {
        "Yen": 20,
        "Screens": 
        {
            "Bosses": {
                "Mid": {
                    "Attacks": 14,
                    "Screen": [14],
                    "Health": [0x46],
                    "UseScreenId": false
                },
                "End": {
                    "Attacks": 10,
                    "Screen": [19],
                    "Health": [0x46],
                    "UseScreenId": false
                },
            },
            "Checkpoints": [0, 10, 14, 19],
            "Secrets": {
                "First": {
                    "AltValue": true,
                    "Checkpoint": 10,
                    "Rooms": [8],
                    "Blocks": [0x535]
                },
                "Second": {
                    "AltValue": true,
                    "Checkpoint": 19,
                    "Rooms": [16],
                    "Blocks": [0x569]
                }
            }
        }
    },
    "Stage4": 
    {
        "Yen": 7,
        "Screens": 
        {
            "Bosses": {
                "Mid": {
                    "Attacks": 14,
                    "Screen": [15],
                    "Health": [0x46, 0x56],
                    "UseScreenId": false
                },
                "End": {
                    "Attacks": 18,
                    "Screen": [19],
                    "Health": [0x46],
                    "UseScreenId": false
                }
            },
            "Checkpoints": [0, 13, 15, 19],
            "Secrets": {
                "First": {
                    "AltValue": false,
                    "Checkpoint": 13,
                    "Rooms": [4],
                    "Blocks": []
                },
                "Second": {
                    "AltValue": false,
                    "Checkpoint": 15,
                    "Rooms": [13],
                    "Blocks": [0x549]
                }
            }
        }
    },
    "Stage5": 
    {
        "Yen": 3,
        "Screens": 
        {
            "Bosses": {
                "Skeletons": {
                    "Attacks": 40,
                    "Screen": [1,2,3,5],
                    "Health": [0xc6],
                    "UseScreenId": false
                },
                "Snail": {
                    "Attacks": 14,
                    "Screen": [11],
                    "Health": [0x46],
                    "UseScreenId": false
                },
                "End": {
                    "Attacks": 16,
                    "Screen": [19],
                    "Health": [0x46],
                    "UseScreenId": false
                }
            },
            "Checkpoints": [0, 6, 11, 19],
            "Secrets": {
                "First": {
                    "AltValue": false,
                    "Checkpoint": 11,
                    "Rooms": [9],
                    "Blocks": []
                },
                "Second": {
                    "AltValue": false,
                    "Checkpoint": 19,
                    "Rooms": [],
                    "Blocks": []
                }
            }
        }
    },
    "Stage6": 
    {
        "Yen": 5,
        "Screens": 
        {
            "Bosses": {
                "Mid": {
                    "Attacks": 12,
                    "Screen": [13],
                    "Health": [0x46],
                    "UseScreenId": false
                },
                "End": {
                    "Attacks": 18,
                    "Screen": [19],
                    "Health": [0x46, 0x56],
                    "UseScreenId": false
                }
            },
            "Checkpoints": [0, 9, 13, 19],
            "Secrets": {
                "First": {
                    "AltValue": false,
                    "Checkpoint": 9,
                    "Rooms": [5],
                    "Blocks": [0x55e, 0x595]
                },
                "Second": {
                    "AltValue": false,
                    "Checkpoint": 19,
                    "Rooms": [18],
                    "Blocks": []
                }
            }
        }
    },
    "Stage7": 
    {
        "Yen": 14,
        "Screens": 
        {
            "Bosses": {
                "Mid": {
                    "Attacks": 14,
                    "Screen": [14],
                    "Health": [0x46],
                    "UseScreenId": false
                },
                "End": {
                    "Attacks": 14,
                    "Screen": [21],
                    "Health": [0x46],
                    "UseScreenId": false
                }
            },
            "Checkpoints": [1, 8, 14, 21],
            "Secrets": {
                "First": {
                    "AltValue": false,
                    "Checkpoint": 14,
                    "Rooms": [12, 13],
                    "Blocks": [0x53d, 0x587]
                },
                "Second": {
                    "AltValue": false,
                    "Checkpoint": 21,
                    "Rooms": [16, 17],
                    "Blocks": [0x526, 0x546, 0x576, 0x596]
                }
            }
        }
    },
}

// Helpers

function IsPlaying(){
    state = GetGameState()
    playing = GameStates["Playing"]
    
    return state == playing
}

function IsInGame(){
    id = GetScreenId()
    title = ScreenIds["Title"]
    intro = ScreenIds["Intro"]
    
    return id > title && id < intro
}

function IsGameOver(){
    id = GetScreenId()
    gameOver = ScreenIds["GameOver"]
    
    return id == gameOver
}

function IsInDemo(){
    state = GetGameState()
    demo = GameStates["Demo"]

    return state == demo
}

function IsFightingBoss(alt = false){
    id = GetScreenId(alt)
    boss = ScreenIds["MidBoss"]
    gameOver = ScreenIds["GameOver"]
    return id >= boss && id < gameOver
}

function GetGameState(){
    state = Game["State"]
    return state
}

function GetStage(){
    stage = Game["Stage"]["Number"]
    return stage
}

function GetBonusTimer(){
    timer = Game["Stage"]["BonusTimer"]
    return timer
}

function GetYen(){
    yen = Player["Yen"]
    return yen
}

function GetLife(){
    life = Player["Life"]
    return life
}

function GetLives(){
    lives = Player["Lives"]
    return lives
}

function GetScreen(){
    screen = Game["Screen"]["Number"]
    return screen
}

function GetScreenId(alt = false){
    id = Game["Screen"]["Id"]
    if (alt)
        id = Game["Screen"]["AltId"]
    return id
}

function GetAttackEnergy(){
    energy = Player["Attack"]
    return energy
}

function GetStageInfo(stage){
    info = StageInfo["Stage" + stage]
    return info
}

function CollectedYen(stage, checkpoint){
    currentStage = GetStage()
    currentYen = GetYen()
    currentScreen = GetScreen()
    bonusTimer = Game["Stage"]["BonusTimer"]
    info = GetStageInfo(stage)
    
    screens = info["Screens"]
    checkpoints = screens["Checkpoints"]
    
    condition = IsPlaying() && 
        IsInGame() &&
        currentStage == stage &&
        bonusTimer == 0x00 &&
        currentYen == prev(currentYen) + 100 
   
    checkpointStart = checkpoints[checkpoint]
    checkpointEnd = checkpoints[checkpoint + 1]
    
    screenCheck = currentScreen >= checkpointStart &&
        currentScreen < checkpointEnd

    reset = CheckpointReset(stage, checkpointEnd)
       
    return condition && screenCheck && reset
}

function CollectedBonusYen(stage, conditions){  
    info = GetStageInfo(stage)
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentYen = GetYen()
    
    secrets = info["Screens"]["Secrets"]
    
    bonusTimer = Game["Stage"]["BonusTimer"]
    stageCheck = IsPlaying() && IsInGame() && currentStage == stage && bonusTimer > 0
    
    for secret in secrets {
        rooms = secrets[secret]["Rooms"]
        checkpoint = secrets[secret]["Checkpoint"]
        blocks = secrets[secret]["Blocks"]
        altCheck = secrets[secret]["AltValue"]
        
        roomCount = length(rooms)
        blockCount = length(blocks)
        
        if (roomCount > 0 && blockCount > 0) {
            roomCheck = currentScreen == rooms[0]
            
            if(roomCount > 1)
                roomCheck = currentScreen >= rooms[0] &&
                    currentScreen <= rooms[1]
                    
            for index in range(0, blockCount - 1){
                block = high4(blocks[index])
                blockValue = 0x04
                
                if (altCheck)
                    blockValue = 0x05
                    
                blockCheck = prev(block) == blockValue &&
                    block != blockValue 
                     
                reset = CheckpointReset(stage, checkpoint)
                    
                array_push(conditions, stageCheck && roomCheck && blockCheck && reset)
            }
        }
    }
    
    return conditions
}

function CountCollectedYen(stage){
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentLives = GetLives()
    info = GetStageInfo(stage)
    
    total = info["Yen"]
    screens = info["Screens"]
    checkpoints = screens["Checkpoints"]

    conditions = array_map(range(0, 2), index => CollectedYen(stage, index))
    conditions = CollectedBonusYen(stage, conditions)
    
    count = measured(tally(total, conditions)) &&
        StageReset(stage)
            
    return count
}

function FoundSecrets(stage){
    info = GetStageInfo(stage)
    currentStage = GetStage()
    currentScreen = GetScreen()
    timer = GetBonusTimer()
    currentLife = GetLife()
    
    screens = info["Screens"]
    secrets = screens["Secrets"]
    
    conditions = []
    
    stageCheck = IsPlaying() && IsInGame() && currentStage == stage
    lostLifeCheck = prev(currentLife) > 0 && currentLife == 0
    
    for secret in secrets {
        rooms = secrets[secret]["Rooms"]
        checkpoint = secrets[secret]["Checkpoint"]
        
        roomCount = length(rooms)
        
        if (roomCount > 0) {
            roomCheck = currentScreen == rooms[0]
            
            if (roomCount > 1)
                roomCheck = currentScreen >= rooms[0] &&
                    currentScreen <= rooms[1]
                    
            secretCheck = prev(timer) == 0 && timer > 0
            
            reset = CheckpointReset(stage, checkpoint)
            
            array_push(conditions, stageCheck && roomCheck && secretCheck && reset)
        }
    }
    
    conditionCount = length(conditions)
    
    return measured(tally(conditionCount, conditions)) &&
        StageReset(stage)        
}

function DefeatedBoss(stage, midboss = false, skeleton = false){
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentScreenId = GetScreenId()
    currentEnergy = GetAttackEnergy()
    currentLife = GetLife()
    info = GetStageInfo(stage)
    
    bosses = info["Screens"]["Bosses"]
    boss = bosses["End"]
    disableConditions = []
    
    if (midboss)
        if (stage == 5)
            if (skeleton)
                boss = bosses["Skeletons"]
            else
                boss = bosses["Snail"]
        else
            boss = bosses["Mid"]

    screens = boss["Screen"]
    healths = boss["Health"]
    useScreenId = boss["UseScreenId"]
    attackCount = boss["Attacks"]
    
    stageCheck = IsPlaying()
    
    bossScreen = screens[0]
    
    if (skeleton)
        bossScreen = screens[3]
        
    screenCheck = currentScreen == bossScreen
       
    if (useScreenId)
        deathCheck = prev(IsFightingBoss()) && currentScreenId < 0x08
    else 
    {
        screenCheck = screenCheck
        health = sum_of(healths, h => byte(h))
        deathCheck = prev(health) > 0 && health == 0
    }
    
    defeatedCheck = stageCheck && 
        currentLife > 0
        
    defeatedTrigger = IsFightingBoss(true) &&
        screenCheck && 
        trigger_when(deathCheck)
        
    if (stage == 2 && midboss)
        defeatedTrigger = screenCheck &&
            trigger_when(deathCheck)
    
    if (stage == 5 && skeleton)
        defeatedTrigger = IsFightingBoss(true) &&
            currentScreen < bossScreen + 1 &&
            trigger_when(screenCheck && deathCheck)
          
    defeatedCheck = defeatedCheck &&
        defeatedTrigger
        
    for screen in screens {
        attackCheck = prev(currentEnergy) > currentEnergy
        
        screenCheck = currentScreen == screen
            
        condition = stageCheck && screenCheck && IsFightingBoss(true) && IsFightingBoss() && attackCheck
        array_push(disableConditions, condition)
    }
    
    return defeatedCheck &&
        disable_when(tally(attackCount + 1, disableConditions)) &&
        BossReset(stage, bossScreen)
}

function ClearedStage(stage){
    currentStage = GetStage()
    currentScreenId = GetScreenId(true)
    
    endingId = ScreenIds["Ending"]
    creditsId = ScreenIds["Credits"]
    
    clearedCheck = prev(currentStage) == stage &&
        currentStage == stage + 1
        
    if (stage == 7)
        clearedCheck = currentStage == stage &&
            prev(currentScreenId) == endingId &&
            currentScreenId == creditsId
    
    return IsPlaying() && clearedCheck 
}

function GotStockedYen(amount){
    currentYen = GetYen()
    
    return IsPlaying() &&
        IsInGame() &&
        prev(currentYen) < amount &&
        currentYen >= amount
}

function GotComboCount(){
    enemyCount = 24
    
    trigger = IsPlaying() &&
        IsInGame()
        
    return trigger &&
        any_of(range(0, enemyCount - 1), index => CheckEnemyCombo(index))
}

function CheckEnemyCombo(index){
    list = EnemyList
    start = list["Start"]
    size = list["Size"]
    stateOffset = list["Offsets"]["State"]
    
    enemyAddress = start + (index * size)
    stateAddress = enemyAddress + stateOffset
    
    enemyState = byte(stateAddress)
    
    return prev(enemyState) == 0xc3 &&
        enemyState == 0xc4
}

function CollectedStopwatch(){
    timer = Player["Items"]["Stopwatch"]["Timer"]
    
    return IsPlaying() && IsInGame() &&
        prev(timer) < timer
}

function CollectedHeart(){
    life = GetLife()
    
    return IsPlaying() && IsInGame() &&
        prev(life) < life
}

function CollectedBarrier(){
    energy = Player["Items"]["Barrier"]["Energy"]
    
    return IsPlaying() && IsInGame() &&
        prev(energy) < energy
}

function CollectedRefill() {
    count = Player["Items"]["Refill"]["Count"]
    
    return IsPlaying() && IsInGame() &&
        prev(count) < count
}

function CollectedRefill2() {
    count = Player["Items"]["Refill"]["Count"]
    
    return IsPlaying() && IsInGame() &&
        prev(count) == 1 &&
        count == 2
}

function AcquiredOchokotama1(){
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentScreenId = GetScreenId()
    
    info = GetStageInfo(2)
    
    boss = info["Screens"]["Bosses"]["Mid"]
    bossScreen = boss["Screen"][0]
    deathCheck = prev(IsFightingBoss()) && currentScreenId < 0x08
    
    return IsPlaying() &&
        currentScreen == bossScreen &&
        deathCheck
}

function AcquiredOchokotama2(){
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentScreenId = GetScreenId()
    
    info = GetStageInfo(4)
    
    boss = info["Screens"]["Bosses"]["Mid"]
    bossScreen = boss["Screen"][0]
    health = sum_of(boss["Health"], h => byte(h))
    deathCheck = prev(health) > 0 && health == 0
    
    return IsPlaying() &&
        IsFightingBoss() &&
        currentScreen == bossScreen &&
        deathCheck
}

function CheckpointReset(stage, checkpoint){
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentLife = GetLife()
    
    stageCheck = currentStage == stage
    lostLifeCheck = prev(currentLife) > 0 && currentLife == 0
    screenCheck = currentScreen < checkpoint
    bossCheck = currentScreen == checkpoint && IsFightingBoss()
    
    return never
    (
        stageCheck &&
        lostLifeCheck &&
        (
            screenCheck ||
            bossCheck
        )
    )
}

function BossReset(stage, screen){
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentLife = GetLife()
    
    stageCheck = currentStage == stage
    notInStage = currentStage != stage
    lostLifeCheck = prev(currentLife) > 0 && currentLife == 0
    
    return 
    (
        always_false() || 
        (
            never(stageCheck && lostLifeCheck) &&
            never(notInStage)
        )
    )
}

function StageReset(stage){
    currentStage = GetStage()
    currentLives = GetLives()
    currentScreen = GetScreen()
    
    return never(!IsInDemo() && currentStage != stage) &&
        never(!IsInDemo() && currentStage == 1 && currentScreen == 0 && prev(currentLives) == 0 && currentLives == 2)
}

// Achievement Functions

// Stage 1

function Stage1_Yen(){
    return CountCollectedYen(1)
}

function Stage1_Secrets(){
    return FoundSecrets(1)
}

function Stage1_MidBoss(){
    return DefeatedBoss(1, true)
}

function Stage1_Boss(){
    return DefeatedBoss(1)
}

function Stage1_Clear(){
    return ClearedStage(1)
}

// Stage 2

function Stage2_Yen(){
    return CountCollectedYen(2)
}

function Stage2_Secrets(){
    return FoundSecrets(2)
}

function Stage2_MidBoss(){
    return DefeatedBoss(2, true)
}

function Stage2_Boss(){
    return DefeatedBoss(2)
}

function Stage2_Clear(){
    return ClearedStage(2)
}

// Stage 3

function Stage3_Yen(){
    return CountCollectedYen(3)
}

function Stage3_Secrets(){
    return FoundSecrets(3)
}

function Stage3_MidBoss(){
    return DefeatedBoss(3, true)
}

function Stage3_Boss(){
    return DefeatedBoss(3)
}

function Stage3_Clear(){
    return ClearedStage(3)
}

// Stage 4

function Stage4_Yen(){
    return CountCollectedYen(4)
}

function Stage4_Secrets(){
    return FoundSecrets(4)
}

function Stage4_MidBoss(){
    return DefeatedBoss(4, true)
}

function Stage4_Boss(){
    return DefeatedBoss(4)
}

function Stage4_Clear(){
    return ClearedStage(4)
}

// Stage 5

function Stage5_Yen(){
    return CountCollectedYen(5)
}

function Stage5_Secrets(){
    return FoundSecrets(5)
}

function Stage5_MidBoss1(){
    return DefeatedBoss(5, true, true)
}

function Stage5_MidBoss2(){
    return DefeatedBoss(5, true)
}

function Stage5_Boss(){
    return DefeatedBoss(5)
}

function Stage5_Clear(){
    return ClearedStage(5)
}

// Stage 6

function Stage6_Yen(){
    return CountCollectedYen(6)
}

function Stage6_Secrets(){
    return FoundSecrets(6)
}

function Stage6_MidBoss(){
    return DefeatedBoss(6, true)
}

function Stage6_Boss(){
    return DefeatedBoss(6)
}

function Stage6_Clear(){
    return ClearedStage(6)
}

// Stage 7

function Stage7_Yen(){
    return CountCollectedYen(7)
}

function Stage7_Secrets(){
    return FoundSecrets(7)
}

function Stage7_MidBoss(){
    return DefeatedBoss(7, true)
}

function Stage7_Boss(){
    return DefeatedBoss(7)
}

function Stage7_Clear(){
    return ClearedStage(7)
}

// Other

function Other_YenChallenge(){
    return GotStockedYen(2000)
}

function Other_ComboChallenge(){
    return GotComboCount()
}

function Other_Stopwatch(){
    return CollectedStopwatch()
}

function Other_Heart(){
    return CollectedHeart()
}

function Other_Barrier(){
    return CollectedBarrier()
}

function Other_AttackRefill1(){
    return CollectedRefill()
}

function Other_AttackRefill2(){
    return CollectedRefill2()
}

function Other_Ochokotama1(){
    return AcquiredOchokotama1()
}

function Other_Ochokotama2(){
    return AcquiredOchokotama2()
}

// Reset Conditions:
// Preserves post-checkpoint yen after death
// Preserves post-checkpoint yen if player continues on Game Over/Title Screen
// Resets pre-checkpoint yen on death/continue
// Resets all when not on stage 1
// Reset all when start is selected on Game Over/Title screen


// Achievement Definitions

// Stage 1

achievement("Phantom Fortune", "Collect 12 or more hidden Yen blocks in Stage 1", points = 3, id = 539843,
    trigger = Stage1_Yen()
)

achievement("Icing on the Cake", "Find 2 hidden bonus rooms in Stage 1", points = 3, id = 539844,
    trigger = Stage1_Secrets()
)

achievement("Rainbow Roll", "Defeat the Mid-Boss on Stage 1 using 10 or less attack energy", points = 5, id = 539845,
    trigger = Stage1_MidBoss()
)

achievement("Onimaki", "Defeat the Boss on Stage 1 using 14 or less attack energy", points = 5, id = 539846,
    trigger = Stage1_Boss()
)

achievement("Hell's Gate", "Clear Stage 1", points = 3, type = "progression", id = 539847,
    trigger = Stage1_Clear()
)

// Stage 2

achievement("Wraith Riches", "Collect 7 or more hidden Yen blocks in Stage 2", points = 3, id = 539848,
    trigger = Stage2_Yen()
)

achievement("Lucky Streak", "Find 2 hidden bonus rooms in Stage 2", points = 3, id = 539849,
    trigger = Stage2_Secrets()
)

achievement("Sashimi", "Defeat the Mid-Boss on Stage 2 using 16 or less attack energy", points = 5, id = 539850,
    trigger = Stage2_MidBoss()
)

achievement("Uramaki", "Defeat the Boss on Stage 2 using 10 or less attack energy", points = 5, id = 539851,
    trigger = Stage2_Boss()
)

achievement("Hell's Pit", "Clear Stage 2", points = 3, type = "progression", id = 539852,
    trigger = Stage2_Clear()
)

// Stage 3

achievement("Banshee Bucks", "Collect 20 or more hidden Yen blocks in Stage 3", points = 3, id = 539853,
    trigger = Stage3_Yen()
)

achievement("Get a Leg Up", "Find 2 hidden bonus rooms in Stage 3", points = 3, id = 539854,
    trigger = Stage3_Secrets()
)

achievement("Futomaki", "Defeat the Mid-Boss on Stage 3 using 14 or less attack energy", points = 5, id = 539855,
    trigger = Stage3_MidBoss()
)

achievement("Uni-don", "Defeat the Boss on Stage 3 using 10 or less attack energy", points = 5, id = 539856,
    trigger = Stage3_Boss()
)

achievement("Sanzu River", "Clear Stage 3", points = 3, type = "progression", id = 539857,
    trigger = Stage3_Clear()
)

// Stage 4

achievement("Goulish Gold", "Collect 7 or more hidden Yen blocks in Stage 4", points = 3, id = 539858,
    trigger = Stage4_Yen()
)

achievement("Hit the Jackpot", "Find 2 hidden bonus rooms in Stage 4", points = 3, id = 539859,
    trigger = Stage4_Secrets()
)

achievement("Kappa Maki", "Defeat the Mid-Boss on Stage 4 using 14 or less attack energy", points = 5, id = 539860,
    trigger = Stage4_MidBoss()
)

achievement("Spider Roll", "Defeat the Boss on Stage 4 using 18 or less attack energy", points = 5, id = 539861,
    trigger = Stage4_Boss()
)

achievement("Cave of Spikes", "Clear Stage 4", points = 5, type = "progression", id = 539862,
    trigger = Stage4_Clear()
)

// Stage 5

achievement("Poltergeist Pennies", "Collect all 3 hidden Yen blocks in Stage 5", points = 3, id = 539863,
    trigger = Stage5_Yen()
)

achievement("Coming Up Roses", "Find the hidden bonus room in Stage 5", points = 3, id = 539864,
    trigger = Stage5_Secrets()
)

achievement("Aji Sashimi", "Defeat all 4 of the skeleton Mid-Bosses on Stage 5 using 40 or less attack energy", points = 10, id = 539865,
    trigger = Stage5_MidBoss1()
)

achievement("Tsubugai Sushi", "Defeat the snail Mid-Boss on Stage 5 using 14 or less attack energy", points = 5, id = 539866,
    trigger = Stage5_MidBoss2()
)

achievement("Spicy California Roll", "Defeat the Boss on Stage 5 using 16 or less attack energy", points = 5, id = 539867,
    trigger = Stage5_Boss()
)

achievement("Blood Ponds", "Clear Stage 5", points = 5, type = "progression", id = 539868,
    trigger = Stage5_Clear()
)

// Stage 6

achievement("Specter Silver", "Collect 5 or more hidden Yen blocks in Stage 6", points = 3, id = 539869,
    trigger = Stage6_Yen()
)

achievement("In the Groove", "Find 2 hidden bonus rooms in Stage 6", points = 3, id = 539870,
    trigger = Stage6_Secrets()
)

achievement("Revolving Sushi", "Defeat the Mid-Boss on Stage 6 using 12 or less attack energy", points = 5, id = 539871,
    trigger = Stage6_MidBoss()
)

achievement("Dragon Roll", "Defeat the Boss on Stage 6 using 18 or less attack energy", points = 5, id = 539872,
    trigger = Stage6_Boss()
)

achievement("Moat of Flames", "Clear Stage 6", points = 5, type = "progression", id = 539873,
    trigger = Stage6_Clear()
)

// Stage 7

achievement("Haunted Hoard", "Collect 14 or more hidden Yen blocks in Stage 7", points = 3, id = 539874,
    trigger = Stage7_Yen()
)

achievement("Lucky Devil", "Find 2 hidden bonus rooms in Stage 7", points = 3, id = 539875,
    trigger = Stage7_Secrets()
)

achievement("Crispy Eye Roll", "Defeat the Mid-Boss on Stage 7 using 14 or less attack energy", points = 10, id = 539876,
    trigger = Stage7_MidBoss()
)

achievement("Kiwami Omakase", "Defeat the Boss on Stage 7 using 14 or less attack energy", points = 10, id = 539877,
    trigger = Stage7_Boss()
)

achievement("Confrontation", "Clear Stage 7", points = 10, type = "win_condition", id = 539878,
    trigger = Stage7_Clear()
)

// Other

achievement("Deep Pockets", "Have a stock of 2000 or more Yen", points = 5, id = 539879,
    trigger = Other_YenChallenge()
)

achievement("Well Oiled Machine", "Achieve a combo of 16x by defeating multiple enemies at once", points = 3, id = 539880,
    trigger = Other_ComboChallenge()
)

achievement("Kill Time", "Find and purchase a Stopwatch, and freeze all enemies in their tracks", points = 3, id = 539881,
    trigger = Other_Stopwatch()
)

achievement("Lock, Stock, and Barrel", "Find and purchase a Heart, and refill your health", points = 3, id = 539882,
    trigger = Other_Heart()
)

achievement("Play it Safe", "Find and purchase a Barrier, and temporarily protect yourself from damage", points = 3, id = 539883,
    trigger = Other_Barrier()
)

achievement("Extra Padding", "Find and purchase an Attack Refill", points = 3, id = 539884,
    trigger = Other_AttackRefill1()
)

achievement("All Decked Out", "Have a stock of 2 Attack Refills", points = 5, id = 539885,
    trigger = Other_AttackRefill2()
)

achievement("Two's Company", "Acquire a second Ochokotama Ball", points = 4, id = 539886,
    trigger = Other_Ochokotama1()
)

achievement("Three's a Party", "Acquire a third Ochokotama Balls", points = 5, id = 539887,
    trigger = Other_Ochokotama2()
)

// Rich Presence Definitions

rich_presence_display("Stage: {0} Screen: {1} Yen: {2} Score: {3}",
    rich_presence_value("Stage", Game["Stage"]["Number"]),
    rich_presence_value("Screen", Game["Screen"]["Number"]),
    rich_presence_value("Yen", Player["Yen"]),
    rich_presence_value("Score", Player["Score"], "SCORE")
)
