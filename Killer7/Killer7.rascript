// Killer7
// #ID = 7032

Disc = byte(0x00000006)
Difficulty = bit0(0x002b7a6e)
Mode = high4(0x002b7a6f) - ((bit7(0x002b7a6f) * 8) + bit4(0x002b7a6f))
GameState = dword_be(0x002b7580)
GamePointer = dword_be(0x000030c8)
Target = dword_be(0x002b7554)
Mission = dword_be(0x002b7558)
Pigeons = bitcount(0x002b7a75)
TargetKills = dword_be(0x002d21d8)
TargetPartKills = dword_be(0x002d21e4)
TargetComboCount = dword_be(0x002d21ec)
SelectedCharacter = byte(0x0071b664)
Health = word_be(0x0071b640)
Ammo = word_be(0x0071b668)
AmmoCapacity = word_be(0x0071b642)
RoomIndex = dword_be(0x0030a510)
PrevRoomIndex = dword_be(0x0030a518)
Killer8 = bit5(0x002b7a6f)
Hopper7 = bit6(0x002b7a6f)
KillMatsuken = bit0(0x002b7a7f)
BloodRoomState = byte(0x002cd83c)
TargetComplete = bit7(0x002b7a6f)

function IsInGame() => GamePointer != 0

function IsKiller7() => Killer8 == 0 && Hopper7 == 0
function IsKiller8() => Killer8 == 1
function IsHopper7() => Hopper7 == 1
function IsNormal() => IsKiller7() && Difficulty == 1
function IsDeadly() => IsKiller7() && Difficulty == 0

function IsDan() => SelectedCharacter == 1
function IsCon() => SelectedCharacter == 2
function IsKaede() => SelectedCharacter == 3
function IsCoyote() => SelectedCharacter == 4
function IsKevin() => SelectedCharacter == 6
function IsMask() => SelectedCharacter == 5
function IsYoungHarman() => SelectedCharacter == 7 && AmmoCapacity == 50
function IsOldHarman() => SelectedCharacter == 7 && AmmoCapacity == 6
function IsGarcian() => SelectedCharacter == 8

Dan = {
    "Power": byte(0x002d7788),
    "Speed": byte(0x002d77d8),
    "Waver": byte(0x002d7828),
    "Critical": byte(0x002d7878)
}

Con = {
    "Power": byte(0x002d7798),
    "Speed": byte(0x002d77e8),
    "Waver": byte(0x002d7838),
    "Critical": byte(0x002d7888)
}

Coyote = {
    "Power": byte(0x002d77b8),
    "Speed": byte(0x002d7808),
    "Waver": byte(0x002d7858),
    "Critical": byte(0x002d78a8)
}

Kaede = {
    "Power": byte(0x002d77c0),
    "Speed": byte(0x002d7810),
    "Waver": byte(0x002d7860),
    "Critical": byte(0x002d78b0)
}

Kevin = {
    "Power": byte(0x002d77c8),
    "Speed": byte(0x002d7818),
    "Invisibility": byte(0x002d7868),
    "Critical": byte(0x002d78b8)
}

Mask = {
    "Power": byte(0x002d77d0),
    "Speed": byte(0x002d7820),
    "Waver": byte(0x002d7870),
    "Critical": byte(0x002d78c0)
}

YoungHarman = {
    "Power": byte(0x002d7790),
    "Speed": byte(0x002d77e0),
    "Waver": byte(0x002d7830),
    "Critical": byte(0x002d7880)
}

Rings = {
    "Fire": bit2(0x002b7a6e),
    "Water": bit3(0x002b7a6e),
    "Time": bit4(0x002b7a6e),
    "Wind": bit5(0x002b7a6e),
    //Stamina uses alt event trigger for timing
    "Stamina": bit5(0x002b7a7f), 
    "Power": bit7(0x002b7a6e)
}

RingLocations = {
    "Fire": 0x30504,
    "Water": 0x6501,
    "Time": 0x14503,
    "Wind": 0x9300,
    "Stamina": 0xc900,
    "Power": 0x16100
}

RingMissions = {
    "Fire": 0,
    "Water": 1,
    "Time": 4,
    "Wind": 2,
    "Stamina": 3,
    "Power": 5
}

TargetDisc = {
    0x0: 0,
    0x1: 0,
    0x2: 0,
    0x3: 0,
    0x4: 1,
    0x5: 1,
    0x6: 1
}

TargetFinalMission = {
    0x0: 0x0,
    0x1: 0x2,
    0x2: 0x3,
    0x3: 0x5,
    0x4: 0x7,
    0x5: 0xa,
    0x6: 0xb
}

