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
    Title = 0x01
    InGame = 0x7f670010
    Cutscene = 0xf8374
    Ending = 0x4f204920
}

class State {
    Code = dword(0x12aaf0)
    States = States()
}
state = State()

class Modes {
    Demo = 0x00
    Opening = 0x01
    NewGame = 0x02
    Continue = 0x03
    Controls = 0x04
}

class Mode {
    Code = dword(0xa3ed4)
    Modes = Modes()
}
mode = Mode()

class Room {
    Name = ""
    Value = 0
}

class Rooms {
    Code = dword(0xa2078)

    Title = Room("Title", 0x00)
    Entrance = Room("Entrance", 0x01)
    MainHall = Room("Main Hall", 0x02)
    F1BigHallway = Room("F1 Big Hallway", 0x03)
    F1Hallway = Room("F1 Hallway", 0x04)
    GuestRoom = Room("Guest Room", 0x05)
    F1BedRoom = Room("F1 Bed Room", 0x06)
    F1LivingRoom = Room("F1 Living Room", 0x07)
    DiningRoom = Room("Dining Room", 0x08)
    Bath = Room("Bath", 0x09)
    Pantry = Room("Pantry", 0x0a)
    Kitchen = Room("Kitchen", 0x0b)
    Study = Room("Study", 0x0c)
    F2Bedroom = Room("F2 Bedroom", 0xc9)
    ChangingRoom = Room("Changing Room", 0xca)
    Laboratory = Room("Laboratory", 0xcb)
    F2LivingRoom = Room("F2 Living Room", 0xcc)
    DanceRoom = Room("Dance Room", 0xcd)
    HiddenRoom = Room("Hidden Room", 0xce)
    ArtGallery = Room("Art Gallery", 0xcf)
    ReferenceRoom = Room("Reference Room", 0xd0)
    Storehouse = Room("Storehouse", 0xd1)
    F2Hallway = Room("F2 Hallway", 0xd2)
    F2BigHallway = Room("F2 Big Hallway", 0xd3)
    HiddenPassage = Room("Hidden Passage", 0xd4)
    Stairwell = Room("Stairwell", 0xd5)
    Cabinet = Room("Cabinet", 0xd7)
    HiddenLadder = Room("Hidden Ladder", 0xd8)
    CaveEntrance = Room("Cave Entrance", 0x12d)
    Dungeon = Room("Dungeon", 0x12e)
    UndergroundRuins = Room("Underground Ruins", 0x12f)
    Cavern = Room("Cavern", 0x130)
    RuinEntrance = Room("Ruin Entrance", 0x131)

    AllRooms = [
       Title,
       Entrance,
       MainHall,
       F1BigHallway,
       F1Hallway,
       GuestRoom,
       F1BedRoom,
       F1LivingRoom,
       DiningRoom,
       Bath,
       Pantry,
       Kitchen,
       Study,
       F2Bedroom,
       ChangingRoom,
       Laboratory,
       F2LivingRoom,
       DanceRoom,
       HiddenRoom,
       ArtGallery,
       ReferenceRoom,
       Storehouse,
       F2Hallway,
       F2BigHallway,
       HiddenPassage,
       Stairwell,
       Cabinet,
       HiddenLadder,
       CaveEntrance,
       Dungeon,
       UndergroundRuins,
       Cavern,
       RuinEntrance 
    ]

