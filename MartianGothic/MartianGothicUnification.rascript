// Martian Gothic: Unification
// #ID = 16570
// BacklogOddy
// Rich Presence Achievement Script

// #region Player Classes

class Character {
    id = 0
    health = 0
    room = 0

    function IsInRoom(location) {
        return this.room == location.id
    }
}

class Characters {
    Karne = Character(0, word(0x10f624), byte(0x10f62d))
    Kenzo = Character(1, word(0x10f72c), byte(0x10f735))
    Matlock = Character(2, word(0x10f834), byte(0x10f83d))
}

characters = Characters()

class Player {
    id = byte(0x10ccae)

    function CharacterDidntChange(){
        return prev(this.id) == this.id
    }

    function IsCharacter(character){
        return this.id == character.id
    }
}

player = Player()

// #endregion

// #region Map Classes

class Map {
    id = byte(0x10b5d4)
    screenId = word(0x10b5d6)

    function IsLoaded() {
        return this.id != 0x00
    }
    
    function Transition(from, to){
        transitioned = prev(this.id) == from.id && this.id == to.id
        return transitioned
    }

    function ScreenTransition(from, to){
        transitioned = prev(this.screenId) == from.id && this.screenId == to.id
        return transitioned
    }

    function IsInRoom(location){
        return this.id == location.id
    }

    function IsOnScreen(screen){
        return this.screenId == screen.id
    }

    function VisitedAllLocations(){
        count = 120
        baseAddress = 0x10b73d

        // 0x10b7b0 is the game over screen
        // The rest are unused flags
        excluded = [0x10b760, 0x10b794, 0x10b797, 0x10b7b0, 0x10b7b4]
        included = []
        
        for index in range(0, count){
            address = baseAddress + index
            if (!array_contains(excluded, baseAddress + index))
                array_push(included, byte(address))
        }
        
        discovered = sum_of(included, flag => flag)
        
        return prev(discovered) < length(included) && measured(discovered >= length(included), discovered - prev(discovered) == 1)
    }
}

map = Map()

// #endregion

// #region Location Classes

class Location {
    id = 0
    flag = 0
    function Discovered() => prev(this.flag) < this.flag
}

class Locations {
    MadisonDecontamination = Location(0x43, byte(0x1ab77f))
    MadisonAvenue1 = Location(0x05, byte(0x10b741))
    BoulevardStMichel2 = Location(0x03, byte(0x10b73f))
    BaseDirectorQuarters = Location(0x2a, byte(0x10b766))
    InocashiraDouri1 = Location(0x33, byte(0x10b76f))
    InocashiraDouri2 = Location(0x32, byte(0x10b76e))
    Arboretum1 = Location(0x2f, byte(0x10b76b))
    ParkLane1 = Location(0x31, byte(0x10b76d))
    ParkLane2 = Location(0x30, byte(0x10b76c))
    ChemLab = Location(0x3f, byte(0x10b77b))
    MedLab = Location(0x08, byte(0x10b744))
    PiccadillyCircus = Location(0x18, byte(0x10b754))
    CarnabyStreet = Location(0x19, byte(0x10b755))
    AirRecycling = Location(0x4f, byte(0x10b78b))
    AirRecyclingAntichamber = Location(0x4e, byte(0x10b78a))
    MOODAntiChamber = Location(0x01, byte(0x10b73d))
    PowerCore = Location(0x1e, byte(0x10b75a))
    TimeSquare1 = Location(0x16, byte(0x10b752))
    Washroom = Location(0x47, byte(0x10b783))
    SimurealChamber = Location(0x59, byte(0x10b795))
    SunsetBoulevard = Location(0x2d, byte(0x10b769))
    StateStreet1 = Location(0x11, byte(0x10b74d))
    StateStreet2 = Location(0x34, byte(0x10b770))
    WallStreet1 = Location(0x22, byte(0x10b75e))
    ShuttleBayEntrance = Location(0x1d, byte(0x10b759))
    ShuttleBay = Location(0x1c, byte(0x10b758))
    PennyLane1 = Location(0x2c, byte(0x10b768))
    Kitchen = Location(0x48, byte(0x10b784))
    MadisonAvenueDorm = Location(0x4b, byte(0x10b787))
    MadisonAvenue3 = Location(0x04, byte(0x10b740))
    DeadMansWalkDorm = Location(0x0b, byte(0x10b747))
    DeadMansWalk2 = Location(0x10, byte(0x10b74c))
    FortySecondStreet1 = Location(0x0c, byte(0x10b748))
    GeoLab = Location(0x3e, byte(0x10b77a))
    NecropolisAltar = Location(0x65, byte(0x10b7a1))
    MaiLinsRoom = Location(0x41, byte(0x10b77d))
    MaiLinVent = Location(0x5a, byte(0x10b796))
    BioLab = Location(0x5e, byte(0x10b79a))
    BioLabEntrance = Location(0x40, byte(0x10b77c))
    ProjectDirectorQuarters = Location(0x2b, byte(0x10b767))
    Broadway5 = Location(0x25, byte(0x10b761))
    Kremlin = Location(0x3a, byte(0x10b776))
    CarnabyStreetAirlock = Location(0x46, byte(0x10b782))
    CarnabyStreetDecontamination = Location(0x45, byte(0x10b781))
    NecropolisElevator = Location(0x12, byte(0x10b74e))
    NecropolisArena = Location(0x70, byte(0x10b7ac))
    NecropolisObelisk2 = Location(0x6d, byte(0x10b7a9))
    NecropolisAltar = Location(0x65, byte(0x10b7a1))
    LonelyStreetDorm = Location(0x20, byte(0x10b75c))
    LonelyStreet3 = Location(0x07, byte(0x10b743))
    Whitehall2 = Location(0x0a, byte(0x10b746))
    WhittakersGrave = Location(0x5f, byte(0x10b79b))
    RegalTomb = Location(0x66, byte(0x10b7a2))
    PitChamber1 = Location(0x54, byte(0x10b790))
    PitChamber2 = Location(0x6f, byte(0x10b7ab))
    FortySecondStreetStoreroom = Location(0x0f, byte(0x10b74b))
    TimeSquareAirlock = Location(0x38, byte(0x10b774))
    MadisonAvenueAirlock = Location(0x44, byte(0x10b780))
    InocashiraDouriAirlock = Location(0x4d, byte(0x10b789))

    Ending = Location()
    GameOver = Location(0x74, byte(0x10b7b0))
}

locations = Locations()

// #endregion

// #region Screen Classes

class Screen {
    location = 0
    id = 0
}

class Screens {
    EndingStart = Screen(locations.Ending, 0x011d)
    EndingEnd = Screen(locations.Ending, 0xffff)
}

screens = Screens()

// #endregion

// #region Door Classes

class Door {
    location = 0
    flag = 0

    function Unlocked(checkLocation = true){
        locationCheck = map.IsInRoom(this.location)
        unlocked = prev(this.flag) < this.flag

        if (checkLocation)
            unlocked = locationCheck && unlocked

        return unlocked
    }

