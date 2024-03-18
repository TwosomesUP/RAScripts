// ~Homebrew~ Hime's Quest
// #ID = 22353

// Address Constants
RoomCode = word(0xc52a)
RoomCode32 = dword(0xc528)
PlayerMaxHealth = word(0xcb75)
CursedMode = bit0(0xcc07)

//Desert Dungeon Challenge - 16 or less screen transitions
//Swamp Dungeon Challenge - 23 or less screen transitions
//Hills Dungeon Challgene - 30 or less screen transitions

Treasures = [
    byte(0xcc3b), //E3 - Gorgo's Basement
    byte(0xd271), //F3 - 3 Story House
    byte(0xd2d7), //G5 - Mall
    byte(0xd077), //D5 - Field
    byte(0xd04f), //E2 - Field
    byte(0xce2d), //H8 - Field
    byte(0xce05), //I6 - Field
    byte(0xccaf), //H7 - Dungeon
    byte(0xcc87), //H7 - Dungeon
    byte(0xd0a7), //G9 - Cave
    byte(0xce63), //E9 - Cave
    byte(0xd09d), //J4 - Cave
    byte(0xcead), //I1 - Field
    byte(0xd2b1), //G2 - Cave
    byte(0xcf01), //J1 - Dungeon
    byte(0xcfb9), //J1 - Dungeon
    byte(0xcf5b), //J1 - Dungeon
    byte(0xcfd3), //J1 - Dungeon
    byte(0xcfd5), //J1 - Dungeon 
    byte(0xd269), //C5 - Cave
    byte(0xd0bd), //B3 - Field
    byte(0xd26f), //C3 - Cave
    byte(0xd017), //A4 - Field
    byte(0xd0dd), //A6 - Field
    byte(0xd267), //C5 - Cave
    byte(0xd19f), //A9 - Dungeon
    byte(0xd1b3), //A9 - Dungeon
    byte(0xd163), //A9 - Dungeon
    byte(0xd1f9)  //A9 - Dungeon
]

TrainStations = [
    bit0(0xcbb1), //NCC
    bit1(0xcbb1), //Desert
    bit2(0xcbb1), //Swamp
    bit3(0xcbb1), //Mountain
    bit4(0xcbb1)  //Hills
]

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

SplashRooms = [
    0x00000000,
    0x5abd326c,
    0x5a07354a, //Crunchyroll
    0x5cd73565  //Poppy
]

IntroRooms = [
    0x5b6f3565,
    0x5ee41b50,
    0x50e53257,
    0x4a8f3550,
    0x50e53258,
    0x502f3558,
    0x4d5f3551,
    0x502f3552,
    0x5a3a2155,
    0x502e3156,
    0x50e53259,
    0x51973557,
    0x54673556
]

TitleRooms = [
    0x5cd83a66, //Title
    0x62773548 //Load Game
]

EndingRooms = [
    0x53b03444,
    0x56803467,
    0x57e83467,
    0x59503467,
    0x5c203467,
    0x4d123167,
    0x5ef03468,
    0x60583468,
    0x55183468,
    0x64953245, //Credits
    0x64953269, //Credits
    0x6495326a, //Credits
    0x6495326b, //Credits
    0x605d3259, //Epilogue
]

BossLookup = {
    0x5e403350: "Kleptopatra",
    0x5e40335e: "Kleptopatra", //2
    0x4e10344e: "Nofungus",
    0x4e10345d: "Nofungus", //2
    0x6a30346d: "Gorgo",
    0x4d603343: "Underlord",
    0x4d60336c: "Underlord", //2
    0x6490345f: "Y2K Bug",
    0x6328345e: "Y2K Bug",
    0x70883a69: "Y2K Bug" //Actual Fight
}

