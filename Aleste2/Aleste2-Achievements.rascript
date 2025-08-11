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
    "Continued": bit4(0x810),
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
    diskId = DiskIds["Disk" + disk]
    
    trigger = ascii_string_equals(address, diskId)
    
    if (disk == 0)
        trigger = trigger || ascii_string_equals(altAddress, diskId)
    
    return trigger
}

function IsInGame(){
    inGame = Game["InGame"]
    inDemo = Game["InDemo"]
    gameOver = Game["GameOver"]
    
    flags = inDemo + gameOver
    
    trigger = inGame == 0x01 && flags == 0
    
    return trigger
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

function ClearedArea(area, challenge = false){
    areaCheck = IsInArea(area)
    currentPosition = Game["Area"]["Position"]
    
    if (area != 4)
    {
        positions = LevelEndings["Area" + area]["Position"]
        start = positions["Start"]
        end = positions["End"]
        clearCheck = prev(currentPosition) == start &&
            currentPosition == end
    }
    else
    {
        clearText = SpecialItems["ClearText"]["Id"]
        specialItem = Player["SpecialItem"]
        bossPosition = Bosses["Area" + area]["Main"]["Position"]
        clearCheck = currentPosition == bossPosition &&
            prev(specialItem) == 0x00 &&
            specialItem == clearText
    }
    
    trigger = clearCheck
    
    if (!challenge)
        trigger = areaCheck && clearCheck
    else
        trigger = trigger
    
    return trigger
}

function CollectedSpecialItem(item){
    specialItem = Player["SpecialItem"]
    value = SpecialItems[item]["Id"]
    return prev(specialItem) == value &&
        specialItem == 0x00
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
        condition = id != 0x00 && 
            prev(type) != value &&
            type == value
        array_push(conditions, condition)
    }
    
    trigger = any_of(conditions, condition => condition)
    
    return trigger
}

function EquippedAnyOption(){
    conditions = []
    
    for index in range(1, 3){
        type = GetOptionType(index)
        condition = prev(type) == 0xff &&
            (type == 0x1a || type == 0x1b || type == 0x1c || type == 0x1d)
        array_push(conditions, condition)
    }
    
    trigger = any_of(conditions, condition => condition)
    
    return trigger
}

function Equipped3Options(){
    type1 = GetOptionType(1)
    type2 = GetOptionType(2)
    type3 = GetOptionType(3)
    trigger = type1 != 0xff &&
        type2 != 0xff &&
        type3 != 0xff &&
        EquippedAnyOption()
        
    return trigger
}

function Equipped3DifferentOptions(){
    type1 = GetOptionType(1)
    type2 = GetOptionType(2)
    type3 = GetOptionType(3)
    trigger = type1 != 0xff &&
        type2 != 0xff &&
        type3 != 0xff &&
        type1 != type2 &&
        type1 != type3 &&
        type2 != type3 &&
        EquippedAnyOption()
        
    return trigger
}

