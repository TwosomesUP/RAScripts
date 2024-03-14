// Killer7
// #ID = 7032

Disc = byte(0x00000006)
Difficulty = bit0(0x002b7a6e)
Mode = high4(0x002b7a6f) - ((bit7(0x002b7a6f) * 8) + bit4(0x002b7a6f))
GameState = dword_be(0x002b7580)
GamePointer = dword_be(0x000030c8)
ScenePointer = dword_be(0x002b7538) 
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

function IsInGame() => GamePointer != 0

function CalculateModeAndDifficulty() => Mode + Difficulty

function IsNormal() => CalculateModeAndDifficulty() == 1
function IsDeadly() => CalculateModeAndDifficulty() == 0
function IsKiller7() => CalculateModeAndDifficulty() == 0 || CalculateModeAndDifficulty() == 1
function IsKiller8() => CalculateModeAndDifficulty() == 2
function IsHopper7() => CalculateModeAndDifficulty() == 4

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
    "Stamina": bit5(0x002b7a7f), //Uses Event Trigger
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

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

//Timing for Stamina Ring is weird - Update to event trigger instead
//Target 02 - prev(bit5(0x002b7a7f) == 1) && bit5(0x002b7a7f) == 1 && Mission == 3
function CollectedRing(ringName){
    return 
        IsInGame() &&
        Disc == 0 &&
        Mission == RingMissions[ringName] &&
        RoomIndex == RingLocations[ringName] &&
        prev(Rings[ringName]) == 0 && Rings[ringName] == 1
}

