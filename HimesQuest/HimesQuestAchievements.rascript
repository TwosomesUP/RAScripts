// ~Homebrew~ Hime's Quest
// #ID = 22353

// Address Constants
RoomCode32 = dword(0xc528)
SkeletonKey = bit4(0xcba8)
CatMinigameCounter = byte(0xcc3f)
CatMinigameHitFlag = byte(0xcc41)
PlayerMaxHealth = word(0xcb75)
PlayerMoney = word(0xcb63)
CursedMode = bit0(0xcc07)

MapTiles = [
    bitcount(0xcbbd), //Row 1
    bitcount(0xcbbf), //Row 2
    bitcount(0xcbc1), //Row 3
    bitcount(0xcbc3), //Row 4
    bitcount(0xcbc5), //Row 5
    bitcount(0xcbc7), //Row 6
    bitcount(0xcbc9), //Row 7
    bitcount(0xcbcb), //Row 8
    bitcount(0xcbcd), //Row 9
    bitcount(0xcbcf), //Row 10 
    bit0(0xcbbe), //Row 1 - Final
    bit0(0xcbc0), //Row 2 - Final
    bit0(0xcbc2), //Row 3 - Final
    bit0(0xcbc4), //Row 4 - Final
    bit0(0xcbc6), //Row 5 - Final
    bit0(0xcbc8), //Row 6 - Final
    bit0(0xcbca), //Row 7 - Final
    bit0(0xcbcc), //Row 8 - Final
    bit0(0xcbce), //Row 9 - Final
    bit0(0xcbd0)  //Row 10 - Final 
]

TrainStations = [
    bit0(0xcbb1),
    bit1(0xcbb1), 
    bit2(0xcbb1),
    bit3(0xcbb1),
    bit4(0xcbb1)
]

// Room Codes
CatMinigame = 0x50e03470
SkeletonKeyLocation = 0x5cd53757
SwordLocation = 0x61c9395c
WingedBootsLocation = 0x59553256
BicepCardLocation = 0x47bf3570
ClubMembershipLocation = 0x50e53243
LegendaryGameDiskLocation = 0x5b70334b
BishumMushroomLocation = 0x4b403454
DreamCasinoKeyLocation = 0x4a903343
JunjiBedroom = 0x5fa53756
JunjiJumpScare = 0x589f3557
Ending1 = 0x5ef03468
Ending2 = 0x60583468
BombLicenseLocation = 0x55d03a66
FishingRodLocation = 0x55d03a66
ArrowBagLocation = 0x55d03a66
BowLocation = 0x47083859
BombBagLocation = 0x57383a66
BoomerangLocation = 0x57383a66
CDPlayerLocation = 0x65f8385a
CursedAmuletLocation = 0x49762163
GorgoArena = 0x6a30346d

//Key Items
Sword = bit0(0xcba7)
LegendaryGameDisk = bit3(0xcba7)
WingedBoots = bit1(0xcba5)
BishumMushroom = bit4(0xcba7)
BicepCard = bit1(0xcba7)
DreamCasinoKey = bit5(0xcba8)
SkeletonKey = bit4(0xcba8)
ClubMembership = bit2(0xcba7)

//Other Items
BombLicense = bit4(0xcba5)
BombBag = word(0xd245)
Bow = bit5(0xcba5)
ArrowBag = word(0xd257)
Boomerang = bit3(0xcba5)
CursedAmulet = bit7(0xcba8)
CDPlayer =  bit7(0xcba7)

// Treasures
NCCTreasureLocations = [
    byte(0xcc3b), //E3 - Gorgo's
    byte(0xd271), //F3 - Three Story House
    byte(0xd2d7), //G5 - Mall
    byte(0xd077), //D5 - Field
    byte(0xd04f)  //E2 - Field
]

DesertTreasureLocations = [
    byte(0xce2d), //H8 - Field
    byte(0xce05), //I6 - Field
    byte(0xccaf), //H7 - Dungeon
    byte(0xcc87), //H7 - Dungeon
    byte(0xd0a7), //G9 - Cave
    byte(0xce63)  //E9 - Cave
]

SwampTreasureLocations = [
    byte(0xd09d), //J4 - Cave
    byte(0xcead), //I1 - Field
    byte(0xd2b1), //G2 - Cave
    byte(0xcf01), //J1 - Dungeon
    byte(0xcfb9), //J1 - Dungeon
    byte(0xcf5b), //J1 - Dungeon
    byte(0xcfd3), //J1 - Dungeon
    byte(0xcfd5)  //J1 - Dungeon 
]