MissionDiscs = {
    0x00: 0,
    0x01: 0,
    0x02: 0,
    0x03: 0,
    0x04: 0,
    0x05: 0,
    0x06: 1,
    0x07: 1,
    0x08: 1,
    0x09: 1,
    0x0a: 1,
    0x0b: 1
}

VinculumSmileMissions = {
    "Speed": 0,
    "Phantom": 1,
    "Backside": 2,
    "Mithril": 4,
    "Laser": 5,
    "Timer": 8,
    "Galactic": 9
}

VinculumSmileDiscs = {
    "Speed": 0,
    "Phantom": 0,
    "Backside": 0,
    "Mithril": 0,
    "Laser": 0,
    "Timer": 1,
    "Galactic": 1
}

VinculumSmileRooms = {
    "Speed": 0x30702,
    "Phantom": 0x7600,
    "Backside": 0x8a00,
    "Mithril": 0x14800,
    "Laser": 0x16d00,
    "Timer": 0x20800,
    "Galactic": 0x22d00
}

function UlmeydaFigureCount(){
    return
        bit0(0x002b7a83) + bit1(0x002b7a83) + bit2(0x002b7a83) + bit3(0x002b7a83) + 
        bit4(0x002b7a83) + bit1(0x002b7a7c) + bit2(0x002b7a7c) + bit3(0x002b7a7c) + 
        bit4(0x002b7a7c) + bit5(0x002b7a7c) + bit6(0x002b7a7c) + bit7(0x002b7a7c)
}

function ColorSampleCount(){
    return
        bit0(0x002b7a7f) + bit1(0x002b7a7f) + bit2(0x002b7a7f) + bit3(0x002b7a7f) + 
        bit4(0x002b7a7f) + bit5(0x002b7a7f) + bit6(0x002b7a7f) + bit7(0x002b7a7f) +
        bit0(0x002b7a7e)
}
    
function CassetteCount(){
    return
        bit3(0x002b7a7c) + bit4(0x002b7a7c) + bit5(0x002b7a7c) + bit6(0x002b7a7c) + 
        bit7(0x002b7a7c) + bit0(0x002b7a83) + bit1(0x002b7a83) + bit2(0x002b7a83) + 
        bit3(0x002b7a83) + bit4(0x002b7a83)
}

EnemyListPointer = dword_be(0x002b7df0)

NextEnemyOffset = 0x004
EnemyIDOffset = 0x01c
EnemyHealthOffset = 0x234
EnemyPointerMask = 0x7fffffff

MaskedEnemyListPointer = EnemyListPointer & EnemyPointerMask

EnemyIDs = {
    "Camellia": 0x7400,
    "Laser": 0x7d00,
    "Micro1": 0x1701,
    "Micro2": 0x1700,
    "Broken": 0x7900,
    "Giant": 0x7c00
}

DeadCharacters = {
    "Dan": bit0(0x002d2513),
    "Con": bit2(0x002d2513),
    "YoungHarmen": bit5(0x002d2513),
    "Coyote": bit6(0x002d2513),
    "Kaede": bit7(0x002d2513),
    "Kevin": bit0(0x002d2512),
    "Mask": bit1(0x002d2512)
}

BossLocations = {
    "Angel": 0x30802,
    "JuliaKisugi": 0x7300,
    "JeanDepaul": 0x8800,
    "KurashiAkiba": 0xa00,
    "AndreiUlmeyda": 0xce00,
    "AyamiBlackburn1": 0x13c00,
    "AyamiBlackburn2": 0x16900,
    "CurtisBlackburn": 0x16b00,
    "GregNightmare": 0x22900
}

BossDiscs = {
    "Angel": 0,
    "JuliaKisugi": 0,
    "JeanDepaul": 0,
    "KurashiAkiba": 0,
    "AndreiUlmeyda": 0,
    "AyamiBlackburn1": 0,
    "AyamiBlackburn2": 0,
    "CurtisBlackburn": 0,
    "GregNightmare": 1
}

BossMissions = {
    "Angel": 0,
    "JuliaKisugi": 1,
    "JeanDepaul": 2,
    "KurashiAkiba": 2,
    "AndreiUlmeyda": 3,
    "AyamiBlackburn1": 4,
    "AyamiBlackburn2": 5,
    "CurtisBlackburn": 5,
    "GregNightmare": 9
}

JeanDepaulPointer = dword_be(0x0030ae18)
MaskedJeanDepaulPointer = JeanDepaulPointer & EnemyPointerMask

// ======================================================================= //
// Achievement Trigger Functions
// ======================================================================= //

function CollectedRing(ringName){
    return 
        IsInGame() &&
        Disc == 0 &&
        Mission == RingMissions[ringName] &&
        RoomIndex == RingLocations[ringName] &&
        prev(Rings[ringName]) == 0 && Rings[ringName] == 1
}

