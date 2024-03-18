// Zen: Intergalactic Ninja
// #ID = 4213

//Memory Accessors

//Screen Coordinates
playerYCoordinate = byte(0xc00f)
playerXCoordinate = byte(0xc014)

//Health and Lives
playerHealth = byte(0xc089)
playerLives = byte(0xdeda)
bossHealth = byte(0xc605)

//Player Score
score = word_be(0xc38e)

//Player Attacks
chargedShotState = byte(0xc101)

chargedShotState_EnemyHit = 0x01

//Game State - Base state for each scene in the game
gameState = byte(0xdee0)

gameState_Title = 0x02
gameState_InGame = 0x06
gameState_GameOver = 0x07
gameState_StageClear = 0x07
gameState_Bonus = 0x08
gameState_BonusFailed = 0x0a
gameState_Ending = 0x0b

//Game Scenes - Paired with gameState for complete scene
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

//Game Areas
gameArea = byte(0xdef1)

gameArea_DustArea = 0x00
gameArea_DamArea = 0x01
gameArea_SmogArea = 0x02
gameArea_OilArea = 0x03
gameArea_FinalArea = 0x04

//Area Sections
areaSection = byte(0xdd40)

areaSection_DustArea_Beginning = 0x00
areaSection_DustArea_AvalancheDecent = 0x01
areaSection_DustArea_SpikePresses = 0x02
areaSection_DustArea_JunkAscent = 0x03
areaSection_DustArea_Cranes = 0x04
areaSection_DustArea_Boss = 0x05

areaSection_DamArea_Beginning = 0x00
areaSection_DamArea_FallingBridge = 0x01
areaSection_DamArea_WaterFalls = 0x02
areaSection_DamArea_WaterFallLasers = 0x03
areaSection_DamArea_WaterFallAscent = 0x04
areaSection_DamArea_Boss = 0x05

areaSection_SmogArea_Beginning = 0x00
areaSection_SmogArea_AcidRain = 0x01
areaSection_SmogArea_AcidRainEnd = 0x02
areaSection_SmogArea_TreeAscent = 0x03
areaSection_SmogArea_Rooftop = 0x04
areaSection_SmogArea_Boss = 0x05

areaSection_OilArea_Beginning = 0x00
areaSection_OilArea_PipeDecent = 0x01
areaSection_OilArea_Barrels = 0x02
areaSection_OilArea_Boss = 0x03

areaSection_FinalArea_Beginning = 0x00
areaSection_FinalArea_Flames = 0x01
areaSection_FinalArea_RockFallDecent = 0x02
areaSection_FinalArea_Skulls = 0x03
areaSection_FinalArea_Boss = 0x04

//Collected Items
itemArrayBegin = 0xc180
itemArrayCount = 7

area1UPState = byte(0xdedc)

area1UPState_Collected = 0x0f

//Invincibility Frames
invincibility = byte(0xc006)

invincibility_none = 0x00
invincibility_damaged = 0x48
invincibility_powercrystal = 0xc8

//Boss States
bossState = byte(0xc020)

bossState_DustArea_Returning = 0x00
bossState_DustArea_Raising = 0x01
bossState_DustArea_Attacking = 0x02
bossState_DustArea_Jumping = 0x03
bossState_DustArea_Sinking = 0x04
bossState_DustArea_Fists = 0x05
bossState_DustArea_Defeated = 0x06

bossState_DamArea_Floating = 0x01
bossState_DamArea_Throwing = 0x02
bossState_DamArea_AcidRain = 0x03
bossState_DamArea_Defeated = 0x04

bossState_SmogArea_InPipe = 0x00
bossState_SmogArea_Jumping = 0x01
bossState_SmogArea_Fog = 0x02
bossState_SmogArea_Smoke = 0x03
bossState_SmogArea_Defeated = 0x05

bossState_OilArea_InFloor = 0x00
bossState_OilArea_Bouncing = 0x01
bossState_OilArea_Dropping = 0x02
bossState_OilArea_Standing = 0x03
bossState_OilArea_Ceiling = 0x04
bossState_OilArea_Defeated = 0x05

bossState_FinalArea_Acid = 0x01
bossState_FinalArea_Smog = 0x02
bossState_FinalArea_Oil = 0x03
bossState_FinalArea_Dust = 0x04
bossState_FinalArea_Defeated = 0x05
bossState_FinalArea_Jeremy = 0x06
bossState_FinalArea_Melted = 0x07

