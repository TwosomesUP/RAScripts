// Aleste 2
// #ID = 3287
// Author: BacklogOdyssey
// Retro Achievements - Achievement Script

// Accessors

Game = {
    "Difficulty": byte(0x878),
    "InGame": byte(0x81f),
    "InDemo": bit2(0x810),
    "Area": {
        "Level": byte(0x183f),
        "State": byte(0x8d9),
        "Position": word(0x8a6)
    },
    "Boss": {
        "Count": byte(0x8db),
        "Timer": byte(0x8e1)
    },
    "Scene": {
        "Index": word(0xf80),
        "Text": byte(0x1876)
    },
    "EntityStack": {
        "Count": 24,
        "Size": 0x20,
        "Start": 0x7fe0,
        "Offsets": {
            "Id": 0x00,
            "Hp": 0x14,
            "Type": 0x19
        }
    }
}

Player = {
    "Speed": byte(0x80e),
    "Lives": byte(0x840),
    "Weapons":{
        "Primary": {
            "Power": byte(0x841)
        },
        "Secondary": {
            "Type": byte(0x84a),
            "Ammo": byte(0x84d),
            "Level": byte(0x84f)
        }
    },
    "SpecialItem": byte(0x1600),
    "Options": {
        "Option1": {
            "Id": byte(0x1620),
            "Type": byte(0x163b),
        },
        "Option2": {
            "Id": byte(0x1640),
            "Type": byte(0x165b),
        },
        "Option3": {
            "Id": byte(0x1660),
            "Type": byte(0x167b),
        }
    },
    "PowerChips": byte(0x849),
    "Score": {
        "Score1": ((low4(0x1880) * 10000000) + (high4(0x1880) * 100000000)),
        "Score2": ((low4(0x1881) * 100000) + (high4(0x1881) * 1000000)),
        "Score3": ((low4(0x1882) * 1000) + (high4(0x1882) * 10000)),
        "Score4": ((low4(0x1883) * 10) + (high4(0x1883) * 100)),
    }
}

// Accessor Values

DiskIds = {
    "Disk0": "ALE20",
    "Disk1": "ALE21",
    "Disk2": "ALE22"
}

Difficulties = {
    "Hito": 0x00,
    "Kami": 0x02,
    "Oni": 0x04
}

SpecialItems = {
    "ClearText": 0x02,
    "BlueCreature": 0x18,
    "StarOrb": 0x19
}

Options = {
    "Yellow": 0x1a,
    "Red": 0x1b,
    "Blue": 0x1c,
    "Gray": 0x1d
}

LevelEndings = {
    "Area1": {
        "Position": {
            "Start": 0x3c6,
            "End": 0x3c7
        }
    },
    "Area2": {
        "Position": {
            "Start": 0x405,
            "End": 0x406
        }
    },
    "Area3": {
        "Position": {
            "Start": 0x5f6,
            "End": 0x5f7
        }
    },
    "Area5": {
        "Position": {
            "Start": 0x442,
            "End": 0x443
        }
    },
    "Area6": {
        "Position": {
            "Start": 0x3e7,
            "End": 0x3e8
        }
    },
    "Area7": {
        "Position": {
            "Start": 0x269,
            "End": 0x26a
        }
    },
    "Area8": {
        "Position": {
            "Start": 0x4b8,
            "End": 0x4b9
        }
    }
}

Bosses = {
    "Area1":{
        "Sub": {
            "Position": 0x1c9
        },
        "Main": {
            "Position": 0x33c
        }
    },
    "Area2":{
        "Sub": {
            "Position": 0x2f0
        },
        "Main": {
            "Position": 0x3f8
        }
    },
    "Area3":{
        "Main": {
            "Position": 0x555
        }
    },
    "Area4":{
        "Main": {
            "Position": 0x32f
        }
    },
    "Area5":{
        "Sub": {
            "Position": 0x2c3
        },
        "Main": {
            "Position": 0x3b8
        }
    },
    "Area6":{
        "Main": {
            "Position": 0x2e2
        }
    },
    "Area7":{
        "Main": {
            "Position": 0x230
        }
    },
    "Area8":{
        "Sub": {
            "Position": 0x252
        },
        "Main": {
            "Position": 0x38f
        }
    }
}

// Helpers

function IsDiskLoaded(disk){
    address = 0x00
    diskId = DiskIds["Disk" + disk]
    return ascii_string_equals(address, diskId)
}

function IsInGame(){
    inGame = Game["InGame"]
    inDemo = Game["InDemo"]
    return inGame == 0x01 && inDemo == 0
}

function IsInDemo(){
    inGame = Game["InGame"]
    inDemo = Game["InDemo"]
    return inGame == 0x01 && inDemo == 1
}

function IsInArea(area){
    currentArea = Game["Area"]["Level"]
    return currentArea == area
}

