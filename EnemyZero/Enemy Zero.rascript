// Doctor Hauzer
// #ID = 14556

class Disc {
    Id = byte(0x197716)
}
disc = Disc()

class Training {
    Level = byte(0x1969e4)
    Active = bit0(0x1969ee)
    Complete = bit4(0x1969ee)
    Lookup = {
        0x00: "Level 1",
        0x01: "Level 2",
        0x02: "Level 3",
        0x03: "Level 3"
    }
}
training = Training()

class PlayerStates {
    LoadingGame = 0x00
    SegaLogo = 0x01
    LoadingData = 0x02
    SearchModeMove = 0x03
    SearchModeIdle = 0x04
    SearchModeMenu = 0x05
    LoadingSave = 0x06
    ActiveMode = 0x08
    VexxTerminal = 0x09
}

class PlayerState {
    Id = byte(0x197714)
    States = PlayerStates()
}
playerState = PlayerState()

class MenuSequenceRange {
    Start = 0
    End = 0
}

class MenuStates {
    NotOpened = 0x00
    Title = 0x01
    SaveLoad = 0x02
}

class MenuSequences {
    SaveFMV = MenuSequenceRange(0x01, 0x01)
    VoiceRecorderOpened = MenuSequenceRange(0x02, 0x03)
    MenuAccessed = MenuSequenceRange(0x04, 0x04)
    SaveLoadTransitionScreen = MenuSequenceRange(0x05, 0x06)
    SlotSelection = MenuSequenceRange(0x07, 0x0b)
    SaveLoadPrompt = MenuSequenceRange(0x0c, 0x0c)
    LoadInitiated = MenuSequenceRange(0x0d, 0x0d)
    LoadAudioPlaying = MenuSequenceRange(0x0e, 0x0e)
    SaveInitiated = MenuSequenceRange(0x0f, 0x0f)
    SavingLoading = MenuSequenceRange(0x14, 0x16)
    ClosingRecorder = MenuSequenceRange(0x1e, 0x1f)
    SaveLoadFinished = MenuSequenceRange(0x28, 0x29)
}

class MenuState {
    Id = byte(0x17d194)
    Sequence = word(0x17d196)
    States = MenuStates()
    Sequences = MenuSequences()
}
menuState = MenuState()

class Saves {
    Remaining = byte(0x196ea6)
    HardMax = 13
    NormalMax = 64
    EasyMax = 99
    BeginnerMax = 99
}
saves = Saves()

class GameDifficulties {
    Easy = 0x00
    Normal = 0x01
    Hard = 0x02
    Beginner = 0x03
}

class GameDifficulty {
    Id = byte(0x1976e1)
    Difficulties = GameDifficulties()
    Lookup = {
        0x00: "Easy",
        0x01: "Normal",
        0x02: "Hard",
        0x03: "Beginner"
    }
}
gameDifficulty = GameDifficulty()

class Timer {
    CurrentFrameParts = [
        word(0x197718),
        word(0x19771a)
    ]
    CurrentFrames = ((CurrentFrameParts[0] * 0x10000) + CurrentFrameParts[1])
    StoredHours = byte(0x1976f0)
    StoredMinues = byte(0x1976f3)
    StoredSeconds = byte(0x1976f2)
    StoredFrames = ((StoredHours * 60 * 60 * 60) + (StoredMinues * 60 * 60) + (StoredSeconds * 60))
    TotalFrames = CurrentFrames + StoredFrames
}
timer = Timer()

class Items {
    VoiceRecorder = byte(0x17d1ca)
    VPSScanner = byte(0x17d1ce)
    LauraKeycard = byte(0x17d1d2)
    StairRoomKeycard = byte(0x17d1d6)
    SeveredFingers = byte(0x17d1da)
    ParkerGun = byte(0x17d1de)
    WinterTowerPowerCode = byte(0x17d1e2) // Kimberly's Clue
    GeorgeBlueKeycard = byte(0x17d1e6)
    GeorgeGun = byte(0x17d1ea)
    KimberlyGun = byte(0x17d1ee)
    ScannerKey = byte(0x17d1f2)
    SummerTowerPowerClue1 = byte(0x17d1f6) // George's Clue
    GeorgeOrangeKeycard = byte(0x17d1fa)
    Sunglasses = byte(0x17d1fe)
    SummerTowerPowerClue2 = byte(0x17d202) // Store Room Hint
    DavidDisk = byte(0x17d206)

    // Need to figure out a solution for the guns since they get swapped out
    // Maybe just have an achievement for collecting the final gun?
    WinterTowerItems = [
        VoiceRecorder, // Don't Lose
        VPSScanner, // Lose in final sequence (won't impact achievement)
        LauraKeycard, // Don't Lose
        StairRoomKeycard, // Don't Lose
        SeveredFingers, // Don't Lose
        ParkerGun, // Lose
        WinterTowerPowerCode, // Don't Lose
        GeorgeBlueKeycard, // Don't Lose
        GeorgeGun // Lose
    ]

    SummerTowerItems = [
        KimberlyGun, // Lose
        ScannerKey, // Don't Lose
        SummerTowerPowerClue1, // Don't Lose
        GeorgeOrangeKeycard, // Lose - used to access the fall tower - use the event as an alt?
        Sunglasses, // Don't Lose
        SummerTowerPowerClue2, // Don't Lose
        DavidDisk // Lose - after meeting George? Use the event as an alt?
    ]
}

class Event {

}

class Location {
    Name = ""
    Value = 0
}

class ActionModeLocations {
    F1WinterTowerHallway = Location("F1 Winter Tower | Hallway", 0x0001)
    WinterTowerBasementHallway = Location("Winter Tower Basement | Hallway", 0x0002)
    WinterTowerBasementHanger = Location("Winter Tower Basement | Hangar", 0x0003)
    WinterTowerAirDucts = Location("Winter Tower | Air Ducts", 0x0005)
    SummerTowerEmergencyBridge1 = Location("Summer Tower | Emergency Bridge", 0x0006)
    SummerTowerEmergencyBridge2 = Location("Summer Tower | Emergency Bridge", 0x0007)
    SummerTowerBasementHallway = Location("Summer Tower Basement | Hallway", 0x0008)
    F1SummerTowerHallway = Location("F1 Summer Tower | Hallway", 0x0009)
    F5SummerTowerHallway = Location("F5 Summer Tower | Hallway", 0x000a)
    F6SummerTowerHallway = Location("F6 Summer Tower | Hallway", 0x000b)
    F7SummerTowerHallway = Location("F7 Summer Tower | Hallway", 0x000c)
    F1FallTowerHallway = Location("F1 Fall Tower | Hallway", 0x000d)
    F2FallTowerHallway = Location("F2 Fall Tower | Hallway", 0x000e)
    F3FallTowerHallway = Location("F3 Fall Tower | Hallway", 0x000f)
    F4FallTowerHallway = Location("F4 Fall Tower | Hallway", 0x0010)
    F5FallTowerHallway = Location("F5 Fall Tower | Hallway", 0x0011)
    F6FallTowerHallway = Location("F6 Fall Tower | Hallway", 0x0012)
    F7FallTowerHallway = Location("F7 Fall Tower | Hallway", 0x0013)
    F8FallTowerHallway = Location("F8 Fall Tower | Hallway", 0x0014)
    F9FallTowerHallway = Location("F9 Fall Tower | Hallway", 0x0015)
    F8FallTowerAirDucts = Location("F8 Fall Tower | Air Ducts", 0x0016)

    AllLocations = [
        F1WinterTowerHallway, WinterTowerBasementHallway, WinterTowerBasementHanger, WinterTowerAirDucts,

        SummerTowerEmergencyBridge1, SummerTowerEmergencyBridge2, SummerTowerBasementHallway, F1SummerTowerHallway,
        F5SummerTowerHallway, F6SummerTowerHallway, F7SummerTowerHallway,

        F1FallTowerHallway, F2FallTowerHallway, F3FallTowerHallway, F4FallTowerHallway,
        F5FallTowerHallway, F6FallTowerHallway, F7FallTowerHallway, F8FallTowerHallway,
        F9FallTowerHallway, F8FallTowerAirDucts
    ]

    function GetLookup() {
        lookup = {}
        for location in this.AllLocations {
            lookup[location.Value] = location.Name
        }
        return lookup
    }
}

class ActionModeLocation {
    Id = word(0x1881f8)
    Locations = ActionModeLocations()
}
actionModeLocation = ActionModeLocation()

class SearchModeLocations {

    // Winter Tower

