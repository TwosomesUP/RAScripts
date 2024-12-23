// Crystal Warriors
// #ID = 11711

Level = byte(0x1f)
ScreenState = byte(0x1d)

Characters = [
    {
        "ID": byte(0x481),
        "Level": byte(0x482)
    },
    {
        "ID": byte(0x4a1),
        "Level": byte(0x4a2)
    },
    {
        "ID": byte(0x4c1),
        "Level": byte(0x4c2)
    },
    {
        "ID": byte(0x4e1),
        "Level": byte(0x4e2)
    },
    {
        "ID": byte(0x501),
        "Level": byte(0x502)
    },
    {
        "ID": byte(0x521),
        "Level": byte(0x522)
    },
    {
        "ID": byte(0x541),
        "Level": byte(0x542)
    },
    {
        "ID": byte(0x561),
        "Level": byte(0x562)
    },
    {
        "ID": byte(0x581),
        "Level": byte(0x582)
    },
]

ScreenStates = {
    "InTown": 0x2b,
    "FromTown": 0x17,
    "ToRound": 0x1a,
    "InRound": 0x1c,
}

CharactersIDs = {
    "Iris": 0x0,
    "Eldor": 0x1,
    "Ratt": 0x6,
    "Dayne": 0xc,
    "Frye": 0xe,
    "Murak": 0xf
}

function CoddledPrincess() {
    return Level == 0xf &&
        Characters[0]["ID"] == CharactersIDs["Iris"] &&
        Characters[0]["Level"] == 1 &&
        Characters[1]["ID"] == CharactersIDs["Dayne"] &&
        Characters[1]["Level"] == 9 &&
        Characters[2]["ID"] == CharactersIDs["Eldor"] &&
        Characters[2]["Level"] == 9 &&
        Characters[3]["ID"] == CharactersIDs["Ratt"] &&
        Characters[3]["Level"] == 9 &&
        Characters[4]["ID"] == CharactersIDs["Murak"] &&
        Characters[4]["Level"] == 9 &&
        Characters[5]["ID"] == CharactersIDs["Frye"] &&
        Characters[5]["Level"] == 9 &&
        Characters[6]["ID"] == 0 &&
        Characters[6]["Level"] == 0 &&
        Characters[7]["ID"] == 0 &&
        Characters[7]["Level"] == 0 &&
        Characters[8]["ID"] == 0 &&
        Characters[8]["Level"] == 0 &&
        prev(ScreenState) == ScreenStates["FromTown"] &&
        ScreenState == ScreenStates["ToRound"]
}

achievement(
    title = "Coddled Princess", points = 25,
    description = "Reach the last Round with only the original five characters at level 9 and princess Iris at level 1",
    id = 63407, badge = "161660", published = "7/29/2018 3:32:19 AM", modified = "3/8/2021 9:32:09 PM",
    /*trigger =  never(byte(0x00001F) != 0x0F) && never(word(0x00001D) == 0x2929) && never(word(0x000481) != 0x100) &&
              word(0x0004A1) == 0x90C && word(0x0004C1) == 0x901 && word(0x0004E1) == 0x906 && word(0x000501) == 0x90F &&
              word(0x000521) == 0x90E && never(word(0x000541) != 0x00) && once(word(0x00001D) == 0x1717) */
    trigger = CoddledPrincess()
)