function IsDifficulty(difficulty){
    currentDifficulty = Game["Difficulty"]
    value = Difficulties[difficulty]
    trigger = currentDifficulty >= value
    return trigger
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

function DefeatedBoss(area, sub = false, challenge = false){
    fightingBoss = IsFightingBoss(area, sub, challenge)
    count = Game["Boss"]["Count"]
    timer = Game["Boss"]["Timer"]
    
    addTimer = true
    
    if (area == 8 && !sub)
        addTimer = false
        
    trigger = fightingBoss && 
        trigger_when(prev(count) > 0 && 
        count == 0)
        
    if (addTimer)
        trigger = trigger &&
            timer > 0
    
    return trigger
}

function DefeatedBossWithTimer(area, sub = false, challenge = false){
    fightingBoss = IsFightingBoss(area, sub, challenge)
    timer = Game["Boss"]["Timer"]
    return fightingBoss && 
        trigger_when(prev(timer) > 0 && timer == 0)
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
    return prev(chips) >= 97 &&
        chips <= 10 &&
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

function PlayerFiredPrimaryShot(){
    state = Player["Weapons"]["Primary"]["State"]
    return state > 1 && state <= 6
}

function PlayerFiredSecondaryShot(){
    ammo = Player["Weapons"]["Secondary"]["Ammo"]
    type = Player["Weapons"]["Secondary"]["Type"]
    return prev(type) == type && prev(ammo) > ammo
}

function FailedARMChallenge(disk, area){
    return disable_when(IsInGame() && IsInArea(area) && !HasSubWeapon(0)) &&
        ResetChallenge(disk, area)
}

function FailedBossDefeatChallenge(disk, area, sub = false){
    lives = Player["Lives"]
    return disable_when(IsInGame() && IsInArea(area) && IsFightingBoss(area, sub) && prev(lives) > lives) &&        
        ResetChallenge(disk, area)
}

function FailedBossTimerChallenge(disk, area, sub = false){
    type = "Main"
    if (sub)
        type = "Sub"

    timer = Game["Boss"]["Timer"]
    timerStart = Bosses["Area" + area][type]["StartTime"]
    timerLimit = timerStart - 3
    
    return disable_when(repeated(3, IsInGame() && IsInArea(area) && IsFightingBoss(area, sub) && timer < timerLimit && PlayerFiredPrimaryShot())) &&
        disable_when(IsInGame() && IsInArea(area) && IsFightingBoss(area, sub) && timer < timerLimit && PlayerFiredSecondaryShot()) &&
        ResetChallenge(disk, area)
}

function ResetChallenge(disk, area){
    lives = Player["Lives"]
    return (
        always_false() || 
        (
            never(!IsInArea(area)) &&
            never(!IsDiskLoaded(disk)) &&
            never(!IsInGame())
        )
    )
}

// Trigger Helpers

function AchievedAreaClear(difficulty, disk, area){
    return IsDiskLoaded(disk) &&
        IsInGame() &&
        IsDifficulty(difficulty) &&
        ClearedArea(area)
}

function AchievedAreaARMChallenge(disk, area){
    return trigger_when(HasSubWeapon(0) &&
        IsDifficulty("Hito") &&
        ClearedArea(area, true)) &&
        FailedARMChallenge(disk, area)
}

function AchievedBossTimerChallenge(disk, area, sub = false){
    return IsDifficulty("Hito") &&
        DefeatedBossWithTimer(area, sub, true) &&
        FailedBossTimerChallenge(disk, area, sub)
}

function AchievedBossChallenge(disk, area, sub = false){
    return IsDifficulty("Hito") &&
        DefeatedBoss(area, sub, true) &&
        FailedBossDefeatChallenge(disk, area, sub)
}

function TriggeredScene(disk, area, scene){
    sceneIndex = Game["Scene"]["Index"]
    start = Scenes[scene]["Start"]
    end = Scenes[scene]["End"]
    
    return IsDiskLoaded(disk) &&
        IsInArea(area) &&
        prev(sceneIndex) == start &&
        sceneIndex == end
}

function TriggeredText(disk, area, trueEnding = false){
    text = Game["Scene"]["Text"]
    
    trigger = IsDiskLoaded(disk) &&
        IsInArea(area)
        
    if (trueEnding)
            trigger = trigger && IsDifficulty("Oni")
    
    return trigger && prev(text) == 0x48 && text == 0x4a
}

function AchievedMaxSubWeapon(weapon){
    return IsInGame() &&
        MaxedSubWeapon(weapon)
}

function AchievedOption(option){
    return IsInGame() &&
        EquippedOptionColor(option)
}

function Achieved3Options(){
    return IsInGame() &&
        Equipped3Options()
}

function Achieved3DifferentOptions(){
    return IsInGame() &&
       Equipped3DifferentOptions() 
}

function AchievedSpecialItem(type){
    trigger = IsInGame()
    primaryPower = Player["Weapons"]["Primary"]["Power"]
    secondaryPower = Player["Weapons"]["Secondary"]["Level"]
    specialTrigger = Player["SpecialItemTrigger"]
    
    if (type == "BlueCreature")
        trigger = trigger &&
            ((prev(primaryPower) != 0xf &&
            primaryPower == 0xf) ||
            (prev(secondaryPower) != 0x5 &&
            secondaryPower == 0x5))
            
    if (type == "StarOrb")
        trigger = trigger &&
            specialTrigger == 0x19
            
    return trigger &&
        CollectedSpecialItem(type)
}

function AchievedPowerChipExtend(){
    return IsInGame() &&
        GotPowerChip1Up()
}

function AchievedScore(score, beforeEnd = false){
    bossCount = Game["Boss"]["Count"]

    trigger = IsInGame() && ReachedScore(score)
    
    disabled = IsDiskLoaded(2) &&
        IsFightingBoss(8) &&
        prev(bossCount) > 0 &&
        bossCount == 0
    
    reset = !IsInArea(8) && 
        !IsInGame()  
    
    if (beforeEnd)
        trigger = trigger && disable_when(disabled, reset)
        
    return trigger
}

function AchievedLivesCount(count){
    lives = Player["Lives"]
    return IsInGame() &&
        prev(lives) < count &&
        lives >= count
}

// Trigger Function

// Area 1

function Intro_Cutscene(){
    return TriggeredScene(0, 1, "Intro")
}

function Area1_HitoClear(){
    return AchievedAreaClear("Hito", 1, 1)
}

function Area1_OniClear(){
    return AchievedAreaClear("Oni", 1, 1)
}

function Area1_ARM0Clear(){
    return AchievedAreaARMChallenge(1, 1)
}

function Area1_SubBossTimerChallenge(){
    return AchievedBossTimerChallenge(1, 1, true)
}

function Area1_SubBossDefeatChallenge(){
    return AchievedBossChallenge(1, 1, true)
}

function Area1_BossTimerChallenge(){
    return AchievedBossTimerChallenge(1, 1)
}

function Area1_BossDefeatChallenge(){
    return AchievedBossChallenge(1, 1)
}

// Area 2

function Area2_HitoClear(){
    return AchievedAreaClear("Hito", 1, 2)
}

function Area2_OniClear(){
    return AchievedAreaClear("Oni", 1, 2)
}

function Area2_ARM0Clear(){
    return AchievedAreaARMChallenge(1, 2)
}

function Area2_SubBossTimerChallenge(){
    return AchievedBossTimerChallenge(1, 2, true)
}

function Area2_SubBossDefeatChallenge(){
    return AchievedBossChallenge(1, 2, true)
}

function Area2_BossTimerChallenge(){
    return AchievedBossTimerChallenge(1, 2)
}

function Area2_BossDefeatChallenge(){
    return AchievedBossChallenge(1, 2)
}

// Area 3

function Area3_HitoClear(){
    return AchievedAreaClear("Hito", 1, 3)
}

function Area3_OniClear(){
    return AchievedAreaClear("Oni", 1, 3)
}

function Area3_ARM0Clear(){
    return AchievedAreaARMChallenge(1, 3)
}

function Area3_BossTimerChallenge(){
    return AchievedBossTimerChallenge(1, 3)
}

function Area3_BossDefeatChallenge(){
    return AchievedBossChallenge(1, 3)
}

// Area 4

function Area4_HitoClear(){
    return AchievedAreaClear("Hito", 1, 4)
}

function Area4_OniClear(){
    return AchievedAreaClear("Oni", 1, 4)
}

function Area4_ARM0Clear(){
    return AchievedAreaARMChallenge(1, 4)
}

function Area4_BossTimerChallenge(){
    return AchievedBossTimerChallenge(1, 4)
}

function Area4_BossDefeatChallenge(){
    return AchievedBossChallenge(1, 4)
}

function Area4_HiddenStoryText(){
    return TriggeredText(1, 5)
}

function Area4_HiddenScene(){
    return TriggeredScene(0, 5, "Area4Ending") 
}

// Area 5

function Area5_HitoClear(){
    return AchievedAreaClear("Hito", 2, 5)
}

function Area5_OniClear(){
    return AchievedAreaClear("Oni", 2, 5)
}

function Area5_ARM0Clear(){
    return AchievedAreaARMChallenge(2, 5)
}

function Area5_SubBossTimerChallenge(){
    return AchievedBossTimerChallenge(2, 5, true)
}

function Area5_SubBossDefeatChallenge(){
    return AchievedBossChallenge(2, 5, true)
}

function Area5_BossTimerChallenge(){
    return AchievedBossTimerChallenge(2, 5)
}

function Area5_BossDefeatChallenge(){
    return AchievedBossChallenge(2, 5)
}

// Area 6

function Area6_HitoClear(){
    return AchievedAreaClear("Hito", 2, 6)
}

function Area6_OniClear(){
    return AchievedAreaClear("Oni", 2, 6)
}

function Area6_ARM0Clear(){
    return AchievedAreaARMChallenge(2, 6)
}

function Area6_BossTimerChallenge(){
    return AchievedBossTimerChallenge(2, 6)
}

function Area6_BossDefeatChallenge(){
    return AchievedBossChallenge(2, 6)
}

// Area 7

function Area7_HitoClear(){
    return AchievedAreaClear("Hito", 2, 7)
}

function Area7_OniClear(){
    return AchievedAreaClear("Oni", 2, 7)
}

function Area7_ARM0Clear(){
    return AchievedAreaARMChallenge(2, 7)
}

function Area7_BossTimerChallenge(){
    return AchievedBossTimerChallenge(2, 7)
}

function Area7_BossDefeatChallenge(){
    return AchievedBossChallenge(2, 7)
}

// Area 8

function Area8_HitoClear(){
    return AchievedAreaClear("Hito", 2, 8)
}

function Area8_OniClear(){
    return AchievedAreaClear("Oni", 2, 8)
}

function Area8_ARM0Clear(){
    return AchievedAreaARMChallenge(2, 8)
}

function Area8_SubBossTimerChallenge(){
    return AchievedBossTimerChallenge(2, 8, true)
}

function Area8_SubBossDefeatChallenge(){
    return AchievedBossChallenge(2, 8, true)
}

function Area8_BossDefeatChallenge(){
    return AchievedBossChallenge(2, 8)
}

function Area8_EndingText(){
    return TriggeredText(2, 1)
}

function Area8_TrueEndingText(){
    return TriggeredText(2, 1, true)
}

function Area8_EndingScene(){
    return TriggeredScene(0, 1, "Ending")
}

// Other

function Other_MaxPrimary(){
    power = Player["Weapons"]["Primary"]["Power"]
    max = 0x0f
    
    return IsInGame() &&
        prev(power) < max &&
        power >= max
}

function Other_MaxARM0(){
    return AchievedMaxSubWeapon(0)
}

function Other_MaxARM1(){
    return AchievedMaxSubWeapon(1)
}

function Other_MaxARM2(){
    return AchievedMaxSubWeapon(2)
}

function Other_MaxARM3(){
    return AchievedMaxSubWeapon(3)
}

function Other_MaxARM4(){
    return AchievedMaxSubWeapon(4)
}

function Other_MaxARM5(){
    return AchievedMaxSubWeapon(5)
}

function Other_MaxARM6(){
    return AchievedMaxSubWeapon(6)
}

function Other_RedOption(){
    return AchievedOption("Red")
}

function Other_BlueOption(){
    return AchievedOption("Blue")
}

function Other_GrayOption(){
    return AchievedOption("Gray")
}

function Other_YellowOption(){
    return AchievedOption("Yellow")
}

function Other_3Options(){
    return Achieved3Options()
}

function Other_3DifferentOptions(){
    return Achieved3DifferentOptions()
}

function Other_BlueCreature(){
    return AchievedSpecialItem("BlueCreature")
}

function Other_StarOrb(){
    return AchievedSpecialItem("StarOrb")
}

function Other_PowerChipExtend(){
    return AchievedPowerChipExtend()
}

function Other_20KExtend(){
    return AchievedScore(20000)
}

function Other_80KExtend(){
    return AchievedScore(80000)
}

function Other_250Thousand(){
    return AchievedScore(250000, true)
}

function Other_500Thousand(){
    return AchievedScore(500000, true)
}

function Other_1Million(){
    return AchievedScore(1000000, true)
}

// Achievement Definitions

// Area 1

achievement("Antagonistic Assault", "Watch the intro cutscene to the end", points = 1, id = 537884,
    trigger = Intro_Cutscene()
)

achievement("Carnivore", "On Hito (Level 1) difficulty or higher, clear Area 1", points = 3, type = "progression", id = 537885,
    trigger = Area1_HitoClear()
)

achievement("Predator", "On Oni (Level 3) difficulty, clear Area 1", points = 10, id = 537886,
    trigger = Area1_OniClear()
)

achievement("Breakneck", "On Hito (Level 1) difficulty or higher, clear Area 1 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537887,
    trigger = Area1_ARM0Clear()
)

achievement("Dam Defenses", "On Hito (Level 1) difficulty or higher, defeat the Area 1 Sub-Boss before the timer runs out, and without losing a life", points = 5, id = 537888,
    trigger = Area1_SubBossDefeatChallenge()
)

achievement("Passive Actions", "On Hito (Level 1) difficulty or higher, survive the Area 1 Sub-Boss by letting the timer run out, without firing a shot", points = 5, id = 537889,
    trigger = Area1_SubBossTimerChallenge()
)

achievement("Crimson Verglan", "On Hito (Level 1) difficulty or higher, defeat the Area 1 Boss before the timer runs out, and without losing a life", points = 5, id = 537890,
    trigger = Area1_BossDefeatChallenge()
)

achievement("Passive Exercises", "On Hito (Level 1) difficulty or higher, survive the Area 1 Boss by letting the timer run out, without firing a shot", points = 5, id = 537891,
    trigger = Area1_BossTimerChallenge()
)


// Area 2

achievement("City Battle", "On Hito (Level 1) difficulty or higher, clear Area 2", points = 3, type = "progression", id = 537892,
    trigger = Area2_HitoClear()
)

achievement("Civic Assault", "On Oni (Level 3) difficulty, clear Area 2", points = 10, id = 537893,
    trigger = Area2_OniClear()
)

achievement("Expeditious", "On Hito (Level 1) difficulty or higher, clear Area 2 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537894,
    trigger = Area2_ARM0Clear()
)

achievement("Gickant", "On Hito (Level 1) difficulty or higher, defeat the Area 2 Sub-Boss before the timer runs out, and without losing a life", points = 5, id = 537895,
    trigger = Area2_SubBossDefeatChallenge()
)

achievement("Passive Maneuvers", "On Hito (Level 1) difficulty or higher, survive the Area 2 Sub-Boss by letting the timer run out, without firing a shot", points = 5, id = 537896,
    trigger = Area2_SubBossTimerChallenge()
)

achievement("Infected Gickant", "On Hito (Level 1) difficulty or higher, defeat the Area 2 Boss before the timer runs out, and without losing a life", points = 5, id = 537897,
    trigger = Area2_BossDefeatChallenge()
)

achievement("Passive Operations", "On Hito (Level 1) difficulty or higher, survive the Area 2 Boss by letting the timer run out, without firing a shot", points = 5, id = 537898,
    trigger = Area2_BossTimerChallenge()
)


// Area 3

achievement("Corrupt Sea", "On Hito (Level 1) difficulty or higher, clear Area 3", points = 3, type = "progression", id = 537899,
    trigger = Area3_HitoClear()
)

achievement("Nefarious Expanse", "On Oni (Level 3) difficulty, clear Area 3", points = 10, id = 537900,
    trigger = Area3_OniClear()
)

achievement("Excessive", "On Hito (Level 1) difficulty or higher, clear Area 3 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537901,
    trigger = Area3_ARM0Clear()
)

achievement("Op Thorb", "On Hito (Level 1) difficulty or higher, defeat the Area 3 Boss before the timer runs out, and without losing a life", points = 5, id = 537902,
    trigger = Area3_BossDefeatChallenge()
)

achievement("Passive Aggression", "On Hito (Level 1) difficulty or higher, survive the Area 3 Boss by letting the timer run out, without firing a shot", points = 5, id = 537903,
    trigger = Area3_BossTimerChallenge()
)


// Area 4

achievement("Convection", "On Hito (Level 1) difficulty or higher, clear Area 4", points = 3, type = "progression", id = 537904,
    trigger = Area4_HitoClear()
)

achievement("Transmission", "On Oni (Level 3) difficulty, clear Area 4", points = 10, id = 537905,
    trigger = Area4_OniClear()
)

achievement("Headlong", "On Hito (Level 1) difficulty or higher, clear Area 4 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537906,
    trigger = Area4_ARM0Clear()
)

achievement("Vallantus", "On Hito (Level 1) difficulty or higher, defeat the Area 4 Boss before the timer runs out, and without losing a life", points = 5, id = 537907,
    trigger = Area4_BossDefeatChallenge()
)

achievement("Passive Intervention", "On Hito (Level 1) difficulty or higher, survive the Area 4 Boss by letting the timer run out, without firing a shot", points = 5, id = 537908,
    trigger = Area4_BossTimerChallenge()
)

achievement("A Terrible Trap", "Reveal the post Area 4 story text after defeating Brahwell", points = 1, id = 537909,
    trigger = Area4_HiddenStoryText()
)

achievement("A Terrible Truth", "Watch the post Area 4 cutscene to the end after defeating Brahwell", points = 1, id = 537910,
    trigger = Area4_HiddenScene()
)


// Area 5

achievement("Cruel Sea", "On Hito (Level 1) difficulty or higher, clear Area 5", points = 5, type = "progression", id = 537911,
    trigger = Area5_HitoClear()
)

achievement("Heartless Expanse", "On Oni (Level 3) difficulty, clear Area 5", points = 10, id = 537912,
    trigger = Area5_OniClear()
)

achievement("Brisk", "On Hito (Level 1) difficulty or higher, clear Area 5 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537913,
    trigger = Area5_ARM0Clear()
)

achievement("Herbaceous Defense", "On Hito (Level 1) difficulty or higher, defeat the Area 5 Sub-Boss before the timer runs out, and without losing a life", points = 5, id = 537914,
    trigger = Area5_SubBossDefeatChallenge()
)

achievement("Passive Onslaught", "On Hito (Level 1) difficulty or higher, survive the Area 5 Sub-Boss by letting the timer run out, without firing a shot", points = 5, id = 537915,
    trigger = Area5_SubBossTimerChallenge()
)

achievement("Barside", "On Hito (Level 1) difficulty or higher, defeat the Area 5 Boss before the timer runs out, and without losing a life", points = 5, id = 537916,
    trigger = Area5_BossDefeatChallenge()
)

achievement("Passive Skirmish", "On Hito (Level 1) difficulty or higher, survive the Area 5 Boss by letting the timer run out, without firing a shot", points = 5, id = 537917,
    trigger = Area5_BossTimerChallenge()
)


// Area 6

achievement("Cancerous City", "On Hito (Level 1) difficulty or higher, clear Area 6", points = 5, type = "progression", id = 537918,
    trigger = Area6_HitoClear()
)

achievement("Malignant Metropolis", "On Oni (Level 3) difficulty, clear Area 6", points = 10, id = 537919,
    trigger = Area6_OniClear()
)

achievement("Hairtrigger", "On Hito (Level 1) difficulty or higher, clear Area 6 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537920,
    trigger = Area6_ARM0Clear()
)

achievement("Jurassic Thorb", "On Hito (Level 1) difficulty or higher, defeat the Area 6 Boss before the timer runs out, and without losing a life", points = 5, id = 537921,
    trigger = Area6_BossDefeatChallenge()
)

achievement("Passive Rush", "On Hito (Level 1) difficulty or higher, survive the Area 6 Boss by letting the timer run out, without firing a shot", points = 5, id = 537922,
    trigger = Area6_BossTimerChallenge()
)

// Area 7

achievement("Conspiracy", "On Hito (Level 1) difficulty or higher, clear Area 7", points = 5, type = "progression", id = 537923,
    trigger = Area7_HitoClear()
)

achievement("Counterplot", "On Oni (Level 3) difficulty, clear Area 7", points = 10, id = 537924,
    trigger = Area7_OniClear()
)

achievement("Nimble", "On Hito (Level 1) difficulty or higher, clear Area 7 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537925,
    trigger = Area7_ARM0Clear()
)

achievement("Mothership", "On Hito (Level 1) difficulty or higher, defeat the Area 7 Boss before the timer runs out, and without losing a life", points = 5, id = 537926,
    trigger = Area7_BossDefeatChallenge()
)

achievement("Passive Initiative", "On Hito (Level 1) difficulty or higher, survive the Area 7 Boss by letting the timer run out, without firing a shot", points = 5, id = 537927,
    trigger = Area7_BossTimerChallenge()
)

// Area 8

achievement("Culmination", "On Hito (Level 1) difficulty or higher, clear Area 8", points = 10, type = "win_condition", id = 537928,
    trigger = Area8_HitoClear()
)

achievement("Consummation", "On Oni (Level 3) difficulty, clear Area 8", points = 25, type = "win_condition", id = 537929,
    trigger = Area8_OniClear()
)

achievement("Electric", "On Hito (Level 1) difficulty or higher, clear Area 8 using ARM Type 0 Super-Rapid without changing secondary weapons", points = 5, id = 537930,
    trigger = Area8_ARM0Clear()
)

achievement("Azure Verglan", "On Hito (Level 1) difficulty or higher, defeat the Area 8 Sub-Boss before the timer runs out, and without losing a life", points = 5, id = 537931,
    trigger = Area8_SubBossDefeatChallenge()
)

achievement("Passive Blitz", "On Hito (Level 1) difficulty or higher, survive the Area 8 Sub-Boss by letting the timer run out, without firing a shot", points = 5, id = 537932,
    trigger = Area8_SubBossTimerChallenge()
)

achievement("Gaizel", "On Hito (Level 1) difficulty or higher, defeat the Area 8 Boss without losing a life", points = 10, id = 537933,
    trigger = Area8_BossDefeatChallenge()
)

achievement("A Heavy Heart", "Reveal the ending text after clearing Area 8", points = 1, id = 537934,
    trigger = Area8_EndingText()
)

achievement("By Sheer Will", "Reveal the true ending text after clearing Area 8", points = 1, id = 537935,
    trigger = Area8_TrueEndingText()
)

achievement("A Bittersweet Victory", "Watch the ending cutscene to the end after clearing Area 8", points = 1, id = 537936,
    trigger = Area8_EndingScene()
)

// Other

achievement("Super-Power", "Reach maximum power for your Primary Weapon", points = 5, id = 537937,
    trigger = Other_MaxPrimary()
)

achievement("Super-Rapid", "Reach maximum power for ARM Type 0", points = 5, id = 537938,
    trigger = Other_MaxARM0()
)

achievement("Destroy-Cutter", "Reach maximum power for ARM Type 1", points = 5, id = 537939,
    trigger = Other_MaxARM1()
)

achievement("Super-Energy", "Reach maximum power for ARM Type 2", points = 5, id = 537940,
    trigger = Other_MaxARM2()
)

achievement("Lazer-Beam", "Reach maximum power for ARM Type 3", points = 5, id = 537941,
    trigger = Other_MaxARM3()
)

achievement("Homing-Energy", "Reach maximum power for ARM Type 4", points = 5, id = 537942,
    trigger = Other_MaxARM4()
)

achievement("Separate", "Reach maximum power for ARM Type 5", points = 5, id = 537943,
    trigger = Other_MaxARM5()
)

achievement("Drop-Down", "Reach maximum power for ARM Type 6", points = 5, id = 537944,
    trigger = Other_MaxARM6()
)

achievement("Bursting Bulwark", "Collect a Red Shield Option for the first time", points = 3, id = 537945,
    trigger = Other_RedOption()
)

achievement("Penetrating Protection", "Collect a Blue Shield Option for the first time", points = 3, id = 537946,
    trigger = Other_BlueOption()
)

achievement("Vigorous Volley", "Collect a Gray Shield Option for the first time", points = 3, id = 537947,
    trigger = Other_GrayOption()
)

achievement("Bulky Barricade", "Collect a Yellow Shield Option for the first time", points = 3, id = 537948,
    trigger = Other_YellowOption()
)

achievement("Triple UP", "Have 3 Shield Options at once", points = 5, id = 537949,
    trigger = Other_3Options()
)

achievement("Rainbow Ramparts", "Have 3 Shield Options of different colors at once", points = 10, id = 537950,
    trigger = Other_3DifferentOptions()
)

achievement("Helping Hand", "Collect a strange blue friend and max out all of your weapons at once", points = 3, id = 537951,
    trigger = Other_BlueCreature()
)

achievement("Cosmic Charge", "Collect a Star Orb and destroy all enemies on screen", points = 3, id = 537952,
    trigger = Other_StarOrb()
)

achievement("Heightened Growth", "Reach a stock of 10 lives", points = 5, id = 537953,
    trigger = AchievedLivesCount(10)
)

achievement("Powered UP", "Extend your lives by 1 by collecting 100 Power Chips", points = 5, id = 537954,
    trigger = Other_PowerChipExtend()
)

achievement("Amplified", "Extend your lives by 1 by scoring 20 thousand points or more", points = 3, id = 537955,
    trigger = Other_20KExtend()
)

achievement("Vitalized", "Extend your lives by 1 by scoring 80 thousand points or more", points = 5, id = 537956,
    trigger = Other_80KExtend()
)

achievement("Intensified", "Reach a score of 250 thousand points or more before beating the final boss in Area 8", points = 3, id = 537957,
    trigger = Other_250Thousand()
)

achievement("Invigorated", "Reach a score of 500 thousand points or more before beating the final boss in Area 8", points = 5, id = 537958,
    trigger = Other_500Thousand()
)

achievement("Maximized", "Reach a score of 1 million points or more before beating the final boss in Area 8", points = 10, id = 537959,
    trigger = Other_1Million()
)