function CompletedTarget(target, mode, difficulty){
    trigger = 
        IsInGame() &&
        Disc == TargetDisc[target] &&
        Target == target &&
        Mission == TargetFinalMission[target] &&
        prev(TargetComplete) < TargetComplete
        
    if(mode == "Killer7"){
        trigger = trigger && IsKiller7()
        if(difficulty == "Deadly"){
            trigger = trigger && IsDeadly()
        }
    }
    
    if(mode == "Killer8"){
        trigger = trigger && IsKiller8()
    }
    
    if(mode == "Hopper7"){
        trigger = trigger && IsHopper7()
    }
    
    return trigger
}

function CompleteGame(ending, mode, difficulty){
    trigger =
        IsInGame() &&
        Disc == 1 &&
        Target == 6 &&
        Mission == TargetFinalMission[6] &&
        prev(TargetComplete) < TargetComplete &&
        KillMatsuken == ending
        
    if(mode == "Killer7"){
        trigger = trigger && IsKiller7()
        if(difficulty == "Deadly"){
            trigger = trigger && IsDeadly()
        }
    }
    
    if(mode == "Killer8"){
        trigger = trigger && IsKiller8()
    }
    
    if(mode == "Hopper7"){
        trigger = trigger && IsHopper7()
    }
        
    return trigger
}

function DefeatedVinculumSmile(smile){
    trigger = 
        IsInGame() &&
        Disc == VinculumSmileDiscs[smile] &&
        Mission == VinculumSmileMissions[smile] &&
        RoomIndex == VinculumSmileRooms[smile]
        
    if(smile == "Timer"){
        timerHitsOffset = 0x444
        timerHits = word_be(MaskedEnemyListPointer + timerHitsOffset)
        
        trigger = trigger &&
            prev(timerHits) < 8 && timerHits == 8
    } 
    else {
        healthOffset = 0x234
        health = word_be(MaskedEnemyListPointer + healthOffset)
    
        trigger = trigger &&
            prev(health) > 0 && health <= 0
    }
        
    return trigger
}

function CollectedUlmeydaFigures(){
    return
        IsInGame() &&
        Disc == 0 &&
        Mission == 4 &&
        prev(UlmeydaFigureCount()) == 11 &&
        UlmeydaFigureCount() == 12
}

function CollectedColorSamples(){
    return
        IsInGame() &&
        Disc == 1 &&
        Mission == 6 &&
        prev(ColorSampleCount()) == 8 &&
        ColorSampleCount() == 9
}

function CollectedCassettes(){
    return
        IsInGame() &&
        Disc == 1 &&
        Mission == 9 &&
        prev(CassetteCount()) == 9 &&
        CassetteCount() == 10
}

function CollectedPigeons() {
    return
        IsInGame() &&
        prev(Pigeons) == 7 &&
        Pigeons == 8
}

function AllSkillsUpgraded(){
    return
        IsInGame() &&
        (
            (prev(sum_of(Dan, skill => Dan[skill])) == 19 && sum_of(Dan, skill => Dan[skill]) == 20) ||
            (prev(sum_of(Con, skill => Con[skill])) == 19 && sum_of(Con, skill => Con[skill]) == 20) ||
            (prev(sum_of(Coyote, skill => Coyote[skill])) == 19 && sum_of(Coyote, skill => Coyote[skill]) == 20) ||
            (prev(sum_of(Kaede, skill => Kaede[skill])) == 19 && sum_of(Kaede, skill => Kaede[skill]) == 20) ||
            (prev(sum_of(Kevin, skill => Kevin[skill])) == 19 && sum_of(Kevin, skill => Kevin[skill]) == 20) ||
            (prev(sum_of(Mask, skill => Mask[skill])) == 19 && sum_of(Mask, skill => Mask[skill]) == 20) ||
            (prev(sum_of(YoungHarman, skill => YoungHarman[skill])) == 19 && sum_of(YoungHarman, skill => YoungHarman[skill]) == 20)
        )
}

function CheckForEnemyDeath(enemy){
    trigger = IsInGame() && EnemyListPointer != 0
        
    enemyFound = 
    (
        word_be(MaskedEnemyListPointer + EnemyIDOffset) == EnemyIDs[enemy] &&
        prev(word_be(MaskedEnemyListPointer + EnemyHealthOffset)) > 0 && 
        word_be(MaskedEnemyListPointer + EnemyHealthOffset) <= 0
    )
        
    for i in range(1, 9){    
        nextPointer = dword_be(MaskedEnemyListPointer + NextEnemyOffset)
        maskedNextPointer = nextPointer & EnemyPointerMask
        for j in range(1, i){
            if(j > 1){
                nextPointer = dword_be(maskedNextPointer + NextEnemyOffset)
                maskedNextPointer = nextPointer & EnemyPointerMask
            }
        }
        enemyFound = enemyFound || 
        (
            nextPointer != 0 &&
            word_be(maskedNextPointer + EnemyIDOffset) == EnemyIDs[enemy] &&
            prev(word_be(maskedNextPointer + EnemyHealthOffset)) > 0 && 
            word_be(maskedNextPointer + EnemyHealthOffset) <= 0
        )
    }

    return trigger && (enemyFound)
}