MountainTreasureLocations = [
    byte(0xd269), //C5 - Cave
    byte(0xd0bd), //B3 - Field
    byte(0xd26f), //C3 - Cave
    byte(0xd017), //A4 - Field
    byte(0xd0dd)  //A6 - Field
]

HillTreasureLocations = [
    byte(0xd267), //B8 - Cave
    byte(0xd19f), //A9 - Dungeon
    byte(0xd1b3), //A9 - Dungeon
    byte(0xd163), //A9 - Dungeon
    byte(0xd1f9)  //A9 - Dungeon
]

DesertDungeonRooms = [
    0x63e03371, //Start
    0x66b03372,
    0x4d602972,
    0x5300334e,
    0x6c50334e,
    0x58a0334f,
    0x5300294e,
    0x6980334e,
    0x47c02941,
    0x50303371,
    0x61103364,
    0x55d0334f,
    0x5e403350, //Boss Fight
    0x5b70334b  //Got Item
]

DesertDungeonEvents = [
    word(0xcbad), //Kleptopatra Defeated
    word(0xcb9b), //Boss door opened
    word(0xccdf), //Got Key 1
    word(0xcccf), //Opened Door 1
    word(0xcc65), //Got Key 2
    word(0xcccd)  //Opened Door 2
]

DesertDungeonTreasures = [
    byte(0xccaf), //East Key
    byte(0xcc87)  //West Key
]

SwampDungeonRooms = [
    0x6f203342, //Start
    0x58a0294d,
    0x40003451,
    0x42d0344e,
    0x45a0344f,
    0x69802950, 
    0x4870344f, 
    0x5e40294e,
    0x77903350,
    0x7d303350,
    0x74c0334e,
    0x71f03350,
    0x7a603350, 
    0x63e0294f, 
    0x4e10344e, //Boss Fight
    0x4b403454  //Got Item
]

SwampDungeonEvents = [
    word(0xcbb7), //Nofungus Defeated
    byte(0xceff), //Door 1
    byte(0xcf83), //Door 2
    byte(0xcfbb), //Door 3
    bit6(0xcbb6), //Power Switch 1
    byte(0xcfd9), //Key
    bit5(0xcbb6), //Warp Switch
    byte(0xcfc5), //Door 4
    bit7(0xcbb6), //Power Switch 2
    byte(0xcf0d), //Boss Door    
]

SwampDungeonTreasures = [
    byte(0xcf01),
    byte(0xcfb9),
    byte(0xcf5b),
    byte(0xcfd3),
    byte(0xcfd5)
]

HillsDungeonRooms = [
    0x50f5285e, //Start
    0x78453260,
    0x6fd5325f,
    0x6775285f,
    0x72a53260,
    0x75753260,
    0x42202962,
    0x42203363,
    0x6d152860,
    0x7de53261,
    0x7b153261,
    0x6a353261,
    0x56952861,
    0x5c35285f,
    0x44f03363,
    0x49762163,
    0x47c03364,
    0x61d52862,
    0x6d053262,
    0x4d603343, //Boss Fight
    0x4a903343  //Got Item
]

HillsDungeonEvents = [
    word(0xcbf9), //Underlord Defeated
    byte(0xd185), //Key 1
    byte(0xd16f), //Door 1 
    byte(0xd219), //East Key Block
    byte(0xd21b), //North Key Block
    byte(0xd21d), //West Key Block
    byte(0xd21f), //South Key Block
    byte(0xcbe5), //Boss Door
]

HillsDungeonTreasures = [
    byte(0xd19f),
    byte(0xd1b3),
    byte(0xd163),
    byte(0xd1f9)
]

//Helper Functions
function roomDidntChange() => prev(RoomCode32) == RoomCode32
function playingCatMinigame() => RoomCode32 == CatMinigame

//Easter Egg Functions
function jumpScare() => 
    prev(RoomCode32) == JunjiBedroom && RoomCode32 == JunjiJumpScare