    function IsClosed(){
        return this.flag == 0
    }

    function IsOpen(){
        return this.flag != 0
    }
}

class Doors {
    BaseDirectorQuarters = Door(locations.BoulevardStMichel2, byte(0x10cc74))
    Arboretum = Door(locations.ParkLane2, bit2(0x10b67d))
    ChemLab = Door(locations.PiccadillyCircus, byte(0x10cc62))
    MedLab = Door(locations.CarnabyStreet, bit0(0x10b69a))
    Washroom = Door(locations.SunsetBoulevard, byte(0x10cc99))
    WallStreetDorm = Door(locations.WallStreet1, byte(0x10cc8c))
    ShuttleBayDoor2 = Door(locations.ShuttleBay, byte(0x10cc31))
    MadisonAvenueDorm = Door(locations.MadisonAvenue3, byte(0x10cc83))
    DeadMansWalkDorm = Door(locations.DeadMansWalk2, byte(0x10cc8d))
    DeadMansWalkDorm42Street = Door(locations.FortySecondStreet1, byte(0x10cc95))
    GeoLab = Door(locations.PiccadillyCircus, byte(0x10cc69))
    MaiLinsRoom = Door(locations.BoulevardStMichel2, byte(0x10cc7d))
    Kremlin = Door(locations.Broadway5, byte(0x10cc73))
    LonelyStreetDorm = Door(locations.LonelyStreet3, byte(0x10cc8e))
    LonelyStreetDormWhitehall = Door(locations.Whitehall2, byte(0x10cc8f))
    Gymnasium = Door(locations.StateStreet1, byte(0x10cc71))
    Washroom = Door(locations.SunsetBoulevard, byte(0x10cc99))
    RecreationRoom = Door(locations.InocashiraDouri2, byte(0x10cc72))
    Study = Door(locations.ParkLane1, byte(0x10cc7f))
}

doors = Doors()

// #endregion

// #region Dialog Classes

class DialogEntry {
    location = 0
    start = 0
    end = 0

    id = dword(0x1030cc)
    status = word(0x1030c4)

    function Triggered(checkRoom = true){
        roomCheck = map.IsInRoom(this.location)

        triggered = prior(this.id) == this.start && this.id == this.end

        if (this.start == this.end)
            triggered = prior(this.id) != this.start && this.id == this.end

        if (checkRoom)
            triggered = roomCheck && triggered

        return prev(this.status) != 0xffff && this.status == 0xffff && triggered
    }
}

class DialogList {
    KarneTimeStops = DialogEntry(locations.InocashiraDouri2, 0x801871cc, 0x801871fe)
    KenzoBulkheads = DialogEntry(locations.SimurealChamber, 0x8018657e, 0x801865c0)
    KarneCutKitchenLock = DialogEntry(locations.InocashiraDouri1, 0x80185520, 0x80185520)
    BenGunnHeartOfFlesh = DialogEntry(locations.BioLab, 0x80182ee0, 0x80182f0e)
}

dialog = DialogList()

// #endregion

// #region Instance Classes

class Instance {
    location = 0
    flag = 0
    function Collected(checkLocation = true){
        locationCheck = map.IsInRoom(this.location)
        collected = prev(this.flag) > this.flag

        if (checkLocation)
            collected = locationCheck && collected

        return collected
    }
}

class Instances {
    BenGunnRedTag = Instance(locations.Kitchen, byte(0x10c304))
    MaiLinDiabolus = Instance(locations.MaiLinsRoom, byte(0x10c1ee))
    Obelisk2ChargedChorus = Instance(locations.NecropolisObelisk2, byte(0x10c8c7))
    AltarArkhamTag = Instance(locations.NecropolisAltar, byte(0x10c788))
    ShuttleBayTrimorphSample = Instance(locations.ShuttleBayEntrance, byte(0x10bc49))
    ShuttleBayTrimorphSampleAlt = Instance(locations.ShuttleBayEntrance, byte(0x10bc4a))
    CarnabyStreetAirlockFlareGun = Instance(locations.CarnabyStreetAirlock, byte(0x10c2b2))
    ChargePalmtop = Instance(locations.NecropolisArena, byte(0x10c96d))
}

instances = Instances()

// #endregion

// #region Item Classes

class Item {
    id = 0
}

// #endregion

class Items {
    BenGunnNote1 = Item(0x0ef)
    BenGunnNote2 = Item(0x105)
    BenGunnNote3 = Item(0x106)
    BenGunnNote4 = Item(0x107)
    Psionara = Item(0x92)
    Piccolo = Item(0x5b)
    NailGun = Item(0x5e)
    Dillinger = Item(0x5d)
    Diabolus = Item(0x5c)
    FlareGun = Item(0x5f)
    PalmTop = Item(0x7a)
}

items = Items()

// #region Inventory Classes

class InventoryOffsets {
    name = 0x8
    count = 0x10
    state = 0x0e
}

class Inventory {
    type = byte(0x1365b8)
    state = byte(0x1365dc)
    index = byte(0x1365b9)
    count = byte(0x1365ab)

    start = 0x1365e0
    slots = 18
    slotSize = 56
    size = slots * slotSize

    offsets = InventoryOffsets()

    function IsOpen() {
        return this.state != 0
    }
    
    function IsBrowsingStorage(){
        return this.type == 8
    }
    
    function GetSelectedItem() {
        startAddress = this.start + (this.size * game.player.character)
        slotAddress = startAddress + (this.index * this.slotSize)
        itemAddress = slotAddress + this.offsets.name
        return word(itemAddress)
    }

    function GetSelectedItemCount() {
        startAddress = this.start + (this.size * game.player.character)
        slotAddress = startAddress + (this.index * this.slotSize)
        itemAddress = slotAddress + this.offsets.count
        return byte(itemAddress)
    }

    function CollectedItem(item) {
        startAddress = this.start
        allSlots = 18 * 3
        checks = []

        for index in range(0, allSlots - 1){
            baseAddress = startAddress + (index * this.slotSize)
            itemId = word(baseAddress + this.offsets.name)
            check = prev(itemId) == 0xffff && itemId == item.id
            array_push(checks, check)
        }

        return any_of(checks, c => c)
    }

    function ItemStateChanged(item, start, end) {
        startAddress = this.start
        allSlots = 18 * 3
        checks = []

        for index in range(0, allSlots - 1){
            baseAddress = startAddress + (index * this.slotSize)
            itemId = word(baseAddress + this.offsets.name)
            itemState = word(baseAddress + this.offsets.state)
            check = itemId == item.id && prev(itemState) == start && itemState == end
            array_push(checks, check)
        }

        return any_of(checks, c => c)
    }
}

inventory = Inventory()

// #endregion

// #region Storage Classes
    
class Storage {
    infoBase = 0x1373e0
    storageBase = 0x137688
    slotSize = 56

    infoIndex = byte(0x10f578)
    infoOffset = infoIndex * 2
    