//Will need to check with both Kevin and Mask
//their ammo behaves a bit differently
function AchievedComboCount(count, type){
    trigger = repeated(count, prev(TargetComboCount) < TargetComboCount)
    
    if(type == "NoMiss"){
        trigger = trigger && never(prev(TargetComboCount) == TargetComboCount && prev(Ammo) < Ammo)
    }
    
    trigger = trigger && 
        never(TargetComboCount == 0) &&
        never(!IsInGame())
    
    return trigger
}

function AchievedKillCount(count){
    return 
        repeated(count, prev(TargetKills) < TargetKills) &&
        never(TargetKills == 0) &&
        never(!IsInGame())
}

function BreakBloodBank(mission){
    return
        IsInGame() &&
        Mission == mission &&
        PrevRoomIndex == 0x7200 &&
        RoomIndex == 0xffff &&
        prev(BloodRoomState) == 0x03 &&
        BloodRoomState == 0x04
}

//Track when player starts a mission (save protection)
//Challenge should start when they have control in the mission (save protection)
//Challenge will reset if any character dies
//Challenge will reset when the player is not in the correct mission
function CompletedMissionNoDeath(mission){
    return
        IsInGame() &&
        //Add Mission Start conditions
        //Add Mission End Scene Lookup condition
        never(Disc != MissionDiscs[mission]) &&
        never(Mission != mission) &&
        never(any_of(DeadCharacters, character => DeadCharacters[character] == 1))
}

function AngelChallenge(){
    angelPointer = dword_be(MaskedEnemyListPointer + NextEnemyOffset) & EnemyPointerMask
    angelHits = dword_be(angelPointer + 0x40c)

    return 
        //Store hits for transition to boss room (once player has control)
        once(RoomIndex == BossLocations["Angel"] && angelHits == 0) && 
        trigger_when(prev(angelHits) == 3 && angelHits == 4) &&
        never(prev(angelHits) == angelHits && prev(Ammo) < Ammo) &&
        never(!IsInGame()) &&
        never(Mission != BossMissions["Angel"]) &&
        never(Disc != BossDiscs["Angel"]) &&
        never(RoomIndex != BossLocations["Angel"])
        
}

function JuliaKisugiChallenge(){
    juliaHits = dword_be(MaskedEnemyListPointer + 0x400)
    juliaState = dword_be(MaskedEnemyListPointer + 0x424)
    
    return
        IsInGame() &&
        Mission == BossMissions["JuliaKisugi"] &&
        Disc == BossDiscs["JuliaKisugi"] &&
        RoomIndex == BossLocations["JuliaKisugi"] &&
        trigger_when(juliaHits >= 140 && prev(juliaState) == 0x7 && juliaState == 0x8)
}

function JeanDepaulChallenge(){
    jeanState = byte(MaskedJeanDepaulPointer + 0x420)
    jeanHits = byte(MaskedJeanDepaulPointer + 0x421)
    
    return
        once(RoomIndex == BossLocations["JeanDepaul"] && jeanHits == 0) &&
        trigger_when(jeanHits == 1 && prev(jeanState) == 0 && jeanState == 1) &&
        never(!IsInGame()) &&
        never(Mission != BossMissions["JeanDepaul"]) &&
        never(Disc != BossDiscs["JeanDepaul"]) &&
        never(RoomIndex != BossLocations["JeanDepaul"]) &&
        never(jeanHits >= 1 && jeanState == 0)
}