    function GetLookup() {
        lookup = {}
        for room in this.AllRooms {
            lookup[room.Value] = room.Name
        }
        return lookup
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
    HauzerGhost = dword(0xad57c)
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

class Door {
    Event = 0
    OpenValue = 2
}

class Trap {
    Event = 0
    DisarmValue = 2
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

    Doors = [
        Door(MainHall.IronKey),
        Door(F1Bedroom.RustedKey),
        Door(F2Hallway.CopperKey),
        Door(DanceRoom.WoodenKey),
        Door(Study.BronzeKey),
        Door(ArtGallery.PatinatedKey),
        Door(Laboratory.GoldKey),
        Door(Pantry.BrassKey),
        Door(GuestRoom.SilverKey),
        Door(Dungeon.BoneKey),
        Door(GuestRoom.DryFlower),
        Door(F1LivingRoom.Table, 1),
        Door(Kitchen.Axe)
    ]

    Traps = [
        Trap(GuestRoom.DryFlower),
        Trap(F1BigHallway.Switch, 1),
        Trap(Bath.RightFaucet, 1),
        Trap(Kitchen.Table),
        Trap(ChangingRoom.F2BedroomClockDart),
        Trap(F1Hallway.BoulderTrap),
        Trap(Entrace.ChandelierTrap, 1)
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
}
events = Events()

class Achievement {
    Type = 0 // 0 = None, 1 = Progression, 2 = Win Condition, 3 = Missable
    Points = 0
    Title = ""
    Description = ""
    Trigger = always_false()
    Id = 0
}

class AchievementHelpers {
    function IsLoaded() {
        return region.Code != 0
    }

    function IsPlaying() {
        return mode.Code > mode.Modes.Opening &&
            mode.Code < mode.Modes.Controls
    }

    function IsInGame() {
        return state.Code == state.States.InGame
    }

    function IsInCutscene() {
        return state.Code == state.States.Cutscene
    }

    function IsNewGame() {
        return mode.Code == mode.Modes.NewGame
    }

    function IsContinuedGame() {
        return mode.Code == mode.Modes.Continue
    }

    function IsOnTitle() {
        return state.Code == state.States.Title
    }

    function IsInRoom(room) {
        return rooms.Code == room.Value
    }

    function RoomTransition(from, to) {
        return prev(rooms.Code) == from.Value &&
            rooms.Code == to.Value
    }

    function TriggeredEvent(event, previous = 0, current = 1) {
        return prev(event) == previous &&
            event == current
    }

    function TriggeredAllEvents(eventList, end = 1) {
        assert(end > 0, "TriggeredAllEvents: Target value for the event must be greater than 0")

        count = length(eventList)
        start = end - 1

        conditions = []
        for event in eventList {
            // Only register a hit when in game and an event was triggered at any point
            array_push(conditions, once(helpers.IsLoaded() && helpers.IsPlaying() && helpers.IsInGame() && event > start))
        }

        return all_of(eventList, event => event > start) &&
            any_of
            (
                eventList, 
                event => measured
                (
                    tally(count, conditions),

                    // Save Protection: Only display measured counter when in game and only unlock if an event triggered this frame
                    helpers.IsLoaded() && 
                    helpers.IsPlaying() && 
                    helpers.IsInGame() && 
                    prev(event) == start && event == end
                )
            ) &&

            // Reset all hits if not in game
            never(!helpers.IsLoaded()) &&
            never(!helpers.IsPlaying()) &&
            never(helpers.IsOnTitle())
    }
}
helpers = AchievementHelpers()

class AchievementTriggers{
    function TheWitheredBouquet() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            events.GuestRoom.DryFlower == 2 &&
            helpers.RoomTransition(rooms.GuestRoom, rooms.F1BedRoom)
    }

    function TheProperArrangement() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            events.F1LivingRoom.Dresser == 1 &&
            events.F1LivingRoom.Table == 1 &&
            helpers.RoomTransition(rooms.F1LivingRoom, rooms.F1Hallway)
    }

    function AHollowDiscovery() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            helpers.IsInRoom(rooms.Pantry) &&
            helpers.TriggeredEvent(events.Pantry.OilCan)
    }

    function AncientRemains() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            events.DiningRoom.Lithograph == 1 &&
            helpers.RoomTransition(rooms.DiningRoom, rooms.F1Hallway)
    }

    function TheHouseBreathes() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            helpers.IsInRoom(rooms.Study) &&
            helpers.TriggeredEvent(events.Study.VentCover)
    }

    function TheGallerysAnswer() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            events.ArtGallery.PatinatedKey > 0 &&
            helpers.RoomTransition(rooms.ArtGallery, rooms.F2Hallway)
    }

    function NotAlone() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            helpers.IsInRoom(rooms.ReferenceRoom) &&
            helpers.TriggeredEvent(events.ReferenceRoom.HauzerGhost)
    }

    function NoLongerLost() {
        return helpers.TriggeredAllEvents(events.Maps)
    }

    function ForcedExit() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            helpers.IsInRoom(rooms.HiddenRoom) &&
            helpers.TriggeredEvent(events.Storehouse.Shotgun, 1, 2)
    }

    function TheFinalStep() {
        return helpers.IsLoaded() &&
            helpers.IsPlaying() &&
            helpers.IsInGame() &&
            events.DanceRoom.WoodenKey == 1 &&
            helpers.RoomTransition(rooms.DanceRoom, rooms.F2Hallway)
    }

    function CompleteAccount() {
        return helpers.TriggeredAllEvents(events.BooksAndMemos)
    }

    function NoSnareHolds() {
        return always_false()
    }

    function HerPortrait() {
        return always_false()
    }

    function WellEquipped() {
        return helpers.TriggeredAllEvents(events.WeaponsAndTools)
    }

    function BeneathTheHearth() {
        return always_false()
    }

    function BearerOfKeys() {
        return helpers.TriggeredAllEvents(events.Keys)
    }

    function TheLowerLine() {
        return always_false()
    }

    function NothingLeftClosed() {
        return always_false()
    }

    function UntouchedResolve() {
        return always_false()
    }

    function TheTieEndures() {
        return always_false()
    }

    function SwiftDeparture() {
        return always_false()
    }
}
triggers = AchievementTriggers()