    objectIndexAddress = infoBase + infoOffset
    objectIndex = word(objectIndexAddress)
    
    objectCountAddress = objectIndexAddress + 0x154
    objectCount = word(objectCountAddress)
    objectOffset = objectIndex * slotSize
    
    objectBase = storageBase + objectOffset
    
    function IsOpen(){
        return this.infoIndex != 0xff
    }
    
    function GetSelectedItem(prevIndex = false){
        index = inventory.index
        if (prevIndex)
            index = prev(index)
    
        slotAddress = this.objectBase + (index * inventory.slotSize)
        itemAddress = slotAddress + inventory.offsets.name
        return word(itemAddress)
    }
    
    function GetSplitAddress(){
        base1 = this.objectIndexAddress - 0x130000
        b0 = base1 - (base1 / 256) * 256 
        b1 = base1 / 256
        
        base2 = this.objectCountAddress - 0x130000
        b2 = base2 - (base2 / 256) * 256 
        b3 = base2 / 256
        
        base3 = this.objectBase - 0x130000
        b4 = base3 - (base3 / 256) * 256 
        b5 = base3 / 256
        
        return [b1, b0, b3, b2, b5, b4]
    }
    
    function CollectedItem(item){
        return this.IsOpen() && inventory.IsOpen() && 
            prev(this.GetSelectedItem()) == item.id && 
            this.GetSelectedItem() != item.id &&
            prev(inventory.count) < inventory.count
    }
}

storage = Storage() 

// #endregion

// #region Event Classes

class Event {
    location = 0
    flag = 0

    function IsTriggered(value = 0){
        triggered = this.flag != 0

        if (value != 0)
            triggered = this.flag >= value

        return triggered
    }

    function Trigger(checkRoom = true) {
        roomCheck = map.IsInRoom(this.location)
        triggered = prev(this.flag) < this.flag

        if (checkRoom)
            triggered = roomCheck && triggered

        return triggered
    }

    function IncrementalTrigger(startValue, endValue, checkRoom = true){
        roomCheck = map.IsInRoom(this.location)
        triggered = prev(this.flag) == startValue && this.flag == endValue

        if (checkRoom)
            triggered = roomCheck && triggered

        return triggered
    }
}

class Events {
    UnlockInocashiraDouriDecontamination = Event(locations.BaseDirectorQuarters, bit0(0x10b67f))
    UnlockTimeSquareDecontamination = Event(locations.BaseDirectorQuarters, bit1(0x10b67f))
    WatchesStop = Event(locations.InocashiraDouri2, bit2(0x10b66f))
    TurnAirRecyclingFanOn = Event(locations.AirRecycling, byte(0x10b6b0))
    CleanedAirRecyclingFilter = Event(locations.AirRecycling, bit7(0x10b66f))
    RepairBreach = Event(locations.MOODAntiChamber, byte(0x10b682))
    CollectJamisonHand = Event(locations.Washroom, bit0(0x10b699))
    ReplacePowerCoreReceptorPanel = Event(locations.PowerCore, byte(0x10b6b3))
    MovePowerCoreArmControl = Event(locations.PowerCore, byte(0x10b69b))
    OpenSimurealGardenDoor = Event(locations.SimurealChamber, byte(0x10b692))
    BlowUpPowerCoreDoor = Event(locations.TimeSquare1, byte(0x10b6c5))
    RaiseBulkheads = Event(locations.StateStreet2, bit5(0x10b67b))
    ShuttleBayTrimorphTrapped = Event(locations.ShuttleBayEntrance, byte(0x10b6be))
    EnteredShuttleBayThroughVent = Event(locations.PennyLane1, bit7(0x10b67b))
    GiveBenGunnPumiceStone = Event(locations.Kitchen, bit7(0x10b64c))
    DisableGeoLabStatue = Event(locations.GeoLab, byte(0x10b6c7))
    CutBioLabTentacles = Event(locations.BioLabEntrance, bit0(0x10b6ff))
    UnlockKremlin = Event(locations.ProjectDirectorQuarters, bit4(0x10b67f))
    ExamineJudithHarrowayCorpse = Event(locations.ProjectDirectorQuarters, bit0(0x10b728))
    BreakLockOnKitchenDoor = Event(locations.InocashiraDouri1, bit0(0x10b684))
    CloseMaiLinVentShutter = Event(locations.MaiLinVent, bit1(0x10b671))
    ActivateKermlinComputer = Event(locations.Kremlin, byte(0x10b693))
    EjectTrimorphOutOfCarnabyStreetAirlock = Event(locations.CarnabyStreetAirlock, byte(0x10b6a4))
    RepairNecropolisElevator = Event(locations.NecropolisElevator, bit0(0x10b6b4))
    RepairNecropolisGenerator = Event(locations.NecropolisArena, bit4(0x10b670))
    ChargedChorus = Event(locations.NecropolisObelisk2, bit0(0x10b6ac))
    ArkhamTagDropped = Event(locations.NecropolisAltar, byte(0x10b680))
    UnlockArkhamDormSpectrometerLock = Event(locations.LonelyStreetDorm, bit4(0x10b67a))
    UseHourglassInArkhamDorm = Event(locations.LonelyStreetDorm, bit0(0x10b695))
    WhittakerAppears = Event(locations.WhittakersGrave, byte(0x10b698))
    CompleteBenGunnExperiment = Event(locations.BioLab, bit1(0x10b6b1))
    GetMatlockBloodSample = Event(locations.BioLab, bit0(0x10b69e))
    GetKarneBloodSample = Event(locations.BioLab, bit0(0x10b69c))
    GetKenzoBloodSample = Event(locations.BioLab, bit0(0x10b69d))
    UseVaccineOnMatlock = Event(locations.BioLab, bit0(0x10b6a1))
    UseVaccineOnKarne = Event(locations.BioLab, bit0(0x10b69f))
    UseVaccineOnKenzo = Event(locations.BioLab, bit0(0x10b6a0))
    CollectAlienFluidSample = Event(locations.RegalTomb, byte(0x10b6ae))
    PrimePitChamberExplosive = Event(locations.PitChamber1, bit6(0x10b67c))
    FlipOverrideSwitch = Event(locations.ShuttleBay, byte(0x10b685))
    ListenToAllMartianMayhem = Event(Location(), byte(0x10ccb0))
    KilledDorm3Trimorph = Event(locations.DeadMansWalkDorm, bit4(0x10b68a))
    KilledObeliskTrimorph = Event(locations.NecropolisObelisk2, bit5(0x10b68a))
    KilledShuttleBayTrimorph = Event(locations.ShuttleBayEntrance, bit1(0x10b68a))
    KilledPitChamberTrimorph = Event(locations.PitChamber2, bit2(0x10b68a))
    KilledNecropolisElevatorTrimorph = Event(locations.NecropolisElevator, bit3(0x10b68a))
    KilledCarnabyStreetAirlockTrimorph = Event(locations.CarnabyStreetAirlock, bit1(0x10b6a4))
    KilledAirRecyclingTrimorph = Event(locations.AirRecyclingAntichamber, bit2(0x10b6a2))

