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
function megaCdSet2Bit2() => bit2(0x00031B)
function megaCdSet2Bit3() => bit3(0x00031B)
function megaCdSet2Bit4() => bit4(0x00031B)
function megaCdSet2Bit5() => bit5(0x00031B)
function megaCdSet2Bit6() => bit6(0x00031B)
function megaCdSet2Bit7() => bit7(0x00031B)

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
        singlePlayer() &&
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
        megaCdSet1Count() + 
        megaCdSet2Bit0() + megaCdSet2Bit2() +
        megaCdSet2Bit3() + megaCdSet2Bit4() +
        megaCdSet2Bit5() + megaCdSet2Bit6() +
        megaCdSet2Bit7() + 
        megaCdSet3Bit0() + megaCdSet3Bit1() + 
        megaCdSet3Bit2() + megaCdSet3Bit3() + 
        megaCdSet3Bit4()
}

function prevGetMegaCdCount(){ 
    return 
        prev(megaCdSet1Count()) + 
        prev(megaCdSet2Bit0()) + prev(megaCdSet2Bit2()) +
        prev(megaCdSet2Bit3()) + prev(megaCdSet2Bit4()) +
        prev(megaCdSet2Bit5()) + prev(megaCdSet2Bit6()) +
        prev(megaCdSet2Bit7()) + 
        prev(megaCdSet3Bit0()) + prev(megaCdSet3Bit1()) + 
        prev(megaCdSet3Bit2()) + prev(megaCdSet3Bit3()) + 
        prev(megaCdSet3Bit4())
}

function gotPowerUp(powerValue){
    return
        powerUps() == powerValue &&
        prev(powerUps()) != powerValue
}

//Updated logic
achievement(
    title = "Hard Mo'", points = 50,
    description = "Complete the entire game in one sitting (no codes, no warps)",
    id = 321594, badge = "358347", published = "5/25/2023 8:27:51 PM", modified = "5/25/2023 8:27:51 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        visitedStage(0x00) &&
        visitedStage(0x01) &&
        visitedStage(0x02) &&
        visitedStage(0x03) &&
        visitedStage(0x04) &&
        visitedStage(0x05) &&
        visitedStage(0x06) &&
        visitedStage(0x07) &&
        visitedStage(0x08) &&
        visitedStage(0x09) &&
        visitedStage(0x0a) &&
        visitedStage(0x0b) &&
        visitedStage(0x0c) &&
        visitedStage(0x0d) &&
        (level() == 0x0e && bossDefeated() && stageEnded()) &&
        never(gameReset())
)

//Updated logic
achievement(
    title = "Practically Immo'tal", points = 10,
    description = "Max out your lives",
    id = 321556, badge = "358300", published = "5/25/2023 8:27:39 PM", modified = "5/25/2023 8:27:39 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        inGame() &&
        lives() == 9 && prev(lives()) < 9
)

//Updated logic
achievement(
    title = "Jacked!", points = 5,
    description = "Max out your health",
    id = 321557, badge = "359856", published = "5/25/2023 8:27:40 PM", modified = "5/28/2023 8:01:54 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        inGame() &&
        health() == 5 && prev(health()) < 5
)

//Updated logic
achievement(
    title = "Spinal Tapped", points = 2,
    description = "Raise the volume past its max",
    id = 321566, badge = "358310", published = "5/25/2023 8:27:42 PM", modified = "5/25/2023 8:27:42 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        inGame() &&
        paused() &&
        volumn() == 11 && prev(volumn()) < 11
)

//Updated logic
achievement(
    title = "Mo' Secrets", points = 5,
    description = "Find a hidden location in any stage",
    id = 321591, badge = "358344", published = "5/25/2023 8:27:50 PM", modified = "5/25/2023 8:27:50 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        hiddenAreaTracker() > prior(hiddenAreaTracker())
)

//Updated logic
achievement(
    title = "Hundo-P!", points = 25,
    description = "Attain 100% completion in any category on any stage",
    id = 321603, badge = "358356", published = "5/25/2023 8:28:23 PM", modified = "5/25/2023 8:28:23 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        stageEnded() &&
        gotOneHundredPercent()
)

