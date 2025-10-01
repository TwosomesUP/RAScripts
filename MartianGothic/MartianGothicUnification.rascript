// Martian Gothic: Unification
// #ID = 16570
// BacklogOddy
// Rich Presence Achievement Script

// #region Player Classes

class Character {
    id = 0
    health = 0
    room = 0
}

class Characters {
    Karne = Character(0, word(0x10f624), byte(0x10f62d))
    Kenzo = Character(1, word(0x10f72c), byte(0x10f735))
    Matlock = Character(2, word(0x10f834), byte(0x10f83d))
}

class Player {
    id = byte(0x10ccae)
    characters = Characters()
}

player = Player()

// #endregion

// #region Map Classes

class Map {
    id = word(0x10b5d4)
    screen = word(0x10b5d6)
    
    function Transition(from, to){
        transitioned = prev(this.id) == from.id && this.id == to.id
        return transitioned
    }

    function IsInRoom(location){
        return this.id == location.id
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
    InocashiraDouri2 = Location(0x32, byte(0x10b76e))
    Arboretum1 = Location(0x2f, byte(0x10b76b))
    ParkLane2 = Location(0x30, byte(0x10b76c))
    ChemLab = Location(0x3f, byte(0x10b77b))
    MedLab = Location(0x08, byte(0x10b744))
    PiccadillyCircus = Location(0x18, byte(0x10b754))
    CarnabyStreet = Location(0x19, byte(0x10b755))
    AirRecycling = Location(0x4f, byte(0x10b78b))
    MOODAntiChamber = Location(0x01, byte(0x10b73d))
    PowerCore = Location(0x1e, byte(0x10b75a))
    TimeSquare1 = Location(0x16, byte(0x10b752))
    Washroom = Location(0x47, byte(0x10b783))
    SimurealChamber = Location(0x59, byte(0x10b795))
    SunsetBoulevard = Location(0x2d, byte(0x10b769))
}

locations = Locations()

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
}

class Doors {
    BaseDirectorQuarters = Door(locations.BoulevardStMichel2, byte(0x10cc74))
    Arboretum = Door(locations.ParkLane2, bit2(0x10b67d))
    ChemLab = Door(locations.PiccadillyCircus, byte(0x10cc62))
    MedLab = Door(locations.CarnabyStreet, bit0(0x10b69a))
    Washroom = Door(locations.SunsetBoulevard, byte(0x10cc99))
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

        if (checkRoom)
            triggered = roomCheck && triggered

        return prev(this.status) != 0xffff && this.status == 0xffff && triggered
    }
}

class DialogList {
    KarneTimeStops = DialogEntry(locations.InocashiraDouri2, 0x801871cc, 0x801871fe)
}

dialog = DialogList()

// #endregion

// #region Inventory Classes

class InventoryOffsets {
    name = 0x8
    count = 0x10
}

class Inventory {
    type = byte(0x1365b8)
    state = byte(0x1365dc)
    index = byte(0x1365b9)
    items = byte(0x1365ab)

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
}

inventory = Inventory()
    
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
        index = game.inventory.index
        if (prevIndex)
            index = prev(index)
    
        slotAddress = this.objectBase + (index * game.inventory.slotSize)
        itemAddress = slotAddress + game.inventory.offsets.name
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
    
    function CollectedItem(id){
        return this.IsOpen() && game.inventory.IsOpen() && 
            prev(this.GetSelectedItem()) == id && 
            this.GetSelectedItem() != id &&
            prev(game.inventory.items) < game.inventory.items
    }
}

storage = Storage() 

// #endregion

// #region Event Classes

class Event {
    location = 0
    flag = 0