    function EventSetTriggered(eventArray, isMeasured = true){
        triggered = sum_of(eventArray, event => event.flag)
        prevCheck = prev(triggered) < length(eventArray)
        check = triggered >= length(eventArray)

        if (isMeasured)
            check = measured(check, triggered - prev(triggered) == 1)

        return prevCheck && check
    }
}

events = Events()

// #endregion

// #region Game State Classes

class Timer {
    hours = byte(0x10ccc0)
    minutes = byte(0x10ccc1)
    seconds = byte(0x10ccc2)

    function GetTimeInSeconds(){
        return this.hours * 3600 + this.minutes * 60 + this.seconds
    }
}

class Saves {
    AirRecycling = byte(0x10b5e2)
    PowerCore = byte(0x10b5e3)
    GeoLab = byte(0x10be4)
    ChemLab = byte(0x10b5e5)
    MedLab = byte(0x10b5e6)
    MaiLin = byte(0x10b5e7)
    BaseDirector = byte(0x10b5e9)
    BioLab = byte(0x10b5ea)
    Study = byte(0x10b5eb)
    Kremlin = byte(0x10b5ec)
    ProjectDirector = byte(0x10b5ed)
    PalmTop = byte(0x10b5ee)
    
    function GetUsedSaves() {
        maxSaves = 144
        baseAddress = 0x10b5e1
        count = 13

        excluded = [0x10b5e1, 0x10b5e8]
        included = []

        for index in range(0, count){
            address = baseAddress + index
            if (!array_contains(excluded, address))
                array_push(included, byte(address))
        }

        remainingSaves = sum_of(included, flag => flag)
            
        return maxSaves - remainingSaves
    }
}

class GameState {
    title = byte(0x1033b8)

    function IsInGame() => this.title == 0
    function IsOnTitle() => this.title == 1
}

class Game {
    state = GameState()
    saves = Saves()
    timer = Timer()

    loaded = byte(0x1033a8)

    function IsLoaded() {
        return this.loaded != 0x00
    }
}

game = Game()

// #endregion

// #region Helper Functions

function CompletedGame(){
    return game.state.IsInGame() &&
        events.FlipOverrideSwitch.IsTriggered(3) &&
        map.ScreenTransition(screens.EndingStart, screens.EndingEnd)
}

// #endregion

// #region Progression Achievement Functions

function Progression_ArriveInVitaBase(){
    return game.state.IsInGame() &&
        map.Transition(locations.MadisonDecontamination, locations.MadisonAvenue1)
}

function Progression_AccessBaseDirectorQuarters(){
    return game.state.IsInGame() &&
        doors.BaseDirectorQuarters.Unlocked()
}

function Progression_UnlockInocashiraDouriDecontamination(){
    return game.state.IsInGame() &&
        events.UnlockInocashiraDouriDecontamination.Trigger()
}

function Progression_TimeStandsStill(){
    return game.state.IsInGame() &&
        events.WatchesStop.IsTriggered() &&
        dialog.KarneTimeStops.Triggered()
}

function Progression_AccessGymnasium(){
    return game.state.IsInGame() &&
        doors.Gymnasium.Unlocked()
}

function Progression_AccessWashroom(){
    return game.state.IsInGame() &&
        doors.Washroom.Unlocked()
}

function Progression_AccessRecreationRoom(){
    return game.state.IsInGame() &&
        doors.RecreationRoom.Unlocked()
}

function Progression_AccessStudy(){
    return game.state.IsInGame() &&
        doors.Study.Unlocked()
}

function Progression_AccessArboretum(){
    return game.state.IsInGame() &&
        doors.Arboretum.Unlocked()
}

function Progression_UnlockTimeSquareDecontamination(){
    return game.state.IsInGame() &&
        events.UnlockTimeSquareDecontamination.Trigger()
}

function Progression_AccessChemLab(){
    return game.state.IsInGame() &&
       doors.ChemLab.Unlocked()
}

function Progression_AccessMedLab(){
    return game.state.IsInGame() &&
        doors.MedLab.Unlocked()
}

function Progression_RestartAirRecycling(){
    return game.state.IsInGame() &&
        events.CleanedAirRecyclingFilter.IsTriggered() &&
        events.TurnAirRecyclingFanOn.IncrementalTrigger(5, 0)
        
}

function Progression_RepairBreach(){
    return game.state.IsInGame() &&
        events.RepairBreach.IncrementalTrigger(1, 2)
}

function Progression_AccessPowerCore(){
    return game.state.IsInGame() &&
        events.BlowUpPowerCoreDoor.IncrementalTrigger(0x14, 0x15)
}

function Progression_CollectJamisonHand(){
    return game.state.IsInGame() &&
        events.CollectJamisonHand.Trigger()
}

function Progression_RestoreVitaBasePower(){
    return game.state.IsInGame() &&
        events.ReplacePowerCoreReceptorPanel.IsTriggered() &&
        events.MovePowerCoreArmControl.IncrementalTrigger(3, 0)
}

function Progression_AccessSimurealChamber(){
    return game.state.IsInGame() &&
        events.OpenSimurealGardenDoor.IncrementalTrigger(1, 2)
}

function Progression_ReleaseVitaBaseBulkheads(){
    return game.state.IsInGame() &&
        events.RaiseBulkheads.IsTriggered() &&
        dialog.KenzoBulkheads.Triggered()
}

function Progression_AccessWallStreetDorm(){
    return game.state.IsInGame() &&
        doors.WallStreetDorm.Unlocked()
}

function Progression_TrapShuttleBayTrimorph(){
    return game.state.IsInGame() &&
        player.IsCharacter(characters.Kenzo) &&
        doors.ShuttleBayDoor2.IsClosed() &&
        events.ShuttleBayTrimorphTrapped.IsTriggered(2) &&
        map.Transition(locations.ShuttleBay, locations.SimurealChamber)
}

function Progression_AccessShuttleBay(){
    return game.state.IsInGame() &&
        events.EnteredShuttleBayThroughVent.IsTriggered() &&
        map.Transition(locations.PennyLane1, locations.ShuttleBay)
}

function Progression_AccessKitchen(){
    return game.state.IsInGame() &&
        events.BreakLockOnKitchenDoor.IsTriggered() &&
        dialog.KarneCutKitchenLock.Triggered()
}

function Progression_AccessMadisonAvenueDorm(){
    return game.state.IsInGame() &&
        doors.MadisonAvenueDorm.Unlocked()
}

function Progression_TradeForRedTag(){
    return game.state.IsInGame() &&
        events.GiveBenGunnPumiceStone.IsTriggered() &&
        instances.BenGunnRedTag.Collected()
}

function Progression_AccessDeadMansWalkDorm(){
    return game.state.IsInGame() &&
        (
            doors.DeadMansWalkDorm.Unlocked() ||
            doors.DeadMansWalkDorm42Street.Unlocked()
        )
}