bossStateByArea_Defeated = 
[
    bossState_DustArea_Defeated, 
    bossState_DamArea_Defeated, 
    bossState_SmogArea_Defeated, 
    bossState_OilArea_Defeated, 
    bossState_FinalArea_Defeated
]

//Bonuses
bonusCounter_SmogArea = byte(0xc024)
bonusCounter_DustArea = byte(0xc024)
bonusCounter_OilArea = byte(0xc025)
bonusCounter_DamArea = byte(0xc030)

bonusCounterByArea = 
[
    bonusCounter_DustArea,
    bonusCounter_DamArea,
    bonusCounter_SmogArea,
    bonusCounter_OilArea
]

//Functions
function inGame() => gameState == gameState_InGame
function inBonus() => gameState == gameState_Bonus

function playingLevel() => inGame() && gameScene == gameScene_InGame_InLevel
function startedBoss(area) => once(inGame() && gameArea == area && prev(gameScene) == gameScene_InGame_PreBoss && gameScene == gameScene_InGame_Boss)
function fightingBoss() => inGame() && gameScene == gameScene_InGame_Boss
function startedLevel() => once(inGame() && prev(gameScene) == gameScene_InGame_Start && gameScene == gameScene_InGame_InLevel)
function startedArea(area) => once(inGame() && gameArea == area && prev(gameScene) == gameScene_InGame_Start && gameScene == gameScene_InGame_InLevel)
function startedArea_w_Reset(area) => once(inGame() && prev(gameScene) == gameScene_InGame_Start && gameScene == gameScene_InGame_InLevel && gameArea == area && never(gameArea != area && !inGame()))
function startedLevel_w_Reset() => once(inGame() && prev(gameScene) == gameScene_InGame_Start && gameScene == gameScene_InGame_InLevel && never(!inGame()))
function completedLevel() => (prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss) && (gameState == gameState_StageClear && gameScene == gameScene_StageClear)
function completedFinalLevel() => (prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss) && (gameState == gameState_Ending && gameScene == gameScene_Ending) 

function playingBonus() => inBonus() && gameScene == gameScene_Bonus_InLevel
function startedBonus() => once(inBonus() && prev(gameScene) == gameScene_Bonus_Start && gameScene == gameScene_Bonus_InLevel)
function startedBonus_w_Reset() => once(inBonus() && prev(gameScene) == gameScene_Bonus_Start && gameScene == gameScene_Bonus_InLevel && never(!inBonus()))

function completedBonus() => inBonus() && gameScene == gameScene_Bonus_Success

function highScoreReached(target){
    return      
        prev(score) <= target && 
        score > target &&
        (
            startedLevel_w_Reset() ||
            startedBonus_w_Reset() 
        ) 
}

function perfectBonusChallenge(area, target){
    prevTarget = target - 1
    return
        startedBonus_w_Reset() &&
        gameArea == area &&
        prev(bonusCounterByArea[area]) == prevTarget &&
        bonusCounterByArea[area] == target
}

function playingArea(area){
    return 
        playingLevel() &&
        gameArea == area
}

function completedArea(area){
    return 
        completedLevel() &&
        gameArea == area
}

function completedGame(){
    return
        completedFinalLevel() &&
        gameArea == gameArea_FinalArea
}

function inStageClear() => gameState == gameState_StageClear
function inEnding() => gameState == gameState_Ending
function stageCleared() => prev(gameState) == gameState_InGame && gameState == gameState_StageClear
function finalStageCleared() => prev(gameState) == gameState_InGame && gameState == gameState_Ending
         
function completedAreaNoDeath(area){
    return 
        startedArea(area) &&
        trigger_when(stageCleared()) &&
        disable_when(gameArea == area && lostLives()) &&
        (
            never(gameArea != area) ||
            never(!inGame() && !inStageClear()) 
        )
}

function completedGameNoDeath(){
    return 
        startedArea(gameArea_FinalArea) &&
        trigger_when(finalStageCleared()) &&
        disable_when(gameArea == gameArea_FinalArea && lostLives()) &&
        (    
            never(gameArea != gameArea_FinalArea) ||
            never(!inGame() && !inEnding())
        )
}

