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
        "Id": byte(0x2a2)
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
    "Size": 0x0f,
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
                "Mid": 17,
                "End": 19
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
                "Mid": 14,
                "End": 20
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
                "Mid": 14,
                "End": 19
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
                "Mid": 15,
                "End": 19
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
                "Mid": 11,
                "End": 19
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
                "Mid": 13,
                "End": 19
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
                "Mid": 14,
                "End": 21
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

function IsFightingBoss(){
    id = GetScreenId()
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

function GetScreenId(){
    id = Game["Screen"]["Id"]
    return id
}

function GetStageInfo(stage){
    info = StageInfo["Stage" + stage]
    return info
}

function CollectedYen(stage, checkpoint){
    currentStage = GetStage()
    currentYen = GetYen()
    currentLife = GetLife()
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
   
    screenCheck = currentScreen >= checkpoints[checkpoint] &&
        currentScreen < checkpoints[checkpoint + 1]
        
    lostLifeCheck = prev(currentLife) > 0 && currentLife == 0
    
    resetScreenCheck = currentScreen < checkpoints[checkpoint + 1]
    
    reset = never
        (
            currentStage == stage && 
            lostLifeCheck && 
            (
                resetScreenCheck  || 
                currentScreen == checkpoints[checkpoint + 1] && IsFightingBoss()
            )
        )
       
    return condition && screenCheck && reset
}

function CollectedBonusYen(stage, conditions){  
    info = GetStageInfo(stage)
    currentStage = GetStage()
    currentScreen = GetScreen()
    currentYen = GetYen()
    currentLife = GetLife()
    
    secrets = info["Screens"]["Secrets"]
    
    bonusTimer = Game["Stage"]["BonusTimer"]
    stageCheck = currentStage == stage && bonusTimer > 0
    lostLifeCheck = prev(currentLife) > 0 && currentLife == 0
    
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
                     
                reset = never
                (
                    currentStage == stage && 
                    lostLifeCheck && 
                    (
                        currentScreen < checkpoint  || 
                        currentScreen == checkpoint && IsFightingBoss()
                    )
                ) 
                    
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
        never(!IsInDemo() && currentStage != stage) &&
        never(!IsInDemo() && currentStage == 1 && currentScreen == 0 && prev(currentLives) == 0 && currentLives == 2)
            
    return count
}

// Preserves post-checkpoint yen after death
// Preserves post-checkpoint yen if player continues on Game Over/Title Screen
// Resets pre-checkpoint yen on death/continue
// Resets all when not on stage 1
// Reset all when start is selected on Game Over/Title screen
achievement("Stage 1 - Yen", "Collect 12 or more hidden Yen blocks in Stage 1", points = 3,
    trigger = CountCollectedYen(1)
)

achievement("Stage 2 - Yen", "Collect 7 or more hidden Yen blocks in Stage 2", points = 3,
    trigger = CountCollectedYen(2)
)

achievement("Stage 3 - Yen", "Collect 20 or more hidden Yen blocks in Stage 3", points = 3,
    trigger = CountCollectedYen(3)
)

achievement("Stage 4 - Yen", "Collect 7 or more hidden Yen blocks in Stage 4", points = 3,
    trigger = CountCollectedYen(4)
)

achievement("Stage 5 - Yen", "Collect all 3 hidden Yen blocks in Stage 5", points = 3,
    trigger = CountCollectedYen(5)
)

achievement("Stage 6 - Yen", "Collect 5 or more hidden Yen blocks in Stage 6", points = 3,
    trigger = CountCollectedYen(6)
)

achievement("Stage 7 - Yen", "Collect 14 or more hidden Yen blocks in Stage 7", points = 3,
    trigger = CountCollectedYen(7)
)

rich_presence_display("Stage: {0} Screen: {1} Yen: {2} Score: {3}",
    rich_presence_value("Stage", Game["Stage"]["Number"]),
    rich_presence_value("Screen", Game["Screen"]["Number"]),
    rich_presence_value("Yen", Player["Yen"]),
    rich_presence_value("Score", Player["Score"], "SCORE")
)


