// Mohawk & Headphone Jack
// #ID = 1036

//Game States
function gameState() => byte(0x0000E7)
function screenState() => byte(0x0000EA)
function bossState() => byte(0x0000EB)
function playMode() => byte(0x0000EC)
function menuCursorState() => byte(0x00550E)
function codeDigit1() => low4(0x005556)
function codeDigit2() => low4(0x005559)
function codeDigit3() => low4(0x00555C)
function codeDigit4() => low4(0x00555F)
function codeDigit5() => low4(0x005562)
function codeDigit6() => low4(0x005565)

//Game Properties
function cheats() => word(0x0000E8)

//Game Stats
function collectedCds() => word(0x000300)
function lives() => byte(0x000306)
function health() => byte(0x000308)
function score() => dword(0x00030C)
function volumn() => byte(0x000F57)

//Mega CDs
function megaCdSet1() => byte(0x00031A)
function megaCdSet1Count() => bitcount(0x00031A)
function megaCdSet1Bit0() => bit0(0x00031A)
function megaCdSet1Bit1() => bit1(0x00031A)
function megaCdSet1Bit2() => bit2(0x00031A)
function megaCdSet1Bit3() => bit3(0x00031A)
function megaCdSet1Bit4() => bit4(0x00031A)
function megaCdSet1Bit5() => bit5(0x00031A)
function megaCdSet1Bit6() => bit6(0x00031A)
function megaCdSet1Bit7() => bit7(0x00031A)

function megaCdSet2() => byte(0x00031B)
function megaCdSet2Count() => bitcount(0x00031B)
function megaCdSet2Bit0() => bit0(0x00031B)
function megaCdSet2Bit1() => bit1(0x00031B)
function megaCdSet2Bit1() => bit2(0x00031B)
function megaCdSet2Bit1() => bit3(0x00031B)
function megaCdSet2Bit1() => bit4(0x00031B)
function megaCdSet2Bit1() => bit5(0x00031B)
function megaCdSet2Bit1() => bit6(0x00031B)
function megaCdSet2Bit1() => bit7(0x00031B)

function megaCdSet3() => byte(0x00031C)
function megaCdSet3Count() => bitcount(0x00031C)
function megaCdSet3Bit0() => bit0(0x00031C)
function megaCdSet3Bit1() => bit1(0x00031C)
function megaCdSet3Bit2() => bit2(0x00031C)
function megaCdSet3Bit3() => bit3(0x00031C)
function megaCdSet3Bit4() => bit4(0x00031C)
function megaCdSet3Bit5() => bit5(0x00031C)
function megaCdSet3Bit6() => bit6(0x00031C)
function megaCdSet3Bit7() => bit7(0x00031C)

function megaCdSet4() => byte(0x00031D)
function megaCdSet4Count() => bitcount(0x00031C)
function megaCdSet4Bit0() => bit0(0x00031C)
function megaCdSet4Bit1() => bit1(0x00031C)
function megaCdSet4Bit2() => bit2(0x00031C)
function megaCdSet4Bit3() => bit3(0x00031C)
function megaCdSet4Bit4() => bit4(0x00031C)
function megaCdSet4Bit5() => bit5(0x00031C)
function megaCdSet4Bit6() => bit6(0x00031C)
function megaCdSet4Bit7() => bit7(0x00031C)

function megaCdSet5() => byte(0x00031E)
function megaCdSet6() => byte(0x00031F)

function numberOfPlayers() => byte(0x000f6a)
function activePlayer() => byte(0x000f6c)

//Level Tracking
function level() => byte(0x00032E)
function warpType() => byte(0x000fb8)
function powerUps() => byte(0x000F32)
function hiddenAreaTracker() => word(0x000326)
function resultScreenCdsPercent() => word(0x005516)
function resultScreenBotsPercent() => word(0x005518)
function resultScreenHiddenPercent() => word(0x00551A)

//Boss Helper Functions
function bossDefeated() => prior(bossState()) == 0x03 && bossState() == 0x01
function bossInactive() => bossState() == 0x00
function bossActive() => bossState() == 0x03

//Cheat Helper Functions
function noCheats() => cheats() == 0