    // F1 Winter Tower | Laura's Room
    F1WinterTowerLaurasRoom1 = Location("F1 Winter Tower | Laura's Room", 0x0014)
    F1WinterTowerLaurasRoom2 = Location("F1 Winter Tower | Laura's Room", 0x0015)
    F1WinterTowerLaurasRoom3 = Location("F1 Winter Tower | Laura's Room", 0x0016)
    F1WinterTowerLaurasRoom4 = Location("F1 Winter Tower | Laura's Room", 0x0017)
    F1WinterTowerLaurasRoom5 = Location("F1 Winter Tower | Laura's Room", 0x0018)
    F1WinterTowerLaurasRoom6 = Location("F1 Winter Tower | Laura's Room", 0x0019)
    F1WinterTowerLaurasRoom7 = Location("F1 Winter Tower | Laura's Room", 0x001a)
    F1WinterTowerLaurasRoom8 = Location("F1 Winter Tower | Laura's Room", 0x001b)
    F1WinterTowerLaurasRoom9 = Location("F1 Winter Tower | Laura's Room", 0x001c)
    F1WinterTowerLaurasRoom10 = Location("F1 Winter Tower | Laura's Room", 0x001d)
    F1WinterTowerLaurasRoom11 = Location("F1 Winter Tower | Laura's Room", 0x001e)
    F1WinterTowerLaurasRoom12 = Location("F1 Winter Tower | Laura's Room", 0x001f)
    F1WinterTowerLaurasRoom13 = Location("F1 Winter Tower | Laura's Room", 0x0020)
    F1WinterTowerLaurasRoom14 = Location("F1 Winter Tower | Laura's Room", 0x0021)
    F1WinterTowerLaurasRoom15 = Location("F1 Winter Tower | Laura's Room", 0x0022)
    F1WinterTowerLaurasRoom16 = Location("F1 Winter Tower | Laura's Room", 0x0023)
    F1WinterTowerLaurasRoom17 = Location("F1 Winter Tower | Laura's Room", 0x0026)
    F1WinterTowerLaurasRoom18 = Location("F1 Winter Tower | Laura's Room", 0x0027)

    // F1 Winter Tower | Store Room
    F1WinterTowerStoreRoom1 = Location("F1 Winter Tower | Store Room", 0x004a)
    F1WinterTowerStoreRoom2 = Location("F1 Winter Tower | Store Room", 0x004b)
    F1WinterTowerStoreRoom3 = Location("F1 Winter Tower | Store Room", 0x004c)
    F1WinterTowerStoreRoom4 = Location("F1 Winter Tower | Store Room", 0x004d)
    F1WinterTowerStoreRoom5 = Location("F1 Winter Tower | Store Room", 0x004e)
    F1WinterTowerStoreRoom6 = Location("F1 Winter Tower | Store Room", 0x004f)
    F1WinterTowerStoreRoom7 = Location("F1 Winter Tower | Store Room", 0x0050)
    F1WinterTowerStoreRoom8 = Location("F1 Winter Tower | Store Room", 0x0051)
    F1WinterTowerStoreRoom9 = Location("F1 Winter Tower | Store Room", 0x0052)
    F1WinterTowerStoreRoom10 = Location("F1 Winter Tower | Store Room", 0x0053)
    F1WinterTowerStoreRoom11 = Location("F1 Winter Tower | Store Room", 0x0054)
    F1WinterTowerStoreRoom12 = Location("F1 Winter Tower | Store Room", 0x0055)
    F1WinterTowerStoreRoom13 = Location("F1 Winter Tower | Store Room", 0x0056)
    F1WinterTowerStoreRoom14 = Location("F1 Winter Tower | Store Room", 0x0057)
    F1WinterTowerStoreRoom15 = Location("F1 Winter Tower | Store Room", 0x0058)
    F1WinterTowerStoreRoom16 = Location("F1 Winter Tower | Store Room", 0x0059)
    F1WinterTowerStoreRoom17 = Location("F1 Winter Tower | Store Room", 0x005a)
    F1WinterTowerStoreRoom18 = Location("F1 Winter Tower | Store Room", 0x005b)
    F1WinterTowerStoreRoom19 = Location("F1 Winter Tower | Store Room", 0x005c)
    F1WinterTowerStoreRoom20 = Location("F1 Winter Tower | Store Room", 0x005d)

    // F1 Winter Tower | Marcus's Room
    F1WinterTowerMarcusRoom1 = Location("F1 Winter Tower | Marcus's Room", 0x0006)
    F1WinterTowerMarcusRoom2 = Location("F1 Winter Tower | Marcus's Room", 0x0028)
    F1WinterTowerMarcusRoom3 = Location("F1 Winter Tower | Marcus's Room", 0x0029)
    F1WinterTowerMarcusRoom4 = Location("F1 Winter Tower | Marcus's Room", 0x002a)
    F1WinterTowerMarcusRoom5 = Location("F1 Winter Tower | Marcus's Room", 0x002b)
    F1WinterTowerMarcusRoom6 = Location("F1 Winter Tower | Marcus's Room", 0x002c)
    F1WinterTowerMarcusRoom7 = Location("F1 Winter Tower | Marcus's Room", 0x002d)
    F1WinterTowerMarcusRoom8 = Location("F1 Winter Tower | Marcus's Room", 0x002e)
    F1WinterTowerMarcusRoom9 = Location("F1 Winter Tower | Marcus's Room", 0x002f)
    F1WinterTowerMarcusRoom10 = Location("F1 Winter Tower | Marcus's Room", 0x0030)
    F1WinterTowerMarcusRoom11 = Location("F1 Winter Tower | Marcus's Room", 0x0031)
    F1WinterTowerMarcusRoom12 = Location("F1 Winter Tower | Marcus's Room", 0x0032)
    F1WinterTowerMarcusRoom13 = Location("F1 Winter Tower | Marcus's Room", 0x0033)
    F1WinterTowerMarcusRoom14 = Location("F1 Winter Tower | Marcus's Room", 0x0034)
    F1WinterTowerMarcusRoom15 = Location("F1 Winter Tower | Marcus's Room", 0x0035)
    F1WinterTowerMarcusRoom16 = Location("F1 Winter Tower | Marcus's Room", 0x0036)
    F1WinterTowerMarcusRoom17 = Location("F1 Winter Tower | Marcus's Room", 0x0037)
    F1WinterTowerMarcusRoom18 = Location("F1 Winter Tower | Marcus's Room", 0x0038)
    F1WinterTowerMarcusRoom19 = Location("F1 Winter Tower | Marcus's Room", 0x0039)
    F1WinterTowerMarcusRoom20 = Location("F1 Winter Tower | Marcus's Room", 0x003a)
    F1WinterTowerMarcusRoom21 = Location("F1 Winter Tower | Marcus's Room", 0x003c)
    F1WinterTowerMarcusRoom22 = Location("F1 Winter Tower | Marcus's Room", 0x003d)
    F1WinterTowerMarcusRoom23 = Location("F1 Winter Tower | Marcus's Room", 0x003e)
    F1WinterTowerMarcusRoom24 = Location("F1 Winter Tower | Marcus's Room", 0x003f)
    F1WinterTowerMarcusRoom25 = Location("F1 Winter Tower | Marcus's Room", 0x0040)

    // Winter Tower | Elevator
    WinterTowerElevator1 = Location("Winter Tower | Elevator", 0x006f)
    WinterTowerElevator2 = Location("Winter Tower | Elevator", 0x0070)
    WinterTowerElevator3 = Location("Winter Tower | Elevator", 0x0071)

    // F1 Winter Tower | Locker Room
    F1WinterTowerLockerRoom1 = Location("F1 Winter Tower | Locker Room", 0x0041)
    F1WinterTowerLockerRoom2 = Location("F1 Winter Tower | Locker Room", 0x0042)
    F1WinterTowerLockerRoom3 = Location("F1 Winter Tower | Locker Room", 0x0043)
    F1WinterTowerLockerRoom4 = Location("F1 Winter Tower | Locker Room", 0x0044)
    F1WinterTowerLockerRoom5 = Location("F1 Winter Tower | Locker Room", 0x0045)
    F1WinterTowerLockerRoom6 = Location("F1 Winter Tower | Locker Room", 0x0046)
    F1WinterTowerLockerRoom7 = Location("F1 Winter Tower | Locker Room", 0x0047)
    F1WinterTowerLockerRoom8 = Location("F1 Winter Tower | Locker Room", 0x0048)
    F1WinterTowerLockerRoom9 = Location("F1 Winter Tower | Locker Room", 0x0049)

