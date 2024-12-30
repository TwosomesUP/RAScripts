// Magic: The Gathering
// #ID = 6564

ChosenDeck = byte(0x272e35)
InGame = byte(0x2cb4f0)
LastCard = word(0x2d7094)
WinState = byte(0x273a5e)

function IsInGame() => InGame == 1

Cards = {
    "GlassesOfUrza": 0x11f,
    "JalumTome": 0x126,
    "JayemdaeTome": 0x127
}

MatchesWon = {
    "TowerBoss1": byte(0x273678),
    "TowerBoss2": byte(0x27367e),
    "TowerBoss3": byte(0x273684),
    "WhiteBoss1": byte(0x27368a)
}

function PlayedMishraCards(){
    return once(IsInGame() && LastCard == 0x11f) &&
        measured(tally(1, once(IsInGame() && LastCard == 0x126), once(IsInGame() && LastCard == 0x127)))
}

function WonMishraChallenge(){
    return PlayedMishraCards() &&
        prev(WinState) == 0 && 
        trigger_when(WinState == 2) &&
        never(!IsInGame())
}

achievement(
    title = "Cards: Mishra Was Here, Urza is a Nerd", points = 5,
    description = "Win a game having played [Glasses of Urza] and either [Jalum Tome] or [Jayemdae Tome].",
    id = 191531, badge = "212270", published = "1/10/2022 2:20:39 PM", modified = "2/22/2022 6:39:16 AM",
    trigger = WonMishraChallenge()
)
