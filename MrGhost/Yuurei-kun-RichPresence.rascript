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

function IsWatchingIntro(){
    id = GetScreenId(true)
    intro = ScreenIds["Intro"]
    return id == intro
}

function IsWatchingEnding(){
    id = GetScreenId(true)
    ending = ScreenIds["Ending"]
    
    return id == ending
}

function IsWatchingCredits(){
    id = GetScreenId(true)
    credits = ScreenIds["Credits"]
    
    return id == credits
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

function GetScore(){
    score = Player["Score"]
    return score
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

// Lookups

StageLookup = {
    1: "Hell's Gate",
    2: "Hell's Pit",
    3: "Sanzu River",
    4: "Cave of Spikes",
    5: "Blood Ponds",
    6: "Moat of Flames",
    7: "Confrontation"
}

// Rich Presence Definitions

rich_presence_conditional_display(IsPlaying() && IsInGame(), "Ghost-kun is floating through Stage {0}: {1} | 👻 {2} | ¥ {3} | 🏆 {4}",
    rich_presence_value("Stage", GetStage()),
    rich_presence_lookup("StageLookup", GetStage(), StageLookup),
    rich_presence_value("Lives", GetLives()),
    rich_presence_value("Yen", GetYen()),
    rich_presence_value("Score", GetScore(), "SCORE")
)

rich_presence_conditional_display(!IsPlaying() && IsWatchingIntro(), "Ghost-kun is trying to remember who they are!")

rich_presence_conditional_display(IsPlaying() && IsWatchingEnding(), "Ghost-kun is discovering the truth of who they are!")

rich_presence_conditional_display(IsPlaying() && IsWatchingCredits(), "Ghost-kun is enjoying the credits!")

rich_presence_conditional_display(IsInDemo(), "Ghost-kun is learning the ropes of being a ghost!")

rich_presence_display("Ghost-kun is getting ready to explore depths of Hell!")