function Progression_AccessGeoLab(){
    return game.state.IsInGame() &&
        doors.GeoLab.Unlocked()
}

function Progression_BreakPsychicCurse(){
    return game.state.IsInGame() &&
        player.IsCharacter(characters.Matlock) &&
        events.DisableGeoLabStatue.IsTriggered(6) &&
        map.Transition(locations.NecropolisAltar, locations.GeoLab)
}

function Progression_AccessMaiLinsRoom(){
    return game.state.IsInGame() &&
        doors.MaiLinsRoom.Unlocked()
}

function Progression_AccessBioLab(){
    return game.state.IsInGame() &&
        events.CutBioLabTentacles.Trigger()
}

function Progression_AccessProjectDirectorQuarters(){
    return game.state.IsInGame() &&
        events.CloseMaiLinVentShutter.IsTriggered() &&
        map.Transition(locations.MaiLinVent, locations.ProjectDirectorQuarters)
}

function Progression_AccessKremlin(){
    return game.state.IsInGame() &&
        player.IsCharacter(characters.Karne) &&
        events.UnlockKremlin.IsTriggered() &&
        map.Transition(locations.Broadway5, locations.ProjectDirectorQuarters)
}

function Progression_ActivateKremlinComputer(){
    return game.state.IsInGame() &&
        events.ActivateKermlinComputer.IncrementalTrigger(2, 3)
}

function Progression_AccessNecropolis(){
    return game.state.IsInGame() &&
        events.RepairNecropolisElevator.Trigger()
}

function Progression_RepairNecropolisGenerator(){
    return game.state.IsInGame() &&
        events.RepairNecropolisGenerator.Trigger()
}

function Progression_ChargeChorus(){
    return game.state.IsInGame() &&
        events.ChargedChorus.IsTriggered() &&
        instances.Obelisk2ChargedChorus.Collected()
}

function Progression_AcquireArkhamTag(){
    return game.state.IsInGame() &&
        events.ArkhamTagDropped.IsTriggered(2) &&
        instances.AltarArkhamTag.Collected()
}

function Progression_AccessLonelyStreetDorm(){
    return game.state.IsInGame() &&
        (
            doors.LonelyStreetDorm.Unlocked() ||
            doors.LonelyStreetDormWhitehall.Unlocked()
        )
}

function Progression_AccessLonelyStreetDormBunk(){
    return game.state.IsInGame() &&
        events.UnlockArkhamDormSpectrometerLock.Trigger()
}

function Progression_AccessWhittakersGrave(){
    return game.state.IsInGame() &&
        events.WhittakerAppears.IncrementalTrigger(1, 2)
}

function Progression_SolveLonelyStreetDormPuzzle(){
    return game.state.IsInGame() &&
        events.UseHourglassInArkhamDorm.Trigger()
}

function Progression_CompleteBenGunnsExperiment(){
    return game.state.IsInGame() &&
        events.CompleteBenGunnExperiment.IsTriggered() &&
        dialog.BenGunnHeartOfFlesh.Triggered()
}

function Progression_CollectBloodSamples(){
    return game.state.IsInGame() &&
        events.EventSetTriggered
        (
            [
                events.GetMatlockBloodSample,
                events.GetKarneBloodSample,
                events.GetKenzoBloodSample
            ]
        )
}

function Progression_CollectTrimorphSample(){
    return game.state.IsInGame() &&
        events.KilledShuttleBayTrimorph.IsTriggered() &&
        (
            // Both flags are reset once collected, so check for either
            instances.ShuttleBayTrimorphSample.Collected() ||
            instances.ShuttleBayTrimorphSampleAlt.Collected()
        )  
}

function Progression_CollectAlienSample(){
    return game.state.IsInGame() &&
        events.CollectAlienFluidSample.IncrementalTrigger(2, 3)
}

function Progression_CureTheVirus(){
    return game.state.IsInGame() &&
        events.EventSetTriggered
        (
            [
                events.UseVaccineOnMatlock,
                events.UseVaccineOnKarne,
                events.UseVaccineOnKenzo
            ]
        )
}

function Progression_SetVitaBaseExplosive(){
    return game.state.IsInGame() &&
        events.PrimePitChamberExplosive.Trigger()
}

function Progression_EscapeVitaBase(){
    return CompletedGame()
}

// #endregion

// #region Challenge Achievement Functions

// Escape with a limited number of saves
function Challenge_EscapeWithSaveLimit(limit = 3){
    return CompletedGame() &&
        game.saves.GetUsedSaves() <= limit
}

// Escape within a time limit (in seconds)
function Challenge_EscapeWithTimeLimit(limit = 18000){
    return CompletedGame() &&
        game.timer.GetTimeInSeconds() <= limit
}

function Challenge_FindABenGunnNote(){
    return game.state.IsInGame() &&
        map.IsInRoom(locations.SunsetBoulevard) &&
        (
            storage.CollectedItem(items.BenGunnNote1) ||
            storage.CollectedItem(items.BenGunnNote2) ||
            storage.CollectedItem(items.BenGunnNote3) ||
            storage.CollectedItem(items.BenGunnNote4)
        )
}

function Challenge_ListenToAllMartianMayhemScenes(){
    return game.state.IsInGame() &&
        events.ListenToAllMartianMayhem.IncrementalTrigger(0x99, 0x9a, false)
}

function Challenge_FindPsionaraEarly(){
    return game.state.IsInGame() &&
        map.IsInRoom(locations.FortySecondStreetStoreroom) &&
        !events.KilledDorm3Trimorph.IsTriggered() &&
        inventory.CollectedItem(items.Psionara)
}

function Challenge_KillAllTrimorphs(){
    return game.state.IsInGame() &&
        events.EventSetTriggered(
            [
                events.KilledAirRecyclingTrimorph,
                events.KilledCarnabyStreetAirlockTrimorph,
                events.KilledDorm3Trimorph,
                events.KilledShuttleBayTrimorph,
                events.KilledNecropolisElevatorTrimorph,
                events.KilledPitChamberTrimorph,
                events.KilledObeliskTrimorph
            ]
        )
}

function Challenge_FindAPortableComputer(){
    return game.state.IsInGame() &&
        inventory.ItemStateChanged(items.PalmTop, 0x100a, 0x0010)
}

function Challenge_ThreeCharactersInOneRoom(){
    return game.state.IsInGame() &&
        !characters.Karne.IsInRoom(locations.GameOver) &&
        !prev(characters.Karne.IsInRoom(locations.Ending)) &&
        !characters.Kenzo.IsInRoom(locations.GameOver) &&
        !prev(characters.Kenzo.IsInRoom(locations.Ending)) &&
        !characters.Matlock.IsInRoom(locations.GameOver) &&
        !prev(characters.Matlock.IsInRoom(locations.Ending)) &&
        prev(characters.Karne.room) == prev(characters.Kenzo.room) &&
        prev(characters.Kenzo.room) == prev(characters.Matlock.room) &&
        (
            prev(characters.Kenzo.room) != characters.Kenzo.room ||
            prev(characters.Karne.room) != characters.Karne.room ||
            prev(characters.Matlock.room) != characters.Matlock.room
        )
}