// ======================================================================= //
// Progression Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Coded] Collect the Fire Ring", points = 2,
    description = "While playing Target 00 [Angel], collect the Fire Ring in any mode and on any difficulty",
    trigger = CollectedRing("Fire"),
    type = "progression",
    id = 407752
)
achievement(
    title = "[Draft] Vinculum Speed Smile", points = 2,
    description = "While playing Target 00 [Angel], enter the Vinculum Gate and defeat the Speed Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Speed"),
    type = "progression",
    id = 407753
)
achievement(
    title = "[Coded] Complete Target 00 [Angel] on Normal", points = 3,
    description = "Complete Target 00 [Angel] in Killer7 mode and on Normal difficulty or higher",
    trigger = CompletedTarget(0, "Killer7", "Normal"),
    type = "progression",
    id = 407754
)
achievement(
    title = "[Coded] Complete Target 00 [Angel] on Deadly", points = 5,
    description = "Complete Target 00 [Angel] in Killer7 mode and on Deadly difficulty",
    trigger = CompletedTarget(0, "Killer7", "Deadly"),
    id = 407755
)
achievement(
    title = "[Coded] Collect the Water Ring", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], collect the Water Ring in any mode and on any difficulty",
    trigger = CollectedRing("Water"),
    type = "progression",
    id = 407756
)
achievement(
    title = "[Draft] Vinculum Phantom Smile", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], enter the Vinculum Gate and defeat the Phantom Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Phantom"),
    type = "progression",
    id = 407757
)
achievement(
    title = "[Coded] Collect the Wind Ring", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], collect the Wind Ring in any mode and on any difficulty",
    trigger = CollectedRing("Wind"),
    type = "progression",
    id = 407758
)
achievement(
    title = "[Draft] Vinculum Backside Smile", points = 5,
    description = "While playing Target 01 Part 02 [Sunset], enter the Vinculum Gate and defeat the Backside Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Backside"),
    type = "progression",
    id = 407759
)
achievement(
    title = "[Coded] Complete Target 01 [Sunset] on Normal", points = 5,
    description = "Complete Target 01 [Sunset] in Killer7 mode and on Normal difficulty or higher",
    trigger = CompletedTarget(1, "Killer7", "Normal"),
    type = "progression",
    id = 407760
)
achievement(
    title = "[Coded] Complete Target 01 [Sunset] on Deadly", points = 10,
    description = "Complete Target 01 [Sunset] in Killer7 mode and on Deadly difficulty",
    trigger = CompletedTarget(1, "Killer7", "Deadly"),
    id = 407761
)
achievement(
    title = "[Coded] Collect the Stamina Ring", points = 5,
    description = "While playing Target 02 [Cloudman], collect the Stamina Ring in any mode and on any difficulty",
    trigger = CollectedRing("Stamina"),
    type = "progression",
    id = 407762
)
achievement(
    title = "[Draft] Collect the Ulmeyda Figures", points = 5,
    description = "While playing Target 02 [Cloudman], collect all of the Ulmeyda Figures in any mode and on any difficulty",
    trigger = CollectedUlmeydaFigures(),
    type = "progression",
    id = 407763
)
achievement(
    title = "[Coded] Complete Target 02 [Cloudman] on Normal", points = 5,
    description = "Complete Target 02 [Cloudman] in Killer7 mode and on Normal difficulty or higher",
    trigger = CompletedTarget(2, "Killer7", "Normal"),
    type = "progression",
    id = 407764
)
achievement(
    title = "[Coded] Complete Target 02 [Cloudman] on Deadly", points = 10,
    description = "Complete Target 02 [Cloudman] in Killer7 mode and on Deadly difficulty",
    trigger = CompletedTarget(2, "Killer7", "Deadly"),
    id = 407765
)
achievement(
    title = "[Coded] Collect the Time Ring", points = 5,
    description = "While playing Target 03 Part 01 [Encounter], collect the Time Ring in any mode and on any difficulty",
    trigger = CollectedRing("Time"),
    type = "progression",
    id = 407766
)
achievement(
    title = "[Draft] Vinculum Mithril Smile", points = 5,
    description = "While playing Target 03 Part 01 [Encounter], enter the Vinculum Gate and defeat the Mithril Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Mithril"),
    type = "progression",
    id = 407767
)
achievement(
    title = "[Coded] Collect the Power Ring", points = 5,
    description = "While playing Target 03 Part 02 [Encounter], collect the Power Ring in any mode and on any difficulty",
    trigger = CollectedRing("Power"),
    type = "progression",
    id = 407768
)
achievement(
    title = "[Draft] Vinculum Laser Smile", points = 5,
    description = "While playing Target 03 Part 02 [Encounter], enter the Vinculum Gate and defeat the Laser Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Laser"),
    type = "progression",
    id = 407769
)
achievement(
    title = "[Coded] Complete Target 03 [Encounter] on Normal", points = 5,
    description = "Complete Target 03 [Encounter] in Killer7 mode and on Normal difficulty or higher",
    trigger = CompletedTarget(3, "Killer7", "Normal"),
    type = "progression",
    id = 407770
)
achievement(
    title = "[Coded] Complete Target 03 [Encounter] on Deadly", points = 10,
    description = "Complete Target 03 [Encounter] in Killer7 mode and on Deadly difficulty",
    trigger = CompletedTarget(3, "Killer7", "Deadly"),
    id = 407771
)
achievement(
    title = "[Draft] Collect the Punishing Rangers Color Samples", points = 5,
    description = "While playing Target 04 Part 01 [Cloudman], collect all of the Punishing Rangers Color Samples in any mode and on any difficulty",
    trigger = CollectedColorSamples(),
    type = "progression",
    id = 407772
)
achievement(
    title = "[Coded] Complete Target 04 [Alter Ego] on Normal", points = 5,
    description = "Complete Target 04 [Alter Ego] in Killer7 mode and on Normal difficulty or higher",
    trigger = CompletedTarget(4, "Killer7", "Normal"),
    type = "progression",
    id = 407773
)
achievement(
    title = "[Coded] Complete Target 04 [Alter Ego] on Deadly", points = 10,
    description = "Complete Target 04 [Alter Ego] in Killer7 mode and on Deadly difficulty",
    trigger = CompletedTarget(4, "Killer7", "Deadly"),
    id = 407774
)
achievement(
    title = "[Draft] Vinculum Timer Smile", points = 5,
    description = "While playing Target 05 Part 01 [Smile], enter the Vinculum Gate and defeat the Timer Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Timer"),
    type = "progression",
    id = 407775
)
achievement(
    title = "[Draft] Collect the Holbert's Cassettes", points = 5,
    description = "While playing Target 05 Part 02 [Smile], collect all of the Holbert's Cassettes in any mode and on any difficulty",
    trigger = CollectedCassettes(),
    type = "progression",
    id = 407776
)
achievement(
    title = "[Draft] Vinculum Galactic Tomahawk Smile", points = 5,
    description = "While playing Target 05 Part 02 [Smile], enter the Vinculum Gate and defeat the Galactic Tomahawk Smile in any mode and on any difficulty",
    trigger = DefeatedVinculumSmile("Galactic"),
    type = "progression",
    id = 407777
)
achievement(
    title = "[Coded] Complete Target 05 [Smile] on Normal", points = 5,
    description = "Complete Target 05 [Smile] in Killer7 mode and on Normal difficulty or higher",
    trigger = CompletedTarget(5, "Killer7", "Normal"),
    type = "progression",
    id = 407778
)
achievement(
    title = "[Coded] Complete Target 05 [Smile] on Deadly", points = 10,
    description = "Complete Target 05 [Smile] in Killer7 mode and on Deadly difficulty",
    trigger = CompletedTarget(5, "Killer7", "Deadly"),
    id = 407779
)
achievement(
    title = "[Coded] Complete Target 06 [Lion] on Normal with Defy Ending", points = 10,
    description = "After defying Matsuken, complete Target 06 [Lion] on Normal difficulty or higher",
    trigger = CompleteGame(1, "Killer7", "Normal"),
    type = "win_condition",
    id = 407780
)
achievement(
    title = "[Coded] Complete Target 06 [Lion] on Normal with Side Ending", points = 10,
    description = "After siding with Matsuken, complete Target 06 [Lion] on Normal difficulty or higher",
    trigger = CompleteGame(0, "Killer7", "Normal"),
    type = "win_condition",
    id = 407781
)
achievement(
    title = "[Coded] Complete Target 06 [Lion] on Deadly with Defy Ending", points = 25,
    description = "After defying Matsuken, complete Target 06 [Lion] on Deadly difficulty",
    trigger = CompleteGame(1, "Killer7", "Deadly"),
    id = 407782
)
achievement(
    title = "[Coded] Complete Target 06 [Lion] on Deadly with Side Ending", points = 25,
    description = "After siding with Matsuken, complete Target 06 [Lion] on Deadly difficulty",
    trigger = CompleteGame(0, "Killer7", "Deadly"),
    id = 407783
)

