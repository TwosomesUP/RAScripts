// Alien Syndrome - Leaderboard
// #ID = 10747

// Alien Syndrome - Rich Presence
// #ID = 10747

gameState = byte(0x0002)
round = byte(0x0052)
bossState = byte(0x007d)
scoreScreen = byte(0x0044)
lives = byte(0x0054)
bossHealth = byte(0x0081)
totalItemsCollected = byte(0x0a5f)
remainingHostages = byte(0x0075)

//Game States
gameState_InGame = 0x80

//Valid Round Values
round1 = 0x00
round2 = 0x01
round3 = 0x02
round4 = 0x03
round5 = 0x04
round6 = 0x05
finalRound = 0x06
credits = 0x07

//Score Array
score = [
    low4(0x002c),
    low4(0x002d),
    low4(0x002e),
    low4(0x002f),
    low4(0x0030),
    low4(0x0031),
    low4(0x0032),
]

//Functions
function inGame() => gameState == gameState_InGame

function getScore(){
    return 
        score[0] * 1000000 +
        score[1] * 100000 +
        score[2] * 10000 +
        score[3] * 1000 +
        score[4] * 100 +
        score[5] * 10 +
        score[6]
}

function scoreAttackStart(){
    return
        prev(gameState) != gameState_InGame &&
        gameState == gameState_InGame
}

function scoreAttackCancel(){
    return !inGame()  
}

function scoreAttackSubmit(){
    return
        (prev(lives) != 0 && lives == 0) ||
        (prev(round) == finalRound && round == credits)
}

leaderboard(
    "Score Attack",
    "Get as many points as you can before getting a game over or completing the game",
    scoreAttackStart(),
    scoreAttackCancel(),
    scoreAttackSubmit(),
    getScore(),
    "Value",
    false
)