function playingAreaBonus(area){
    return
        playingBonus() &&
        gameArea == area
}

function fightingAreaBoss(area){
    return 
        fightingBoss() &&
        gameArea == area
}

function defeatedAreaBossMeleeOnly(area){
    return 
        startedBoss(area) &&
        prev(bossHealth) != 0x00 &&
        trigger_when(bossHealth == 0x00) &&
        disable_when(chargeDamage()) &&
        (
            never(!fightingBoss()) ||
            never(gameArea != area)
        )
}

function oilSlickPhaseChallenge(){
    return 
        startedBoss(gameArea_OilArea) &&
        trigger_when(repeated(3, gameArea == gameArea_OilArea && chargeDamage() && never(bossState == bossState_OilArea_Bouncing))) &&
        never(!fightingBoss()) && 
        never(gameArea != gameArea_OilArea) && 
        never(bossState == bossState_OilArea_Defeated)
}

function sulfuraAcidRainPhaseChallenge(){
    return 
        startedBoss(gameArea_DamArea) &&
        prev(bossHealth) != 0x00 &&
        trigger_when(bossHealth == 0x00) &&
        disable_when(gameArea == gameArea_DamArea && bossState == bossState_DamArea_AcidRain) &&
        (
            never(!fightingBoss()) ||
            never(gameArea != gameArea_DamArea)
        )
}

function garbagemanPhaseChallenge(){
    return
        startedBoss(gameArea_DustArea) &&
        prev(bossHealth) != 0x00 &&
        trigger_when(bossHealth == 0x00) &&
        disable_when(repeated(3, gameArea == gameArea_DustArea && prev(bossState) != bossState_DustArea_Attacking && bossState == bossState_DustArea_Attacking)) &&
        (
            never(!fightingBoss()) ||
            never(gameArea != gameArea_DustArea)
        )
} 

function smoggerPhaseChallenge(){
    return 
        startedBoss(gameArea_SmogArea) &&
        prev(bossHealth) != 0x00 &&
        trigger_when(bossHealth == 0x00) &&
        disable_when(repeated(3, gameArea == gameArea_SmogArea && prev(bossState) != bossState_SmogArea_InPipe && bossState == bossState_SmogArea_InPipe)) &&
        (
            never(!fightingBoss()) || 
            never(gameArea != gameArea_SmogArea)
        )
}

function lordContaminousPhaseChallenge(){
    return 
        startedBoss(gameArea_FinalArea) &&
        prev(bossHealth) != 0x00 &&
        trigger_when(bossHealth == 0x00) &&
        disable_when(gameArea == gameArea_FinalArea && bossState == bossState_FinalArea_Oil) && 
        (
            never(!fightingBoss()) || 
            never(gameArea != gameArea_FinalArea)
        )
}

function chargeDamage(){
    return 
        prev(bossHealth) > bossHealth &&
        chargedShotState == chargedShotState_EnemyHit
}

function itemCollected(){
    return any_of(range(0, 7), itemCheck)
}

function itemCheck(index){
    return prev(byte(itemArrayBegin + index)) < byte(itemArrayBegin + index)
}

function noDamage() => prev(playerHealth) == playerHealth
function gainedHealth() => prev(playerHealth) < playerHealth
function lostHealth() => prev(playerHealth) > playerHealth

function gotPowerCrystal() => noDamage() && prev(invincibility) == invincibility_none && invincibility == invincibility_powercrystal

function gainedLives() => prev(playerLives) < playerLives
function lostLives() => prev(playerLives) > playerLives

function startedAreaSection(area, prevSection, targetSection){
    return once(inGame() && gameArea == area && prev(areaSection) == prevSection && areaSection == targetSection)  
}

function startedAreaSection_1UPChallenge(area, prevSection, targetSection){
    return once(inGame() && gameArea == area && area1UPState != area1UPState_Collected && prev(areaSection) == prevSection && areaSection == targetSection)  
}

function completedAreaSectionChallenge(sectionStart, sectionEnd){
    return trigger_when(prev(areaSection) == sectionStart && areaSection == sectionEnd)
}