class Achievements {
    StartingID = 0
    Data = [
        Achievement(1, 2, "The Withered Bouquet", "Tend to the withering arrangement and leave the Guest Room behind", triggers.TheWitheredBouquet()),
        Achievement(1, 2, "The Proper Arrangement", "Set the room in its proper order and depart the Living Room", triggers.TheProperArrangement()),
        Achievement(0, 3, "A Hollow Discovery", "Collect what was carelessly left behind", triggers.AHollowDiscovery()),
        Achievement(1, 3, "Ancient Remains", "Claim an prized relic and survive the Dining Hall", triggers.AncientRemains()),
        Achievement(0, 3, "The House Breathes", "Unseal the cover and stir the stagnant air", triggers.TheHouseBreathes()),
        Achievement(0, 3, "The Gallery's Answer", "Solve an artistic conundrum and escape with your life", triggers.TheGallerysAnswer()),
        Achievement(1, 4, "Not Alone", "Witness who still walks the mansion", triggers.NotAlone()),
        Achievement(0, 5, "No Longer Lost", "Gather all maps hidden throughout the Mansion", triggers.NoLongerLost()),
        Achievement(1, 4, "Forced Exit", "Use excessive force and escape the Hidden Room", triggers.ForcedExit()),
        Achievement(1, 4, "The Final Step", "Collect a whittled prize and safely shimmy out of the Dance Room", triggers.TheFinalStep()),
        Achievement(0, 5, "Complete Account", "Piece together all of the Mansion's records", triggers.CompleteAccount()),
        Achievement(0, 5, "No Snare Holds", "Escape or disarm all of the Mansion's deadly devices", triggers.NoSnareHolds()),
        Achievement(1, 4, "Her Portrait", "Collect a framed memory", triggers.HerPortrait()),
        Achievement(0, 5, "Well Equipped", "Gather all weapons and tools hidden throughout the Mansion", triggers.WellEquipped()),
        Achievement(1, 4, "Beneath the Hearth", "Disturb a false hearth and fall into the depths of the mansion", triggers.BeneathTheHearth()),
        Achievement(0, 5, "Bearer of Keys", "Gather all keys hidden throughout the Mansion", triggers.BearerOfKeys()),
        Achievement(1, 4, "The Lower Line", "Break the wall and uncover the buried rails", triggers.TheLowerLine()),
        Achievement(0, 5, "Nothing Left Closed", "Unlock all of the Mansion's sealed doors and cabinets", triggers.NothingLeftClosed()),
        Achievement(0, 5, "Untouched Resolve", "Drive back the Evil Entity before taking 4 or more hits", triggers.UntouchedResolve()),
        Achievement(2, 5, "The Tie Endures", "Drive back the Evil Entity with a lingering bond and flee the Mansion", triggers.TheTieEndures()),
        Achievement(0, 10, "Swift Departure", "Escape the Mansion in less than an hour", triggers.SwiftDeparture())
    ]

    function Generate() {   
        count = 0
        for achievement in this.Data {
            achievementType = ""

            if (achievement.Type == 1)
                achievementType = "progression"
            else if (achievement.Type == 2)
                achievementType = "win_condition"

            if (this.StartingID != 0)
                achievement.Id = this.StartingID

            achievement.Id = achievement.Id + count

            achievement(achievement.Title, achievement.Description, achievement.Points, achievement.Trigger, achievement.Id, type=achievementType)

            count = count + 1
        }
    }
}
achievements = Achievements()
achievements.Generate()

rich_presence_conditional_display(region.Code != 0, "{0} | Room: {1}",
    rich_presence_lookup("Region", region.Code, region.Lookup, "Loading..."),
    rich_presence_lookup("Room", rooms.Code, rooms.GetLookup(), "Not Found")
)

rich_presence_display("Playing Doctor Hauzer!")