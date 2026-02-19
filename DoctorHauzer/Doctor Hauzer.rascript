// Doctor Hauzer
// #ID = 16480

class Region {
    Code = dword(0x4)
    Lookup = {
        0xea0045ae: "Translated Version",
        0xea0040a0: "Original Version"
    }
}
region = Region()

class States {
    InGame = 0x7f670010
    Cutscene = 0xf8374
    Ending = 0x4f204920
}

class State {
    Code = dword(0x12aaf0)
    States = States()
}
state = State()

class Options {
    Demo = 0x00
    Opening = 0x01
    NewGame = 0x02
    Continue = 0x03
    Controls = 0x04
}

class Option {
    Code = dword(0xa3ed4)
    Options = Options()
}
option = Option()

class Rooms {
    Room = dword(0xa2078)
    Lookup = {
        0x00: "Title", 
        0x01: "Entrance", 
        0x02: "Main Hall", 
        0x03: "F1 Big Hallway",
        0x04: "F1 Hallway", 
        0x05: "Guest Room", 
        0x06: "F1 Bed Room", 
        0x07: "F1 Living Room",
        0x08: "Dining Room", 
        0x09: "Bath", 
        0x0A: "Pantry", 
        0x0B: "Kitchen",
        0x0C: "Study",
        0xC9: "F2 Bedroom", 
        0xCA: "Changing Room", 
        0xCB: "Laboratory",
        0xCC: "F2 Living Room",
        0xCD: "Dance Room", 
        0xCE: "Hidden Room", 
        0xCF: "Art Gallery",
        0xD0: "Reference Room", 
        0xD1: "Storehouse", 
        0xD2: "F2 Hallway", 
        0xD3: "F2 Big Hallway",
        0xD4: "Hidden Passage", 
        0xD5: "Stairwell", 
        0xD7: "Cabinet",
        0xD8: "Hidden Ladder",
        0x12D: "Cave Entrance", 
        0x12E: "Dungeon", 
        0x12F: "Underground Ruins",
        0x130: "Cavern", 
        0x131: "Ruin Entrance"
    }
}
rooms = Rooms()

class UndergroundRuinEvents {
    UsedWifePainting = dword(0xad30c)
    BossHitsTaken = dword(0xad310) // 10 = Dead
}

class CaveEntranceEvents {
    Cutscene = dword(0xad578)
}

class EntranceEvents {
    ChandelierTimer = dword(0xad494)
    Intro = dword(0xad560)
    ChandelierTrap = dword(0xad624) // 1 = Triggered
}

class MainHallEvents {
    IronKey = dword(0xad49c) // 1 = Obtained, 2 = Unlocked F1 Hallway
    Cutscene = dword(0xad598)
    HauzerPainting = dword(0xad600) // 1 = Examined
    HauzerWifePainting = dword(0xad608) // 1 = Examined
}

class F1BedroomEvents {
    RustedKey = dword(0xad4a0) // 1 = Obtained, 2 = Unlocked F1 Living Room
    HauzerDiary1 = dword(0xad4c4)
    F1RoughMap = dword(0xad4dc)
}

class F1BigHallwayEvents {
    Switch = dword(0xad538)
}

class F2BigHallwayEvents {
    StrangePainting = dword(0xad594) // 1 = Examined
}

class BathroomEvents {
    RightFaucet = dword(0xad53c) // 1 = Unlock Door
    LeftFaucet = dword(0xad56c) // Triggers Trap. When it reaches 100 it will kill the player.
}

class ReferenceRoomEvents {
    F2RoughMap = dword(0xad4e0)
    MansionPainting = dword(0xad558) // 1-3 = Examined, 4 = Cut with Knife, 5 = Obtained F2 Rough Map
    Cutscene = dword(0xad57c)
}

class F1HallwayEvents {
    BoulderTrap = dword(0xad604) // 1 = Triggered, 2 = Escaped
}

class F2HallwayEvents {
    CopperKey = dword(0xad4a4) // 1 = Obtained, 2 = Unlocked Dance Room
    WorkerMemo = dword(0xad4d8)
}

class DanceRoomEvents {
    WoodenKey = dword(0xad4a8) // 1 = Obtained, 2 = Unlocked F2 Big Hallway
    BladeTrapTimer = dword(0xad55c)
}

class StudyEvents {
    BronzeKey = dword(0xad4ac) // 1 = Obtained, 2 = Unlocked Storehouse
    HauzerDiary2 = dword(0xad4c8)
    LithographMemo = dword(0xad4d4)
    Dictionary = dword(0xad4e4)
    LeatherBook = dword(0xad4e8)
    VentCover = dword(0xad50c)
}

class StorehouseEvents {
    Lighter = dword(0xad510) // 1 = Obtained, 2 = Lit Dynamite in Cavern, 3 = Dynamite Exploded
    Crowbar = dword(0xad514) // 1 = Obtained, 2 = Revealed Hidden Passage, 4 = Prying Open Hidden Passage
    Shotgun = dword(0xad518) // 1 = Obtained, 2 = Break Glass in Hidden Room
}

class CavernEvents {
    DynamiteTimer = dword(0xad588)
    RailCar = dword(0xad59c)
}

class CabinetEvents {
    Dynamite = dword(0xad51c) // 1 = Obtained, 2 = Placed in Cavern
}