function oilAreaLevelChallenge(){
    return 
        startedAreaSection(gameArea_OilArea, areaSection_OilArea_Beginning, areaSection_OilArea_PipeDecent) &&
        completedAreaSectionChallenge(areaSection_OilArea_PipeDecent, areaSection_OilArea_Barrels) &&
        disable_when(gameArea == gameArea_OilArea && areaSection == areaSection_OilArea_PipeDecent && playerHealth < prev(playerHealth)) &&
        disable_when(gameArea == gameArea_OilArea && areaSection == areaSection_OilArea_PipeDecent && itemCollected() && gotPowerCrystal()) &&
        (
            never(!inGame()) ||
            never(gameArea != gameArea_OilArea) ||
            never(areaSection == areaSection_OilArea_Beginning)
        )
}   

function damAreaLevelChallenge(){
    return 
        startedAreaSection(gameArea_DamArea, areaSection_DamArea_WaterFallLasers, areaSection_DamArea_WaterFallAscent) &&
        completedAreaSectionChallenge(areaSection_DamArea_WaterFallAscent, areaSection_DamArea_Boss) &&
        disable_when(gameArea == gameArea_DamArea && areaSection == areaSection_DamArea_WaterFallAscent && playerYCoordinate >= 0x70) &&
        (
            never(!inGame()) ||
            never(gameArea != gameArea_DamArea) ||
            never(areaSection == areaSection_DamArea_WaterFallLasers)
        )
}

function dustAreaLevelChallenge(){
    return 
        startedAreaSection_1UPChallenge(gameArea_DustArea, areaSection_DustArea_Beginning, areaSection_DustArea_AvalancheDecent) &&
        trigger_when(once(gameArea == gameArea_DustArea && areaSection == areaSection_DustArea_AvalancheDecent && itemCollected() && gainedLives())) &&
        completedAreaSectionChallenge(areaSection_DustArea_AvalancheDecent, areaSection_DustArea_SpikePresses) &&
        disable_when(gameArea == gameArea_DustArea && areaSection == areaSection_DustArea_AvalancheDecent && lostLives()) &&
        (
            never(!inGame()) ||
            never(gameArea != gameArea_DustArea) ||
            never(areaSection == areaSection_DustArea_Beginning)
        )
}

function smogAreaLevelChallenge(){
    return 
        startedAreaSection(gameArea_SmogArea, areaSection_SmogArea_Beginning, areaSection_SmogArea_AcidRain) &&
        completedAreaSectionChallenge(areaSection_SmogArea_AcidRain, areaSection_SmogArea_AcidRainEnd) &&
        disable_when(gameArea == gameArea_SmogArea && areaSection == areaSection_SmogArea_AcidRain && playerHealth < prev(playerHealth)) &&
        disable_when(gameArea == gameArea_SmogArea && areaSection == areaSection_SmogArea_AcidRain && itemCollected() && gotPowerCrystal()) &&
        (
            never(!inGame()) ||
            never(gameArea != gameArea_SmogArea) ||
            never(areaSection == areaSection_SmogArea_Beginning)
        )
}

function finalAreaLevelChallenge(){
    return
        startedAreaSection_1UPChallenge(gameArea_FinalArea, areaSection_FinalArea_Flames, areaSection_FinalArea_RockFallDecent) &&
        trigger_when(once(gameArea == gameArea_FinalArea && areaSection == areaSection_FinalArea_RockFallDecent && itemCollected() && gainedLives())) &&
        completedAreaSectionChallenge(areaSection_FinalArea_RockFallDecent, areaSection_FinalArea_Skulls) &&
        disable_when(gameArea == gameArea_FinalArea && areaSection == areaSection_FinalArea_RockFallDecent && playerHealth < prev(playerHealth)) &&
        disable_when(gameArea == gameArea_FinalArea && areaSection == areaSection_FinalArea_RockFallDecent && itemCollected() && gotPowerCrystal()) &&
        (
            never(!inGame()) ||
            never(gameArea != gameArea_FinalArea) ||
            never(areaSection == areaSection_FinalArea_Flames)
        )
}

//Achievements

//High Score >= 30000
achievement(
    title = "Zen-sational",
    points = 5,
    description = "Achieve a high score greater than 30000",
    trigger = highScoreReached(0x300),
    id = 333403
)

//High Score >= 120000
achievement(
    title = "Peak Zen",
    points = 25,
    description = "Achieve a high score greater than 120000",
    trigger = highScoreReached(0x1200),
    id = 333404
)

