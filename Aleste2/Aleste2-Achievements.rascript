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
        
    position = Bosses["Area" + area][type]["Position"]
    currentArea = Game["Area"]["Level"]
    currentPosition = Game["Area"]["Position"]
    
    return currentArea == area &&
        currentPosition == position
}

function DefeatedBoss(area, sub = false){
    fightingBoss = IsFightingBoss(area, sub)
    count = Game["Boss"]["Count"]
    return fightingBoss && prev(count) > 0 && count == 0
}

function DefeatedBossWithTimer(area, sub = false){
    fightingBoss = IsFightingBoss(area, sub)
    timer = Game["Boss"]["Timer"]
    return fightingBoss && prev(timer) > 0 && timer == 0
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

function FailedARMChallenge(disk, area){
    return disable_when(IsInArea(area) && !HasSubWeapon(0)) &&
        ResetChallenge(disk, area)
}

function FailedBossChallenge(disk, area, sub = false){
    lives = Player["Lives"]
    return disable_when(IsInArea(area) && IsFightingBoss(area, sub) && prev(lives) > lives) &&
        ResetChallenge(disk, area)
}

function ResetChallenge(disk, area){
    lives = Player["Lives"]
    return (
        always_false() || 
        (
            never(!IsInArea(area)) &&
            never(lives == 0x00) &&
            never(!IsDiskLoaded(disk)) &&
            never(!IsInGame())
        )
    )
}

// Trigger Function

// Area 1

function Area1_HitoClear(){
    return IsDiskLoaded(1) &&
        IsInGame() &&
        IsDifficulty("Hito") &&
        ClearedArea(1)
}

function Area1_OniClear(){
    return IsDiskLoaded(1) &&
        IsInGame() &&
        IsDifficulty("Oni") &&
        ClearedArea(1)
}

function Area1_ARM0Clear(){
    return HasSubWeapon(0) &&
        Area1_HitoClear() &&
        FailedARMChallenge(1, 1)
}

function Area1_SubBossTimerChallenge(){
    return IsDiskLoaded(1) &&
        IsInGame() &&
        IsDifficulty("Hito") &&
        DefeatedBossWithTimer(1, true) &&
        FailedBossChallenge(1, 1, true)
}

function Area1_SubBossDefeatChallenge(){
    return IsDiskLoaded(1) &&
        IsInGame() &&
        IsDifficulty("Hito") &&
        DefeatedBoss(1, true) &&
        FailedBossChallenge(1, 1, true)
}

function Area1_BossTimerChallenge(){
    return IsDiskLoaded(1) &&
        IsInGame() &&
        IsDifficulty("Hito") &&
        DefeatedBossWithTimer(1) &&
        FailedBossChallenge(1, 1)
}

function Area1_BossDefeatChallenge(){
    return IsDiskLoaded(1) &&
        IsInGame() &&
        IsDifficulty("Hito") &&
        DefeatedBoss(1) &&
        FailedBossChallenge(1, 1)
}

// Area 2

function Area2_HitoClear(){
    return always_false()
}

function Area2_OniClear(){
    return always_false()
}

function Area2_ARM0Clear(){
    return always_false()
}

function Area2_SubBossTimerChallenge(){
    return always_false()
}

function Area2_SubBossDefeatChallenge(){
    return always_false()
}

function Area2_BossTimerChallenge(){
    return always_false()
}

function Area2_BossDefeatChallenge(){
    return always_false()
}

// Area 3

function Area3_HitoClear(){
    return always_false()
}

function Area3_OniClear(){
    return always_false()
}

function Area3_ARM0Clear(){
    return always_false()
}

function Area3_BossTimerChallenge(){
    return always_false()
}

function Area3_BossDefeatChallenge(){
    return always_false()
}

// Area 4

function Area4_HitoClear(){
    return always_false()
}

function Area4_OniClear(){
    return always_false()
}

function Area4_ARM0Clear(){
    return always_false()
}

function Area4_BossTimerChallenge(){
    return always_false()
}

function Area4_BossDefeatChallenge(){
    return always_false()
}

function Area4_HiddenStoryText(){
    return always_false()
}

function Area4_HiddenScene(){
    return always_false()
}

// Area 5

function Area5_HitoClear(){
    return always_false()
}

function Area5_OniClear(){
    return always_false()
}

function Area5_ARM0Clear(){
    return always_false()
}

function Area5_SubBossTimerChallenge(){
    return always_false()
}

function Area5_SubBossDefeatChallenge(){
    return always_false()
}

function Area5_BossTimerChallenge(){
    return always_false()
}

function Area5_BossDefeatChallenge(){
    return always_false()
}

// Area 6

function Area6_HitoClear(){
    return always_false()
}

function Area6_OniClear(){
    return always_false()
}

function Area6_ARM0Clear(){
    return always_false()
}

function Area6_BossTimerChallenge(){
    return always_false()
}

function Area6_BossDefeatChallenge(){
    return always_false()
}

// Area 7

function Area7_HitoClear(){
    return always_false()
}

function Area7_OniClear(){
    return always_false()
}

function Area7_ARM0Clear(){
    return always_false()
}

function Area7_BossTimerChallenge(){
    return always_false()
}

function Area7_BossDefeatChallenge(){
    return always_false()
}

// Area 8

function Area8_HitoClear(){
    return always_false()
}

function Area8_OniClear(){
    return always_false()
}

function Area8_ARM0Clear(){
    return always_false()
}

function Area8_SubBossTimerChallenge(){
    return always_false()
}

function Area8_SubBossDefeatChallenge(){
    return always_false()
}

function Area8_BossDefeatChallenge(){
    return always_false()
}

function Area8_HiddenStoryText(){
    return always_false()
}

function Area8_Credits(){
    return always_false()
}

// Other

function Other_MaxPrimary(){
    return always_false()
}

function Other_MaxARM0(){
    return always_false()
}

function Other_MaxARM1(){
    return always_false()
}

function Other_MaxARM2(){
    return always_false()
}

function Other_MaxARM3(){
    return always_false()
}

function Other_MaxARM4(){
    return always_false()
}

function Other_MaxARM5(){
    return always_false()
}

function Other_MaxARM6(){
    return always_false()
}

function Other_RedOption(){
    return always_false()
}

function Other_BlueOption(){
    return always_false()
}

function Other_GrayOption(){
    return always_false()
}

function Other_YellowOption(){
    return always_false()
}

function Other_3Options(){
    return always_false()
}

function Other_3DifferentOptions(){
    return always_false()
}

function Other_BlueCreature(){
    return always_false()
}

function Other_StarOrb(){
    return always_false()
}

function Other_PowerChipExtend(){
    return always_false()
}

function Other_20KExtend(){
    return always_false()
}

function Other_80KExtend(){
    return always_false()
}

function Other_250Thousand(){
    return always_false()
}

function Other_500Thousand(){
    return always_false()
}

function Other_1Million(){
    return always_false()
}

// Achievement Definitions

// Area 1

achievement("Area 1 - Hito Clear", "On Hito difficulty or higher, clear Area 1", points = 3, type = "progression",
    trigger = Area1_HitoClear()
)

achievement("Area 1 - Oni Clear", "On Oni difficulty, clear Area 1", points = 10,
    trigger = Area1_OniClear()
)

achievement("Area 1 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 1 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area1_ARM0Clear()
)

achievement("Area 1 - Sub-Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 1 Sub-Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area1_SubBossTimerChallenge()
)

achievement("Area 1 - Sub-Boss Challenge", "On Hito difficulty or higher, survive the Area 1 Sub-Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area1_SubBossDefeatChallenge()
)

achievement("Area 1 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 1 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area1_BossTimerChallenge()
)

achievement("Area 1 - Boss Challenge", "On Hito difficulty or higher, survive the Area 1 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area1_BossDefeatChallenge()
)


// Area 2

achievement("Area 2 - Hito Clear", "On Hito difficulty or higher, clear Area 2", points = 3, type = "progression",
    trigger = Area2_HitoClear()
)

achievement("Area 2 - Oni Clear", "On Oni difficulty, clear Area 2", points = 10,
    trigger = Area2_OniClear()
)

achievement("Area 2 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 2 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area2_ARM0Clear()
)

achievement("Area 2 - Sub-Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 2 Sub-Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area2_SubBossTimerChallenge()
)

achievement("Area 2 - Sub-Boss Challenge", "On Hito difficulty or higher, survive the Area 2 Sub-Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area2_SubBossDefeatChallenge()
)

achievement("Area 2 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 2 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area2_BossTimerChallenge()
)

achievement("Area 2 - Boss Challenge", "On Hito difficulty or higher, survive the Area 2 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area2_BossDefeatChallenge()
)


// Area 3

achievement("Area 3 - Hito Clear", "On Hito difficulty or higher, clear Area 3", points = 3, type = "progression",
    trigger = Area3_HitoClear()
)

achievement("Area 3 - Oni Clear", "On Oni difficulty, clear Area 3", points = 10,
    trigger = Area3_OniClear()
)

achievement("Area 3 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 3 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area3_ARM0Clear()
)

achievement("Area 3 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 3 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area3_BossTimerChallenge()
)

achievement("Area 3 - Boss Challenge", "On Hito difficulty or higher, survive the Area 3 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area3_BossDefeatChallenge()
)


// Area 4

achievement("Area 4 - Hito Clear", "On Hito difficulty or higher, clear Area 4", points = 3, type = "progression",
    trigger = Area4_HitoClear()
)

achievement("Area 4 - Oni Clear", "On Oni difficulty, clear Area 4", points = 10,
    trigger = Area4_OniClear()
)

achievement("Area 4 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 4 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area4_ARM0Clear()
)

achievement("Area 4 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 4 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area4_BossTimerChallenge()
)

achievement("Area 4 - Boss Challenge", "On Hito difficulty or higher, survive the Area 4 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area4_BossDefeatChallenge()
)

achievement("Area 4 - Hidden Text", "Reveal the hidden story text after clearing Area 4", points = 2,
    trigger = Area4_HiddenStoryText()
)

achievement("Area 4 - Hidden Scene", "Watch the hidden scene to the end after clearing Area 4", points = 2,
    trigger = Area4_HiddenScene()
)


// Area 5

achievement("Area 5 - Hito Clear", "On Hito difficulty or higher, clear Area 5", points = 5, type = "progression",
    trigger = Area5_HitoClear()
)

achievement("Area 5 - Oni Clear", "On Oni difficulty, clear Area 5", points = 10,
    trigger = Area5_OniClear()
)

achievement("Area 5 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 5 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area5_ARM0Clear()
)

achievement("Area 5 - Sub-Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 1 Sub-Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area5_SubBossTimerChallenge()
)

achievement("Area 5 - Sub-Boss Challenge", "On Hito difficulty or higher, survive the Area 1 Sub-Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area5_SubBossDefeatChallenge()
)

achievement("Area 5 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 5 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area5_BossTimerChallenge()
)

achievement("Area 5 - Boss Challenge", "On Hito difficulty or higher, survive the Area 5 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area5_BossDefeatChallenge()
)


// Area 6

achievement("Area 6 - Hito Clear", "On Hito difficulty or higher, clear Area 6", points = 5, type = "progression",
    trigger = Area6_HitoClear()
)

achievement("Area 6 - Oni Clear", "On Oni difficulty, clear Area 6", points = 10,
    trigger = Area6_OniClear()
)

achievement("Area 6 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 6 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area6_ARM0Clear()
)

achievement("Area 6 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 6 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area6_BossTimerChallenge()
)

achievement("Area 6 - Boss Challenge", "On Hito difficulty or higher, survive the Area 6 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area6_BossDefeatChallenge()
)

// Area 7

achievement("Area 7 - Hito Clear", "On Hito difficulty or higher, clear Area 7", points = 5, type = "progression",
    trigger = Area7_HitoClear()
)

achievement("Area 7 - Oni Clear", "On Oni difficulty, clear Area 7", points = 10,
    trigger = Area7_OniClear()
)

achievement("Area 7 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 7 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area7_ARM0Clear()
)

achievement("Area 7 - Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 7 Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area7_BossTimerChallenge()
)

achievement("Area 7 - Boss Challenge", "On Hito difficulty or higher, survive the Area 7 Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area7_BossDefeatChallenge()
)

// Area 8

achievement("Area 8 - Hito Clear", "On Hito difficulty or higher, clear Area 8", points = 10, type = "win_condition",
    trigger = Area8_HitoClear()
)

achievement("Area 8 - Oni Clear", "On Oni difficulty, clear Area 8", points = 25, type = "win_condition",
    trigger = Area8_OniClear()
)

achievement("Area 8 - ARM 0 Clear", "On Hito difficulty or higher, clear Area 8 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5,
    trigger = Area8_ARM0Clear()
)

achievement("Area 8 - Sub-Boss Timer Challenge", "On Hito difficulty or higher, defeat the Area 8 Sub-Boss before the timer runs out, and without losing a life", points = 5,
    trigger = Area8_SubBossTimerChallenge()
)

achievement("Area 8 - Sub-Boss Challenge", "On Hito difficulty or higher, survive the Area 8 Sub-Boss by letting the timer run out, dealing only minimal damage, and without losing a life", points = 5,
    trigger = Area8_SubBossDefeatChallenge()
)

achievement("Area 8 - Boss Challenge", "On Hito difficulty or higher, defeat the Area 8 Boss without losing a life", points = 5,
    trigger = Area8_BossDefeatChallenge()
)

achievement("Area 8 - Hidden Text", "Reveal the hidden story text after clearing Area 8", points = 2,
    trigger = Area8_HiddenStoryText()
)

achievement("Area 8 - Hidden Scene", "Watch the credits scene to the end after clearing Area 8", points = 2,
    trigger = Area8_Credits()
)

// Other

achievement("Max Primary", "Reach maximum power for your Primary Weapon", points = 5,
    trigger = Other_MaxPrimary()
)

achievement("Max ARM0", "Reach maximum power for ARM Type 0: Super-Rapid", points = 5,
    trigger = Other_MaxARM0()
)

achievement("Max ARM1", "Reach maximum power for ARM Type 1: Destroy-Cutter", points = 5,
    trigger = Other_MaxARM1()
)

achievement("Max ARM2", "Reach maximum power for ARM Type 2: Super-Energy", points = 5,
    trigger = Other_MaxARM2()
)

achievement("Max ARM3", "Reach maximum power for ARM Type 3: Lazer-Beam", points = 5,
    trigger = Other_MaxARM3()
)

achievement("Max ARM4", "Reach maximum power for ARM Type 4: Homing-Energy", points = 5,
    trigger = Other_MaxARM4()
)

achievement("Max ARM5", "Reach maximum power for ARM Type 5: Separate", points = 5,
    trigger = Other_MaxARM5()
)

achievement("Max ARM6", "Reach maximum power for ARM Type 6: Drop-Down", points = 5,
    trigger = Other_MaxARM6()
)

achievement("Red Shield", "Collect a Red Shield Option for the first time", points = 3,
    trigger = Other_RedOption()
)

achievement("Blue Shield", "Collect a Blue Shield Option for the first time", points = 3,
    trigger = Other_BlueOption()
)

achievement("Gray Shield", "Collect a Gray Shield Option for the first time", points = 3,
    trigger = Other_GrayOption()
)

achievement("Yellow Shield", "Collect a Yellow Shield Option for the first time", points = 3,
    trigger = Other_YellowOption()
)

achievement("Three Options", "Have 3 Shield Options at once", points = 5,
    trigger = Other_3Options()
)

achievement("Three Different Options", "Have 3 Shield Options of different colors at once", points = 10,
    trigger = Other_3DifferentOptions()
)

achievement("Blue Creature", "Collect a strange blue friend and max out all of your weapons at once", points = 3,
    trigger = Other_BlueCreature()
)

achievement("Star Orb", "Collect a Star Orb and destroy all enemies on screen", points = 3,
    trigger = Other_StarOrb()
)

achievement("Power Chip Extend", "Extend your lives by 1 by collecting 100 Power Chips", points = 5,
    trigger = Other_PowerChipExtend()
)

achievement("20K Extend", "Extend your lives by 1 by scoring 20 thousand points or more", points = 3,
    trigger = Other_20KExtend()
)

achievement("80K Extend", "Extend your lives by 1 by scoring 80 thousand points or more", points = 5,
    trigger = Other_80KExtend()
)

achievement("250K Points", "Reach a score of 250 thousand points or more before beating the final boss in Area 8", points = 3,
    trigger = Other_250Thousand()
)

achievement("500K Points", "Reach a score of 500 thousand points or more before beating the final boss in Area 8", points = 5,
    trigger = Other_500Thousand()
)

achievement("1M Points", "Reach a score of 1 million points or more before beating the final boss in Area 8", points = 10,
    trigger = Other_1Million()
)

