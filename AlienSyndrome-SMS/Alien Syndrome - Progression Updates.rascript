// Alien Syndrome - Progress Updates
// #ID = 10747

gameState = byte(0x0002)
round = byte(0x0052)
bossState = byte(0x007d)
scoreScreen = byte(0x0044)

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

//Achievements
achievement(
    title = "Calliope Clear", points = 5,
    description = "Defeat Squime and clear Round 1",
    trigger = roundCleared(round1)
)

achievement(
    title = "Clio Clear", points = 5,
    description = "Defeat Aargh and clear Round 2",
    trigger = roundCleared(round2)
)

achievement(
    title = "Erato Clear", points = 5,
    description = "Defeat Tacapy and clear Round 3",
    trigger = roundCleared(round3)
)

achievement(
    title = "Euterpe Clear", points = 5,
    description = "Defeat Masher and clear Round 4",
    trigger = roundCleared(round4)
)

achievement(
    title = "Melpomene Clear", points = 5,
    description = "Defeat Haggah and clear Round 5",
    trigger = roundCleared(round5)
)

achievement(
    title = "Minosar Clear", points = 5,
    description = "Defeat Minosar and clear Round 6",
    trigger = roundCleared(round6)
)

achievement(
    title = "The World is Saved!", points = 10,
    description = "Clear Round 7 and stop the alien invasion",
    trigger = roundCleared(finalRound)
)