    // Winter Tower Basement | Parker's Room
    WinterTowerBasementParkersRoom1 = Location("Winter Tower Basement | Parker's Room", 0x0073)
    WinterTowerBasementParkersRoom2 = Location("Winter Tower Basement | Parker's Room", 0x0074)
    WinterTowerBasementParkersRoom3 = Location("Winter Tower Basement | Parker's Room", 0x0075)
    WinterTowerBasementParkersRoom4 = Location("Winter Tower Basement | Parker's Room", 0x0076)
    WinterTowerBasementParkersRoom5 = Location("Winter Tower Basement | Parker's Room", 0x0077)
    WinterTowerBasementParkersRoom6 = Location("Winter Tower Basement | Parker's Room", 0x0078)
    WinterTowerBasementParkersRoom7 = Location("Winter Tower Basement | Parker's Room", 0x0079)
    WinterTowerBasementParkersRoom8 = Location("Winter Tower Basement | Parker's Room", 0x007a)
    WinterTowerBasementParkersRoom9 = Location("Winter Tower Basement | Parker's Room", 0x007b)
    WinterTowerBasementParkersRoom10 = Location("Winter Tower Basement | Parker's Room", 0x007c)
    WinterTowerBasementParkersRoom11 = Location("Winter Tower Basement | Parker's Room", 0x007d)
    WinterTowerBasementParkersRoom12 = Location("Winter Tower Basement | Parker's Room", 0x007e)
    WinterTowerBasementParkersRoom13 = Location("Winter Tower Basement | Parker's Room", 0x007f)
    WinterTowerBasementParkersRoom14 = Location("Winter Tower Basement | Parker's Room", 0x0080)
    WinterTowerBasementParkersRoom15 = Location("Winter Tower Basement | Parker's Room", 0x0081)
    WinterTowerBasementParkersRoom16 = Location("Winter Tower Basement | Parker's Room", 0x0082)
    WinterTowerBasementParkersRoom17 = Location("Winter Tower Basement | Parker's Room", 0x0083)

    // B1 Winter Tower | Power Room
    B1WinterTowerPowerRoom1 = Location("Winter Tower Basement | Power Room", 0x0003)
    B1WinterTowerPowerRoom2 = Location("Winter Tower Basement | Power Room", 0x0084)
    B1WinterTowerPowerRoom3 = Location("Winter Tower Basement | Power Room", 0x0085)
    B1WinterTowerPowerRoom4 = Location("Winter Tower Basement | Power Room", 0x0086)
    B1WinterTowerPowerRoom5 = Location("Winter Tower Basement | Power Room", 0x0087)
    B1WinterTowerPowerRoom6 = Location("Winter Tower Basement | Power Room", 0x0088)
    B1WinterTowerPowerRoom7 = Location("Winter Tower Basement | Power Room", 0x0089)
    B1WinterTowerPowerRoom8 = Location("Winter Tower Basement | Power Room", 0x008a)

    // F2 Winter Tower | Air Ducts
    F2WinterTowerAirDucts1 = Location("Winter Tower | Air Ducts", 0x0007)
    F2WinterTowerAirDucts2 = Location("Winter Tower | Air Ducts", 0x0072)

    // F2 Winter Tower | Archives
    F2WinterTowerArchives1 = Location("F2 Winter Tower | Archives", 0x008b)
    F2WinterTowerArchives2 = Location("F2 Winter Tower | Archives", 0x008c)
    F2WinterTowerArchives3 = Location("F2 Winter Tower | Archives", 0x008d)
    F2WinterTowerArchives4 = Location("F2 Winter Tower | Archives", 0x008e)
    F2WinterTowerArchives5 = Location("F2 Winter Tower | Archives", 0x008f)
    F2WinterTowerArchives6 = Location("F2 Winter Tower | Archives", 0x0090)
    F2WinterTowerArchives7 = Location("F2 Winter Tower | Archives", 0x0091)
    F2WinterTowerArchives8 = Location("F2 Winter Tower | Archives", 0x0092)
    F2WinterTowerArchives9 = Location("F2 Winter Tower | Archives", 0x0093)
    F2WinterTowerArchives10 = Location("F2 Winter Tower | Archives", 0x0095)
    F2WinterTowerArchives11 = Location("F2 Winter Tower | Archives", 0x0096)
    F2WinterTowerArchives12 = Location("F2 Winter Tower | Archives", 0x0097)
    F2WinterTowerArchives13 = Location("F2 Winter Tower | Archives", 0x0098)
    F2WinterTowerArchives14 = Location("F2 Winter Tower | Archives", 0x0099)
    F2WinterTowerArchives15 = Location("F2 Winter Tower | Archives", 0x009a)
    F2WinterTowerArchives16 = Location("F2 Winter Tower | Archives", 0x009b)

    // F2 Winter Tower | Tool Room
    F2WinterTowerToolRoom1 = Location("F2 Winter Tower | Tool Room", 0x009c)
    F2WinterTowerToolRoom2 = Location("F2 Winter Tower | Tool Room", 0x009d)
    F2WinterTowerToolRoom3 = Location("F2 Winter Tower | Tool Room", 0x009e)
    F2WinterTowerToolRoom4 = Location("F2 Winter Tower | Tool Room", 0x009f)
    F2WinterTowerToolRoom5 = Location("F2 Winter Tower | Tool Room", 0x00a0)
    F2WinterTowerToolRoom6 = Location("F2 Winter Tower | Tool Room", 0x00a1)

    // F2 Winter Tower | Maintenance Elevator
    F2WinterTowerMaintenanceElevator1 = Location("Inter-Tower Elevator", 0x00b2)

    // F3 Winter Tower | Kimberly's Room
    F3WinterTowerKimberlysRoom1 = Location("F3 Winter Tower | Kimberly's Room", 0x00a2)
    F3WinterTowerKimberlysRoom2 = Location("F3 Winter Tower | Kimberly's Room", 0x00a3)
    F3WinterTowerKimberlysRoom3 = Location("F3 Winter Tower | Kimberly's Room", 0x00a4)
    F3WinterTowerKimberlysRoom4 = Location("F3 Winter Tower | Kimberly's Room", 0x00a5)
    F3WinterTowerKimberlysRoom5 = Location("F3 Winter Tower | Kimberly's Room", 0x00a6)
    F3WinterTowerKimberlysRoom6 = Location("F3 Winter Tower | Kimberly's Room", 0x00a7)
    F3WinterTowerKimberlysRoom7 = Location("F3 Winter Tower | Kimberly's Room", 0x00a8)
    F3WinterTowerKimberlysRoom8 = Location("F3 Winter Tower | Kimberly's Room", 0x00a9)
    F3WinterTowerKimberlysRoom9 = Location("F3 Winter Tower | Kimberly's Room", 0x00aa)
    F3WinterTowerKimberlysRoom10 = Location("F3 Winter Tower | Kimberly's Room", 0x00ab)
    F3WinterTowerKimberlysRoom11 = Location("F3 Winter Tower | Kimberly's Room", 0x00ac)
    F3WinterTowerKimberlysRoom12 = Location("F3 Winter Tower | Kimberly's Room", 0x00ad)
    F3WinterTowerKimberlysRoom13 = Location("F3 Winter Tower | Kimberly's Room", 0x00ae)
    F3WinterTowerKimberlysRoom14 = Location("F3 Winter Tower | Kimberly's Room", 0x00af)
    F3WinterTowerKimberlysRoom15 = Location("F3 Winter Tower | Kimberly's Room", 0x00b0)
    F3WinterTowerKimberlysRoom16 = Location("F3 Winter Tower | Kimberly's Room", 0x00b1)
    F3WinterTowerKimberlysRoom17 = Location("F3 Winter Tower | Kimberly's Room", 0x00b3)
    F3WinterTowerKimberlysRoom18 = Location("F3 Winter Tower | Kimberly's Room", 0x00b4)

    // Summer Tower

    // Summer Tower | Emergency Bridge
    SummerTowerEmergencyBridge1 = Location("Summer Tower | Emergency Bridge", 0x0002)
    SummerTowerEmergencyBridge2 = Location("Summer Tower | Emergency Bridge", 0x0008)
    SummerTowerEmergencyBridge3 = Location("Summer Tower | Emergency Bridge", 0x0009)

    // Summer Tower | Elevator
    SummerTowerElevator1 = Location("Summer Tower | Elevator", 0x0123)
    SummerTowerElevator2 = Location("Summer Tower | Elevator", 0x0124)
    SummerTowerElevator3 = Location("Summer Tower | Elevator", 0x0125)
    SummerTowerElevator4 = Location("Summer Tower | Elevator", 0x0126)
    SummerTowerElevator5 = Location("Summer Tower | Elevator", 0x0127)
    SummerTowerElevator6 = Location("Summer Tower | Elevator", 0x0128)