// ======================================================================= //
// Progression Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Draft] Collect the Fire Ring", points = 2,
    description = "While playing Target 00 [Angel], collect the Fire Ring in any mode and on any difficulty",
    trigger = CollectedRing("Fire"),
    type = "progression",
    id = 407752
)
achievement(
    title = "[Draft] Vinculum Speed Smile", points = 2,
    description = "While playing Target 00 [Angel], enter the Vinculum Gate and defeat the Speed Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407753
)
achievement(
    title = "[Draft] Complete Target 00 [Angel] on Normal", points = 3,
    description = "Complete Target 00 [Angel] in Killer7 mode and on Normal difficulty or higher",
    trigger = always_false(),
    type = "progression",
    id = 407754
)
achievement(
    title = "[Draft] Complete Target 00 [Angel] on Deadly", points = 5,
    description = "Complete Target 00 [Angel] in Killer7 mode and on Deadly difficulty",
    trigger = always_false(),
    id = 407755
)
achievement(
    title = "[Draft] Collect the Water Ring", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], collect the Water Ring in any mode and on any difficulty",
    trigger = CollectedRing("Water"),
    type = "progression",
    id = 407756
)
achievement(
    title = "[Draft] Vinculum Phantom Smile", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], enter the Vinculum Gate and defeat the Phantom Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407757
)
achievement(
    title = "[Draft] Collect the Wind Ring", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], collect the Wind Ring in any mode and on any difficulty",
    trigger = CollectedRing("Wind"),
    type = "progression",
    id = 407758
)
achievement(
    title = "[Draft] Vinculum Backside Smile", points = 5,
    description = "While playing Target 01 Part 02 [Sunset], enter the Vinculum Gate and defeat the Backside Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407759
)
achievement(
    title = "[Draft] Complete Target 01 [Sunset] on Normal", points = 5,
    description = "Complete Target 01 [Sunset] in Killer7 mode and on Normal difficulty or higher",
    trigger = always_false(),
    type = "progression",
    id = 407760
)
achievement(
    title = "[Draft] Complete Target 01 [Sunset] on Deadly", points = 10,
    description = "Complete Target 01 [Sunset] in Killer7 mode and on Deadly difficulty",
    trigger = always_false(),
    id = 407761
)
achievement(
    title = "[Draft] Collect the Stamina Ring", points = 5,
    description = "While playing Target 02 [Cloudman], collect the Stamina Ring in any mode and on any difficulty",
    trigger = CollectedRing("Stamina"),
    type = "progression",
    id = 407762
)
achievement(
    title = "[Draft] Collect the Ulmeyda Figures", points = 5,
    description = "While playing Target 02 [Cloudman], collect all of the Ulmeyda Figures in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407763
)
achievement(
    title = "[Draft] Complete Target 02 [Cloudman] on Normal", points = 5,
    description = "Complete Target 02 [Cloudman] in Killer7 mode and on Normal difficulty or higher",
    trigger = always_false(),
    type = "progression",
    id = 407764
)
achievement(
    title = "[Draft] Complete Target 02 [Cloudman] on Deadly", points = 10,
    description = "Complete Target 02 [Cloudman] in Killer7 mode and on Deadly difficulty",
    trigger = always_false(),
    id = 407765
)
achievement(
    title = "[Draft] Collect the Time Ring", points = 5,
    description = "While playing Target 03 Part 01 [Encounter], collect the Time Ring in any mode and on any difficulty",
    trigger = CollectedRing("Time"),
    type = "progression",
    id = 407766
)
achievement(
    title = "[Draft] Vinculum Mithril Smile", points = 5,
    description = "While playing Target 03 Part 01 [Encounter], enter the Vinculum Gate and defeat the Mithril Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407767
)
achievement(
    title = "[Draft] Collect the Power Ring", points = 5,
    description = "While playing Target 03 Part 02 [Encounter], collect the Power Ring in any mode and on any difficulty",
    trigger = CollectedRing("Power"),
    type = "progression",
    id = 407768
)
achievement(
    title = "[Draft] Vinculum Laser Smile", points = 5,
    description = "While playing Target 03 Part 02 [Encounter], enter the Vinculum Gate and defeat the Laser Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407769
)
achievement(
    title = "[Draft] Complete Target 03 [Encounter] on Normal", points = 5,
    description = "Complete Target 03 [Encounter] in Killer7 mode and on Normal difficulty or higher",
    trigger = always_false(),
    type = "progression",
    id = 407770
)
achievement(
    title = "[Draft] Complete Target 03 [Encounter] on Deadly", points = 10,
    description = "Complete Target 03 [Encounter] in Killer7 mode and on Deadly difficulty",
    trigger = always_false(),
    id = 407771
)
achievement(
    title = "[Draft] Collect the Punishing Rangers Color Samples", points = 5,
    description = "While playing Target 04 Part 01 [Cloudman], collect all of the Punishing Rangers Color Samples in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407772
)
achievement(
    title = "[Draft] Complete Target 04 [Alter Ego] on Normal", points = 5,
    description = "Complete Target 04 [Alter Ego] in Killer7 mode and on Normal difficulty or higher",
    trigger = always_false(),
    type = "progression",
    id = 407773
)
achievement(
    title = "[Draft] Complete Target 04 [Alter Ego] on Deadly", points = 10,
    description = "Complete Target 04 [Alter Ego] in Killer7 mode and on Deadly difficulty",
    trigger = always_false(),
    id = 407774
)
achievement(
    title = "[Draft] Vinculum Timer Smile", points = 5,
    description = "While playing Target 05 Part 01 [Smile], enter the Vinculum Gate and defeat the Timer Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407775
)
achievement(
    title = "[Draft] Collect the Holbert's Cassettes", points = 5,
    description = "While playing Target 05 Part 02 [Smile], collect all of the Holbert's Cassettes in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407776
)
achievement(
    title = "[Draft] Vinculum Galactic Tomahawk Smile", points = 5,
    description = "While playing Target 05 Part 02 [Smile], enter the Vinculum Gate and defeat the Galactic Tomahawk Smile in any mode and on any difficulty",
    trigger = always_false(),
    type = "progression",
    id = 407777
)
achievement(
    title = "[Draft] Complete Target 05 [Smile] on Normal", points = 5,
    description = "Complete Target 05 [Smile] in Killer7 mode and on Normal difficulty or higher",
    trigger = always_false(),
    type = "progression",
    id = 407778
)
achievement(
    title = "[Draft] Complete Target 05 [Smile] on Deadly", points = 10,
    description = "Complete Target 05 [Smile] in Killer7 mode and on Deadly difficulty",
    trigger = always_false(),
    id = 407779
)
achievement(
    title = "[Draft] Complete Target 06 [Lion] on Normal with Defy Ending", points = 10,
    description = "After defying Matsuken, complete Target 06 [Lion] on Normal difficulty or higher",
    trigger = always_false(),
    type = "win_condition",
    id = 407780
)
achievement(
    title = "[Draft] Complete Target 06 [Lion] on Normal with Side Ending", points = 10,
    description = "After siding with Matsuken, complete Target 06 [Lion] on Normal difficulty or higher",
    trigger = always_false(),
    type = "win_condition",
    id = 407781
)
achievement(
    title = "[Draft] Complete Target 06 [Lion] on Deadly with Defy Ending", points = 25,
    description = "After defying Matsuken, complete Target 06 [Lion] on Deadly difficulty",
    trigger = always_false(),
    id = 407782
)
achievement(
    title = "[Draft] Complete Target 06 [Lion] on Deadly with Side Ending", points = 25,
    description = "After siding with Matsuken, complete Target 06 [Lion] on Deadly difficulty",
    trigger = always_false(),
    id = 407783
)

