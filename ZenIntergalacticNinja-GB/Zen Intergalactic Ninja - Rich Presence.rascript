// Zen: Intergalactic Ninja - Rich Presence
// #ID = 4213

//On Title Screen
//On Game Over Screen
//Watching Ending
//Area being played
//Area Bonus being played
//Boss being fought
//Current high score
//Continues used?

playerHealth = byte(0xc089)
playerLives = byte(0xdeda)
playerScore = bcd(word_be(0xc38e))

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

GameStateLookup = {
    gameState_Intro: "Watching Intro",
    gameState_Title: "On Title Screen",
    gameState_TitlePassword: "On Title Screen",
    gameState_AreaSelect: "Preparing to save the World",
    gameState_AreaTransition: "Preparing to save the World",
    gameState_GameOver: "Preparing to save the World",
    gameState_GameOverPassword: "Preparing to save the World",
    gameState_FinalAreaCutscene: "Preparing to save the World",
    gameState_Ending: "Watching the ending after saving the World"
}

function notInGame(){
    return
        gameState == gameState_Intro ||
        gameState == gameState_Title ||
        gameState == gameState_TitlePassword
}

gameScene = byte(0xdee1)

gameScene_PreBoss = 0x02
gameScene_Boss = 0x03
gameScene_Continued = 0x09

gameArea = byte(0xdef1)

gameArea_DustArea = 0x00
gameArea_DamArea = 0x01
gameArea_SmogArea = 0x02
gameArea_OilArea = 0x03
gameArea_FinalArea = 0x04

GameAreaLookup = {
    gameArea_DustArea: "Taking out the trash in the Dust Area",
    gameArea_DamArea: "Clarifying the water in the Dam Area",
    gameArea_SmogArea: "Purifying the air in the Smog Area",
    gameArea_OilArea: "Cleaning the mess in the Oil Area",
    gameArea_FinalArea: "Saving the world in the Final Area"
}

AreaBossLookup = {
    gameArea_DustArea: "Fighting Garbageman in the Dust Area",
    gameArea_DamArea: "Fighting Sulfura in the Dam Area",
    gameArea_SmogArea: "Fighting Smogger in the Smog Area",
    gameArea_OilArea: "Fighting Oil Slick in the Oil Area",
    gameArea_FinalArea: "Fighting Lord Contanimous in the Final Area"
}

AreaBonusLookup = {
    gameArea_DustArea: "Collecting cans in the Dust Area Bonus",
    gameArea_DamArea: "Shooting cans in the Dam Area Bonus",
    gameArea_SmogArea: "Clearing the smoke in the Smog Area Bonus",
    gameArea_OilArea: "Saving the seabirds in the Oil Area Bonus"
}

function playingArea(){
    return 
        gameState == gameState_InGame && 
        gameScene != gameScene_Boss
}

function betweenAreas(){
    return
        gameState == gameState_StageClear ||
        gameState == gameState_GameOver ||
        gameState == gameState_GameOverPassword ||
        gameState == gameState_AreaSelect ||
        gameState == gameState_AreaTransition ||
        gameState == gameState_Ending ||
        gameState == gameState_FinalAreaCutscene
}

function inGameOver() {
    return
        gameState == gameState_GameOver ||
        gameState == gameState_GameOverPassword
}

function fightingBoss(){
    return
        gameState == gameState_InGame &&
        gameScene == gameScene_Boss
}

function playingBonus(){
    return
        gameState == gameState_Bonus ||
        gameState == gameState_BonusFailed
}

function continuesUsed(){
    return 
        measured(tally(0, gameState == gameState_GameOver && gameScene == gameScene_Continued))
}

rich_presence_conditional_display(notInGame(), "{0}",
    rich_presence_lookup("GameState", gameState, GameStateLookup)
)

rich_presence_conditional_display(playingArea(), "{0} | Lives: {1} | Score: {2} | Continues Used: {3}",
    rich_presence_lookup("GameArea", gameArea, GameAreaLookup),
    rich_presence_value("Number", playerLives - 1),
    rich_presence_value("Number", playerScore * 100),
    rich_presence_value("Number", continuesUsed())
)

rich_presence_conditional_display(fightingBoss(), "{0} | Lives: {1} | Score: {2} | Continues Used: {3}",
    rich_presence_lookup("Boss", gameArea, AreaBossLookup),
    rich_presence_value("Number", playerLives - 1),
    rich_presence_value("Number", playerScore * 100),
    rich_presence_value("Number", continuesUsed())
)

rich_presence_conditional_display(betweenAreas(), "{0} | Lives: {1} | Score: {2} | Continues Used: {3}",
    rich_presence_lookup("GameState", gameState, GameStateLookup),
    rich_presence_value("Number", playerLives - 1),
    rich_presence_value("Number", playerScore * 100),
    rich_presence_value("Number", continuesUsed())
)

rich_presence_conditional_display(playingBonus(), "{0} | Lives: {1} | Score: {2} | Continues Used: {3}",
    rich_presence_lookup("Bonus", gameArea, AreaBonusLookup),
    rich_presence_value("Number", playerLives - 1),
    rich_presence_value("Number", playerScore * 100),
    rich_presence_value("Number", continuesUsed())
)

rich_presence_display("Playing Zen: Intergalactic Ninja")