//Collect a Power Crystal and become invulnerable
achievement(
    title = "The Power of Zen",
    points = 1,
    description = "Collect a Power Crystal and become invulnerable",
    trigger = playingLevel() && itemCollected() && gotPowerCrystal(),
    id = 333405
)

//Collect a Life Up item and replenish your health
achievement(
    title = "Zen-durance Up",
    points = 1,
    description = "Collected a Life Up item and replenished your health",
    trigger = playingLevel() && itemCollected() && gainedHealth(),
    id = 333406
)

//Collect a Zen Up item and increase your lives
achievement(
    title = "One Life, One Zen",
    points = 1,
    description = "Collected a Zen Up item and increase your lives",
    trigger = playingLevel() && itemCollected() && gainedLives(),
    id = 333407
)

//Oil Area - Complete
achievement(
    title = "One Slick Ticket",
    points = 2,
    description = "Complete the Oil Area",
    trigger = completedArea(gameArea_OilArea),
    id = 333408
)

//Oil Area - No Deaths
achievement(
    title = "Down with the Slickness",
    points = 10,
    description = "Complete the Oil Area without losing a life",
    trigger = completedAreaNoDeath(gameArea_OilArea),
    id = 333409
)

//Oil Area - Reach the bottom of the Pipes Decent without taking damage (No Crystal)
achievement(
    title = "Down the Drain",
    points = 10,
    description = "Reach the bottom of the Pipes Decent in the Oil Area without taking damage (no power crystal)",
    trigger = oilAreaLevelChallenge(),
    id = 333410
)

//Oil Area - Defeat Oil Slick (Melee Only)
achievement(
    title = "Not that Slick",
    points = 10,
    description = "Defeat Oil Slick in the Oil Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_OilArea),
    id = 333411
)

//Hit the Oil Area Boss 3 times with your charged attack in a single phase
achievement(
    title = "Greased Lightning",
    points = 5,
    description = "Damage Oil Slick 3 times with charged attacks in a single phase",
    trigger = oilSlickPhaseChallenge(),
    id = 333412
)

//Oil Area Bonus - Save all of the Sea Birds
achievement(
    title = "Seabird Sanctuary",
    points = 5,
    description = "Complete the Oil Area Bonus Stage and save all of the Sea Birds",
    trigger = perfectBonusChallenge(gameArea_OilArea, 16),
    id = 333413
)

//Dam Area - Complete
achievement(
    title = "Did the Dam Thing",
    points = 2,
    description = "Complete the Dam Area",
    trigger = completedArea(gameArea_DamArea),
    id = 333414
)

//Dam Area - Complete (No Deaths)
achievement(
    title = "Dam Right!",
    points = 5,
    description = "Complete the Dam Area without losing a life",
    trigger = completedAreaNoDeath(gameArea_DamArea),
    id = 333415
)

//Dam Area - Reach the top of the Waterfall Ascent without falling
achievement(
    title = "Fighting the Current", 
    points = 5,
    description = "Reach the top of the Waterfall Ascent in the Dam Area without falling too far",
    trigger = damAreaLevelChallenge(),
    id = 333416
)

//Dam Area - Defeat Sulfura (Melee Only)
achievement(
    title = "Rainy Day Parade",
    points = 10,
    description = "Defeat Sulfura in the Dam Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_DamArea),
    id = 333417
)

//Defeat the Dam Area Boss before her acid rain phase
achievement(
    title = "Rain Check",
    points = 5,
    description = "Defeat Sulfura in the Dam Area before her acid rain phase",
    trigger = sulfuraAcidRainPhaseChallenge(),
    id = 333418
)

//Dam Area Bonus - Shoot all of the cans
achievement(
    title = "Nature is Saved",
    points = 5,
    description = "Complete the Dam Area Bonus Stage and shoot all of the cans",
    trigger = perfectBonusChallenge(gameArea_DamArea, 16),
    id = 333419
)

//Dust Area - Complete
achievement(
    title = "Done and Dusted",
    points = 2,
    description = "Complete the Dust Area",
    trigger = completedArea(gameArea_DustArea),
    id = 333420
)

//Dust Area - Complete (No Deaths)
achievement(
    title = "Eat my Dust",
    points = 5,
    description = "Complete the Dust Area without losing a life",
    trigger = completedAreaNoDeath(gameArea_DustArea),
    id = 333421
)