//Codes
//Updated logic
achievement(
    title = "Straight Skippin'", points = 1,
    description = "Activate a level code",
    id = 321565, badge = "358309", published = "5/25/2023 8:27:42 PM", modified = "5/25/2023 8:27:42 PM",
    trigger = 
        onTitle() &&
        validCode() &&
        prev(level()) == 0x00 &&
        level() != 0x00
)
//Updated logic
achievement(
    title = "Shady Business", points = 1,
    description = "Activate a cheat code",
    id = 321554, badge = "358298", published = "5/25/2023 8:27:39 PM", modified = "5/25/2023 8:27:39 PM",
    trigger = 
        onTitle() &&
        validCode() &&
        prev(cheats()) == 0x00 &&
        cheats() != 0x00
)

//Updated format - no need to republish
achievement(
    title = "On the down Mo'", points = 1,
    description = "Activate a secret message code",
    id = 321555, badge = "358299", published = "5/25/2023 8:27:39 PM", modified = "5/28/2023 8:36:23 PM",
    trigger = 
        onTitle() &&
        validMessageCode() &&
        (
            codeEntered(3,1,4,1,5,9) ||
            codeEntered(2,7,1,8,2,8) ||
            codeEntered(2,9,9,7,9,0) ||
            codeEntered(6,6,7,3,0,0) ||
            codeEntered(6,6,2,6,0,0) ||
            codeEntered(9,7,8,0,4,9) ||
            codeEntered(0,0,0,0,4,2) ||
            codeEntered(0,6,5,8,1,6) ||
            codeEntered(0,0,6,5,0,2) ||
            codeEntered(0,0,8,0,8,6) ||
            codeEntered(0,6,8,0,0,0) ||
            codeEntered(0,6,8,0,1,0) ||
            codeEntered(0,6,8,0,2,0) ||
            codeEntered(0,6,8,0,3,0) ||
            codeEntered(0,6,8,0,4,0) ||
            codeEntered(0,8,0,2,8,6) ||
            codeEntered(0,8,0,3,8,6) ||
            codeEntered(0,8,0,4,8,6) ||
            codeEntered(0,6,2,8,6,7) ||
            codeEntered(0,6,2,8,6,8) ||
            codeEntered(0,7,1,0,9,4) ||
            codeEntered(1,1,1,4,6,8) ||
            codeEntered(1,2,1,9,6,7) ||
            codeEntered(1,5,5,2,8,2) ||
            codeEntered(2,6,6,3,4,8) ||
            codeEntered(2,7,4,5,4,3) ||
            codeEntered(3,8,5,9,2,7) ||
            codeEntered(3,9,8,6,5,6) ||
            codeEntered(3,8,9,7,0,6) ||
            codeEntered(7,6,0,2,0,9) ||
            codeEntered(9,2,3,6,7,6) ||
            codeEntered(9,8,3,6,9,6)
        )
)

//Warps
//Logic updated
achievement(
    title = "Hop!", points = 10,
    description = "Found and used the warp on Tropical Caves 1",
    id = 321600, badge = "358353", published = "5/25/2023 8:28:22 PM", modified = "5/25/2023 8:28:22 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x02) &&
        stageEnded()
)
//Logic updated
achievement(
    title = "Skip!", points = 10,
    description = "Found and used the warp on Deep Water 1",
    id = 321587, badge = "358337", published = "5/25/2023 8:27:48 PM", modified = "5/25/2023 8:27:48 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x04) &&
        stageEnded()
)
//Logic updated
achievement(
    title = "Jump!", points = 10,
    description = "Found and used the warp on Deep Water 2",
    id = 321588, badge = "358338", published = "5/25/2023 8:27:49 PM", modified = "5/25/2023 8:27:49 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x05) &&
        stageEnded()
)
//Logic updated
achievement(
    title = "Pounce!", points = 10,
    description = "Found and used the warp on Toast in the Machine 2",
    id = 321601, badge = "358354", published = "5/25/2023 8:28:22 PM", modified = "5/25/2023 8:28:22 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x07) &&
        stageEnded()
)
//Logic updated
achievement(
    title = "Leap!", points = 10,
    description = "Found and used the warp on It Takes Guts 2",
    id = 321589, badge = "358340", published = "5/25/2023 8:27:49 PM", modified = "5/25/2023 8:27:49 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x09) &&
        stageEnded()
)
//Logic updated
achievement(
    title = "Bound!", points = 10,
    description = "Found and used the warp on Getting Warmer 2",
    id = 321602, badge = "358355", published = "5/25/2023 8:28:23 PM", modified = "5/25/2023 8:28:23 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x0b) &&
        stageEnded()
)
//Logic updated
achievement(
    title = "Vault!", points = 10,
    description = "Found and used the warp on Radio-Active 1",
    id = 321590, badge = "358342", published = "5/25/2023 8:27:49 PM", modified = "5/25/2023 8:27:49 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        foundWarp(0x0c) &&
        stageEnded()
)