    // F7 Summer Tower | Ronny's Room
    F7SummerTowerRonnysRoom1 = Location("F7 Summer Tower | Ronny's Room", 0x00df)
    F7SummerTowerRonnysRoom2 = Location("F7 Summer Tower | Ronny's Room", 0x00e0)
    F7SummerTowerRonnysRoom3 = Location("F7 Summer Tower | Ronny's Room", 0x00e1)
    F7SummerTowerRonnysRoom4 = Location("F7 Summer Tower | Ronny's Room", 0x00e2)
    F7SummerTowerRonnysRoom5 = Location("F7 Summer Tower | Ronny's Room", 0x00e3)
    F7SummerTowerRonnysRoom6 = Location("F7 Summer Tower | Ronny's Room", 0x00e4)
    F7SummerTowerRonnysRoom7 = Location("F7 Summer Tower | Ronny's Room", 0x00e5)
    F7SummerTowerRonnysRoom8 = Location("F7 Summer Tower | Ronny's Room", 0x00e6)
    F7SummerTowerRonnysRoom9 = Location("F7 Summer Tower | Ronny's Room", 0x00e7)
    F7SummerTowerRonnysRoom10 = Location("F7 Summer Tower | Ronny's Room", 0x00e8)
    F7SummerTowerRonnysRoom11 = Location("F7 Summer Tower | Ronny's Room", 0x00e9)
    F7SummerTowerRonnysRoom12 = Location("F7 Summer Tower | Ronny's Room", 0x00ea)
    F7SummerTowerRonnysRoom13 = Location("F7 Summer Tower | Ronny's Room", 0x00eb)
    F7SummerTowerRonnysRoom14 = Location("F7 Summer Tower | Ronny's Room", 0x00ec)
    F7SummerTowerRonnysRoom15 = Location("F7 Summer Tower | Ronny's Room", 0x00ed)
    F7SummerTowerRonnysRoom16 = Location("F7 Summer Tower | Ronny's Room", 0x00ee)
    F7SummerTowerRonnysRoom17 = Location("F7 Summer Tower | Ronny's Room", 0x00ef)
    F7SummerTowerRonnysRoom18 = Location("F7 Summer Tower | Ronny's Room", 0x00f0)
    F7SummerTowerRonnysRoom19 = Location("F7 Summer Tower | Ronny's Room", 0x00f1)
    F7SummerTowerRonnysRoom20 = Location("F7 Summer Tower | Ronny's Room", 0x00f2)
    F7SummerTowerRonnysRoom21 = Location("F7 Summer Tower | Ronny's Room", 0x00f3)
    F7SummerTowerRonnysRoom22 = Location("F7 Summer Tower | Ronny's Room", 0x00f4)
    F7SummerTowerRonnysRoom23 = Location("F7 Summer Tower | Ronny's Room", 0x00f5)
    F7SummerTowerRonnysRoom24 = Location("F7 Summer Tower | Ronny's Room", 0x00f6)
    F7SummerTowerRonnysRoom25 = Location("F7 Summer Tower | Ronny's Room", 0x00f7)
    F7SummerTowerRonnysRoom26 = Location("F7 Summer Tower | Ronny's Room", 0x00f8)
    F7SummerTowerRonnysRoom27 = Location("F7 Summer Tower | Ronny's Room", 0x00f9)
    F7SummerTowerRonnysRoom28 = Location("F7 Summer Tower | Ronny's Room", 0x00fa)
    F7SummerTowerRonnysRoom29 = Location("F7 Summer Tower | Ronny's Room", 0x00fb)
    F7SummerTowerRonnysRoom30 = Location("F7 Summer Tower | Ronny's Room", 0x00fc)
    F7SummerTowerRonnysRoom31 = Location("F7 Summer Tower | Ronny's Room", 0x00fd)
    F7SummerTowerRonnysRoom32 = Location("F7 Summer Tower | Ronny's Room", 0x00fe)
    F7SummerTowerRonnysRoom33 = Location("F7 Summer Tower | Ronny's Room", 0x00ff)
    F7SummerTowerRonnysRoom34 = Location("F7 Summer Tower | Ronny's Room", 0x0100)
    F7SummerTowerRonnysRoom35 = Location("F7 Summer Tower | Ronny's Room", 0x0101)

    // F5 Summer Tower | George's Room
    F5SummerTowerGeorgesRoom1 = Location("F5 Summer Tower | George's Room", 0x00b5)
    F5SummerTowerGeorgesRoom2 = Location("F5 Summer Tower | George's Room", 0x00b6)
    F5SummerTowerGeorgesRoom3 = Location("F5 Summer Tower | George's Room", 0x00b7)
    F5SummerTowerGeorgesRoom4 = Location("F5 Summer Tower | George's Room", 0x00b8)
    F5SummerTowerGeorgesRoom5 = Location("F5 Summer Tower | George's Room", 0x00b9)
    F5SummerTowerGeorgesRoom6 = Location("F5 Summer Tower | George's Room", 0x00ba)
    F5SummerTowerGeorgesRoom7 = Location("F5 Summer Tower | George's Room", 0x00bb)
    F5SummerTowerGeorgesRoom8 = Location("F5 Summer Tower | George's Room", 0x00bc)
    F5SummerTowerGeorgesRoom9 = Location("F5 Summer Tower | George's Room", 0x00bd)
    F5SummerTowerGeorgesRoom10 = Location("F5 Summer Tower | George's Room", 0x00be)
    F5SummerTowerGeorgesRoom11 = Location("F5 Summer Tower | George's Room", 0x00bf)
    F5SummerTowerGeorgesRoom12 = Location("F5 Summer Tower | George's Room", 0x00c0)
    F5SummerTowerGeorgesRoom13 = Location("F5 Summer Tower | George's Room", 0x00c1)
    F5SummerTowerGeorgesRoom14 = Location("F5 Summer Tower | George's Room", 0x00c2)
    F5SummerTowerGeorgesRoom15 = Location("F5 Summer Tower | George's Room", 0x00c3)
    F5SummerTowerGeorgesRoom16 = Location("F5 Summer Tower | George's Room", 0x00c4)
    F5SummerTowerGeorgesRoom17 = Location("F5 Summer Tower | George's Room", 0x00c5)
    F5SummerTowerGeorgesRoom18 = Location("F5 Summer Tower | George's Room", 0x00c6)
    F5SummerTowerGeorgesRoom19 = Location("F5 Summer Tower | George's Room", 0x00c7)
    F5SummerTowerGeorgesRoom20 = Location("F5 Summer Tower | George's Room", 0x00c8)
    F5SummerTowerGeorgesRoom21 = Location("F5 Summer Tower | George's Room", 0x00c9)
    F5SummerTowerGeorgesRoom22 = Location("F5 Summer Tower | George's Room", 0x00ca)

    // F5 Summer Tower | David's Room
    F5SummerTowerDavidsRoom1 = Location("F5 Summer Tower | David's Room", 0x00cb)
    F5SummerTowerDavidsRoom2 = Location("F5 Summer Tower | David's Room", 0x00cc)
    F5SummerTowerDavidsRoom3 = Location("F5 Summer Tower | David's Room", 0x00cd)
    F5SummerTowerDavidsRoom4 = Location("F5 Summer Tower | David's Room", 0x00ce)
    F5SummerTowerDavidsRoom5 = Location("F5 Summer Tower | David's Room", 0x00cf)
    F5SummerTowerDavidsRoom6 = Location("F5 Summer Tower | David's Room", 0x00d0)
    F5SummerTowerDavidsRoom7 = Location("F5 Summer Tower | David's Room", 0x00d1)
    F5SummerTowerDavidsRoom8 = Location("F5 Summer Tower | David's Room", 0x00d2)
    F5SummerTowerDavidsRoom9 = Location("F5 Summer Tower | David's Room", 0x00d3)
    F5SummerTowerDavidsRoom10 = Location("F5 Summer Tower | David's Room", 0x00d4)
    F5SummerTowerDavidsRoom11 = Location("F5 Summer Tower | David's Room", 0x00d5)
    F5SummerTowerDavidsRoom12 = Location("F5 Summer Tower | David's Room", 0x00d6)
    F5SummerTowerDavidsRoom13 = Location("F5 Summer Tower | David's Room", 0x00d7)
    F5SummerTowerDavidsRoom14 = Location("F5 Summer Tower | David's Room", 0x00d8)
    F5SummerTowerDavidsRoom15 = Location("F5 Summer Tower | David's Room", 0x00d9)
    F5SummerTowerDavidsRoom16 = Location("F5 Summer Tower | David's Room", 0x00da)
    F5SummerTowerDavidsRoom17 = Location("F5 Summer Tower | David's Room", 0x00db)
    F5SummerTowerDavidsRoom18 = Location("F5 Summer Tower | David's Room", 0x00dc)
    F5SummerTowerDavidsRoom19 = Location("F5 Summer Tower | David's Room", 0x00dd)
    F5SummerTowerDavidsRoom20 = Location("F5 Summer Tower | David's Room", 0x00de)