function Challenge_FindAPiccolo(){
    return game.state.IsInGame() &&
        inventory.CollectedItem(items.Piccolo)
}

function Challenge_FindANailGun(){
    return game.state.IsInGame() &&
        inventory.CollectedItem(items.NailGun)
}

function Challenge_FindADillinger(){
    return game.state.IsInGame() &&
        inventory.CollectedItem(items.Dillinger)
}

function Challenge_FindAPsionara(){
    return game.state.IsInGame() &&
        map.IsInRoom(locations.FortySecondStreetStoreroom) &&
        inventory.CollectedItem(items.Psionara)
}

function Challenge_FindADiabolus(){
    return game.state.IsInGame() &&
        inventory.CollectedItem(items.Diabolus)
}

function Challenge_FindAFlareGun(){
    return game.state.IsInGame() &&
        inventory.CollectedItem(items.FlareGun)
}

function Challenge_VisitAllLocations(){
    return game.state.IsInGame() &&
        map.VisitedAllLocations()
}

function Challenge_FindJudithHarroway(){
    return game.state.IsInGame() &&
        map.IsInRoom(locations.ProjectDirectorQuarters) &&
        events.ExamineJudithHarrowayCorpse.Trigger()
}

// #endregion

// #region RP Lookups

class Lookups {
    characterIds = {
        0x0: "Karne",
        0x1: "Kenzo",
        0x2: "Matlock",
        0xf: "Babybug"
    }

    mapIds = {
        0x00: "Loading...",
        0x01: "MOOD Antichamber",
        0x02: "Boulevard St. Michel",
        0x03: "Boulevard St. Michel",
        0x04: "Madison Avenue",
        0x05: "Madison Avenue",
        0x06: "Madison Avenue",
        0x07: "Lonely Street",
        0x08: "Med Lab",
        0x09: "Lonely Street",
        0x0a: "Whitehall",
        0x0b: "Dead Man's Walk Dorm",
        0x0c: "42nd Street",
        0x0d: "Whitehall",
        0x0e: "42nd Street",
        0x0f: "42nd Street Store Room",
        0x10: "Dead Man's Walk",
        0x11: "State Street",
        0x12: "Necropolis Elevator",
        0x13: "Necropolis Elevator Antechamber",
        0x14: "West Sterilization Room",
        0x15: "Time Square",
        0x16: "Time Square",
        0x17: "Baker Street",
        0x18: "Piccadilly Circus",
        0x19: "Carnaby Street",
        0x1a: "East Sterilization Room",
        0x1b: "Broadway",
        0x1c: "Shuttle Bay",
        0x1d: "Shuttle Bay Entrance",
        0x1e: "Power Core",
        0x1f: "Lonely Street",
        0x20: "Arkham Dorm",
        0x21: "Broadway",
        0x22: "Wall Street",
        0x23: "Wall Street",
        0x25: "Broadway",
        0x26: "Madison Avenue",
        0x27: "Downing Street",
        0x28: "Dead Man's Walk",
        0x29: "Lonely Street Decontamination",
        0x2a: "Director's Quarters",
        0x2b: "Project Director's Quarters",
        0x2c: "Penny Lane",
        0x2d: "Sunset Boulevard",
        0x2e: "Lonely Street Airlock Entrance",
        0x2f: "Arboretum",
        0x30: "Park Lane",
        0x31: "Park Lane",
        0x32: "Inocashira Douri",
        0x33: "Inocashira Douri",
        0x34: "State Street",
        0x35: "Broadway",
        0x36: "Broadway",
        0x37: "Time Square Decontamination",
        0x38: "Time Square Airlock",
        0x39: "Gymnasium",
        0x3a: "Kremlin",
        0x3b: "Kremlin Storage Room",
        0x3c: "MOOD Chamber",
        0x3d: "Recreation Room",
        0x3e: "Geo Lab",
        0x3f: "Chem Lab",
        0x40: "Bio Lab Entrance",
        0x41: "Mai Lin's Room",
        0x42: "Lonely Street Airlock",
        0x43: "Madison Avenue Decontamination Room",
        0x44: "Madison Avenue Airlock",
        0x45: "Carnaby Street Decontamination Chamber",
        0x46: "Carnaby Street Airlock",
        0x47: "Washroom",
        0x48: "Kitchen",
        0x49: "Study",
        0x4a: "Wall Street Dorm",
        0x4b: "Madison Avenue Dorm",
        0x4c: "Inocashira Douri Decontamination",
        0x4d: "Inocashira Douri Airlock",
        0x4e: "Air Recycling Antichamber",
        0x4f: "Air Recycling Center",
        0x50: "Necropolis",
        0x51: "Necropolis",
        0x52: "Necropolis",
        0x53: "Necropolis",
        0x54: "Necropolis Pit Chamber",
        0x55: "Necropolis",
        0x56: "Necropolis",
        0x57: "Necropolis",
        0x59: "Simureal Chamber",
        0x5a: "Boulevard St. Michel Vent",
        0x5c: "Arboretum",
        0x5d: "Arboretum",
        0x5e: "Bio Lab",
        0x5f: "Whittaker's Grave",
        0x60: "Necropolis",
        0x61: "Necropolis",
        0x62: "Necropolis",
        0x63: "Necropolis",
        0x64: "Necropolis",
        0x65: "Necropolis Altar",
        0x66: "Necropolis Regal Tomb",
        0x67: "Necropolis",
        0x68: "Necropolis",
        0x69: "Necropolis",
        0x6a: "Necropolis",
        0x6b: "Necropolis North Chamber",
        0x6c: "Necropolis Obelisk",
        0x6d: "Necropolis Obelisk",
        0x6e: "Necropolis Obelisk",
        0x6f: "Necropolis Pit Chamber",
        0x70: "Necropolis Arena",
        0x71: "Necropolis Arena Research Building",
        0x72: "Space Shuttle",
        0x73: "Royal Tomb Crane",
        0x74: "Game Over",
        0x75: "Necropolis",
        0x76: "Necropolis",
        0x77: "Necropolis",
        0x79: "Inocashira Douri",
        0xff: "Loading..."
    }
}

lookups = Lookups()

// #endregion

// #region Achievement Definitions

achievement(
    "Piccolo",
    "Find a Piccolo",
    points = 2,
    trigger = Challenge_FindAPiccolo()
)

achievement(
    "Vita Base", 
    "Coordinate with your team then enter the Vita Base", 
    points = 2,
    trigger = Progression_ArriveInVitaBase(),
    type = "progression"
)

achievement(
    "Base Director's Quarters", 
    "Discover the use for a colorful tag and gain access to the Base Director's Quarters", 
    points = 2,
    trigger = Progression_AccessBaseDirectorQuarters(),
    type = "progression"
)