class F1LivingRoomEvents {
    Dresser = dword(0xad570)
    Table = dword(0xad58c) // 1 = Flipped Floor Switch
}

class F2LivingRoomEvents {
    PhotoOfWife = dword(0xad520)
    Fireplace = dword(0xad54c)
}

class ArtGalleryEvents {
    Paintings = dword(0xad554) // 1-7 = Triggered Puzzle Step, 8 = Solved Puzzle
    WallTrap = dword(0xad574) // 1 = Triggered
}

class HiddenPassageEvents {
    Light = dword(0xad590)  // 1 = Used Candlestick, 2 = Lit Candlestick with Lighter
}

class HiddenRoomEvents {
    HauzerDiary3 = dword(0xad4cc)
}

class ArtGalleryEvents {
    PatinatedKey = dword(0xad4b0) // 1 = Obtained, 2 = Unlocked Reference Room
}

class LaboratoryEvents {
    GoldKey = dword(0xad4b4) // 1 = Obtained, 2 = Unlocked Changing Room
    HauzerDiary4 = dword(0xad4d0)
}

class PantryEvents {
    BrassKey = dword(0xad4b8) // 1 = Obtained, 2 = Unlocked Dining Room
    OilCan = dword(0xad4f4)
    Knife = dword(0xad4f8)
}

class DiningRoomEvents {
    Lithograph = dword(0xad4fc)
    Candlestick = dword(0xad500)
}

class KitchenEvents {
    Axe = dword(0xad504) // 1 = Obtained, 2 = Placed in rack in F2 Bedroom
    Table = dword(0xad540) // 1 = Falls in Pit, 2 = Creates Bridge over Pit
}

class ChangingRoom {
    F2BedroomClockDart = dword(0xad548) // 1 = Triggered, 2 = Disarmed
    Cabinet = dword(0xad564) // 1 = Found Something, 2 = It's a Switch
}

class GuestRoomEvents {
    SilverKey = dword(0xad4bc) // 1 = Obtained, 2 = Unlocked Reference Room Cabinet
    DryFlower = dword(0xad4ec) // 1 = Obtained, 2 = Placed in Vase
    VaseDeathScene = dword(0xad4f0)
}

class DungeonEvents {
    BoneKey = dword(0xad4c0) // 1 = Obtained, 2 = Unlocked Underground Ruins
}

class Events {
    Entrance = EntranceEvents()
    MainHall = MainHallEvents()
    F1BigHallway = F1BigHallwayEvents()
    F1Hallway = F1HallwayEvents()
    GuestRoom = GuestRoomEvents()
    F1Bedroom = F1BedroomEvents()
    F1LivingRoom = F1LivingRoomEvents()
    DiningRoom = DiningRoomEvents()
    Bath = BathroomEvents()
    Pantry = PantryEvents()
    Kitchen = KitchenEvents()
    Study = StudyEvents()
    F2Bedroom = F2BedroomEvents()
    ChangingRoom = ChangingRoom()
    Laboratory = LaboratoryEvents()
    F2LivingRoom = F2LivingRoomEvents()
    DanceRoom = DanceRoomEvents()
    HiddenRoom = HiddenRoomEvents()
    ArtGallery = ArtGalleryEvents()
    ReferenceRoom = ReferenceRoomEvents()
    Storehouse = StorehouseEvents()
    F2Hallway = F2HallwayEvents()
    F2BigHallway = F2BigHallwayEvents()
    HiddenPassage = HiddenPassageEvents()
    Cabinet = CabinetEvents()
    CaveEntrance = CaveEntranceEvents()
    Dungeon = DungeonEvents()
    UndergroundRuins = UndergroundRuinEvents()
    Cavern = CavernEvents()

    Keys = [
        MainHall.IronKey,
        F1Bedroom.RustedKey,
        F2Hallway.CopperKey,
        DanceRoom.WoodenKey,
        Study.BronzeKey,
        ArtGallery.PatinatedKey,
        Laboratory.GoldKey,
        Pantry.BrassKey,
        GuestRoom.SilverKey,
        Dungeon.BoneKey
    ]

    BooksAndMemos = [
        F1Bedroom.HauzerDiary1,
        Study.HauzerDiary2,
        HiddenRoom.HauzerDiary3,
        Laboratory.HauzerDiary4,
        Study.LithographMemo,
        F2Hallway.WorkerMemo,
        Study.Dictionary,
        Study.LeatherBook
    ]

    Maps = [
        F1Bedroom.F1RoughMap,
        ReferenceRoom.F2RoughMap
    ]

    WeaponsAndTools = [
        Pantry.Knife,
        DiningRoom.Candlestick,
        Kitchen.Axe,
        Storehouse.Lighter,
        Storehouse.Crowbar,
        Storehouse.Shotgun,
        Cabinet.Dynamite
    ]

    Progression = [
        
    ]

    VentCover = Study.VentCover
    OilCan = Pantry.OilCan
    Lithograph = DiningRoom.Lithograph
    PhotoOfWife = F2LivingRoom.PhotoOfWife
}
events = Events()

rich_presence_conditional_display(region.Code != 0, "{0} | Room: {1}",
    rich_presence_lookup("Region", region.Code, region.Lookup, "Loading..."),
    rich_presence_lookup("Room", rooms.Room, rooms.Lookup, "Not Found")
)

rich_presence_display("Playing Doctor Hauzer!")