    // B0 Summer Tower | Store Room
    B0SummerTowerStoreRoom1 = Location("Summer Tower Basement | Store Room", 0x0102)
    B0SummerTowerStoreRoom2 = Location("Summer Tower Basement | Store Room", 0x0103)
    B0SummerTowerStoreRoom3 = Location("Summer Tower Basement | Store Room", 0x0104)
    B0SummerTowerStoreRoom4 = Location("Summer Tower Basement | Store Room", 0x0105)
    B0SummerTowerStoreRoom5 = Location("Summer Tower Basement | Store Room", 0x0106)
    B0SummerTowerStoreRoom6 = Location("Summer Tower Basement | Store Room", 0x0107)
    B0SummerTowerStoreRoom7 = Location("Summer Tower Basement | Store Room", 0x0108)
    B0SummerTowerStoreRoom8 = Location("Summer Tower Basement | Store Room", 0x0109)
    B0SummerTowerStoreRoom9 = Location("Summer Tower Basement | Store Room", 0x010a)
    B0SummerTowerStoreRoom10 = Location("Summer Tower Basement | Store Room", 0x010b)
    B0SummerTowerStoreRoom11 = Location("Summer Tower Basement | Store Room", 0x010c)
    B0SummerTowerStoreRoom12 = Location("Summer Tower Basement | Store Room", 0x010d)
    B0SummerTowerStoreRoom13 = Location("Summer Tower Basement | Store Room", 0x010e)
    B0SummerTowerStoreRoom14 = Location("Summer Tower Basement | Store Room", 0x010f)
    B0SummerTowerStoreRoom15 = Location("Summer Tower Basement | Store Room", 0x0110)
    B0SummerTowerStoreRoom16 = Location("Summer Tower Basement | Store Room", 0x0111)
    B0SummerTowerStoreRoom17 = Location("Summer Tower Basement | Store Room", 0x0112)
    B0SummerTowerStoreRoom18 = Location("Summer Tower Basement | Store Room", 0x0113)
    B0SummerTowerStoreRoom19 = Location("Summer Tower Basement | Store Room", 0x0114)
    B0SummerTowerStoreRoom20 = Location("Summer Tower Basement | Store Room", 0x0115)
    B0SummerTowerStoreRoom21 = Location("Summer Tower Basement | Store Room", 0x0116)

    // F6 Summer Tower | Power Room
    F6SummerTowerPowerRoom1 = Location("F6 Summer Tower | Power Room", 0x0117)
    F6SummerTowerPowerRoom2 = Location("F6 Summer Tower | Power Room", 0x0118)
    F6SummerTowerPowerRoom3 = Location("F6 Summer Tower | Power Room", 0x0119)
    F6SummerTowerPowerRoom4 = Location("F6 Summer Tower | Power Room", 0x011a)
    F6SummerTowerPowerRoom5 = Location("F6 Summer Tower | Power Room", 0x011b)
    F6SummerTowerPowerRoom6 = Location("F6 Summer Tower | Power Room", 0x011c)
    F6SummerTowerPowerRoom7 = Location("F6 Summer Tower | Power Room", 0x011d)
    F6SummerTowerPowerRoom8 = Location("F6 Summer Tower | Power Room", 0x011e)

    // Fall Tower

    // Fall Tower | Elevator
    FallTowerElevator1 = Location("Fall Tower | Elevator", 0x0001)
    FallTowerElevator2 = Location("Fall Tower | Elevator", 0x011f)
    FallTowerElevator3 = Location("Fall Tower | Elevator", 0x0120)
    FallTowerElevator4 = Location("Fall Tower | Elevator", 0x0121)
    FallTowerElevator5 = Location("Fall Tower | Elevator", 0x0122)
    FallTowerElevator6 = Location("Fall Tower | Elevator", 0x0129)
    FallTowerElevator7 = Location("Fall Tower | Elevator", 0x012a)
    FallTowerElevator8 = Location("Fall Tower | Elevator", 0x012b)

    // Fall Tower | Safe Room
    FallTowerSafeRoom1 = Location("Fall Tower | Safe Room", 0x012c)
    FallTowerSafeRoom2 = Location("Fall Tower | Safe Room", 0x012d)
    FallTowerSafeRoom3 = Location("Fall Tower | Safe Room", 0x012e)
    FallTowerSafeRoom4 = Location("Fall Tower | Safe Room", 0x012f)
    FallTowerSafeRoom5 = Location("Fall Tower | Safe Room", 0x0130)
    FallTowerSafeRoom6 = Location("Fall Tower | Safe Room", 0x0131)
    FallTowerSafeRoom7 = Location("Fall Tower | Safe Room", 0x0132)
    FallTowerSafeRoom8 = Location("Fall Tower | Safe Room", 0x0133)

    // F9 Fall Tower
    F9FallTower1 = Location("F9 Fall Tower", 0x000b)
    F9FallTower2 = Location("F9 Fall Tower", 0x000e)
    F9FallTower3 = Location("F9 Fall Tower", 0x006e)

    // Stair Room
    StairRoom1 = Location("Stair Room", 0x0004)
    StairRoom2 = Location("Stair Room", 0x005e)
    StairRoom3 = Location("Stair Room", 0x005f)
    StairRoom4 = Location("Stair Room", 0x0060)
    StairRoom5 = Location("Stair Room", 0x0061)
    StairRoom6 = Location("Stair Room", 0x0062)
    StairRoom7 = Location("Stair Room", 0x0063)
    StairRoom8 = Location("Stair Room", 0x0064)
    StairRoom9 = Location("Stair Room", 0x0065)
    StairRoom10 = Location("Stair Room", 0x0066)
    StairRoom11 = Location("Stair Room", 0x0067)
    StairRoom12 = Location("Stair Room", 0x0068)
    StairRoom13 = Location("Stair Room", 0x0069)
    StairRoom14 = Location("Stair Room", 0x006a)
    StairRoom15 = Location("Stair Room", 0x006b)
    StairRoom16 = Location("Stair Room", 0x006c)
    StairRoom17 = Location("Stair Room", 0x006d)

    // Escape Shuttle
    EscapeShuttle1 = Location("Escape Shuttle", 0x000f)

