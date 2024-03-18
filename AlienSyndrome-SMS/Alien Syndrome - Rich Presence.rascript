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
credits = 0x07

//Score Screen States
scoreScreen_Active = 0x07
scoreScreen_Inactive = 0x00

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

//Total Items Array
roundItemCount = [17,13,15,12,13,14]

//Functions
function inGame() => gameState == gameState_InGame
function bossActive() => bossState == bossState_Active

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

function hostagesCollected(){
    return sum_of(range(0x005c, 0x0073), in => bit0(in) + bit4(in))
}

RoundLookup = {
    round1: "Calliope",
    round2: "Clio",
    round3: "Erato",
    round4: "Euterpe",
    round5: "Melpomene",
    round6: "Thalia",
    finalRound: "Urania"
}

BossLookup = {
    round1: "Squime",
    round2: "Aargh",
    round3: "Tacapy",
    round4: "Masher",
    round5: "Haggah",
    round6: "Minosar",
    finalRound: "Mr. Mimi"
}

rich_presence_conditional_display(inGame() && !bossActive(), "Rescuing hostages in {0} | Hostages: {3}/12 | Lives: {1} | Score: {2}",
    rich_presence_lookup("GameArea", round, RoundLookup),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", getScore()),
    rich_presence_value("Number", hostagesCollected()) 
)

rich_presence_conditional_display(inGame() && bossActive() && round != credits, "Fighting {0} in {1} | Lives: {2} | Score: {3}",
    rich_presence_lookup("Boss", round, BossLookup),
    rich_presence_lookup("Round", round, RoundLookup),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", getScore())
)

rich_presence_conditional_display(inGame() && bossActive() && round == credits, "Watching the Epilogue!")

rich_presence_display("Playing Alien Syndrome")