//Dust Area - Collect the 1UP during the Mudslide Decent without dying
achievement(
    title = "Clear as Mud",
    points = 5,
    description = "Collect the Zen Up during the Mudslide Decent in the Dust Area and reach the bottom without losing a life",
    trigger = dustAreaLevelChallenge(),
    id = 333422
)

//Dust Area - Defeat Garbageman (Melee Only)
achievement(
    title = "Stinky Stopper",
    points = 10,
    description = "Defeat Garbageman in the Dust Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_DustArea),
    id = 333423
)

//Defeat the Dust Area Boss in 3 phases or less
achievement(
    title = "Taking out the Trash",
    points = 5,
    description = "Defeat Garbageman in the Dust Area in 2 phases or less",
    trigger = garbagemanPhaseChallenge(),
    id = 333424
)

//Dust Area Bonus - Collect all of the cans (there's more than 15!)
achievement(
    title = "Not a Garbage Can't",
    points = 5,
    description = "Complete the Dust Area Bonus Stage and collect all of the cans",
    trigger = perfectBonusChallenge(gameArea_DustArea, 18),
    id = 333425
)

//Smog Area - Complete
achievement(
    title = "A Breath of Fresh Air",
    points = 2,
    description = "Complete the Smog Area",
    trigger = completedArea(gameArea_SmogArea),
    id = 333426
)

//Smog Area - Complete (No Deaths)
achievement(
    title = "In the O-Zone",
    points = 5,
    description = "Complete the Smog Area without losing a life",
    trigger = completedAreaNoDeath(gameArea_SmogArea),
    id = 333427
)

//Smog Area - Don't get hit by the acid rain during the Acid Rain section
achievement(
    title = "Storm Sidestepper",
    points = 5,
    description = "Reach the end of the Acid Rain section of the Smog Area without taking damage from any source (no power crystal)",
    trigger = smogAreaLevelChallenge(),
    id = 333428
)

//Smog Area - Defeat Smogger (Melee Only)
achievement(
    title = "Clean Air Reigns",
    points = 10,
    description = "Defeat Smogger in the Smog Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_SmogArea),
    id = 333429
)

//Defeat the Smog Area Boss in 2 phases or less
achievement(
    title = "Walking on Air",
    points = 5,
    description = "Defeat Smogger in the Smog Area in 2 phases or less",
    trigger = smoggerPhaseChallenge(),
    id = 333430
)

//Smog Area Bonus - Hit every smoke cloud
achievement(
    title = "Clear Skies",
    points = 5,
    description = "Complete the Smog Area Bonus Stage and destroy every smoke cloud",
    trigger = perfectBonusChallenge(gameArea_SmogArea, 15),
    id = 333431
)

//Final Area - Complete
achievement(
    title = "Emission Accomplished",
    points = 4,
    description = "Complete the Final Area",
    trigger = completedGame(),
    id = 333432
)

//Final Area - Complete (No Deaths)
achievement(
    title = "Flawless Finale",
    points = 5,
    description = "Complete the Final Area without losing a life",
    trigger = completedGameNoDeath(),
    id = 333433
)

//Final Area - Reach the bottom of the Rockfall Decent without taking damage (No Crystal)
achievement(
    title = "Hard Rain",
    points = 10,
    description = "Collect the Zen Up during the Rockfall Decent in the Final Area and reach the bottom without taking damage (no power crystal)",
    trigger = finalAreaLevelChallenge(),
    id = 333434
)

//Final Area - Free Jeremy and defeat Lord Contanimous (Melee Only)
achievement(
    title = "Creepazoid Crusher",
    points = 10,
    description = "Free Jeremy and defeat Lord Contanimous in the Final Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_FinalArea),
    id = 333435
)

//Final Area - Phase Challenge - Defeat the boss before the Oil Phase
achievement(
    title = "Industrial Wasted",
    points = 5,
    description = "Free Jeremy and defeat Lord Contanimous before reaching his Oil Phase",
    trigger = lordContaminousPhaseChallenge(),
    id = 333436
)

//== Potential Challenges ==

//Oil Area - All Items
//Dam Area - All Items
//Dust Area - All Items
//Smog Area - All Items

//Defeat Each Enemy Type
//Complete Game No Charge

//[VOID]  - [Obsolete] Complete Game (No Continues)
//     Replaced with High Score > 120000