//Bonuses
//Update logic
achievement(
    title = "Radical!", points = 1,
    description = "Find and explore Scraping the Surface Bonus 1",
    id = 321567, badge = "358311", published = "5/25/2023 8:27:43 PM", modified = "5/25/2023 8:27:43 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x00)
)

//Update logic
achievement(
    title = "Epic!", points = 10,
    description = "Find and explore Scarping the Surface Bonus 2",
    id = 321568, badge = "358312", published = "5/25/2023 8:27:43 PM", modified = "5/25/2023 8:27:43 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x01)
)

//Update logic
achievement(
    title = "Psychedelic!", points = 10,
    description = "Find and explore Tropical Caves Bonus 1",
    id = 321569, badge = "358313", published = "5/25/2023 8:27:43 PM", modified = "5/25/2023 8:27:43 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x02)
)

//Update logic
achievement(
    title = "Tubular!", points = 10,
    description = "Find and explore Tropical Caves Bonus 2",
    id = 321570, badge = "358314", published = "5/25/2023 8:27:43 PM", modified = "5/25/2023 8:27:43 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x03)
)

//Update logic
achievement(
    title = "Bodacious!", points = 10,
    description = "Find and explore Deep Water Bonus 1",
    id = 321571, badge = "358315", published = "5/25/2023 8:27:44 PM", modified = "5/25/2023 8:27:44 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x04)
)

//Update logic
achievement(
    title = "Choice!", points = 10,
    description = "Find and explore Deep Water Bonus 2",
    id = 321572, badge = "358316", published = "5/25/2023 8:27:44 PM", modified = "5/25/2023 8:27:44 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x05)
)

//Update logic
achievement(
    title = "Gnarly!", points = 10,
    description = "Find and explore Toast in the Machine Bonus 1",
    id = 321573, badge = "358317", published = "5/25/2023 8:27:44 PM", modified = "5/25/2023 8:27:44 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x06)
)

//Update logic
achievement(
    title = "Fresh!", points = 10,
    description = "Find and explore Toast in the Machine Bonus 2",
    id = 321574, badge = "358318", published = "5/25/2023 8:27:44 PM", modified = "5/25/2023 8:27:44 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x07)
)

//Update logic
achievement(
    title = "Neato!", points = 10,
    description = "Find and explore It Takes Guts Bonus 1",
    id = 321575, badge = "358319", published = "5/25/2023 8:27:45 PM", modified = "5/25/2023 8:27:45 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x08)
)

//Update logic
achievement(
    title = "Wicked!", points = 10,
    description = "Find and explore It Takes Guts Bonus 2",
    id = 321576, badge = "358320", published = "5/25/2023 8:27:45 PM", modified = "5/25/2023 8:27:45 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x09)
)

//Update logic
achievement(
    title = "Excellent!", points = 10,
    description = "Find and explore Getting Warmer Bonus 1",
    id = 321577, badge = "358321", published = "5/25/2023 8:27:45 PM", modified = "5/25/2023 8:27:45 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x0a)
)

//Update logic
achievement(
    title = "Righteous!", points = 10,
    description = "Find and explore Getting Warmer Bonus 2",
    id = 321578, badge = "358322", published = "5/25/2023 8:27:45 PM", modified = "5/25/2023 8:27:45 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x0b)
)

//Update logic
achievement(
    title = "Outrageous!", points = 25,
    description = "Find and explore Radio-Active Bonus 1",
    id = 321579, badge = "358323", published = "5/25/2023 8:27:46 PM", modified = "5/25/2023 8:27:46 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x0c)
)

