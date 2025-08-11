// Aleste 2
// #ID = 3287
// Author: BacklogOdyssey
// Retro Achievements - Achievement Script

// Accessors

Game = {
    "Difficulty": byte(0x878),
    "InGame": byte(0x81f),
    "InDemo": bit2(0x810),
    "GameOver": bit3(0x810),
    "Loading": bit4(0x810),
    "Area": {
        "Level": byte(0x183f),
        "State": byte(0x8d9),
        "Position": word(0x8a6)
    },
    "Boss": {
        "State": byte(0x8d8),
        "Count": byte(0x8db),
        "Timer": byte(0x8e1)
    },
    "Scene": {
        "Index": word(0xf80),
        "Text": byte(0x1aff)
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
    "Buttons": {
        "Primary": bit4(0x800),
        "Secondary": bit5(0x800)
    },
    "Weapons":{
        "Primary": {
            "State": byte(0x85b),
            "Power": byte(0x841)
        },
        "Secondary": {
            "Type": byte(0x84a),
            "Ammo": byte(0x84d),
            "Level": byte(0x84f)
        }
    },
    "SpecialItem": byte(0x1600),
    "SpecialItemTrigger": byte(0x7c60),
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

AltDiskIds = {
    "Disk0": "ALESTE20",
    "Disk1": "ALESTE21",
    "Disk2": "ALESTE22"
}

Difficulties = {
    "Hito": 0x00,
    "Kami": 0x02,
    "Oni": 0x04
}

SpecialItems = {
    "ClearText": {
        "Id": 0x02
    },
    "BlueCreature": {
        "Id": 0x18
    },
    "StarOrb": {
        "Id": 0x19,
        "Points": 1000
    }
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
            "Start": 0x388,
            "End": 0x389
        }
    },
    "Area2": {
        "Position": {
            "Start": 0x404,
            "End": 0x405
        }
    },
    "Area3": {
        "Position": {
            "Start": 0x5a8,
            "End": 0x5a9
        }
    },
    "Area5": {
        "Position": {
            "Start": 0x408,
            "End": 0x409
        }
    },
    "Area6": {
        "Position": {
            "Start": 0x393,
            "End": 0x394
        }
    },
    "Area7": {
        "Position": {
            "Start": 0x252,
            "End": 0x253
        }
    },
    "Area8": {
        "Position": {
            "Start": 0x431,
            "End": 0x432
        }
    }
}

Bosses = {
    "Area1":{
        "Sub": {
            "StartTime": 0x64,
            "Position": 0x1c9
        },
        "Main": {
            "StartTime": 0x64,
            "Position": 0x33c
        }
    },
    "Area2":{
        "Sub": {
            "StartTime": 0x78,
            "Position": 0x2f0
        },
        "Main": {
            "StartTime": 0x82,
            "Position": 0x3f8
        }
    },
    "Area3":{
        "Main": {
            "StartTime": 0x78,
            "Position": 0x555
        }
    },
    "Area4":{
        "Main": {
            "StartTime": 0x78,
            "Position": 0x32f
        }
    },
    "Area5":{
        "Sub": {
            "StartTime": 0x64,
            "Position": 0x2c3
        },
        "Main": {
            "StartTime": 0x8c,
            "Position": 0x3b8
        }
    },
    "Area6":{
        "Main": {
            "StartTime": 0x8c,
            "Position": 0x2e2
        }
    },
    "Area7":{
        "Main": {
            "StartTime": 0x78,
            "Position": 0x230
        }
    },
    "Area8":{
        "Sub": {
            "StartTime": 0x46,
            "Position": 0x252
        },
        "Main": {
            "Position": 0x38f
        }
    }
}

Scenes = {
    "Intro": {
        "Start": 0x5f80,
        "End": 0x5f84 
    },
    "Area4Ending": {
        "Start": 0x5618,
        "End": 0x5619
    },
    "Ending": {
        "Start": 0x5005,
        "End": 0x500a
    }
}

// Helpers

function IsDiskLoaded(disk){
    address = 0x00
    altAddress = 0x100
    altAddress2 = 0x03
    
    diskId = DiskIds["Disk" + disk]
    altDiskId = AltDiskIds["Disk" + disk]
    
    trigger = ascii_string_equals(address, diskId)
    
    if (disk == 0)
        trigger = trigger || ascii_string_equals(altAddress, diskId)
    else
        trigger = trigger || ascii_string_equals(altAddress2, altDiskId)
    
    return trigger
}

function IsInArea(area){
    currentArea = Game["Area"]["Level"]
    return currentArea == area
}

function GetOptionId(index){
    options = Player["Options"]
    id = options["Option" + index]["Id"]
    return id
}