function ClearedArea(area){
    trigger = IsInArea(area)
    currentPosition = Game["Area"]["Position"]
    
    if (area != 4)
    {
        positions = LevelEndings["Area" + area]["Position"]
        start = positions["Start"]
        end = positions["End"]
        trigger = trigger && 
            prev(currentPosition) == start &&
            currentPosition == end
    }
    else
    {
        clearText = SpecialItems["ClearText"]
        specialItem = Player["SpecialItem"]
        bossPosition = Bosses["Area" + area]["Main"]["Position"]
        trigger = trigger &&
            currentPosition == bossPosition &&
            prev(specialItem) == 0x00 &&
            specialItem == clearText
    }
    
    return trigger
}

function CollectedSpecialItem(item){
    specialItem = Player["SpecialItem"]
    value = SpecialItems[item]
    return prev(specialItem) != value &&
        specialItem == value
}

function GetOptionType(index){
    options = Player["Options"]
    type = options["Option" + index]["Type"]
    return type
}

function GetOptionId(index){
    options = Player["Options"]
    id = options["Option" + index]["Id"]
    return id
}

function EquippedOptionColor(option){
    value = Options[option]
    conditions = []
    
    for index in range(1, 3){
        id = GetOptionId(index)
        type = GetOptionType(index)
        condition = type == value && 
            prev(id) == 0x00 &&
            id != 0x00
        array_push(conditions, condition)
    }
    
    trigger = any_of(conditions, condition => condition)
    
    return trigger
}

function EquippedAnyOption(){
    conditions = []
    
    for index in range(1, 3){
        id = GetOptionId(index)
        condition = prev(id) == 0x00 &&
            id != 0x00
        array_push(conditions, condition)
    }
    
    trigger = any_of(conditions, condition => condition)
    
    return trigger
}

function Equipped3Options(){
    id1 = GetOptionId(1)
    id2 = GetOptionId(2)
    id3 = GetOptionId(3)
    trigger = id1 != 0x00 &&
        id2 != 0x00 &&
        id3 != 0x00 &&
        EquippedAnyOption()
        
    return trigger
}

function Equipped3DifferentOptions(){
    id1 = GetOptionId(1)
    id2 = GetOptionId(2)
    id3 = GetOptionId(3)
    trigger = id1 != 0x00 &&
        id2 != 0x00 &&
        id3 != 0x00 &&
        id1 != id2 &&
        id1 != id3 &&
        id2 != id3 &&
        EquippedAnyOption()
        
    return trigger
}

function IsDifficulty(difficulty){
    currentDifficulty = Game["Difficulty"]
    value = Difficulties[difficulty]
    trigger = currentDifficulty >= value
    return trigger
}

function IsFightingBoss(area, sub = false){
    type = "Main"
    
    if (sub)
        type = "Sub"
        
    position = Bosses["Area" + area][type]
    currentArea = Game["Area"]
    currentPosition = Game["Area"]["Position"]
    
    return currentArea == area &&
        currentPosition == position
}

function MaxedPrimaryWeapon(){
    power = Player["Weapons"]["Primary"]["Level"]
    return prev(power) != 0x0f &&
        power == 0x0f
}

function HasSubWeapon(weapon){
    currentWeapon = Player["Weapons"]["Secondary"]["Type"]
    return currentWeapon == weapon
}

function MaxedSubWeapon(weapon){
    level = Player["Weapons"]["Secondary"]["Level"]
    return HasSubWeapon(weapon) &&
        prev(level) != 0x05 &&
        level == 0x05
}

function ReachedLivesCount(count){
    lives = Player["Lives"]
    return prev(lives) < count &&
        lives >= count
}

function ReachedScore(score){
    currentScore = GetScore()
    return prev(currentScore) < score &&
        currentScore >= score
}

function GetEntityAddress(index){
    stack = Game["EntityStack"]
    start = stack["Start"]
    size = stack["Size"]
    offset = index * size
    address = start + offset
    return address
}

function GotPowerChip1Up(){
    chips = Player["PowerChips"]
    lives = Player["Lives"]
    return prev(chips) < 99 &&
        chips == 0 &&
        prev(lives) < lives 
}

function GetEntityOffset(type){
    stack = Game["EntityStack"]
    offsets = stack["Offsets"]
    return offsets[type]
}

function GetEntityId(index){
    idOffset = GetEntityOffset("Id")
    address = GetEntityAddress(index)
    idAddress = address + idOffset
    return byte(idAddress)
}

function GetEntityHp(index){
    hpOffset = GetEntityOffset("Hp")
    address = GetEntityAddress(index)
    hpAddress = address + hpOffset
    return byte(hpAddress)
}

function GetEntityType(index){
    typeOffset = GetEntityOffset("Type")
    address = GetEntityAddress(index)
    typeAddress = address + typeOffset
    return byte(typeAddress)
}

function GetScore(){
    scores = Player["Score"]
    return sum_of(scores, score => scores[score])
}

achievement("Test", "Test", 3, trigger = IsInGame() && IsDiskLoaded(1) && ClearedArea(4))