DungeonLookup = {
    0x63e03371: "the Desert Dungeon",
    0x66b03372: "the Desert Dungeon",
    0x4d602972: "the Desert Dungeon",
    0x5300334e: "the Desert Dungeon",
    0x6c50334e: "the Desert Dungeon",
    0x58a0334f: "the Desert Dungeon",
    0x5300294e: "the Desert Dungeon",
    0x6980334e: "the Desert Dungeon",
    0x47c02941: "the Desert Dungeon",
    0x50303371: "the Desert Dungeon",
    0x61103364: "the Desert Dungeon",
    0x55d0334f: "the Desert Dungeon",
    0x5b70334b: "the Desert Dungeon",
    0x6f203342: "the Swamp Dungeon",
    0x58a0294d: "the Swamp Dungeon",
    0x40003451: "the Swamp Dungeon",
    0x42d0344e: "the Swamp Dungeon",
    0x45a0344f: "the Swamp Dungeon",
    0x69802950: "the Swamp Dungeon", 
    0x4870344f: "the Swamp Dungeon", 
    0x5e40294e: "the Swamp Dungeon",
    0x77903350: "the Swamp Dungeon",
    0x7d303350: "the Swamp Dungeon",
    0x74c0334e: "the Swamp Dungeon",
    0x71f03350: "the Swamp Dungeon",
    0x7a603350: "the Swamp Dungeon", 
    0x63e0294f: "the Swamp Dungeon",
    0x4b403454: "the Swamp Dungeon",
    0x50f5285e: "the Hills Dungeon",
    0x78453260: "the Hills Dungeon",
    0x6fd5325f: "the Hills Dungeon",
    0x6775285f: "the Hills Dungeon",
    0x72a53260: "the Hills Dungeon",
    0x75753260: "the Hills Dungeon",
    0x42202962: "the Hills Dungeon",
    0x42203363: "the Hills Dungeon",
    0x6d152860: "the Hills Dungeon",
    0x7de53261: "the Hills Dungeon",
    0x7b153261: "the Hills Dungeon",
    0x6a353261: "the Hills Dungeon",
    0x56952861: "the Hills Dungeon",
    0x5c35285f: "the Hills Dungeon",
    0x44f03363: "the Hills Dungeon",
    0x49762163: "the Hills Dungeon",
    0x47c03364: "the Hills Dungeon",
    0x61d52862: "the Hills Dungeon",
    0x6d053262: "the Hills Dungeon",
    0x4a903343: "the Hills Dungeon",
    0x421f3541: "Gorgo's Basement",
    0x7570346e: "Gorgo's Basement",
    0x7840346e: "Gorgo's Basement",
    0x7b10346e: "Gorgo's Basement",
    0x7de0346f: "Gorgo's Basement",
    0x44ef3553: "Gorgo's Basement"
}

CursedModeLookup = {
    1: " in Cursed Mode"
}

function inGame() => 
    all_of(SplashRooms, (value) => RoomCode32 != value) &&
    all_of(IntroRooms, (value) => RoomCode32 != value) &&
    all_of(TitleRooms, (value) => RoomCode32 != value) &&
    all_of(DungeonLookup, (value) => RoomCode32 != value) &&
    all_of(BossLookup, (value) => RoomCode32 != value) &&
    all_of(EndingRooms, (value) => RoomCode32 != value) &&
    PlayerMaxHealth > 0
    
function inMenus() => any_of(TitleRooms, (value) => RoomCode32 == value)
function inIntro() => any_of(IntroRooms, (value) => RoomCode32 == value)
function inEnding() => any_of(EndingRooms, (value) => RoomCode32 == value)
function inDungeon() => any_of(DungeonLookup, (value) => RoomCode32 == value)
function fightingBoss() => any_of(BossLookup, (value) => RoomCode32 == value)

function totalTreasures() => sum_of(Treasures, (value) => value)   
function totalHearts() => PlayerMaxHealth - 4
function totalMapTiles() => sum_of(MapTiles, (value) => value)
function totalTrainStations() => sum_of(TrainStations, (value) => value)

rich_presence_conditional_display(inMenus(), "On Title Screen")
rich_presence_conditional_display(inIntro(), "Watching Intro")
rich_presence_conditional_display(inEnding(), "Watching the Ending!")

rich_presence_conditional_display(inDungeon(), "Exploring {5}{6} ・ 💎 {0}/{1} ・ ❤︎ {2}/10 ・ 🚂 {3}/5 ・ 🌍 {4}/90",
    rich_presence_value("CurrentTreasures", totalTreasures()),
    rich_presence_value("MaxTreasures", length(Treasures)),
    rich_presence_value("CurrentHearts", totalHearts()),
    rich_presence_value("CurrentStations", totalTrainStations()),
    rich_presence_value("CurrentMapTiles", totalMapTiles()),
    rich_presence_lookup("Dungeon", RoomCode32, DungeonLookup),
    rich_presence_lookup("CursedMode", CursedMode, CursedModeLookup)
)

rich_presence_conditional_display(fightingBoss(), "Fighting {5}{6} ・ 💎 {0}/{1} ・ ❤︎ {2}/10 ・ 🚂 {3}/5 ・ 🌍 {4}/90",
    rich_presence_value("CurrentTreasures", totalTreasures()),
    rich_presence_value("MaxTreasures", length(Treasures)),
    rich_presence_value("CurrentHearts", totalHearts()),
    rich_presence_value("CurrentStations", totalTrainStations()),
    rich_presence_value("CurrentMapTiles", totalMapTiles()),
    rich_presence_lookup("Boss", RoomCode32, BossLookup),
    rich_presence_lookup("CursedMode", CursedMode, CursedModeLookup)
)

rich_presence_conditional_display(inGame(), "Saving New Crunchy City{5} ・ 💎 {0}/{1} ・ ❤︎ {2}/10 ・ 🚂 {3}/5 ・ 🌍 {4}/90",
    rich_presence_value("CurrentTreasures", totalTreasures()),
    rich_presence_value("MaxTreasures", length(Treasures)),
    rich_presence_value("CurrentHearts", totalHearts()),
    rich_presence_value("CurrentStations", totalTrainStations()),
    rich_presence_value("CurrentMapTiles", totalMapTiles()),
    rich_presence_lookup("CursedMode", CursedMode, CursedModeLookup)
)

rich_presence_display("Playing Hime's Quest")