achievement(
    "Free Karne", 
    "Use the Base Director's Computer and free Karne from the Inocashiro Douri Airlock", 
    points = 2,
    trigger = Progression_UnlockInocashiraDouriDecontamination(),
    type = "progression"
)

achievement(
    "Frozen in Time", 
    "Witness time stand still and receive a set of mysterious numbers", 
    points = 2,
    trigger = Progression_TimeStandsStill(),
    type = "progression"
)

achievement(
    "Gymnasium", 
    "Discover the use for a colorful tag and gain access to the Gymnasium", 
    points = 2,
    trigger = Progression_AccessGymnasium(),
    type = "progression"
)

achievement(
    "Washroom", 
    "Discover the use for a colorful tag and gain access to the Washroom", 
    points = 2,
    trigger = Progression_AccessWashroom(),
    type = "progression"
)

achievement(
    "Ben Gunn's Notes",
    "Find a helpful note from a mysterious friend",
    points = 2,
    trigger = Challenge_FindABenGunnNote()
)

achievement(
    "Recreation Room", 
    "Discover the use for a colorful tag and gain access to the Recreation Room", 
    points = 2,
    trigger = Progression_AccessRecreationRoom(),
    type = "progression"
)

achievement(
    "Study", 
    "Discover the use for a colorful tag and gain access to the Study", 
    points = 2,
    trigger = Progression_AccessStudy(),
    type = "progression"
)

achievement(
    "Arboretum", 
    "Find a hidden passcode and gain access to the Arboretum", 
    points = 2,
    trigger = Progression_AccessArboretum(),
    type = "progression"
)

achievement(
    "Nail Gun",
    "Find a Nail Gun",
    points = 2,
    trigger = Challenge_FindANailGun()
)

achievement(
    "Free Matlock", 
    "Use the Base Director's Computer and free Matlock from the Time Square Airlock", 
    points = 2,
    trigger = Progression_UnlockTimeSquareDecontamination(),
    type = "progression"
)

achievement(
    "Chem Lab", 
    "Discover the use for a colorful tag and gain access to the Chem Lab", 
    points = 2,
    trigger = Progression_AccessChemLab(),
    type = "progression"
)

achievement(
    "Med Lab", 
    "Discover the use for a mysterious key and gain access to the Med Lab", 
    points = 2,
    trigger = Progression_AccessMedLab(),
    type = "progression"
)

achievement(
    "Air Recycling", 
    "Repair the Vita Base Air Recycling system and save your team from suffocation", 
    points = 4,
    trigger = Progression_RestartAirRecycling(),
    type = "progression"
)

achievement(
    "Repair Breach", 
    "Repair a breach in the Vita Base Hull and save your team from an untimely end", 
    points = 4,
    trigger = Progression_RepairBreach(),
    type = "progression"
)

achievement(
    "Power Core", 
    "Employ your alchemic ingenuity and gain access to the Vita Base Power Core", 
    points = 2,
    trigger = Progression_AccessPowerCore(),
    type = "progression"
)

achievement(
    "Jamison's Hand", 
    "Receive a helping hand from Jamison", 
    points = 2,
    trigger = Progression_CollectJamisonHand(),
    type = "progression"
)

achievement(
    "Restore Power", 
    "Employ your engineering prowess and restore power to the Vita Base", 
    points = 4,
    trigger = Progression_RestoreVitaBasePower(),
    type = "progression"
)

achievement(
    "Simureal Chamber Garden", 
    "Adorn the Shamisen with a precious trinket and gain access to the Simureal Chamber Garden", 
    points = 2,
    trigger = Progression_AccessSimurealChamber(),
    type = "progression"
)

achievement(
    "Bulkheads", 
    "Grant your team some breathing room and release the Vita Base Emergency Bulkheads", 
    points = 2,
    trigger = Progression_ReleaseVitaBaseBulkheads(),
    type = "progression"
)

achievement(
    "Wall Street Dorm", 
    "Discover the use for a colorful tag and gain access to the Wall Street Dorm", 
    points = 3,
    trigger = Progression_AccessWallStreetDorm(),
    type = "progression"
)

achievement(
    "Shuttle Bay Trimorph", 
    "Employ the help of a friend and trap the Trimorph that's stalking the Shuttle Bay", 
    points = 4,
    trigger = Progression_TrapShuttleBayTrimorph(),
    type = "progression"
)

achievement(
    "Shuttle Bay", 
    "Don't let a deadly obstacle get in your way and gain access to the Shuttle Bay", 
    points = 3,
    trigger = Progression_AccessShuttleBay(),
    type = "progression"
)

achievement(
    "Dillinger",
    "Find a Dillinger",
    points = 2,
    trigger = Challenge_FindADillinger()
)

achievement(
    "Kitchen", 
    "Employ your welding skills and cut your way through to the Kitchen", 
    points = 3,
    trigger = Progression_AccessKitchen(),
    type = "progression"
)

achievement(
    "Madison Avenue Dorm", 
    "Discover the use for a colorful tag and gain access to the Madison Avenue Dorm", 
    points = 3,
    trigger = Progression_AccessMadisonAvenueDorm(),
    type = "progression"
)

achievement(
    "Red Tag", 
    "Keep Ben Gunn happy and earn yourself a Red Tag", 
    points = 4,
    trigger = Progression_TradeForRedTag(),
    type = "progression"
)

achievement(
    "Dead Man Walk Dorm", 
    "Discover the use for a colorful tag and gain access to the Dead Man's Walk Dorm", 
    points = 3,
    trigger = Progression_AccessDeadMansWalkDorm(),
    type = "progression"
)

achievement(
    "Early Psionara",
    "Tempt fate and collect the Psionara without killing the Trimorph found in the Dead Man's Walk Dorm",
    points = 10,
    trigger = Challenge_FindPsionaraEarly()
)

achievement(
    "Geo Lab", 
    "Discover the use for a colorful tag and gain access to the Geo Lab", 
    points = 3,
    trigger = Progression_AccessGeoLab(),
    type = "progression"
)

achievement(
    "Psychic Curse", 
    "Employ your sculpting know-how and break the Psychic Curse afflicting your team", 
    points = 4,
    trigger = Progression_BreakPsychicCurse(),
    type = "progression"
)

achievement(
    "Mai Lin's Room", 
    "Discover the use for a colorful tag and gain access to Mai Lin's Room", 
    points = 3,
    trigger = Progression_AccessMaiLinsRoom(),
    type = "progression"
)

achievement(
    "Diabolus",
    "Find a Diabolus",
    points = 2,
    trigger = Challenge_FindADiabolus()
)

achievement(
    "Bio Lab", 
    "Employ your surgical dexterity and gain access to the Bio Lab", 
    points = 3,
    trigger = Progression_AccessBioLab(),
    type = "progression"
)

achievement(
    "Project Director's Quarters", 
    "Survive a clostrophobic event and gain access to the Project Director's Quarters", 
    points = 4,
    trigger = Progression_AccessProjectDirectorQuarters(),
    type = "progression"
)