    AllLocations = [
        F1WinterTowerLaurasRoom1, F1WinterTowerLaurasRoom2, F1WinterTowerLaurasRoom3, F1WinterTowerLaurasRoom4,
        F1WinterTowerLaurasRoom5, F1WinterTowerLaurasRoom6, F1WinterTowerLaurasRoom7, F1WinterTowerLaurasRoom8,
        F1WinterTowerLaurasRoom9, F1WinterTowerLaurasRoom10, F1WinterTowerLaurasRoom11, F1WinterTowerLaurasRoom12,
        F1WinterTowerLaurasRoom13, F1WinterTowerLaurasRoom14, F1WinterTowerLaurasRoom15, F1WinterTowerLaurasRoom16,
        F1WinterTowerLaurasRoom17, F1WinterTowerLaurasRoom18,

        F1WinterTowerStoreRoom1, F1WinterTowerStoreRoom2, F1WinterTowerStoreRoom3, F1WinterTowerStoreRoom4,
        F1WinterTowerStoreRoom5, F1WinterTowerStoreRoom6, F1WinterTowerStoreRoom7, F1WinterTowerStoreRoom8,
        F1WinterTowerStoreRoom9, F1WinterTowerStoreRoom10, F1WinterTowerStoreRoom11, F1WinterTowerStoreRoom12,
        F1WinterTowerStoreRoom13, F1WinterTowerStoreRoom14, F1WinterTowerStoreRoom15, F1WinterTowerStoreRoom16,
        F1WinterTowerStoreRoom17, F1WinterTowerStoreRoom18, F1WinterTowerStoreRoom19, F1WinterTowerStoreRoom20,

        F1WinterTowerMarcusRoom1, F1WinterTowerMarcusRoom2, F1WinterTowerMarcusRoom3, F1WinterTowerMarcusRoom4,
        F1WinterTowerMarcusRoom5, F1WinterTowerMarcusRoom6, F1WinterTowerMarcusRoom7, F1WinterTowerMarcusRoom8,
        F1WinterTowerMarcusRoom9, F1WinterTowerMarcusRoom10, F1WinterTowerMarcusRoom11, F1WinterTowerMarcusRoom12,
        F1WinterTowerMarcusRoom13, F1WinterTowerMarcusRoom14, F1WinterTowerMarcusRoom15, F1WinterTowerMarcusRoom16,
        F1WinterTowerMarcusRoom17, F1WinterTowerMarcusRoom18, F1WinterTowerMarcusRoom19, F1WinterTowerMarcusRoom20,
        F1WinterTowerMarcusRoom21, F1WinterTowerMarcusRoom22, F1WinterTowerMarcusRoom23, F1WinterTowerMarcusRoom24,
        F1WinterTowerMarcusRoom25,

        WinterTowerElevator1, WinterTowerElevator2, WinterTowerElevator3,

        F1WinterTowerLockerRoom1, F1WinterTowerLockerRoom2, F1WinterTowerLockerRoom3, F1WinterTowerLockerRoom4,
        F1WinterTowerLockerRoom5, F1WinterTowerLockerRoom6, F1WinterTowerLockerRoom7, F1WinterTowerLockerRoom8,
        F1WinterTowerLockerRoom9,

        WinterTowerBasementParkersRoom1, WinterTowerBasementParkersRoom2, WinterTowerBasementParkersRoom3,
        WinterTowerBasementParkersRoom4, WinterTowerBasementParkersRoom5, WinterTowerBasementParkersRoom6,
        WinterTowerBasementParkersRoom7, WinterTowerBasementParkersRoom8, WinterTowerBasementParkersRoom9,
        WinterTowerBasementParkersRoom10, WinterTowerBasementParkersRoom11, WinterTowerBasementParkersRoom12,
        WinterTowerBasementParkersRoom13, WinterTowerBasementParkersRoom14, WinterTowerBasementParkersRoom15,
        WinterTowerBasementParkersRoom16, WinterTowerBasementParkersRoom17,

        B1WinterTowerPowerRoom1, B1WinterTowerPowerRoom2, B1WinterTowerPowerRoom3, B1WinterTowerPowerRoom4,
        B1WinterTowerPowerRoom5, B1WinterTowerPowerRoom6, B1WinterTowerPowerRoom7, B1WinterTowerPowerRoom8,

        F2WinterTowerAirDucts1, F2WinterTowerAirDucts2,

        F2WinterTowerArchives1, F2WinterTowerArchives2, F2WinterTowerArchives3, F2WinterTowerArchives4,
        F2WinterTowerArchives5, F2WinterTowerArchives6, F2WinterTowerArchives7, F2WinterTowerArchives8,
        F2WinterTowerArchives9, F2WinterTowerArchives10, F2WinterTowerArchives11, F2WinterTowerArchives12,
        F2WinterTowerArchives13, F2WinterTowerArchives14, F2WinterTowerArchives15, F2WinterTowerArchives16,

        F2WinterTowerToolRoom1, F2WinterTowerToolRoom2, F2WinterTowerToolRoom3,
        F2WinterTowerToolRoom4, F2WinterTowerToolRoom5, F2WinterTowerToolRoom6,

        F2WinterTowerMaintenanceElevator1,

        F3WinterTowerKimberlysRoom1, F3WinterTowerKimberlysRoom2, F3WinterTowerKimberlysRoom3,
        F3WinterTowerKimberlysRoom4, F3WinterTowerKimberlysRoom5, F3WinterTowerKimberlysRoom6,
        F3WinterTowerKimberlysRoom7, F3WinterTowerKimberlysRoom8, F3WinterTowerKimberlysRoom9,
        F3WinterTowerKimberlysRoom10, F3WinterTowerKimberlysRoom11, F3WinterTowerKimberlysRoom12,
        F3WinterTowerKimberlysRoom13, F3WinterTowerKimberlysRoom14, F3WinterTowerKimberlysRoom15,
        F3WinterTowerKimberlysRoom16, F3WinterTowerKimberlysRoom17, F3WinterTowerKimberlysRoom18,

        SummerTowerEmergencyBridge1, SummerTowerEmergencyBridge2, SummerTowerEmergencyBridge3,

        SummerTowerElevator1, SummerTowerElevator2, SummerTowerElevator3,
        SummerTowerElevator4, SummerTowerElevator5, SummerTowerElevator6,

        F7SummerTowerRonnysRoom1, F7SummerTowerRonnysRoom2, F7SummerTowerRonnysRoom3, F7SummerTowerRonnysRoom4,
        F7SummerTowerRonnysRoom5, F7SummerTowerRonnysRoom6, F7SummerTowerRonnysRoom7, F7SummerTowerRonnysRoom8,
        F7SummerTowerRonnysRoom9, F7SummerTowerRonnysRoom10, F7SummerTowerRonnysRoom11, F7SummerTowerRonnysRoom12,
        F7SummerTowerRonnysRoom13, F7SummerTowerRonnysRoom14, F7SummerTowerRonnysRoom15, F7SummerTowerRonnysRoom16,
        F7SummerTowerRonnysRoom17, F7SummerTowerRonnysRoom18, F7SummerTowerRonnysRoom19, F7SummerTowerRonnysRoom20,
        F7SummerTowerRonnysRoom21, F7SummerTowerRonnysRoom22, F7SummerTowerRonnysRoom23, F7SummerTowerRonnysRoom24,
        F7SummerTowerRonnysRoom25, F7SummerTowerRonnysRoom26, F7SummerTowerRonnysRoom27, F7SummerTowerRonnysRoom28,
        F7SummerTowerRonnysRoom29, F7SummerTowerRonnysRoom30, F7SummerTowerRonnysRoom31, F7SummerTowerRonnysRoom32,
        F7SummerTowerRonnysRoom33, F7SummerTowerRonnysRoom34, F7SummerTowerRonnysRoom35,

        F5SummerTowerGeorgesRoom1, F5SummerTowerGeorgesRoom2, F5SummerTowerGeorgesRoom3, F5SummerTowerGeorgesRoom4,
        F5SummerTowerGeorgesRoom5, F5SummerTowerGeorgesRoom6, F5SummerTowerGeorgesRoom7, F5SummerTowerGeorgesRoom8,
        F5SummerTowerGeorgesRoom9, F5SummerTowerGeorgesRoom10, F5SummerTowerGeorgesRoom11, F5SummerTowerGeorgesRoom12,
        F5SummerTowerGeorgesRoom13, F5SummerTowerGeorgesRoom14, F5SummerTowerGeorgesRoom15, F5SummerTowerGeorgesRoom16,
        F5SummerTowerGeorgesRoom17, F5SummerTowerGeorgesRoom18, F5SummerTowerGeorgesRoom19, F5SummerTowerGeorgesRoom20,
        F5SummerTowerGeorgesRoom21, F5SummerTowerGeorgesRoom22,

        F5SummerTowerDavidsRoom1, F5SummerTowerDavidsRoom2, F5SummerTowerDavidsRoom3, F5SummerTowerDavidsRoom4,
        F5SummerTowerDavidsRoom5, F5SummerTowerDavidsRoom6, F5SummerTowerDavidsRoom7, F5SummerTowerDavidsRoom8,
        F5SummerTowerDavidsRoom9, F5SummerTowerDavidsRoom10, F5SummerTowerDavidsRoom11, F5SummerTowerDavidsRoom12,
        F5SummerTowerDavidsRoom13, F5SummerTowerDavidsRoom14, F5SummerTowerDavidsRoom15, F5SummerTowerDavidsRoom16,
        F5SummerTowerDavidsRoom17, F5SummerTowerDavidsRoom18, F5SummerTowerDavidsRoom19, F5SummerTowerDavidsRoom20,

        B0SummerTowerStoreRoom1, B0SummerTowerStoreRoom2, B0SummerTowerStoreRoom3, B0SummerTowerStoreRoom4,
        B0SummerTowerStoreRoom5, B0SummerTowerStoreRoom6, B0SummerTowerStoreRoom7, B0SummerTowerStoreRoom8,
        B0SummerTowerStoreRoom9, B0SummerTowerStoreRoom10, B0SummerTowerStoreRoom11, B0SummerTowerStoreRoom12,
        B0SummerTowerStoreRoom13, B0SummerTowerStoreRoom14, B0SummerTowerStoreRoom15, B0SummerTowerStoreRoom16,
        B0SummerTowerStoreRoom17, B0SummerTowerStoreRoom18, B0SummerTowerStoreRoom19, B0SummerTowerStoreRoom20,
        B0SummerTowerStoreRoom21,

        F6SummerTowerPowerRoom1, F6SummerTowerPowerRoom2, F6SummerTowerPowerRoom3, F6SummerTowerPowerRoom4,
        F6SummerTowerPowerRoom5, F6SummerTowerPowerRoom6, F6SummerTowerPowerRoom7, F6SummerTowerPowerRoom8,

        FallTowerElevator1, FallTowerElevator2, FallTowerElevator3, FallTowerElevator4,
        FallTowerElevator5, FallTowerElevator6, FallTowerElevator7, FallTowerElevator8,

        FallTowerSafeRoom1, FallTowerSafeRoom2, FallTowerSafeRoom3, FallTowerSafeRoom4,
        FallTowerSafeRoom5, FallTowerSafeRoom6, FallTowerSafeRoom7, FallTowerSafeRoom8,

        F9FallTower1, F9FallTower2, F9FallTower3,

        StairRoom1, StairRoom2, StairRoom3, StairRoom4, StairRoom5, StairRoom6, StairRoom7, StairRoom8,
        StairRoom9, StairRoom10, StairRoom11, StairRoom12, StairRoom13, StairRoom14, StairRoom15, StairRoom16,
        StairRoom17,

        EscapeShuttle1
    ]

   function GetLookup() {
        lookup = {}
        for location in this.AllLocations {
            lookup[location.Value] = location.Name
        }
        return lookup
    }
}

