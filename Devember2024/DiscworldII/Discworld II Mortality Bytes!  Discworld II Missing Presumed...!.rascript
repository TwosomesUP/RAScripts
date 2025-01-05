// Discworld II: Mortality Bytes! | Discworld II: Missing Presumed...!?
// #ID = 13966

Screen = dword(0x6c8d0)
Act = byte(0xf9b18)
LastCharacter = word(0x6c4dc)
ActiveCharacter = byte(0x09a448)
ActiveCharacter_Mouse = byte(0x99908)
ImpConversation = word(0x0fa470)

Screens = {
    "GardenBirdHouse": 0x51
}

Characters = {
    "Imp": 0xa
}


function ListenedToImpsSong(){
    return Act == 1 &&
        Screen == Screens["GardenBirdHouse"] &&
        (ActiveCharacter == Characters["Imp"] || ActiveCharacter_Mouse == Characters["Imp"]) &&
        prev(ImpConversation) == 0x317 &&
        ImpConversation == 0x318
}

achievement(
    title = "Oit! Oit!", points = 1, type="missable",
    description = "Listen to the Imp's song",
    id = 255263, badge = "283050", published = "10/11/2022 11:36:07 PM", modified = "10/23/2022 9:37:40 PM",
    /*trigger = dword(0x06C8D0) == 0x51 && word(0x06C4DC) == 0x0A && word(0x0FA470) == 0x318 && byte(0x09A418) == 0x0A &&
              byte(0x0F9B18) == 0x01*/
    trigger = ListenedToImpsSong()
)