//Game State Helper Functions
function inGame() => gameState() == 0x42
function prevNotInGame() => prev(gameState()) != 0x42
function onTitle() => playMode() == 0x80
function priorOnTitle() => prior(playMode()) == 0x80
function notInDemo() => playMode() == 0x00
function gameReset() => playMode() != 0x00
function priorInGame() => prior(gameState()) == 0x42
function onResultScreen() => gameState() == 0x00
function priorOnResultScreen() => prior(gameState()) == 0x00
function stageStarted() => lives() != 0 && level() != 0x0e && priorOnResultScreen() && inGame() && collectedCds() == 0
function stageEnded() => lives() != 0 && score() != 0 && priorInGame() && onResultScreen()
function gameEnded() => priorInGame() && onResultScreen()
function nextStageStarted() => score() > 0 && prev(collectedCds()) > 0 && collectedCds() == 0 && level() < 0x0f && prev(level()) < level()
function paused() => screenState() == 0x2f
function onMap() => screenState() == 0xec
function singlePlayer() => numberOfPlayers() == 0x00
function twoPlayer() => numberOfPlayers() == 0x01

function worldCompleted(currentWorld){
    finalLevels = [1, 3, 5, 7, 9, 11, 13]
    level = finalLevels[currentWorld - 1]
    return
        notInDemo() &&
        noCheats() &&
        level() == level &&
        score() > 0 &&
        bossDefeated() &&
        (priorInGame() && onResultScreen())
}

function foundBonus(stage){
    bonusStage = 0x0f + stage
    cds = [0x03,0x250,0x250,0x250,0x300,0x300,0x300,0x350,0x300,0x350,0x400,0x400,0x300,0x350]
    return
        prior(level()) == stage &&
        level() == bonusStage &&
        collectedCds() >= cds[stage]
}

function foundWarp(stage) => warpType() >= 2 && level() == stage
function gotOneHundredPercent() => resultScreenCdsPercent() == 0x100 || resultScreenBotsPercent() == 0x100 || resultScreenHiddenPercent() == 0x100
function visitedStage(stage) => once(inGame() && level() == stage)

//Menu State Helper Functions
function validMessageCode() => menuCursorState() == 0x03
function validCode() => menuCursorState() == 0x04

function codeEntered(digit1, digit2, digit3, digit4, digit5, digit6){
    return 
        prev(codeDigit1()) == digit1 &&
        prev(codeDigit2()) == digit2 &&
        prev(codeDigit3()) == digit3 &&
        prev(codeDigit4()) == digit4 &&
        prev(codeDigit5()) == digit5 &&
        prev(codeDigit6()) == digit6
}

//Collection Helper Functions
function getMegaCdCount(){ 
    return 
        megaCdSet1Count() + megaCdSet2Count() + 
        megaCdSet3Bit0() + megaCdSet3Bit1() + 
        megaCdSet3Bit2() + megaCdSet3Bit3() + 
        megaCdSet3Bit4() 
}

function prevGetMegaCdCount(){ 
    return 
        prev(megaCdSet1Count()) + prev(megaCdSet2Count()) +
        prev(megaCdSet3Bit0()) + prev(megaCdSet3Bit1()) + 
        prev(megaCdSet3Bit2()) + prev(megaCdSet3Bit3()) + 
        prev(megaCdSet3Bit4())
}

function gotPowerUp(powerValue){
    return
        powerUps() == powerValue &&
        prev(powerUps()) != powerValue
}

//Score attack functions
function scoreAttackStarted(){
    return always_false()
}

function scoreAttackSubmitted(){
    return always_false()
}

leaderboard("Score Attack", "Reach the highest score you can without getting a game over", 
    start = scoreAttackStarted(),
    cancel = always_false(),
    submit = scoreAttackSubmitted(),
    value = score(),
    format = "VALUE",
    lower_is_better = false,
    id = 66609
)

//CD Collection functions
function cdCollectionStarted(){
    return 
        noCheats() &&
        singlePlayer() &&
        priorOnTitle() && notInDemo() &&
        priorOnResultScreen() && inGame() &&
        lives() != 0 && 
        level() == 0x00 && 
        collectedCds() == 0
}

function cdCollectionSubmitted(){
    return 
        gameEnded() &&
        (
            (prior(lives()) != 0x00 && lives() == 0x00) ||
            (level() == 0x0e && bossDefeated() && score() != 0x00 && lives() != 0x00)
        )    
}

function cdCollectionCancel() {
    return gameReset()
}

function cdCollectionAmount(){
    return measured(tally(0, inGame() && prev(collectedCds()) < collectedCds()))
}

leaderboard("CD Collection - Single Player", "Collect as many CDs as you can before getting a game over or completing the game", 
    start = cdCollectionStarted(),
    cancel = cdCollectionCancel(),
    submit = cdCollectionSubmitted(),
    value = cdCollectionAmount(),
    format = "VALUE",
    lower_is_better = false,
    id = 66610
)