//Challenge Functions
function desertDungeonChallenge() {
    return
    once
    (     
        RoomCode32 == 0x63e03371 &&
        none_of(DesertDungeonTreasures, (value) => value == 1) &&
        none_of(DesertDungeonEvents, (value) => value == 1)
    ) && 
    trigger_when(prev(DesertDungeonEvents[0]) == 1 && DesertDungeonEvents[0] == 1) &&
    never(none_of(DesertDungeonRooms, (value) => RoomCode32 == value)) &&
    never(tally(18, prev(RoomCode32) != RoomCode32))
}

function swampDungeonChallenge() {
    return
    once
    (     
        RoomCode32 == 0x6f203342 &&
        none_of(SwampDungeonTreasures, (value) => value == 1) &&
        none_of(SwampDungeonEvents, (value) => value == 1)
    ) && 
    trigger_when(prev(SwampDungeonEvents[0]) == 1 && SwampDungeonEvents[0] == 1) &&
    never(none_of(SwampDungeonRooms, (value) => RoomCode32 == value)) &&
    never(tally(26, prev(RoomCode32) != RoomCode32))
}

function hillsDungeonChallenge() {
    return
    once
    (     
        RoomCode32 == 0x50f5285e &&
        none_of(HillsDungeonTreasures, (value) => value == 1) &&
        none_of(HillsDungeonEvents, (value) => value == 1)
    ) && 
    trigger_when(prev(HillsDungeonEvents[0]) == 1 && HillsDungeonEvents[0] == 1) &&
    never(none_of(HillsDungeonRooms, (value) => RoomCode32 == value)) &&
    never(tally(37, prev(RoomCode32) != RoomCode32))
}

function wonCatMinigame() => 
    trigger_when(prev(CatMinigameCounter) == 0x4 && CatMinigameCounter == 0x5) && 
    disable_when(CatMinigameHitFlag == 0x1, !playingCatMinigame())
    
function foundAllTreasures(treasureLocations) =>
    prev(sum_of(treasureLocations, (value) => value)) == length(treasureLocations) - 1 && 
    measured(sum_of(treasureLocations, (value) => value) == length(treasureLocations), prev(sum_of(treasureLocations, (value) => value) < length(treasureLocations)))
    
function revealedAllMapTiles() =>
    prev(sum_of(MapTiles, (value) => value)) == 89 &&
    measured(sum_of(MapTiles, (value) => value) == 90, prev(sum_of(MapTiles, (value) => value)) < 90)
    
function obtainedAllHearts() => prev(PlayerMaxHealth) == 13 && measured(PlayerMaxHealth - 4 == 10, prev(PlayerMaxHealth) < 14)

function foundAllTrainStations() => 
    prev(sum_of(TrainStations, (value) => value)) == 4 && 
    measured(sum_of(TrainStations, (value) => value) == 5, prev(sum_of(TrainStations, (value) => value)) < 5)
     
//Item Functions
function foundSword() => 
    roomDidntChange() &&
    RoomCode32 == SwordLocation &&
    prev(Sword) == 0 && Sword == 1
        
function foundSkeletonKey() => 
    roomDidntChange() &&
    RoomCode32 == SkeletonKeyLocation &&
    prev(SkeletonKey) == 0 && SkeletonKey == 1
    
function foundWingedBoots() =>
    roomDidntChange() &&
    RoomCode32 == WingedBootsLocation &&
    prev(WingedBoots) == 0 && WingedBoots == 1
    
function foundBicepCard() =>
    roomDidntChange() &&
    RoomCode32 == BicepCardLocation &&
    prev(BicepCard) == 0 && BicepCard == 1
    
function foundClubMembership() => 
    roomDidntChange() &&
    RoomCode32 == ClubMembershipLocation &&
    prev(ClubMembership) == 0 && ClubMembership == 1
    
function foundBombLicense() => 
    roomDidntChange() && 
    RoomCode32 == BombLicenseLocation && 
    prev(BombLicense) == 0 && BombLicense == 1
    
function foundBombBag() => 
    roomDidntChange() &&
    RoomCode32 == BombBagLocation &&
    prev(BombBag) == 0 && BombBag == 1
    
function foundBow() => 
    roomDidntChange() &&
    RoomCode32 == BowLocation &&
    prev(Bow) == 0 && Bow == 1
    
function foundArrowBag() => 
    roomDidntChange() &&
    RoomCode32 == ArrowBagLocation &&
    prev(ArrowBag) == 0 && ArrowBag == 1
    
