// Magic: The Gathering
// #ID = 6564

ChosenDeck = byte(0x272e35)
InGame = byte(0x2cb4f0)
LastCard = word(0x2d7094)
WinState = byte(0x273a5e)

function IsInGame() => InGame == 1
function IsInDemo() => ChosenDeck == 0

Cards = {
    "GlassesOfUrza": 0x11f,
    "JalumTome": 0x126,
    "JayemdaeTome": 0x127,
    "TheHive": 0x121,
    "SnakeBasket": 0x138,
    "Meekstone": 0x12b
}

function PlayedMishraCards(){
    return once(IsInGame() && !IsInDemo() && LastCard == Cards["GlassesOfUrza"]) &&
        measured(tally(1, once(IsInGame() && !IsInDemo() && LastCard == Cards["JalumTome"]), once(IsInGame() && !IsInDemo() && LastCard == Cards["JayemdaeTome"])))
}

function WonMishraChallenge(){
    return PlayedMishraCards() &&
        prev(WinState) == 0 && 
        trigger_when(WinState == 2) &&
        never(!IsInGame())
}

function PlayedPestsCards(){
    return measured(tally(2, 
        once(IsInGame() && !IsInDemo() && LastCard == Cards["TheHive"]), 
        once(IsInGame() && !IsInDemo() && LastCard == Cards["SnakeBasket"]), 
        once(IsInGame() && !IsInDemo() && LastCard == Cards["Meekstone"])))
}

function WonPestsChallenge(){
    return PlayedPestsCards() &&
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

achievement(
    title = "Cards: Pests", points = 5,
    description = "Win a game having played 2 of these 3: [The Hive], [Snake Basket], [Meekstone].",
    id = 191532, badge = "212271", published = "1/10/2022 2:20:39 PM", modified = "2/22/2022 6:39:17 AM",
    /*trigger = never(byte(0x272E35) == 0x00) && never(prev(byte(0x272E35)) == 0x00) &&
              measured(tally(2, once(word(0x2D7094) == 0x121), once(word(0x2D7094) == 0x138), once(word(0x2D7094) == 0x12B))) &&
              (always_false() || (trigger_when((byte(0x273678) > prev(byte(0x273678)) || byte(0x27367E) > prev(byte(0x27367E)) ||
                    byte(0x273684) > prev(byte(0x273684)) || byte(0x27368A) > prev(byte(0x27368A)) ||
                    byte(0x273690) > prev(byte(0x273690)) || byte(0x273696) > prev(byte(0x273696)) ||
                    byte(0x27369C) > prev(byte(0x27369C)) || byte(0x2736A2) > prev(byte(0x2736A2)) ||
                    byte(0x2736A8) > prev(byte(0x2736A8)) || byte(0x2736AE) > prev(byte(0x2736AE)) ||
                    byte(0x2736B4) > prev(byte(0x2736B4)) || byte(0x2736BA) > prev(byte(0x2736BA)) ||
                    byte(0x2736C0) > prev(byte(0x2736C0)) || byte(0x2736C6) > prev(byte(0x2736C6)) ||
                    byte(0x2736CC) > prev(byte(0x2736CC)) || byte(0x2736D2) > prev(byte(0x2736D2)) ||
                    byte(0x2736D8) > prev(byte(0x2736D8)) || byte(0x2736DE) > prev(byte(0x2736DE)) ||
                    byte(0x2736E4) > prev(byte(0x2736E4)) || byte(0x2736EA) > prev(byte(0x2736EA)) ||
                    byte(0x2736F0) > prev(byte(0x2736F0)) || byte(0x2736F6) > prev(byte(0x2736F6)) ||
                    byte(0x2736FC) > prev(byte(0x2736FC)) || byte(0x273702) > prev(byte(0x273702)) ||
                    byte(0x273708) > prev(byte(0x273708)) || byte(0x27370E) > prev(byte(0x27370E)) ||
                    byte(0x273714) > prev(byte(0x273714)) || byte(0x27371A) > prev(byte(0x27371A)))
                ) &&
                never((byte(0x27367A) > prev(byte(0x27367A)) || byte(0x273680) > prev(byte(0x273680)) ||
                    byte(0x273686) > prev(byte(0x273686)) || byte(0x27368C) > prev(byte(0x27368C)) ||
                    byte(0x273692) > prev(byte(0x273692)) || byte(0x273698) > prev(byte(0x273698)) ||
                    byte(0x27369E) > prev(byte(0x27369E)) || byte(0x2736A4) > prev(byte(0x2736A4)) ||
                    byte(0x2736AA) > prev(byte(0x2736AA)) || byte(0x2736B0) > prev(byte(0x2736B0)) ||
                    byte(0x2736B6) > prev(byte(0x2736B6)) || byte(0x2736BC) > prev(byte(0x2736BC)) ||
                    byte(0x2736C2) > prev(byte(0x2736C2)) || byte(0x2736C8) > prev(byte(0x2736C8)) ||
                    byte(0x2736CE) > prev(byte(0x2736CE)) || byte(0x2736D4) > prev(byte(0x2736D4)) ||
                    byte(0x2736DA) > prev(byte(0x2736DA)) || byte(0x2736E0) > prev(byte(0x2736E0)) ||
                    byte(0x2736E6) > prev(byte(0x2736E6)) || byte(0x2736EC) > prev(byte(0x2736EC)) ||
                    byte(0x2736F2) > prev(byte(0x2736F2)) || byte(0x2736F8) > prev(byte(0x2736F8)) ||
                    byte(0x2736FE) > prev(byte(0x2736FE)) || byte(0x273704) > prev(byte(0x273704)) ||
                    byte(0x27370A) > prev(byte(0x27370A)) || byte(0x273710) > prev(byte(0x273710)) ||
                    byte(0x273716) > prev(byte(0x273716)) || byte(0x27371C) > prev(byte(0x27371C)))
                ) && never((prev(byte(0x2CB4F0)) == 0x00 && byte(0x2CB4F0) == 0x01))))*/
    trigger = WonPestsChallenge()
)