    function IsTriggered(){
        return this.flag != 0
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

    function EventSetTriggered(eventArray){
        triggered = sum_of(eventArray, event => event.flag)
        return prev(triggered) < length(eventArray) && measured(triggered >= length(eventArray), triggered - prev(triggered) == 1)
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
        count = 14

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
}

game = Game()

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
    return always_false()
}

function Progression_AccessWallStreetDorm(){
    return always_false()
}

function Progression_TrapShuttleBayTrimorph(){
    return always_false()
}

function Progression_AccessShuttleBay(){
    return always_false()
}

function Progression_AccessKitchen(){
    return always_false()
}

function Progression_AccessMadisonAvenueDorm(){
    return always_false()
}

function Progression_TradeForRedTag(){
    return always_false()
}

function Progression_AccessDeadMansWalkDorm(){
    return always_false()
}

function Progression_AccessGeoLab(){
    return always_false()
}

function Progression_BreakPsychicCurse(){
    return always_false()
}

function Progression_AccessMaiLinsRoom(){
    return always_false()
}

function Progression_AccessBioLab(){
    return always_false()
}

function Progression_AccessProjectDirectorQuarters(){
    return always_false()
}

function Progression_AccessKremlin(){
    return always_false()
}

function Progression_ActivateKremlinComputer(){
    return always_false()
}

function Progression_AccessCarnabyStreetAirlock(){
    return always_false()
}

function Progression_AccessNecropolis(){
    return always_false()
}

function Progression_RepairNecropolisGenerator(){
    return always_false()
}

function Progression_ChargeChorus(){
    return always_false()
}

function Progression_AcquireArkhamTag(){
    return always_false()
}

function Progression_AccessLonelyStreetDorm(){
    return always_false()
}

function Progression_AccessLonelyStreetDormBunk(){
    return always_false()
}

function Progression_AccessWhittakersGrave(){
    return always_false()
}

function Progression_SolveLonelyStreetDormPuzzle(){
    return always_false()
}

function Progression_CompleteBenGunnsExperiment(){
    return always_false()
}

function Progression_CollectBloodSamples(){
    return always_false()
}

function Progression_CollectTrimorphSample(){
    return always_false()
}

function Progression_CollectAlienSample(){
    return always_false()
}

function Progression_CureTheVirus(){
    return always_false()
}

function Progression_SetVitaBaseExplosive(){
    return always_false()
}

function Progression_EscapeVitaBase(){
    return always_false()
}

// #endregion

// #region Challenge Achievement Functions

// Escape with a limited number of saves
function Challenge_EscapeWithSaveLimit(limit = 3){
    return always_false()
}

// Escape within a time limit (in seconds)
function Challenge_EscapeWithTimeLimit(limit = 18000){
    return always_false()
}

function Challenge_FindABenGunnNote(){
    return always_false()
}

function Challenge_ListenToAllMartianMayhemScenes(){
    return always_false()
}

function Challenge_ListToAllJudithHarrowayReports(){
    return always_false()
}

function Challenge_FindPsionaraEarly(){
    return always_false()
}

function Challenge_KillAllTrimorphs(){
    return always_false()
}

function Challenge_ListenToAllBenGunnAdvice(){
    return always_false()
}

function Challenge_ListenToAllMOODAdvice(){
    return always_false()
}

function Challenge_FindAPortableComputer(){
    return always_false()
}

function Challenge_ThreeCharactersInOneRoom(){
    return always_false()
}

function Challenge_FindAPicollo(){
    return always_false()
}

function Challenge_FindANailGun(){
    return always_false()
}

function Challenge_FindADillinger(){
    return always_false()
}

function Challenge_FindAPsionara(){
    return always_false()
}

function Challenge_FindADiabolus(){
    return always_false()
}

function Challenge_FindAFlareGun(){
    return always_false()
}

function Challenge_VisitAllLocations(){
    return game.state.IsInGame() &&
        map.VisitedAllLocations()
}

// #endregion

// #region Progression Achievements

achievement(
    "Vita Base", 
    "Radio your team and head into the Vita Base", 
    points = 2,
    trigger = Progression_ArriveInVitaBase(),
    type = "progression"
)

achievement(
    "Base Director's Quarters", 
    "Access the Base Director's Quarters", 
    points = 2,
    trigger = Progression_AccessBaseDirectorQuarters(),
    type = "progression"
)

achievement(
    "Free Karne", 
    "Use the Base Director's Computer and free Karne from the Inocashira Douri Airlock", 
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
    "Arboretum", 
    "Access the Arboretum", 
    points = 2,
    trigger = Progression_AccessArboretum(),
    type = "progression"
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
    "Access the Chem Lab", 
    points = 2,
    trigger = Progression_AccessChemLab(),
    type = "progression"
)

achievement(
    "Med Lab", 
    "Access the Med Lab", 
    points = 2,
    trigger = Progression_AccessMedLab(),
    type = "progression"
)

achievement(
    "Air Recycling", 
    "Repair and restart the Vita Base Air Recycling system", 
    points = 4,
    trigger = Progression_RestartAirRecycling(),
    type = "progression"
)

achievement(
    "Repair Breach", 
    "Repair a breach in the Vita Base Hull", 
    points = 4,
    trigger = Progression_RepairBreach(),
    type = "progression"
)

achievement(
    "Power Core", 
    "Access the Vita Base Power Core", 
    points = 2,
    trigger = Progression_AccessPowerCore(),
    type = "progression"
)

achievement(
    "Jamison's Hand", 
    "Get a hand from Jamison", 
    points = 2,
    trigger = Progression_CollectJamisonHand(),
    type = "progression"
)

achievement(
    "Restore Power", 
    "Restore power to the Vita Base", 
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
    "Release the Vita Base Emergency Bulkheads", 
    points = 2,
    trigger = Progression_ReleaseVitaBaseBulkheads(),
    type = "progression"
)

achievement(
    "Wall Street Dorm", 
    "Access the Wall Street Dorm", 
    points = 3,
    trigger = Progression_AccessWallStreetDorm(),
    type = "progression"
)

achievement(
    "Shuttle Bay Trimorph", 
    "Trap the Trimorph that's stalking the Shuttle Bay", 
    points = 4,
    trigger = Progression_TrapShuttleBayTrimorph(),
    type = "progression"
)

achievement(
    "Shuttle Bay", 
    "Access the Shuttle Bay", 
    points = 3,
    trigger = Progression_AccessShuttleBay(),
    type = "progression"
)

achievement(
    "Kitchen", 
    "Hack your way through to the Kitchen", 
    points = 3,
    trigger = Progression_AccessKitchen(),
    type = "progression"
)

achievement(
    "Madison Avenue Dorm", 
    "Access the Madison Avenue Dorm", 
    points = 3,
    trigger = Progression_AccessMadisonAvenueDorm(),
    type = "progression"
)

achievement(
    "Red Tag", 
    "Trade with Ben Gunn for a Red Tag", 
    points = 4,
    trigger = Progression_TradeForRedTag(),
    type = "progression"
)

achievement(
    "Dead Man Walk Dorm", 
    "Access the Dead Man's Walk Dorm", 
    points = 3,
    trigger = Progression_AccessDeadMansWalkDorm(),
    type = "progression"
)

achievement(
    "Geo Lab", 
    "Access the Geo Lab", 
    points = 3,
    trigger = Progression_AccessGeoLab(),
    type = "progression"
)

achievement(
    "Psychic Curse", 
    "Break the Psychic Curse inflicted upon your team", 
    points = 4,
    trigger = Progression_BreakPsychicCurse(),
    type = "progression"
)

achievement(
    "Mai Lin's Room", 
    "Access Mai Lin's Room", 
    points = 3,
    trigger = Progression_AccessMaiLinsRoom(),
    type = "progression"
)

achievement(
    "Bio Lab", 
    "Access the Bio Lab", 
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
    "Kremlin", 
    "Access the Kremlin", 
    points = 4,
    trigger = Progression_AccessKremlin(),
    type = "progression"
)

achievement(
    "Kremlin Computer", 
    "Work as a team and power on the Kremlin Computer", 
    points = 5,
    trigger = Progression_ActivateKremlinComputer(),
    type = "progression"
)

achievement(
    "Carnaby Street Airlock", 
    "Access the Carnaby Street Airlock", 
    points = 4,
    trigger = Progression_AccessCarnabyStreetAirlock(),
    type = "progression"
)

achievement(
    "Necroplolis Elevator", 
    "Repair the Vita Base Elevator and gain access to the Necropolis", 
    points = 4,
    trigger = Progression_AccessNecropolis(),
    type = "progression"
)

achievement(
    "Necropolis Generator", 
    "Repair the Necropolis Arena Generator", 
    points = 4,
    trigger = Progression_RepairNecropolisGenerator(),
    type = "progression"
)

achievement(
    "Charged Chorus", 
    "Use the power of the Necropolis Obelisk and charge the Chorus", 
    points = 5,
    trigger = Progression_ChargeChorus(),
    type = "progression"
)

achievement(
    "Arkham Tag", 
    "Use the power of the Necropolis Altar and acquire the Arkham Tag", 
    points = 5,
    trigger = Progression_AcquireArkhamTag(),
    type = "progression"
)

achievement(
    "Lonely Street Dorm", 
    "Access the Lonely Street Dorm", 
    points = 4,
    trigger = Progression_AccessLonelyStreetDorm(),
    type = "progression"
)

achievement(
    "Lonely Street Dorm Bunk", 
    "Gain access to the locked bunk in the Lonely Street Dorm", 
    points = 5,
    trigger = Progression_AccessLonelyStreetDormBunk(),
    type = "progression"
)

achievement(
    "Whittaker's Grave", 
    "Find Whittaker's Grave", 
    points = 4,
    trigger = Progression_AccessWhittakersGrave(),
    type = "progression"
)

achievement(
    "Lonely Street Dorm Puzzle", 
    "Solve a colorless conundrum in the Lonely Street Dorm", 
    points = 5,
    trigger = Progression_SolveLonelyStreetDormPuzzle(),
    type = "progression"
)

achievement(
    "Ben Gunn's Experiment", 
    "Finish Ben Gunn's Experiment", 
    points = 3,
    trigger = Progression_CompleteBenGunnsExperiment(),
    type = "progression"
)

achievement(
    "Blood Samples", 
    "Collect a sample from each of your team", 
    points = 3,
    trigger = Progression_CollectBloodSamples(),
    type = "progression"
)

achievement(
    "Trimorph Sample", 
    "Collect a sample from a Trimorph", 
    points = 3,
    trigger = Progression_CollectTrimorphSample(),
    type = "progression"
)

achievement(
    "Alien Fluid Sample", 
    "Collect a sample from an the ancient alien Sovereign", 
    points = 4,
    trigger = Progression_CollectAlienSample(),
    type = "progression"
)

achievement(
    "Cure Virus", 
    "Cure your team of the deadly Martian Virus", 
    points = 5,
    trigger = Progression_CureTheVirus(),
    type = "progression"
)

achievement(
    "Place Explosive", 
    "Condemn the Vita Base to an explosive end", 
    points = 3,
    trigger = Progression_SetVitaBaseExplosive(),
    type = "progression"
)

achievement(
    "Escape Vita Base", 
    "Escape Vita Base", 
    points = 10,
    trigger = Progression_EscapeVitaBase(),
    type = "progression"
)

// #endregion

// #region Challenge Achievements

achievement(
    "Save Challenge",
    "Beat the game using 3 saves or less",
    points = 25,
    trigger = Challenge_EscapeWithSaveLimit()
)

achievement(
    "Time Challenge",
    "Beat the game in 5 hours or less",
    points = 25,
    trigger = Challenge_EscapeWithTimeLimit()
)

achievement(
    "Ben Gunn's Notes",
    "Find a Ben Gunn note",
    points = 2,
    trigger = Challenge_FindABenGunnNote()
)

achievement(
    "Martian Mayhem",
    "Listen to all Martian Mayhem scenes",
    points = 2,
    trigger = Challenge_ListenToAllMartianMayhemScenes()
)

achievement(
    "Judith Harroway",
    "Listen to all of Judith Harroway's Reports/Journals",
    points = 4,
    trigger = Challenge_ListToAllJudithHarrowayReports()
)

achievement(
    "Early Psionara",
    "Collect the Psionara without killing the Trimorph found in the Dead Man's Walk Dorm",
    points = 10,
    trigger = Challenge_FindPsionaraEarly()
)

achievement(
    "Trimorph Exterminator",
    "Kill all Trimorphs stalking the halls of Vita Base",
    points = 5,
    trigger = Challenge_KillAllTrimorphs()
)

achievement(
    "Ben Gunn's Advice",
    "Learn all you can from Ben Gunn",
    points = 4,
    trigger = Challenge_ListenToAllBenGunnAdvice()
)

achievement(
    "MOOD's Advice",
    "Learn all you can from MOOD",
    points = 4,
    trigger = Challenge_ListenToAllMOODAdvice()
)

achievement(
    "Portable Computer",
    "Find and repair a portable computer",
    points = 2,
    trigger = Challenge_FindAPortableComputer()
)

achievement(
    "All Together Now",
    "Before finding a cure, have all 3 characters in the same room",
    points = 10,
    trigger = Challenge_ThreeCharactersInOneRoom()
)

achievement(
    "Piccolo",
    "Find a Piccolo",
    points = 2,
    trigger = Challenge_FindAPicollo()
)

achievement(
    "Nail Gun",
    "Find a Nail Gun",
    points = 2,
    trigger = Challenge_FindANailGun()
)

achievement(
    "Dillinger",
    "Find a Dillinger",
    points = 2,
    trigger = Challenge_FindADillinger()
)

achievement(
    "Psionara",
    "Find a Psionara",
    points = 2,
    trigger = Challenge_FindAPsionara()
)

achievement(
    "Diabolus",
    "Find a Diabolus",
    points = 2,
    trigger = Challenge_FindADiabolus()
)

achievement(
    "Flare Gun",
    "Find a Flare Gun",
    points = 2,
    trigger = Challenge_FindAFlareGun()
)

achievement(
    "Mars Explorer",
    "Visit all locations on the Vita Base",
    points = 5,
    trigger = Challenge_VisitAllLocations()
)

// #endregion