function foundBoomerang() => 
    roomDidntChange() &&
    RoomCode32 == BoomerangLocation &&
    prev(Boomerang) == 0 && Boomerang == 1
    
function foundCDPlayer() => 
    roomDidntChange() &&
    RoomCode32 == CDPlayerLocation &&
    prev(CDPlayer) == 0 && CDPlayer == 1
    
function foundCursedAmulet() => 
    roomDidntChange() &&
    RoomCode32 == CursedAmuletLocation &&
    prev(CursedAmulet) == 0 && CursedAmulet == 1
    
//Boss/Dungeon Functions
function defeatedGorgo(cursed = false){
    cleared = roomDidntChange() &&
        RoomCode32 == GorgoArena &&
        PlayerMoney - prev(PlayerMoney) == 120
        
    if(cursed == true)
        cleared = cleared && CursedMode == 1
        
    return cleared
}

function clearedDesertDungeon(cursed = false)
{
    cleared = roomDidntChange() &&
        RoomCode32 == LegendaryGameDiskLocation && 
        prev(LegendaryGameDisk) == 0 && LegendaryGameDisk == 1
        
    if(cursed == true)
        cleared = cleared && CursedMode == 1
        
    return cleared
}
    
function clearedSwampDungeon(cursed = false){
    cleared = roomDidntChange() &&
        RoomCode32 == BishumMushroomLocation &&
        prev(BishumMushroom) == 0 && BishumMushroom == 1
    
    if(cursed == true)
        cleared = cleared && CursedMode == 1
        
    return cleared
}  
    
function clearedHillsDungeon(cursed = false){
    cleared = roomDidntChange() &&
        RoomCode32 == DreamCasinoKeyLocation &&
        prev(DreamCasinoKey) == 0 && DreamCasinoKey == 1
        
    if (cursed == true)
        cleared = cleared && CursedMode == 1
    
    return cleared
}
    
function clearedGame(cursed = false)
{
    cleared = prev(RoomCode32) == Ending1 && RoomCode32 == Ending2 
    
    if(cursed == true)
        cleared = cleared && CursedMode == 1
    
    return cleared
} 
    
//Optional Achievements
achievement(title = "Kowai!!!", points = 2, description = "Find a surprise in a horror author's eerie abode", trigger = jumpScare(), id = 381675)
achievement(title = "Debt Collector", points = 3, description = "Defeat Gorgo and receive your overdue rent!", trigger = defeatedGorgo(), id = 382116)
achievement(title = "License to Detonate", points = 3, description = "Get your demolition certification and buy the Bomb License", trigger = foundBombLicense(), id = 382176)
achievement(title = "Doling out Destruction", points = 3, description = "Expand your capacity for destruction and buy the Bomb Bag", trigger = foundBombBag(), id = 382177)
achievement(title = "Archery Accouterments", points = 3, description = "Trade a tastey snack for the Bow", trigger = foundBow(), id = 382178)
achievement(title = "Compound Quiver", points = 3, description = "Expand your capacity for archery and buy the Arrow Bag", trigger = foundArrowBag(), id = 382179)
achievement(title = "In this Economy?!", points = 5, description = "Bust your budget and buy the Boomerang", trigger = foundBoomerang(), id = 382180)
achievement(title = "Chiptune Devotee", points = 5, description = "Recieve the CD Player from a chiptune prodigy", trigger = foundCDPlayer(), id = 382181)
achievement(title = "Hopelessly Hexed", points = 5, description = "Find the Cursed Amulet by applying your classic cheat code knowledge in the Hills", trigger = foundCursedAmulet(), id = 382182)
    