//Update logic
achievement(
    title = "Most Triumphant!", points = 25,
    description = "Find and explore Radio-Active Bonus 2",
    id = 321595, badge = "358348", published = "5/25/2023 8:28:21 PM", modified = "5/25/2023 8:28:21 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        foundBonus(0x0d)
)

//Update logic
achievement(
    title = "Morfin' Time - Unicycler", points = 3,
    description = "Find the Burn Rubber Morf power up",
    id = 321558, badge = "358302", published = "5/25/2023 8:27:40 PM", modified = "5/25/2023 8:27:40 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        gotPowerUp(1)
)

//Update logic
achievement(
    title = "Morfin' Time - Aviator", points = 3,
    description = "Find the Flying Morf power up",
    id = 321559, badge = "358303", published = "5/25/2023 8:27:40 PM", modified = "5/25/2023 8:27:40 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        gotPowerUp(2)
)

//Update logic
achievement(
    title = "Morfin' Time - Aquanaut", points = 3,
    description = "Find the Creature from the Ooze Lagoon Morf power up",
    id = 321561, badge = "358305", published = "5/25/2023 8:27:41 PM", modified = "5/25/2023 8:27:41 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        gotPowerUp(3)
)

//Update logic
achievement(
    title = "Morfin' Time - Acrobat", points = 3,
    description = "Find the Spring Morf power up",
    id = 321563, badge = "358307", published = "5/25/2023 8:27:41 PM", modified = "5/25/2023 8:27:41 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        gotPowerUp(4)
)

//Update logic
achievement(
    title = "Morfin' Time - Aeronaut", points = 3,
    description = "Find the Inflate-O-Morf power up",
    id = 321560, badge = "358304", published = "5/25/2023 8:27:41 PM", modified = "5/25/2023 8:27:41 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        gotPowerUp(5)
)

//Update logic
achievement(
    title = "Morfin' Time - Grimpeur", points = 3,
    description = "Find the Suction Morf power up",
    id = 321562, badge = "358306", published = "5/25/2023 8:27:41 PM", modified = "5/25/2023 8:27:41 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        inGame() &&
        notInDemo() &&
        gotPowerUp(6)
)

//updated logic
achievement(
    title = "Gotta Start Somewhere", points = 1,
    description = "Find your first new Music Track",
    id = 321585, badge = "358333", published = "5/25/2023 8:27:48 PM", modified = "5/25/2023 8:27:48 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        inGame() &&
        prevGetMegaCdCount() == 0 &&
        getMegaCdCount() == 1
)

//updated logic
achievement(
    title = "Music Hoarder", points = 10,
    description = "Find 10 Music Tracks",
    id = 321599, badge = "358352", published = "5/25/2023 8:28:22 PM", modified = "5/25/2023 8:28:22 PM",
    trigger = 
        noCheats() &&
        notInDemo() &&
        inGame() &&
        prevGetMegaCdCount() == 9 &&
        measured(getMegaCdCount() == 10, when=singlePlayer())
)

//updated logic
achievement(
    title = "Living Jukebox", points = 25,
    description = "Find All Music Tracks",
    id = 321586, badge = "358335", published = "5/25/2023 8:27:48 PM", modified = "5/25/2023 8:27:48 PM",
    trigger = 
        noCheats() &&
        notInDemo() &&
        inGame() &&
        prevGetMegaCdCount() == 19 &&
        measured(getMegaCdCount() == 20, when=singlePlayer())
)

//Updated logic
achievement(
    title = "Funkiness Restored", points = 25,
    description = "Defeat Headslot and complete the game",
    id = 321598, badge = "358351", published = "5/25/2023 8:28:22 PM", modified = "5/25/2023 8:28:22 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        notInDemo() &&
        level() == 0x0e &&
        bossDefeated() &&
        stageEnded()
)

//Updated logic - adding check for beginning of stage to prevent save state scumming
achievement(
    title = "Bare Minimum", points = 10,
    description = "Complete any stage without collecting a power up",
    id = 321593, badge = "358346", published = "5/25/2023 8:27:50 PM", modified = "5/28/2023 8:11:09 PM",
    trigger = 
        singlePlayer() &&
        noCheats() &&
        level() != 0x0e &&
        once(stageStarted()) &&
        trigger_when(stageEnded()) &&
        disable_when(powerUps() != 0) &&
        (never(gameReset()) || never(nextStageStarted()))
)