// ======================================================================= //
// Action/Boss Challenge Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Draft] No Miss Kill Combo", points = 10,
    description = "Reach a Kill Combo of 7 or more without missing, in any mode and on any difficulty",
    trigger = AchievedComboCount(7, "NoMiss"),
    id = 407784
)
achievement(
    title = "[Draft] Kill Combo", points = 10,
    description = "Maintain a Kill Combo of 28 or more, in any mode and on any difficulty",
    trigger = AchievedComboCount(28, "Standard"),
    id = 407785
)
achievement(
    title = "[Draft] 77 Smiles", points = 5,
    description = "Kill 77 Smiles or more in any single assignment, in any mode and on any difficulty",
    trigger = AchievedKillCount(77),
    id = 407786
)
achievement(
    title = "[Draft] 154 Smiles", points = 10,
    description = "Kill 154 Smiles or more in any single assignment, in any mode and on any difficulty",
    trigger = AchievedKillCount(154),
    id = 407787
)
achievement(
    title = "[Draft] No Miss Angel", points = 5,
    description = "While playing Target 00 [Angel], defeat Angel without missing a shot, in any mode and on any difficulty",
    trigger = AngelChallenge(),
    id = 407788
)
achievement(
    title = "[Draft] 140 Hit Julia Kisugi", points = 10,
    description = "While playing Target 01 Part 01 [Sunset], defeat Julia Kisugi by scoring 140 or more hits, in any mode and on any difficulty",
    trigger = JuliaKisugiChallenge(),
    id = 407789
)
achievement(
    title = "[Draft] One Shot Jean DePaul", points = 5,
    description = "While playing Target 01 Part 02 [Sunset], defeat Jean DePaul with one shot, in any mode and on any difficulty",
    trigger = JeanDepaulChallenge(),
    id = 407790
)
achievement(
    title = "[Draft] Minimum Shots Kurahashi & Akiba", points = 10,
    description = "While playing Target 01 Part 02 [Sunset], defeat Kurahashi & Akiba without firing more than 14 shots, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407791
)
achievement(
    title = "[Draft] Speed Kill Andrei Ulmeyda", points = 10,
    description = "While playing Target 02 [Cloudman], defeat Andrei Ulmeyda in 77 seconds or less, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407792
)
achievement(
    title = "[Draft] No Miss Ayame Blackburn 1", points = 25,
    description = "While playing Target 03 Part 01 [Encounter], defeat Ayame Blackburn without missing a shot, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407793
)
achievement(
    title = "[Draft] No Damage Ayame Blackburn 2", points = 50,
    description = "While playing Target 03 Part 02 [Encounter], defeat Ayame Blackburn without taking damage, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407794
)
achievement(
    title = "[Draft] No Shot Curtis Blackburn", points = 10,
    description = "While playing Target 03 Part 02 [Encounter], defeat Curtis Blackburn without letting him get a shot off, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407795
)
achievement(
    title = "[Draft] Minimum Shots Greg Nightmare", points = 10,
    description = "While playing Target 05 Part 02 [Smile], defeat Greg Nightmare without firing more than 21 shots, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407796
)
achievement(
    title = "[Draft] Camellia Smile Kill", points = 10,
    description = "Kill a Camellia Smile by shooting its weakpoint and gain an excess of Thin Blood, in any mode and on any difficulty",
    trigger = CheckForEnemyDeath("Camellia"),
    id = 407797
)
achievement(
    title = "[Draft] Micro Smile Kill", points = 5,
    description = "Kill a Micro Smile and recieve its reward, in any mode and on any difficulty",
    trigger = CheckForEnemyDeath("Micro1") || CheckForEnemyDeath("Micro2"),
    id = 407798
)
achievement(
    title = "[Draft] Broken Smile Kill", points = 50,
    description = "Kill a Broken Smile by shooting the weakpoint on its jetpack, in any mode and on any difficulty",
    trigger = CheckForEnemyDeath("Broken"),
    id = 407799
)
achievement(
    title = "[Draft] Giant Smile Kill", points = 25,
    description = "Kill a Giant Smile by shooting its eye, in any mode and on any difficulty",
    trigger = CheckForEnemyDeath("Giant"),
    id = 407800
)
achievement(
    title = "[Draft] Laser Smile Kill", points = 10,
    description = "Kill a Laser Smile by shooting its weakpoint, in any mode and on any difficulty",
    trigger = CheckForEnemyDeath("Laser"),
    id = 407801
)
achievement(
    title = "[Draft] No Death Target 00", points = 10,
    description = "In a single session, complete Target 00 [Angel] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(0),
    id = 407802
)
achievement(
    title = "[Draft] No Death Target 01 Part 01", points = 10,
    description = "In a single session, complete Target 01 Part 01 [Sunset] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(1),
    id = 407803
)
achievement(
    title = "[Draft] No Death Target 01 Part 02", points = 10,
    description = "In a single session, complete Target 01 Part 02 [Sunset] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(2),
    id = 407804
)
achievement(
    title = "[Draft] No Death Target 02", points = 10,
    description = "In a single session, complete Target 02 [Cloudman] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(3),
    id = 407805
)
achievement(
    title = "[Draft] No Death Target 03 Part 01", points = 10,
    description = "In a single session, complete Target 03 Part 01 [Encounter] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(4),
    id = 407806
)
achievement(
    title = "[Draft] No Death Target 03 Part 02", points = 10,
    description = "In a single session, complete Target 03 Part 02 [Encounter] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(5),
    id = 407807
)
achievement(
    title = "[Draft] No Death Target 04 Part 01", points = 10,
    description = "In a single session, complete Target 04 Part 01 [Alter Ego] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(6),
    id = 407808
)
achievement(
    title = "[Draft] No Death Target 05 Part 01", points = 25,
    description = "In a single session, complete Target 05 Part 01 [Smile] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(8),
    id = 407809
)
achievement(
    title = "[Draft] No Death Target 05 Part 02", points = 25,
    description = "In a single session, complete Target 05 Part 02 [Smile] without losing a Smith in any mode and on any difficulty",
    trigger = CompletedMissionNoDeath(9),
    id = 407810
)