//Progression Achievements
achievement(title = "Do Hairclips Count?", points = 1, description = "Obtain the Sword from a mysterious stranger from another land", trigger = foundSword(), id = 380621)
achievement(title = "It'sss Mine to Keep!", points = 5, description = "Defeat the desert thief Kleptopatra and obtain the Legendary Game Disk", trigger = clearedDesertDungeon(), id = 381672)
achievement(title = "Freshly Plundered Swag!", points = 3, description = "Obtained the Winged Boots from an elderly retro gaming collector", trigger = foundWingedBoots(), id = 380622)
achievement(title = "Eww... No Thank You", points = 5, description = "Defeat the sporeling commander Nofungus and obtain the Bishum Mushroom", trigger = clearedSwampDungeon(), id = 381673)
achievement(title = "Salty Delivery!", points = 3, description = "Obtained the Bicep Card from a mushroom powered witch", trigger = foundBicepCard(), id = 380623)
achievement(title = "A Cheeky Trade!", points = 3, description = "Obtain the Skeleton Key from a cat loving cosmic horror enthusiast", trigger = foundSkeletonKey(), id = 379607)
achievement(title = "Politely Accepted", points = 5, description = "Defeat the benevolent ruler Underlord and obtain the Dream Casino Key", trigger = clearedHillsDungeon(), id = 381674)
achievement(title = "Unwavering Otaku", points = 5, description = "Obtain the Anime Club Membership Card from a dedicated anime fan", trigger = foundClubMembership(), id = 380624)
achievement(title = "THIS IS FOR ANIME!", points = 10, description = "Save the world, technology, and anime by defeating the Y2K Bug!", trigger = clearedGame(), id = 381671)

//Treasure Achievements
achievement(title = "Wasteland Wealth", points = 5, description = "Open all treasure chests found in the Desert and the Desert Dungeon", trigger = foundAllTreasures(DesertTreasureLocations), id = 379604)
achievement(title = "Putrid Prizes", points = 5, description = "Open all treasure chests found in the Swamp and the Swamp Dungeon", trigger = foundAllTreasures(SwampTreasureLocations), id = 380249)
achievement(title = "Fridged Fortunes", points = 5, description = "Open all treasure chests found in the Mountains", trigger = foundAllTreasures(MountainTreasureLocations), id = 379605)
achievement(title = "Cliffside Cache", points = 5, description = "Open all treasure chests found in the Hills and the Hills Dungeon", trigger = foundAllTreasures(HillTreasureLocations), id = 379606)
achievement(title = "Arboreal Abundance", points = 5, description = "Open all treasure chests found in New Crunchy City and the Forest", trigger = foundAllTreasures(NCCTreasureLocations), id = 380250)

//Challenge Achievements
achievement(title = "In the Neko Time", points = 5, description = "Successfully pet Yuzu 5 times without getting scratched", trigger = wonCatMinigame(), id = 379603)
achievement(title = "Chibi Cartographer", points = 5, description = "Explored the entire map and revealed all map tiles", trigger = revealedAllMapTiles(), id = 382109)
achievement(title = "Ace of Hearts", points = 5, description = "Obtained all hearts and max out Hime's Health", trigger = obtainedAllHearts(), id = 382110)
achievement(title = "All Aboard!", points = 3, description = "Visit and activate all Train Stations", trigger = foundAllTrainStations(), id = 382111)
achievement(title = "The Landlord's Curse", points = 5, description = "Clear Gorgo's Basement on Cursed Mode", trigger = defeatedGorgo(true), id = 382117)
achievement(title = "The Curse of the Badlands", points = 5, description = "Clear the Desert Dungeon on Cursed Mode", trigger = clearedDesertDungeon(true), id = 382112)
achievement(title = "The Quagmire Curse", points = 10, description = "Clear the Swamp Dungeon on Cursed Mode", trigger = clearedSwampDungeon(true), id = 382113)
achievement(title = "The Curse of the Foothills", points = 10, description = "Clear the Hills Dungeon on Cursed Mode", trigger = clearedHillsDungeon(true), id = 382115)
achievement(title = "The Millenial Curse", points = 25, description = "Clear the Dream Casino on Cursed Mode", trigger = clearedGame(true), id = 382114)

achievement(
    title = "An Arid Route", points = 10, 
    description = "In one session, and without leaving, clear the Desert Dungeon in 17 screen transitions or less (Cursed or Normal, Reloads OK, No prior progress)", 
    trigger = desertDungeonChallenge(),
    id = 382657
)

achievement(
    title = "A Marshy Route", points = 10, 
    description = "In one session, and without leaving, clear the Swamp Dungeon in 25 screen transitions or less (Cursed or Normal, Reloads OK, No prior progress)", 
    trigger = swampDungeonChallenge(),
    id = 382659
)

achievement(
    title = "A Craggy Route", points = 10, 
    description = "In one session, and without leaving, clear the Hills Dungeon in 36 screen transitions or less (Cursed or Normal, Reloads OK, No prior progress)", 
    trigger = hillsDungeonChallenge(),
    id = 382668
)