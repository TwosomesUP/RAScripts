// Alien Syndrome - Trigger Updates
// #ID = 10747

gameState = byte(0x0002)
round = byte(0x0052)
bossState = byte(0x007d)
scoreScreen = byte(0x0044)
lives = byte(0x0054)
bossHealth = byte(0x0081)

//Game States
gameState_InGame = 0x80

//Boss States
bossState_Active = 0x01

//Valid Round Values
round1 = 0x00
round2 = 0x01
round3 = 0x02
round4 = 0x03
round5 = 0x04
round6 = 0x05
finalRound = 0x06

//Score Screen States
scoreScreen_Active = 0x07
scoreScreen_Inactive = 0x00

//Functions
function inGame() => gameState == gameState_InGame
function bossActive() => bossState == bossState_Active

function roundCleared(roundNumber){
    return
        inGame() &&
        round == roundNumber &&
        bossActive() &&
        (
            scoreScreen == scoreScreen_Active &&
            prev(scoreScreen) == scoreScreen_Inactive
        )
}

function bossDefeated(){
    return
        prev(bossHealth) != 0xff && bossHealth == 0xff
}

function noDeathBossChallenge(inRound){
    return
        trigger_when(bossDefeated()) &&
        disable_when(lives < prev(lives), !inGame() || !bossActive() || round != inRound)
}

achievement(
    title = "In Space no one can hear a Squime", points = 25,
    description = "Defeat The Stage 1 Boss without Dying",
    id = 73294, badge = "78616", published = "3/9/2019 9:56:07 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = noDeathBossChallenge(round1)
)

achievement(
    title = "Aarghin' Through", points = 25,
    description = "Defeat The Stage 2 Boss without Dying",
    id = 73297, badge = "78617", published = "3/9/2019 9:56:39 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = noDeathBossChallenge(round2)
)

achievement(
    title = "Fit to Print but Not Tacapy", points = 25,
    description = "Defeat The Stage 3 Boss without Dying",
    id = 73300, badge = "78618", published = "3/9/2019 9:57:07 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = noDeathBossChallenge(round3)
)

achievement(
    title = "Mashed Masher ", points = 25,
    description = "Defeat The Stage 4 Boss without Dying",
    id = 73303, badge = "78619", published = "3/9/2019 9:57:48 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = noDeathBossChallenge(round4)
)

achievement(
    title = "The Last Haggah", points = 25,
    description = "Defeat The Stage 5 Boss without Dying",
    id = 73306, badge = "78620", published = "3/9/2019 9:58:24 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = noDeathBossChallenge(round5)
)

achievement(
    title = "Minosar is Wrecked", points = 25,
    description = "Defeat The Stage 6 Boss without Dying",
    id = 73309, badge = "78621", published = "3/9/2019 9:59:07 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = noDeathBossChallenge(round6)
)

achievement(
    title = "Mr. Mimi is no Meanie", points = 25,
    description = "Defeat The Stage 7 Boss without Dying",
    id = 73310, badge = "78623", published = "3/9/2019 9:59:33 AM", modified = "7/15/2019 2:14:20 AM",
    trigger = noDeathBossChallenge(finalRound)
)
