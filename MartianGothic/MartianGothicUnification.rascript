// Martian Gothic: Unification
// #ID = 16570
// BacklogOddy
// Rich Presence Achievement Script

// Classes

class Player {
    character = byte(0x10ccae)
}

class Event {
    flag = 0
    function Triggered() => prev(this.flag) < this.flag
}

class Door {
    flag = 0
    function Unlocked() => prev(this.flag) < this.flag
}

class Locations {
    MadisonDecontamination = 0x43
    MadisonAvenue1 = 0x05
}

function ProcessLocation(address)
{
    
    if (!array_contains(excluded, address))
        return byte(address)
}

class Map {
    id = word(0x10b5d4)
    screen = word(0x10b5d6)
    
    locations = Locations()
    
    function Transition(from, to){
        return prev(this.id) == from && this.id == to
    }
    
    function VisitedAllLocations(){
        count = 120
        baseAddress = 0x10b73d
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

class Events {
    
}

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
        
        remainingSaves = this.AirRecycling +
            this.PowerCore +
            this.GeoLab +
            this.ChemLab +
            this.MedLab +
            this.MaiLin +
            this.BaseDirector + 
            this.BioLab +
            this.Study +
            this.Kremlin +
            this.ProjectDirector +
            this.PalmTop
            
        return maxSaves - remainingSaves
    }
}

class GameState {
    title = byte(0x1033b8)
    saves = Saves()
    function IsInGame() => this.title == 0
    function IsOnTitle() => this.title == 1
}

class Game {
    state = GameState()
    player = Player()
    map = Map()
    inventory = Inventory()
    storage = Storage()
    timer = Timer()
}

// Globals

game = Game()

// Achievement Functions

function ArriveInVitaBase(){
    from = game.map.locations.MadisonDecontamination
    to = game.map.locations.MadisonAvenue1

    return game.state.IsInGame() &&
        game.map.Transition(from, to)
}

function VisitAllLocations(){
    return game.state.IsInGame() &&
        game.map.VisitedAllLocations()
}

// Achievements Definitions

achievement(
    "Vita Base", 
    "Radio your team and head into the Vita Base", 
    points = 2,
    trigger = ArriveInVitaBase()
)

achievement(
    "Mars Explorer",
    "Visit all locations on the Vita Base",
    points = 5,
    trigger = VisitAllLocations()
)



