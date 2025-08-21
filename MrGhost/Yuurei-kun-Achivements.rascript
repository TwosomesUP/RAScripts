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
        "Id": byte(0x2a1)
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
            "Checkpoints": [0, 8, 17],
            "Secrets": {
                "First": [7],
                "Second": [11]
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
            "Checkpoints": [1, 13, 15],
            "Secrets": {
                "First": [9, 10],
                "Second": [16, 17]
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
            "Checkpoints": [0, 10, 14],
            "Secrets": {
                "First": [8],
                "Second": [16]
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
            "Checkpoints": [0, 13, 15],
            "Secrets": {
                "First": [4],
                "Second": [13]
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
            "Checkpoints": [0, 6, 11],
            "Secrets": {
                "First": [9],
                "Second": []
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
            "Checkpoints": [0, 5, 18],
            "Secrets": {
                "First": [5],
                "Second": [18]
            }
        }
    },
    "Stage7": 
    {
        "Yen": 15,
        "Screens": 
        {
            "Bosses": {
                "Mid": 14,
                "End": 21
            },
            "Checkpoints": [1, 9, 15],
            "Secrets": {
                "First": [12, 13],
                "Second": [16, 17]
            }
        }
    },
}

// Helpers

function IsPlaying(){
    state = GetGameState()
    playing = GameStates["Playing"]
    
    return state == playing && 
        IsInGame()
}

function IsInGame(){
    id = GetScreenId()
    intro = ScreenIds["Intro"]
    
    return id < intro
}

function IsGameOver(){
    id = GetScreenId()
    gameOver = ScreenIds["GameOver"]
    
    return id == gameOver
}

function IsInDemo(){
    state = GetGameState()
    playing = GameStates["Playing"]
    gameOver = GameStates["GameOver"]

    return state != playing && state != gameOver
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
    info = GetStageInfo(stage)
    
    screens = info["Screens"]
    checkpoints = screens["Checkpoints"]
    
    condition = IsPlaying() && 
        currentStage == stage &&
        currentYen == prev(currentYen) + 100 
   
    screenCheck = currentScreen >= checkpoints[checkpoint]
    resetScreenCheck = screenCheck
    
    if (checkpoint < 2) 
    {
        screenCheck = screenCheck  &&
            currentScreen < checkpoints[checkpoint + 1]
            
        resetScreenCheck = currentScreen < checkpoints[checkpoint + 1]
    }
    
    reset = never(resetScreenCheck && prev(currentLife) > 0 && currentLife == 0)
       
    return condition && screenCheck && reset
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
    
    count = tally(total, conditions) &&
        never(currentStage != stage) &&
        never(currentScreen == 0 && prev(currentLives) == 0 && currentLives == 2) &&
        never(!IsInGame()) &&
        never(IsInDemo())
            
    return count
}

// Resets pre-checkpoint yen on death/continue
// Resets all when not on stage 1
// Reset all when start is selected on Game Over screen
// Resets all when watching intro, ending, or credits
achievement("test2", "test2", points=1,
trigger = CountCollectedYen(1))

rich_presence_display("Stage: {0} Screen: {1} Yen: {2} Score: {3}",
    rich_presence_value("Stage", Game["Stage"]["Number"]),
    rich_presence_value("Screen", Game["Screen"]["Number"]),
    rich_presence_value("Yen", Player["Yen"]),
    rich_presence_value("Score", Player["Score"], "SCORE")
)