achievement(
    "Find Judith Harroway",
    "Discover a lost companion and commit to ending the Martian Virus at any cost",
    points = 2,
    trigger = Challenge_FindJudithHarroway()
)

achievement(
    "Kremlin", 
    "Employ your technical aptitude and gain access to the Kremlin", 
    points = 4,
    trigger = Progression_AccessKremlin(),
    type = "progression"
)

achievement(
    "Kremlin Computer", 
    "Employ the help of a friend and power on the Kremlin Computer", 
    points = 5,
    trigger = Progression_ActivateKremlinComputer(),
    type = "progression"
)

achievement(
    "Flare Gun",
    "Find a Flare Gun",
    points = 2,
    trigger = Challenge_FindAFlareGun()
)

achievement(
    "Psionara",
    "Find a Psionara",
    points = 2,
    trigger = Challenge_FindAPsionara()
)

achievement(
    "Necroplolis Elevator", 
    "Employ your mechanical genius to repair the Vita Base Elevator and gain access to the Necropolis", 
    points = 4,
    trigger = Progression_AccessNecropolis(),
    type = "progression"
)

achievement(
    "Necropolis Generator", 
    "Employ your electrical expertise and repair the Necropolis Arena Generator", 
    points = 4,
    trigger = Progression_RepairNecropolisGenerator(),
    type = "progression"
)

achievement(
    "Portable Computer",
    "Make your life easier and repair a portable computer",
    points = 2,
    trigger = Challenge_FindAPortableComputer()
)

achievement(
    "Charged Chorus", 
    "Use the energy of the Necropolis Obelisk and empower a mysterious artifact", 
    points = 5,
    trigger = Progression_ChargeChorus(),
    type = "progression"
)

achievement(
    "Arkham Tag", 
    "Use the power of the Necropolis Altar and acquire a mysterious tag", 
    points = 5,
    trigger = Progression_AcquireArkhamTag(),
    type = "progression"
)

achievement(
    "Lonely Street Dorm", 
    "Discover the use for a colorless tag and gain access to the Lonely Street Dorm", 
    points = 4,
    trigger = Progression_AccessLonelyStreetDorm(),
    type = "progression"
)

achievement(
    "Lonely Street Dorm Bunk", 
    "Employ your achromatic insight and gain access to the bunk locker in the Lonely Street Dorm ", 
    points = 5,
    trigger = Progression_AccessLonelyStreetDormBunk(),
    type = "progression"
)

achievement(
    "Whittaker's Grave", 
    "Touch Martian soil and discover a haunted grave", 
    points = 4,
    trigger = Progression_AccessWhittakersGrave(),
    type = "progression"
)

achievement(
    "Lonely Street Dorm Puzzle", 
    "Solve a chromatic conundrum in the Lonely Street Dorm", 
    points = 5,
    trigger = Progression_SolveLonelyStreetDormPuzzle(),
    type = "progression"
)

achievement(
    "Ben Gunn's Experiment", 
    "Employ your inner Frankenstein and finish Ben Gunn's experiment", 
    points = 3,
    trigger = Progression_CompleteBenGunnsExperiment(),
    type = "progression"
)

achievement(
    "Blood Samples", 
    "Collect a blood sample from each member of your team", 
    points = 3,
    trigger = Progression_CollectBloodSamples(),
    type = "progression"
)

achievement(
    "Trimorph Sample", 
    "Collect a tissue sample from a Trimorph", 
    points = 3,
    trigger = Progression_CollectTrimorphSample(),
    type = "progression"
)

achievement(
    "Alien Fluid Sample", 
    "Collect a fluid sample from an ancient alien Sovereign", 
    points = 4,
    trigger = Progression_CollectAlienSample(),
    type = "progression"
)

achievement(
    "Cure Virus", 
    "Employ your medical proficiency and cure your team of the deadly Martian Virus", 
    points = 5,
    trigger = Progression_CureTheVirus(),
    type = "progression"
)

achievement(
    "Place Explosive", 
    "Employ your demolitions expertise and condemn the Vita Base to an explosive end", 
    points = 3,
    trigger = Progression_SetVitaBaseExplosive(),
    type = "progression"
)

achievement(
    "Escape Vita Base", 
    "Employ your aeronautical savvy and escape the Vita Base leaving Mars behind", 
    points = 10,
    trigger = Progression_EscapeVitaBase(),
    type = "win_condition"
)

achievement(
    "Save Challenge",
    "Escape the Vita Base using 3 saves or less",
    points = 25,
    trigger = Challenge_EscapeWithSaveLimit()
)

achievement(
    "Time Challenge",
    "Escape the Vita Base in 3 hours or less",
    points = 25,
    trigger = Challenge_EscapeWithTimeLimit(10800)
)

achievement(
    "Martian Mayhem",
    "Go against your better judgement and listen to all Martian Mayhem scenes",
    points = 2,
    trigger = Challenge_ListenToAllMartianMayhemScenes()
)

achievement(
    "All Together Now",
    "Before finding a cure, defy your primary directive and have all 3 characters in the same room, then leave without dying",
    points = 10,
    trigger = Challenge_ThreeCharactersInOneRoom()
)

achievement(
    "Trimorph Exterminator",
    "Kill all Trimorphs stalking the halls of Vita Base",
    points = 5,
    trigger = Challenge_KillAllTrimorphs()
)

achievement(
    "Mars Explorer",
    "Employ your inner cartographer and visit all locations on the Vita Base",
    points = 5,
    trigger = Challenge_VisitAllLocations()
)

// #endregion

// #region Rich Presence Definitions

rich_presence_conditional_display(
    game.state.IsInGame() && map.IsLoaded() && !map.IsOnScreen(screens.EndingEnd), 
    "{0} || 🗺️ {1} || ⏳ {2}",
    rich_presence_lookup("Character", player.id, lookups.characterIds),
    rich_presence_lookup("Location", map.id, lookups.mapIds),
    rich_presence_value("Time", game.timer.GetTimeInSeconds(), "SECS_AS_MINS")
)

rich_presence_conditional_display(
    game.IsLoaded() && game.state.IsInGame() && !map.IsLoaded() && map.IsOnScreen(screens.EndingEnd), 
    "The Enigma Team is catching up on Martian history"
)

rich_presence_conditional_display(
    game.IsLoaded() && game.state.IsInGame() && !map.IsLoaded() && map.IsOnScreen(screens.EndingStart), 
    "The Enigma Team has cured the Martian Virus and is returning to Earth!"
)

rich_presence_conditional_display(
    game.IsLoaded() && game.state.IsOnTitle(), 
    "The Enigma Team is preparing for a voyage to Mars"
)

rich_presence_display("The Enigma Team is launching Martian Gothic: Unification")

// #endregion

// #region Leaderboard Definitions

leaderboard("Enigma Team Speedrun", 
    "Escape the Vita Base as quickly as possible!",
    start = CompletedGame(),
    cancel = always_false(),
    submit = always_true(),
    value = game.timer.GetTimeInSeconds(),
    format = "SECS",
    lower_is_better = true
)

// #endregion