//Updated using new logic
achievement(
    title = "Mo'd Down", points = 5,
    description = "Destroy 20 enemies in a single stage without dying",
    id = 321564, badge = "358308", published = "5/25/2023 8:27:42 PM", modified = "5/25/2023 8:27:42 PM",
    trigger = 
        measured(repeated(20, 
                singlePlayer() &&
                notInDemo() &&
                noCheats() &&
                inGame() &&
                bossInactive() &&
                collectedCds() == prev(collectedCds()) && 
                megaCdSet1() == prev(megaCdSet1()) &&
                megaCdSet2() == prev(megaCdSet2()) && 
                megaCdSet3() == prev(megaCdSet3()) && 
                megaCdSet4() == prev(megaCdSet4()) && 
                megaCdSet5() == prev(megaCdSet5()) && 
                megaCdSet6() == prev(megaCdSet6()) && 
                score() > prev(score()))) && 
        disable_when(lives() < prev(lives())) &&
        (never(gameReset()) || never(nextStageStarted()))
)

//Updated using new logic
achievement(
    title = "Nobody messes with the Do!", points = 25,
    description = "Encounter and defeat a boss without taking damage",
    id = 321592, badge = "358345", published = "5/25/2023 8:27:50 PM", modified = "5/25/2023 8:27:50 PM",
    trigger = 
        singlePlayer() &&
        notInDemo() &&
        noCheats() &&
        inGame() &&
        prev(bossState()) == 0x03 &&
        trigger_when(bossState() == 0x01) &&
        disable_when(bossActive() && lives() < prev(lives()), until=(onResultScreen() || bossInactive())) &&
        disable_when(bossActive() && health() < prev(health()), until=(onResultScreen() || bossInactive()))
)

//Updated using new logic
achievement(
    title = "Surfacebound Success", points = 5,
    description = "Completed World 1 - Scraping the Surface",
    id = 321580, badge = "358325", published = "5/25/2023 8:27:46 PM", modified = "5/25/2023 8:27:46 PM",
    trigger = worldCompleted(1)
)


//Updated using new logic
achievement(
    title = "Tropical Triumph", points = 5,
    description = "Completed World 2 - Tropical Caves",
    id = 321581, badge = "358326", published = "5/25/2023 8:27:46 PM", modified = "5/25/2023 8:27:46 PM",
    trigger = worldCompleted(2)
)

//Updated using new logic
achievement(
    title = "Deep Water Deed", points = 5,
    description = "Completed World 3 - Deep Water",
    id = 321596, badge = "358349", published = "5/25/2023 8:28:21 PM", modified = "5/25/2023 8:28:21 PM",
    trigger = worldCompleted(3)
)

//Updated using new logic
achievement(
    title = "Toasty Touch", points = 5,
    description = "Completed World 4 - Toast in the Machine",
    id = 321582, badge = "358328", published = "5/25/2023 8:27:47 PM", modified = "5/25/2023 8:27:47 PM",
    trigger = worldCompleted(4)
)

//Updated using new logic
achievement(
    title = "Gutsy Gusto", points = 10,
    description = "Completed World 5 - It Takes Guts",
    id = 321597, badge = "358350", published = "5/25/2023 8:28:21 PM", modified = "5/25/2023 8:28:21 PM",
    trigger = worldCompleted(5)
)

//Updated using new logic
achievement(
    title = "Warming Wrap-Up", points = 10,
    description = "Completed World 6 - Getting Warmer",
    id = 321583, badge = "358330", published = "5/25/2023 8:27:47 PM", modified = "5/25/2023 8:27:47 PM",
    trigger = worldCompleted(6)
)

//Updated using new logic
achievement(
    title = "Radio-Active Redemption", points = 10,
    description = "Completed World 7 - Radio-Active",
    id = 321584, badge = "358331", published = "5/25/2023 8:27:47 PM", modified = "5/25/2023 8:27:47 PM",
    trigger = worldCompleted(7)
)