class SearchModeLocation {
    Id = word(0x17cf92)
    Locations = SearchModeLocations()
}
searchModeLocation = SearchModeLocation()

class Cutscenes {
    // Progression Events
    MarcusCorpse = 0x0088
    WinterTowerElevatorAttack = 0x010d
    ParkerCorpse = 0x0136
    KimberlyCorpse = 0x0137
    SelfDestructActivated = 0x138
    ActivateWinterTowerPowerRoom = 0x156
    LeaveSummerTower = 0x1c5
    UseDavidsDisk = 0x01f0
    ReadDavidDiskFile = 0x0241
    MeetDavid = 0x0245
    ExamineDavidPhoto = 0x246
    PostMedicalScan = 0x0247
    RonnyCorpse = 0x0297
    ActivateMedicalScanner = 0x029a
    ReadRonnyComputerDocument = 0x029c
    DavidCorpse = 0x031a
    ActivateSummerTowerPowerRoom = 0x033d
    AccessSummerTowerElevator = 0x0365
    FallTowerSafeRoomDavidHelmet = 0x03cd
    KillFallTowerBoss = 0x03ce

    // Optional Events 
    ButterflyHolo = 0x0045
    StarHolo = 0x0078
    KillWinterTowerBasementEnemy = 0x015a
    ChargeGunInToolRoom = 0x0198
    GeorgesComputer = 0x0228
    RonnyStaticAttack = 0x03f1

    // Items and Tools
    VoiceRecorder = 0x003e
    VPSScanner = 0x003f
    SeveredFingers = 0x0085
    GeorgeGun = 0x0188
    ScannerKey = 0x1f2
    OrangeKeycard = 0x0248
    GeorgeClue = 0x0249
    Sunglasses = 0x298
    SummerStoreRoomHint = 0x0333
    KimberlyGun = 0x03ad

    // Other Events
    LaurasMemories = 0x0007
    Credits = 0x0008
    SavingLoading = 0x000a
    DeathScene = 0x000b
    Intro = 0x000f
    EnterStorageRoomVexxTerminal = 0x00d3
    ExitParkersVexxTerminal = 0x0135
    EnterArchives = 0x015b
}

class Cutscene {
    Id = word(0x17cfa2)
    Timer = word(0x17dbd2)
    Cutscenes = Cutscenes()
    NotPlaying = 0xffff
}

class Achievement {
    Type = 0 // 0 = None, 1 = Progression, 2 = Win Condition, 3 = Missable
    Points = 0
    Title = ""
    Description = ""
    Trigger = always_false()
    Id = 0
}

class AchievementHelpers {
    function IsSearchMode() {
        return __ornext(
            playerState.Id == playerState.States.SearchModeMove ||
            playerState.Id == playerState.States.SearchModeIdle ||
            playerState.Id == playerState.States.SearchModeMenu ||
            playerState.Id == playerState.States.VexxTerminal
        )
    }

    function IsActiveMode() {
        return playerState.Id == playerState.States.ActiveMode
    }

    function IsSavingOrLoading() {
        return __ornext
        (
            playerState.Id == playerState.States.LoadingSave ||
            playerState.Id == playerState.States.SegaLogo ||
            playerState.Id == playerState.States.LoadingData ||
            playerState.Id == playerState.States.LoadingGame
        )
    }

    function IsPlaying() {
        return __ornext(
            playerState.Id == playerState.States.SearchModeMove ||
            playerState.Id == playerState.States.SearchModeIdle ||
            playerState.Id == playerState.States.SearchModeMenu ||
            playerState.Id == playerState.States.VexxTerminal ||
            playerState.Id == playerState.States.ActiveMode
        )
    }

    function GetSavePercentage() {
        return max_of(
            measured((saves.Remaining / saves.BeginnerMax * 100.0), gameDifficulty.Id == gameDifficulty.Difficulties.Beginner),
            measured((saves.Remaining / saves.EasyMax * 100.0), gameDifficulty.Id == gameDifficulty.Difficulties.Easy),
            measured((saves.Remaining / saves.NormalMax * 100.0), gameDifficulty.Id == gameDifficulty.Difficulties.Normal),
            measured((saves.Remaining / saves.HardMax * 100.0), gameDifficulty.Id == gameDifficulty.Difficulties.Hard)
        )
    }

    function HasSavePercentage(difficulty, value) {
        assert(difficulty >= gameDifficulty.Difficulties.Normal && difficulty <= gameDifficulty.Difficulties.Hard, "Difficulty must be Normal or higher")
        assert(value > 1.0 || value < 0.0, "Percentage must be between 0.0 and 1.0")

        target = gameDifficulty.NormalMax

        if (difficulty == difficulty.Difficulties.Hard)
            target = gameDifficulty.HardMax

        target = target * value

        return saves.Remaining >= target
    }

    function CutscenePlayed(id) {
        return cutscene.Id == id &&
            prev(cutscene.Timer) != cutscene.NotPlaying &&
            cutscene.Timer == cutscene.NotPlaying
    }
}
helpers = AchievementHelpers()

class AchievementTriggers {
    function SharpenTheSaw() {
        return disc.Id == 1 &&
            helpers.IsPlaying() &&
            prev(training.Level) == 2 &&
            training.Level == 3
    }

    function TheButterflyEffecT() {
        return disc.Id == 2 &&
            helpers.IsPlaying()

    }

    function ThirdTimesTheCharm() {
        return always_false()
    }
    
    function DownButNotOut() {
        return always_false()
    }
    
    function WorkingStiff() {
        return always_false()
    }
    
    function OneStepAhead() {
        return always_false()
    }
    
    function WatchYourSix() {
        return always_false()
    }
    
    function WrittenInTheStars() {
        return always_false()
    }
    
    function StoneColdKiller() {
        return always_false()
    }
    
    function TheColdLightOfDay() {
        return always_false()
    }
    
    function ABreathOfFreshAir() {
        return always_false()
    }
    
    function VeiledAttempt() {
        return always_false()
    }
    
    function NewHeights() {
        return always_false()
    }
    
    function BackOnTrack() {
        return always_false()
    }
    
    function PaveTheWay() {
        return always_false()
    }
    
    function SkeletonCrew() {
        return always_false()
    }
    
    function OddsAndEnds() {
        return always_false()
    }
    
    function OneDoorCloses() {
        return always_false()
    }
    
    function OpenSesame() {
        return always_false()
    }
    
    function RiddleMeThis() {
        return always_false()
    }
    
    function TrueColors() {
        return always_false()
    }
    
    function TheWayWeWere() {
        return always_false()
    }
    
    function InsultToInjury() {
        return always_false()
    }
    
    function BiteTheBullet() {
        return always_false()
    }
    
    function BunInTheOven() {
        return always_false()
    }
    
    function GoodForTheGoose() {
        return always_false()
    }
    
    function FromTheAshes() {
        return always_false()
    }
    
    function MixedBag() {
        return always_false()
    }
    
    function TheEleventhHour() {
        return always_false()
    }
    
    function YouShouldntHave() {
        return always_false()
    }
    
    function Checkmate() {
        return always_false()
    }
    
    function FromWhenceYouCame() {
        return always_false()
    }
    
    function LoveIsBlind() {
        return always_false()
    }
    
    function StrangerThanFiction() {
        return always_false()
    }
    
    function Intern() {
        return always_false()
    }
    
    function Junior() {
        return always_false()
    }
    
    function Associate() {
        return always_false()
    }
    
    function Senior() {
        return always_false()
    }
    
    function FlyingBlind() {
        return always_false()
    }
    
    function StepOnTheGas() {
        return always_false()
    }
    
    function GutFeeling() {
        return always_false()
    }
    
    function SixthSense() {
        return always_false()
    }
    
    function UnderTheRadar() {
        return always_false()
    }
}
triggers = AchievementTriggers()

