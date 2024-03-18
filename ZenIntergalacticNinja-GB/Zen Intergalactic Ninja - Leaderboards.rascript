// Zen: Intergalactic Ninja - Leaderboards
// #ID = 4213

gameState = byte(0xdee0)

gameState_Splash = 0x00
gameState_Intro = 0x01
gameState_Title = 0x02
gameState_AreaSelect = 0x03
gameState_AreaTransition = 0x05
gameState_InGame = 0x06
gameState_GameOver = 0x07
gameState_StageClear = 0x07
gameState_Bonus = 0x08
gameState_FinalAreaCutscene = 0x09
gameState_BonusFailed = 0x0a
gameState_Ending = 0x0b
gameState_GameOverPassword = 0x0e
gameState_TitlePassword = 0x0f

//
gameScene = byte(0xdee1)

gameScene_Title = 0x02

gameScene_InGame_Start = 0x00
gameScene_InGame_InLevel = 0x01
gameScene_InGame_PreBoss = 0x02
gameScene_InGame_Boss = 0x03
gameScene_InGame_Continue = 0x04

gameScene_GameOver = 0x08

gameScene_StageClear = 0x00

gameScene_Bonus_Start = 0x01
gameScene_Bonus_InLevel = 0x02
gameScene_Bonus_Success = 0x04
gameScene_Bonus_Score = 0x08

gameScene_BonusFailed = 0x03
gameScene_BonusFailed_Score = 0x05

gameScene_Ending = 0x00

//
gameArea = byte(0xdef1)

gameArea_DustArea = 0x00
gameArea_DamArea = 0x01
gameArea_SmogArea = 0x02
gameArea_OilArea = 0x03
gameArea_FinalArea = 0x04

function startedArea(area) => 
    gameArea == area && 
    gameState == gameState_InGame && 
    prev(gameScene) == gameScene_InGame_Start && 
    gameScene == gameScene_InGame_InLevel
    
function finishedArea(area) => 
    gameArea == area && 
    prev(gameState) == gameState_InGame && 
    prev(gameScene) == gameScene_InGame_Boss && 
    gameState == gameState_StageClear && 
    gameScene == gameScene_StageClear
    
    
function finishedGame() => 
    gameArea == gameArea_FinalArea && 
    prev(gameState) == gameState_InGame && 
    prev(gameScene) == gameScene_InGame_Boss && 
    gameState == gameState_Ending && 
    gameScene == gameScene_Ending

gameState_Splash = 0x00
gameState_Intro = 0x01
gameState_Title = 0x02
gameState_AreaSelect = 0x03
gameState_AreaTransition = 0x05
gameState_InGame = 0x06
gameState_GameOver = 0x07
gameState_StageClear = 0x07
gameState_Bonus = 0x08
gameState_FinalAreaCutscene = 0x09
gameState_BonusFailed = 0x0a
gameState_Ending = 0x0b
gameState_GameOverPassword = 0x0e
gameState_TitlePassword = 0x0f    
    
    
function cancel(){
    return
        gameState != gameState_InGame &&
        gameState != gameState_GameOver &&
        gameState != gameState_GameOverPassword &&
        gameState != gameState_StageClear &&
        gameState != gameState_Ending
}   
 
function submitScore(){
    return
        measured(always_true())
}

//Oil Area - Speedrun
leaderboard(
    "Oil Area - Time Attack",
    "Defeat Oil Slick and reach the end of the Oil Area as quickly as possible",
    startedArea(gameArea_OilArea),
    cancel(),
    finishedArea(gameArea_OilArea),
    submitScore(),
    "FRAMES",
    true,
    68473
)

//Dam Area - Speedrun
leaderboard(
    "Dam Area - Time Attack",
    "Defeat Sulfura and reach the end of the Dam Area as quickly as possible",
    startedArea(gameArea_DamArea),
    cancel(),
    finishedArea(gameArea_DamArea),
    submitScore(),
    "FRAMES",
    true,
    68474
)

//Dust Area - Speedrun
leaderboard(
    "Dust Area - Time Attack",
    "Defeat Garbageman and reach the end of the Dust Area as quickly as possible",
    startedArea(gameArea_DustArea),
    cancel(),
    finishedArea(gameArea_DustArea),
    submitScore(),
    "FRAMES",
    true,
    68475
)

//Smog Area - Speedrun
leaderboard(
    "Smog Area - Time Attack",
    "Defeat Smogger and reach the end of the Smog Area as quickly as possible",
    startedArea(gameArea_SmogArea),
    cancel(),
    finishedArea(gameArea_SmogArea),
    submitScore(),
    "FRAMES",
    true,
    68476
)

//Final Area - Speedrun
leaderboard(
    "Final Area - Time Attack",
    "Defeat Lord Contanimous and reach the end of the Final Area as quickly as possible (Final Area code allowed)",
    startedArea(gameArea_FinalArea),
    cancel(),
    finishedGame(),
    submitScore(),
    "FRAMES",
    true,
    68477
)

//Complete Game - Speedrun