// Discworld II: Mortality Bytes! | Discworld II: Missing Presumed...!?
// #ID = 13966

Screen = word(0x6c8d0)
Act = word(0xf9b18)
ActiveCharacter = byte(0x09a448)
ActiveCharacter_Mouse = byte(0x99908)
InteractionType = byte(0x9a414)
InteractionType_Mouse = byte(0x998d4)
LastItem = word(0x6c4d4)
HeldItem = word(0x6bf60)
HoverID = byte(0x6c078)

SaddleFlag = word(0xfa224)
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

function GotNotSoGraceful(){
    return Screen == 0x48 &&
        SaddleFlag == 0 &&
        (ActiveCharacter == Characters["Binky"] ||
        ActiveCharacter_Mouse == Characters["Binky"]) &&
        prev(BinkyFailedEvent) == 1 &&
        BinkyFailedEvent == 0
}

function GotTheRicewindCut(){
    return Screen == 0x3e &&
        HeldItem == 0x72 &&
        prev(HoverID) == 0xe &&
        ((ActiveCharacter == 0xe && InteractionType == 0xb) ||
        (ActiveCharacter_Mouse == 0xe && InteractionType_Mouse == 0xb))
}

function GotSavingDeath(){
    return HeldItem == 0x65 &&
        Screen == 0x29 &&
        ((ActiveCharacter == 0x13 && InteractionType == 0xb) ||
        (ActiveCharacter_Mouse == 0x13 && InteractionType_Mouse == 0xb))
}

function GotGerbil(){
    return Act == 2 &&
        LastItem == 0x27 &&
        (ActiveCharacter == 0x9 || ActiveCharacter_Mouse == 0x9) &&
        prior(Screen) == Screens["CamelSalesYard"] &&
        Screen == Screens["Djelibeybi"]
}

function RodeBinkySuccessfully(){
    return Screen == 0x48 &&
        SaddleFlag == 1 &&
        (ActiveCharacter == Characters["Binky"] ||
        ActiveCharacter_Mouse == Characters["Binky"]) &&
        prev(BinkyRiddenEvent) == 0 &&
        BinkyRiddenEvent == 1
}

function GotLeanMeanReapinMachine(){
    return Screen == Screens["CornReaping"] &&
        Act == 0x3 &&
        HeldItem == Items["ReapingMachine"] &&
        (ActiveCharacter == Characters["FountainOfYouth"] || 
        ActiveCharacter_Mouse == Characters["FountainOfYouth"])
}

function GotYourHired(){
    return HeldItem == Items["AntSoulds"] &&
        Screen == Screens["Anhk"] &&
        (
            ActiveCharacter == 0x13 ||
            ActiveCharacter_Mouse == 0x13
        ) &&
        MrsCakeConvo == 0xc2c
}

function Test(){
    return Act == 1 &&
        Screen == Screens["GardenBirdHouse"] &&
        HeldItem == 0x31 &&
        prev(HoverID) == Characters["Imp"] &&
        ((ActiveCharacter == Characters["Imp"] && InteractionType == 0xb) || 
        (ActiveCharacter_Mouse == Characters["Imp"] && InteractionType_Mouse == 0xb))
}

achievement("Test Interaction", "Test", points = 2, 
    trigger = Test()
)

// Fixed
achievement(
    title = "My Very Own Prime Racing Gerbil", points = 2,
    description = "Obtain the Camel",
    id = 255281, badge = "283068", published = "10/11/2022 11:36:13 PM", modified = "2/2/2023 9:35:11 PM",
    /* trigger = prior(word(0x06C8D0)) == 0x13 && word(0x06C8D0) == 0x22 && word(0x0F9B18) == 0x02 &&
              word(0x06C4D4) == 0x27 && byte(0x09A418) == 0x09 */
    trigger = GotGerbil()
)

// Need event flags
achievement(
    title = "The Rincewind Cut", points = 5,
    description = "Save the clickie premiere",
    id = 255301, badge = "283088", published = "10/11/2022 11:36:20 PM", modified = "2/2/2023 11:02:35 PM",
    /* trigger = word(0x06C8D0) == 0x3E && word(0x06BF60) == 0x72 && byte(0x06C078) == 0x0E && byte(0x09A418) == 0x0E &&
              byte(0x09A4C4) == 0x03 */
    trigger = GotTheRicewindCut()
)

// Fixed
achievement(
    title = "The Graceful Rider", points = 10,
    description = "Successfully ride Binky",
    id = 255291, badge = "283078", published = "10/11/2022 11:36:17 PM", modified = "2/9/2023 8:42:42 PM",
    /* trigger = word(0x06C8D0) == 0x1B && word(0x0FA224) == 0x01 && word(0x09A418) == 0x0B && byte(0x09A4C4) == 0x03 &&
              byte(0x0F9CC8) == 0x01 */
    trigger = RodeBinkySuccessfully()
)

//Logic updated to use a more reliable active conversation indicator. Alt to support mouse input included. Delta was also used for the event flag.
achievement(
    title = "Lean Mean Reapin' Machine", points = 10,
    description = "Reap the corn field in style",
    id = 255304, badge = "283091", published = "10/11/2022 11:36:21 PM", modified = "10/11/2022 11:36:21 PM",
    /*trigger = word(0x06C8D0) == 0x16 && word(0x0F9B18) == 0x03 && word(0x06BF60) == 0xA4 && word(0x09A418) == 0x13*/
    trigger = GotLeanMeanReapinMachine()
)

// Fixed
achievement(
    title = "You're Hired!", points = 10,
    description = "Complete Albert's final challenge",
    id = 255305, badge = "283092", published = "10/11/2022 11:36:21 PM", modified = "10/11/2022 11:36:21 PM",
    /* trigger = word(0x06BF60) == 0xA0 && word(0x06C8D0) == 0x1E && word(0x09A418) == 0x13 && word(0x074F3C) == 0xC2C */
    trigger = GotYourHired()
)

achievement(
    title = "The Not-So-Graceful Rider", points = 1, type="missable",
    description = "Unsuccessfully ride Binky",
    id = 255292, badge = "283079", published = "10/11/2022 11:36:17 PM", modified = "2/9/2023 8:49:32 PM",
    /* trigger = word(0x06C8D0) == 0x48 && byte(0x09A418) == 0x0B && byte(0x09A4C4) == 0x03 && byte(0x0FA224) == 0x00 &&
              prev(byte(0x072E30)) == 0x01 && byte(0x072E30) == 0x00 */
    trigger = GotNotSoGraceful()
)

achievement(
    title = "Saving Death...From Death?", points = 10,
    description = "Save Death",
    id = 255306, badge = "283093", published = "10/11/2022 11:36:22 PM", modified = "10/11/2022 11:36:22 PM",
    /* trigger = word(0x06BF60) == 0x65 && word(0x06C8D0) == 0x29 && word(0x09A418) == 0x13 && word(0x09A4C4) == 0x03 */
    trigger = GotSavingDeath()
)