class Achievements {
    StartingID = 0
    Data = [
        Achievement(0, 5, "Sharpen the Saw", "Complete all three training missions on Disc 0", triggers.SharpenTheSaw()),
        Achievement(0, 3, "The Butterfly Effect", "Notice something delicate drifting through the silence...", triggers.TheButterflyEffecT()),
        Achievement(0, 3, "Third Times the Charm", "Press Parker for answers... and hear the signal die", triggers.ThirdTimesTheCharm()),
        Achievement(1, 5, "Down but not Out", "Override the emergency lockdown and descend into the Winter Tower Basement", triggers.DownButNotOut()),
        Achievement(1, 5, "Working Stiff", "Discover why Parker stopped answering", triggers.WorkingStiff()),
        Achievement(1, 5, "One Step Ahead", "Witness a gruesome scene in Marcus's Room", triggers.OneStepAhead()),
        Achievement(1, 5, "Watch Your Six", "Find something to defend yourself with", triggers.WatchYourSix()),
        Achievement(0, 3, "Written in the Stars", "Pause beneath the endless stars", triggers.WrittenInTheStars()),
        Achievement(1, 5, "Stone Cold Killer", "Strike down the unseen hunter below the Winter Tower", triggers.StoneColdKiller()),
        Achievement(1, 5, "The Cold Light of Day", "Restore light to the silent Winter Tower", triggers.TheColdLightOfDay()),
        Achievement(1, 5, "A Breath of Fresh Air", "Escape an invisible stalker and slip away into the station's veins", triggers.ABreathOfFreshAir()),
        Achievement(0, 3, "Veiled Attempt", "Tamper with George's terminal and face his displeasure", triggers.VeiledAttempt()),
        Achievement(1, 5, "New Heights", "Open a quiet path back into the air ducts", triggers.NewHeights()),
        Achievement(0, 3, "Back on Track", "Break George's safeguards and revive your weapon", triggers.BackOnTrack()),
        Achievement(1, 5, "Pave the Way", "Silence the watcher in the vents and reach Kimberly", triggers.PaveTheWay()),
        Achievement(1, 5, "Skeleton Crew", "Search for answers while there's still someone left to give them", triggers.SkeletonCrew()),
        Achievement(0, 5, "Odds and Ends", "Gather every trace left by the Winter Tower crew", triggers.OddsAndEnds()),
        Achievement(1, 10, "One Door Closes", "Leave the frozen tower behind", triggers.OneDoorCloses()),
        Achievement(1, 5, "Open Sesame", "Understand the strange logic of the Summer Tower lift", triggers.OpenSesame()),
        Achievement(1, 5, "Riddle Me This", "Break Ronny's cryptic lock", triggers.RiddleMeThis()),
        Achievement(1, 5, "True Colors", "Follow Ronny's emotional trail and uncover the truth", triggers.TrueColors()),
        Achievement(1, 5, "The Way We Were", "Reunite with David and remember quieter days", triggers.TheWayWeWere()),
        Achievement(1, 5, "Insult to Injury", "Watch hope vanish in an instant", triggers.InsultToInjury()),
        Achievement(1, 5, "Bite the Bullet", "Expose the secret hidden on David's disk—and live through the consequences", triggers.BiteTheBullet()),
        Achievement(1, 5, "Bun in the Oven", "Learn what the creature left inside you", triggers.BunInTheOven()),
        Achievement(1, 5, "Good for the Goose", "Survive a desperate assault… and a stranger rescue", triggers.GoodForTheGoose()),
        Achievement(1, 5, "From the Ashes", "Bring life back to the Summer Tower", triggers.FromTheAshes()),
        Achievement(0, 5, "Mixed Bag", "Gather every trace left by the Summer Tower crew", triggers.MixedBag()),
        Achievement(1, 10, "The Eleventh Hour", "Descend toward the final tower", triggers.TheEleventhHour()),
        Achievement(1, 5, "You Shouldn't Have", "Find a rare sanctuary within the Fall Tower and discover a parting gift from David", triggers.YouShouldntHave()),
        Achievement(1, 5, "Checkmate", "Put an end to the infectious horror in depths of the Fall Tower", triggers.Checkmate()),
        Achievement(1, 10, "From Whence You Came", "Flee the autumn labyrinth and return to the frozen tower", triggers.FromWhenceYouCame()),
        Achievement(1, 5, "Love is Blind", "Find Kimberly forever united with Parker", triggers.LoveIsBlind()),
        Achievement(1, 5, "Stranger Than Fiction", "Uncover the truth Parker tried to hide", triggers.StrangerThanFiction()),
        Achievement(0, 1, "Intern", "Escape the station on Beginner difficulty or higher", triggers.Intern()),
        Achievement(0, 3, "Junior", "Escape the station on Easy difficulty or higher", triggers.Junior()),
        Achievement(2, 5, "Associate", "Escape the station on Normal difficulty or higher", triggers.Associate()),
        Achievement(0, 10, "Senior", "Escape the station on Hard difficulty", triggers.Senior()),
        Achievement(0, 25, "Flying Blind", "Beat the game on Normal difficulty or higher without collecting the VPS scanner", triggers.FlyingBlind()),
        Achievement(0, 10, "Step on the Gas", "Escape the station in 1.5 hours or less on Normal difficulty or higher", triggers.StepOnTheGas()),
        Achievement(0, 10, "Gut Feeling", "Escape the station with at least 50% save battery remaining on Normal difficulty or higher", triggers.GutFeeling()),
        Achievement(0, 25, "Sixth Sense", "Escape the station with 100% save battery remaining on Normal difficulty or higher", triggers.SixthSense()),
        Achievement(0, 10, "Under the Radar", "Escape the station having killed 3 enemies or less on Normal difficulty or higher", triggers.UnderTheRadar()),
    ]

    function Generate() {   
        count = 0
        for achievement in this.Data {
            achievementType = ""

            if (achievement.Type == 1)
                achievementType = "progression"
            else if (achievement.Type == 2)
                achievementType = "win_condition"

            achievement(achievement.Title, achievement.Description, achievement.Points, achievement.Trigger, achievement.Id, type=achievementType)

            count = count + 1
        }
    }
}
achievements = Achievements()

class LeaderboardFormats {
    Value = "VALUE"
    Seconds = "SECS"
    Frames = "FRAMES"
    Points = "POINTS"
    Milliseconds = "MILLISECS"
    Minutes = "MINUTES"
    SecondsAsMinutes = "SECS_AS_MINS"
    Float1 = "FLOAT1"
    Float2 = "FLOAT2"
    Float3 = "FLOAT3"
    Float4 = "FLOAT4"
    Float5 = "FLOAT5"
    Float6 = "FLOAT6"
    Fixed1 = "FIXED1"
    Fixed2 = "FIXED2"
    Fixed3 = "FIXED3"
    Tens = "TENS"
    Hundreds = "HUNDREDS"
    Thousands = "THOUSANDS"
}
leaderboardFormats = LeaderboardFormats()

class Leaderboard {
    Id = 0
    Title = ""
    Description = ""
    Start = always_false()
    Cancel = always_false()
    Submit = always_false()
    Value = 0
    Format = leaderboardFormats.Value
    LowerIsBetter = false
    Set = 0
}

class Leaderboards {
    Data = [
        Leaderboard("Test", "Test")
    ]

    function Generate() {   
        count = 0
        for leaderboardDef in this.Data {
            leaderboard
            (
                leaderboardDef.Title, 
                leaderboardDef.Description, 
                leaderboardDef.Start, 
                leaderboardDef.Cancel,
                leaderboardDef.Submit,
                leaderboardDef.Value,
                leaderboardDef.Format,
                leaderboardDef.LowerIsBetter,
                leaderboardDef.Id,
                leaderboardDef.Set
            )
            count = count + 1
        }
    }
}
leaderboards = Leaderboards()

rich_presence_conditional_display(disc.Id >= 2 && helpers.IsSearchMode(), 
    "Laura is exploring {0} || Difficulty: {1} | Battery: {2}% | Time: {3}",
    rich_presence_lookup("SearchModeLocation", searchModeLocation.Id, searchModeLocation.Locations.GetLookup(), "Unknown Location"),
    rich_presence_lookup("Difficulty", gameDifficulty.Id, gameDifficulty.Lookup),
    rich_presence_value("Battery", helpers.GetSavePercentage()),
    rich_presence_value("Time", timer.TotalFrames, "FRAMES")
)

rich_presence_conditional_display(disc.Id >= 2 && helpers.IsActiveMode(), 
    "Laura is exploring {0} || Difficulty: {1} | Battery: {2}% | Time: {3}",
    rich_presence_lookup("ActionModeLocation", actionModeLocation.Id, actionModeLocation.Locations.GetLookup(), "Unknown Location"),
    rich_presence_lookup("Difficulty", gameDifficulty.Id, gameDifficulty.Lookup),
    rich_presence_value("Battery", helpers.GetSavePercentage()),
    rich_presence_value("Time", timer.TotalFrames, "FRAMES")
)

rich_presence_conditional_display(disc.Id >= 2 && helpers.IsSavingOrLoading() && menuState.Id == menuState.States.SaveLoad, 
    "Laura is logging her progress"
)

rich_presence_conditional_display(disc.Id >= 2 && helpers.IsSavingOrLoading() && menuState.Id != menuState.States.SaveLoad, 
    "Laura is preparing to investigate the Aki Station incident"
)

rich_presence_conditional_display(disc.Id == 1 && training.Active == 1, 
    "Laura is training on {0} and preparing for the horrors that await her on the Aki Station",
    rich_presence_lookup("TrainingLevel", training.Level, training.Lookup)
)

rich_presence_conditional_display(disc.Id == 1 && training.Active == 0, 
    "Laura is preparing to investigate the Aki Station incident"
)

rich_presence_display("Playing Enemy Zero!")

achievements.Generate()
//leaderboards.Generate()