// ======================================================================= //
// Action/Boss Challenge Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Draft] No Miss Kill Combo", points = 10,
    description = "Reach a Kill Combo of 7 or more without missing, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407784
)
achievement(
    title = "[Draft] Kill Combo", points = 10,
    description = "Maintain a Kill Combo of 28 or more, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407785
)
achievement(
    title = "[Draft] 77 Smiles", points = 5,
    description = "Kill 77 Smiles or more in any single assignment, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407786
)
achievement(
    title = "[Draft] 154 Smiles", points = 10,
    description = "Kill 154 Smiles or more in any single assignment, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407787
)
achievement(
    title = "[Draft] No Miss Angel", points = 5,
    description = "While playing Target 00 [Angel], defeat Angel without missing a shot, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407788
)
achievement(
    title = "[Draft] 140 Hit Julia Kisugi", points = 10,
    description = "While playing Target 01 Part 01 [Sunset], defeat Julia Kisugi by scoring 140 or more hits, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407789
)
achievement(
    title = "[Draft] One Shot Jean DePaul", points = 5,
    description = "While playing Target 01 Part 02 [Sunset], defeat Jean DePaul with one shot, in any mode and on any difficulty",
    trigger = always_false(),
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
    trigger = always_false(),
    id = 407797
)
achievement(
    title = "[Draft] Micro Smile Kill", points = 5,
    description = "Kill a Micro Smile and recieve its reward, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407798
)
achievement(
    title = "[Draft] Broken Smile Kill", points = 50,
    description = "Kill a Broken Smile by shooting the weakpoint on its jetpack, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407799
)
achievement(
    title = "[Draft] Giant Smile Kill", points = 25,
    description = "Kill a Giant Smile by shooting its eye, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407800
)
achievement(
    title = "[Draft] Laser Smile Kill", points = 10,
    description = "Kill a Giant Smile by shooting its eye, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407801
)
achievement(
    title = "[Draft] No Death Target 00", points = 10,
    description = "In a single session, complete Target 00 [Angel] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407802
)
achievement(
    title = "[Draft] No Death Target 01 Part 01", points = 10,
    description = "In a single session, complete Target 01 Part 01 [Sunset] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407803
)
achievement(
    title = "[Draft] No Death Target 01 Part 02", points = 10,
    description = "In a single session, complete Target 01 Part 02 [Sunset] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407804
)
achievement(
    title = "[Draft] No Death Target 02", points = 10,
    description = "In a single session, complete Target 02 [Cloudman] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407805
)
achievement(
    title = "[Draft] No Death Target 03 Part 01", points = 10,
    description = "In a single session, complete Target 03 Part 01 [Encounter] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407806
)
achievement(
    title = "[Draft] No Death Target 03 Part 02", points = 10,
    description = "In a single session, complete Target 03 Part 02 [Encounter] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407807
)
achievement(
    title = "[Draft] No Death Target 04 Part 01", points = 10,
    description = "In a single session, complete Target 04 Part 01 [Alter Ego] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407808
)
achievement(
    title = "[Draft] No Death Target 05 Part 01", points = 25,
    description = "In a single session, complete Target 05 Part 01 [Smile] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407809
)
achievement(
    title = "[Draft] No Death Target 05 Part 02", points = 25,
    description = "In a single session, complete Target 05 Part 02 [Smile] without losing a Smith in any mode and on any difficulty",
    trigger = always_false(),
    id = 407810
)