function IsFightingBoss(area, sub = false, challenge = false){
    type = "Main"
    
    if (sub)
        type = "Sub"
        
    position = Bosses["Area" + area][type]["Position"]
    currentArea = Game["Area"]["Level"]
    currentPosition = Game["Area"]["Position"]
    
    trigger = currentPosition == position
        
    if (!challenge)
        trigger = currentArea == area &&
            trigger
    
    return trigger
}

function GetScore(){
    scores = Player["Score"]
    return sum_of(scores, score => scores[score])
}

function IsGameDisk(){
    return (IsDiskLoaded(1) || IsDiskLoaded(2))
}

function IsTravelingTo(){
    inGame = Game["InGame"]
    inDemo = Game["InDemo"]
    gameOver = Game["GameOver"]
    loading = Game["Loading"]
    
    return IsGameDisk() &&
        inGame == 0 &&
        inDemo == 0 &&
        gameOver == 0 &&
        loading == 1
}

function IsTravelingFrom(){
    inGame = Game["InGame"]
    inDemo = Game["InDemo"]
    gameOver = Game["GameOver"]
    loading = Game["Loading"]
    
    return IsGameDisk() &&
        inGame == 1 &&
        inDemo == 0 &&
        gameOver == 0 &&
        loading == 1
}

function IsPlaying(){
    inGame = Game["InGame"]
    inDemo = Game["InDemo"]
    gameOver = Game["GameOver"]
    loading = Game["Loading"]
    
    return IsGameDisk() &&
        inGame == 1 &&
        inDemo == 0 &&
        gameOver == 0 &&
        loading == 0
}

function GetArea(){
    return Game["Area"]["Level"]
}

function GetPrimaryLevel(){
    return Player["Weapons"]["Primary"]["Power"]
}

function GetSecondaryType(){
    return Player["Weapons"]["Secondary"]["Type"]
}

function GetSecondaryLevel(){
    return Player["Weapons"]["Secondary"]["Level"] + 1
}

function GetLives(){
    return Player["Lives"]
}

function GetPowerChips(){
    return Player["PowerChips"]
}

// RP Lookups

OptionLookup = {
    0x1a: "🟡",
    0x1b: "🔴",
    0x1c: "🔵",
    0x1d: "⚫"
}

// RP Definitions

rich_presence_conditional_display(IsDiskLoaded(0), "Ellinor is watching the plot unfold!")

rich_presence_conditional_display(IsTravelingTo(), "Ellinor is traveling to Area {0}!",
    rich_presence_value("Area", GetArea())
)

rich_presence_conditional_display(IsTravelingFrom(), "Ellinor has defeated the Vegant in Area {0}! | PRIMARY LEV{1} • ARM{2} LEV{3} | {4} {5} {6} | ❤️ {7} | 🔋 {8} | 🏆 {9}",
    rich_presence_value("Area", GetArea()),
    rich_presence_value("Primary", GetPrimaryLevel()),
    rich_presence_value("Secondary", GetSecondaryType()),
    rich_presence_value("SecondaryLevel", GetSecondaryLevel()),
    rich_presence_lookup("OptionLookup", GetOptionId(1), OptionLookup, "◯"),
    rich_presence_lookup("OptionLookup", GetOptionId(2), OptionLookup, "◯"),
    rich_presence_lookup("OptionLookup", GetOptionId(3), OptionLookup, "◯"),
    rich_presence_value("Lives", GetLives()),
    rich_presence_value("PowerChips", GetPowerChips()),
    rich_presence_value("Score", GetScore(), "SCORE")
)

rich_presence_conditional_display(IsPlaying(), "Ellinor is fighting the Vegant in Area {0} | PRIMARY LEV{1} • ARM{2} LEV{3} | {4} {5} {6} | ❤️ {7} | 🔋 {8} | 🏆 {9}",
    rich_presence_value("Area", GetArea()),
    rich_presence_value("Primary", GetPrimaryLevel()),
    rich_presence_value("Secondary", GetSecondaryType()),
    rich_presence_value("SecondaryLevel", GetSecondaryLevel()),
    rich_presence_lookup("OptionLookup", GetOptionId(1), OptionLookup, "◯"),
    rich_presence_lookup("OptionLookup", GetOptionId(2), OptionLookup, "◯"),
    rich_presence_lookup("OptionLookup", GetOptionId(3), OptionLookup, "◯"),
    rich_presence_value("Lives", GetLives()),
    rich_presence_value("PowerChips", GetPowerChips()),
    rich_presence_value("Score", GetScore(), "SCORE")
)

rich_presence_display("Ellinor is gearing up to fight the Vegant!")
