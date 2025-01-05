// Discworld II: Mortality Bytes! | Discworld II: Missing Presumed...!?
// #ID = 13966

Screen = word(0x6c8d0)
Act = byte(0xf9b18)
ActiveCharacter = byte(0x09a448)
ActiveCharacter_Mouse = byte(0x99908)
InteractionType = byte(0x9a414)
InteractionType_Mouse = byte(0x998d4)
LastItem = byte(0x6c4d4)
HeldItem = word(0x6bf60)
HoverID = byte(0x6c078)

SaddleFlag = byte(0xfa224)
BinkyRiddenEvent = byte(0xf9cc8)
BinkyFailedEvent = byte(0x72e30)
MrsCakeConvo = word(0x74f3c)

Screens = {
    "GardenBirdHouse": 0x51,
    "CamelSalesYard": 0x13,
    "Djelibeybi": 0x22,
    "DeathsRealm": 0x1b,
    "CornReaping": 0x16,
    "Anhk": 0x1e
}

Characters = {
    "Imp": 0xa,
    "Binky": 0xb,
    "FountainOfYouth": 0x13
}

Items = {
    "ReapingMachine": 0xa4,
    "AntSoulds": 0xa0
}

function GotDiedWool(){
    return Screen == 0x2e &&
        Act == 2 &&
        LastItem == 0xab &&
        (ActiveCharacter == 0x9 || ActiveCharacter_Mouse == 0x9) 
}

achievement(
    title = "Died in the Wool", points = 5,
    description = "Find a convincing stunt double",
    id = 255300, badge = "283087", published = "10/11/2022 11:36:20 PM", modified = "10/22/2022 9:52:13 PM",
    /*trigger = word(0x06C8D0) == 0x2E && byte(0x0F9B18) == 0x02 && byte(0x06C4DC) == 0x09 && byte(0x06C4D4) == 0xAB*/
    trigger = GotDiedWool()
)