// ======================================================================= //
// Post Game Challenge Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Draft] Complete Target 00 [Angel] on Killer8 Mode", points = 10,
    description = "Complete Target 00 [Angel] on Killer8 mode",
    trigger = always_false(),
    id = 407811
)
achievement(
    title = "[Draft] Complete Target 01 [Sunset] on Killer8 Mode", points = 10,
    description = "Complete Target 01 [Sunset] on Killer8 mode",
    trigger = always_false(),
    id = 407812
)
achievement(
    title = "[Draft] Complete Target 02 [Cloudman] on Killer8 Mode", points = 10,
    description = "Complete Target 02 [Cloudman] on Killer8 mode",
    trigger = always_false(),
    id = 407813
)
achievement(
    title = "[Draft] Complete Target 03 [Encounter] on Killer8 Mode", points = 10,
    description = "Complete Target 03 [Encounter] on Killer8 mode",
    trigger = always_false(),
    id = 407814
)
achievement(
    title = "[Draft] Complete Target 04 [Alter Ego] on Killer8 Mode", points = 10,
    description = "Complete Target 04 [Alter Ego] on Killer8 mode",
    trigger = always_false(),
    id = 407815
)
achievement(
    title = "[Draft] Complete Target 05 [Smile] on Killer8 Mode", points = 10,
    description = "Complete Target 05 [Smile] on Killer8 mode",
    trigger = always_false(),
    id = 407816
)
achievement(
    title = "[Draft] Complete Target 06 [Lion] on Killer8 Mode", points = 10,
    description = "Complete Target 06 [Lion] on Killer8 mode",
    trigger = always_false(),
    id = 407817
)
achievement(
    title = "[Draft] Complete Target 00 [Angel] on Hopper7 Mode", points = 10,
    description = "Complete Target 00 [Angel] on Hopper7 mode",
    trigger = always_false(),
    id = 407818
)
achievement(
    title = "[Draft] Upgrade All Skills", points = 25,
    description = "Upgrade all skills for any Smith, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407819
)

// ======================================================================= //
// Other Challenge Achievement Definitions
// ======================================================================= //

achievement(
    title = "[Draft] Pigeon Collector", points = 10,
    description = "Collect all Carrier Pigeons, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407820
)
achievement(
    title = "[Draft] Break the Bank [Angel]", points = 5,
    description = "While playing Target 00 [Angel], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407821
)
achievement(
    title = "[Draft] Break the Bank [Sunset 1]", points = 5,
    description = "While playing Target 01 Part 01 [Sunset], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407822
)
achievement(
    title = "[Draft] Break the Bank [Sunset 2]", points = 5,
    description = "While playing Target 01 Part 02 [Sunset], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407823
)
achievement(
    title = "[Draft] Break the Bank [Cloudman]", points = 5,
    description = "While playing Target 02 [Cloudman], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407824
)
achievement(
    title = "[Draft] Break the Bank [Encounter 1]", points = 5,
    description = "While playing Target 03 Part 01 [Encounter], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407825
)
achievement(
    title = "[Draft] Break the Bank [Encounter 2]", points = 5,
    description = "While playing Target 03 Part 02 [Encounter], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407826
)
achievement(
    title = "[Draft] Break the Bank [Alter Ego]", points = 5,
    description = "While playing Target 04 Part 01 [Angel], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407827
)
achievement(
    title = "[Draft] Break the Bank [Smile 1]", points = 10,
    description = "While playing Target 05 Part 01 [Smile], break the Blood Room blood tank, in any mode and on any difficulty",
    trigger = always_false(),
    id = 407828
)