// ======================================================================= //
// Post Game Challenge Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Coded] Complete Target 00 [Angel] on Killer8 Mode", points = 10,
    description = "Complete Target 00 [Angel] on Killer8 mode",
    trigger = CompletedTarget(0, "Killer8", "Bloodbath"),
    id = 407811
)
achievement(
    title = "[Coded] Complete Target 01 [Sunset] on Killer8 Mode", points = 10,
    description = "Complete Target 01 [Sunset] on Killer8 mode",
    trigger = CompletedTarget(1, "Killer8", "Bloodbath"),
    id = 407812
)
achievement(
    title = "[Coded] Complete Target 02 [Cloudman] on Killer8 Mode", points = 10,
    description = "Complete Target 02 [Cloudman] on Killer8 mode",
    trigger = CompletedTarget(2, "Killer8", "Bloodbath"),
    id = 407813
)
achievement(
    title = "[Coded] Complete Target 03 [Encounter] on Killer8 Mode", points = 10,
    description = "Complete Target 03 [Encounter] on Killer8 mode",
    trigger = CompletedTarget(3, "Killer8", "Bloodbath"),
    id = 407814
)
achievement(
    title = "[Coded] Complete Target 04 [Alter Ego] on Killer8 Mode", points = 10,
    description = "Complete Target 04 [Alter Ego] on Killer8 mode",
    trigger = CompletedTarget(4, "Killer8", "Bloodbath"),
    id = 407815
)
achievement(
    title = "[Coded] Complete Target 05 [Smile] on Killer8 Mode", points = 10,
    description = "Complete Target 05 [Smile] on Killer8 mode",
    trigger = CompletedTarget(5, "Killer8", "Bloodbath"),
    id = 407816
)
achievement(
    title = "[Coded] Complete Target 06 [Lion] on Killer8 Mode", points = 10,
    description = "Complete Target 06 [Lion] on Killer8 mode",
    trigger = CompleteGame(0, "Killer8", "Bloodbath") || CompleteGame(1, "Killer8", "Bloodbath"),
    id = 407817
)
achievement(
    title = "[Coded] Complete Target 00 [Angel] on Hopper7 Mode", points = 10,
    description = "Complete Target 00 [Angel] on Hopper7 mode",
    trigger = CompletedTarget(0, "Hopper7", "FaceTheSwarm"),
    id = 407818
)
achievement(
    title = "[Draft] Upgrade All Skills", points = 25,
    description = "Upgrade all skills for any Smith, in any mode and on any difficulty",
    trigger = AllSkillsUpgraded(),
    id = 407819
)

// ======================================================================= //
// Other Challenge Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Draft] Pigeon Collector", points = 10,
    description = "Collect all Carrier Pigeons, in any mode and on any difficulty",
    trigger = CollectedPigeons(),
    id = 407820
)
achievement(
    title = "[Draft] Break the Bank [Angel]", points = 5,
    description = "While playing Target 00 [Angel], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(0),
    id = 407821
)
achievement(
    title = "[Draft] Break the Bank [Sunset 1]", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(1),
    id = 407822
)
achievement(
    title = "[Draft] Break the Bank [Sunset 2]", points = 5,
    description = "While playing Target 01 Part 02 [Sunset], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(2),
    id = 407823
)
achievement(
    title = "[Draft] Break the Bank [Cloudman]", points = 5,
    description = "While playing Target 02 [Cloudman], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(3),
    id = 407824
)
achievement(
    title = "[Draft] Break the Bank [Encounter 1]", points = 5,
    description = "While playing Target 03 Part 01 [Encounter], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(4),
    id = 407825
)
achievement(
    title = "[Draft] Break the Bank [Encounter 2]", points = 5,
    description = "While playing Target 03 Part 02 [Encounter], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(5),
    id = 407826
)
achievement(
    title = "[Draft] Break the Bank [Alter Ego]", points = 5,
    description = "While playing Target 04 Part 01 [Alter Ego], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(6),
    id = 407827
)
achievement(
    title = "[Draft] Break the Bank [Smile 1]", points = 10,
    description = "While playing Target 05 Part 01 [Smile], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = BreakBloodBank(8),
    id = 407828
)