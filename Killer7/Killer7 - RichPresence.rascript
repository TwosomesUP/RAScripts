// Killer7
// #ID = 7032
Disc = byte(0x00000006)

Difficulty = bit0(0x002b7a6e)
Mode = high4(0x002b7a6f)

function IsKiller7() => bit5(Mode) != 1 && bit6(Mode) != 1
function IsKiller8() => Mode == 2
function IsHopper7() => Mode == 4

GameState = dword_be(0x002b7580)
ScenePointer = dword_be(0x002b7538)

GameStates = {
    "None": 0x00,
    "TargetEnd": 0x10
}

TargetSelectScreens = {
    "TargetSelect0": 0x8077ad40,
    "TargetSelect1": 0x8077ae00,
    "TargetSelect2": 0x8077b5e0,
    "TargetSelect3": 0x8077c4a0,
    "TargetSelect4": 0x8077d040,
    "TargetSelect5": 0x8077d9e0,
    "TargetSelect6": 0x8077e0e0,
    "TargetSelect7": 0x8077e540,
    "TargetSelect8": 0x8077e700
}

TargetEndScreens = {
    "Results": 0x80734120,
    "Pre-Save": 0x8073b380,
    "Save": 0x8073b220
}

GamePointer = dword_be(0x000030c8)

function IsInGame() => GamePointer != 0
function IsOnTitle() => GamePointer == 0 && ScenePointer == 0
function IsOnTargetEnd() => GamePointer == 0 && ScenePointer != 0 && any_of(TargetEndScreens, scene => ScenePointer == TargetEndScreens[scene])
function IsOnTargetSelect() => GamePointer == 0 && ScenePointer != 0 && none_of(TargetEndScreens, scene => ScenePointer == TargetEndScreens[scene])
Target = dword_be(0x002b7554)
Mission = dword_be(0x002b7558)

Rings = {
    "Fire": bit2(0x002b7a6e),
    "Water": bit3(0x002b7a6e),
    "Time": bit4(0x002b7a6e),
    "Wind": bit5(0x002b7a6e),
    "Stamina": bit6(0x002b7a6e),
    "Power": bit7(0x002b7a6e)
}

Pigeons = bitcount(0x002b7a75)

StatPointer = dword_be(0x002cfb9c)
Stats = {
    "ThinBlood": word_be(StatPointer + 0x4169),
    "Vials": (word_be(StatPointer + 0x416b) / 50),
    "ThickBlood": word_be(StatPointer + 0x416d)
}

TargetKills = dword_be(0x002d21d8)
TargetPartKills = dword_be(0x002d21e4)
TargetComboCount = dword_be(0x002d21ec)

SelectedCharacter = byte(0x0071b664)
Health = word_be(0x0071b640)
Ammo = word_be(0x0071b668)
AmmoCapacity = word_be(0x0071b642)

IsDan = SelectedCharacter == 1
IsCon = SelectedCharacter == 2
IsKaede = SelectedCharacter == 3
IsCoyote = SelectedCharacter == 4
IsKevin = SelectedCharacter == 6
IsMask = SelectedCharacter == 5
IsYoungHarman = SelectedCharacter == 7 && AmmoCapacity == 50
IsOldHarman = SelectedCharacter == 7 && AmmoCapacity == 6
IsGarcian = SelectedCharacter == 8

StandardCharacterLookup = {
    0: "The Smiths",
    1: "Dan Smith",
    2: "Con Smith",
    3: "KAEDE Smith",
    4: "Coyote Smith",
    5: "Mask de Smith",
    6: "Kevin Smith",
    7: "Harman Smith",
    8: "Garcian Smith"
}

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
    "Criticals": byte(0x002d78a8)
}

Kaede = {
    "Power": byte(0x002d77c0),
    "Speed": byte(0x002d7810),
    "Waver": byte(0x002d7860),
    "Criticals": byte(0x002d78b0)
}

Kevin = {
    "Power": byte(0x002d77c8),
    "Speed": byte(0x002d7818),
    "Invisibility": byte(0x002d7868),
    "Criticals": byte(0x002d78b8)
}

Mask = {
    "Power": byte(0x002d77d0),
    "Speed": byte(0x002d7820),
    "Waver": byte(0x002d7870),
    "Criticals": byte(0x002d78c0)
}

YoungHarman = {
    "Power": byte(0x002d7790),
    "Speed": byte(0x002d77e0),
    "Waver": byte(0x002d7830),
    "Criticals": byte(0x002d7880)
}

TargetLookup = {
    0x00: "33 [Angel]",
    0x01: "34 [Sunset]",
    0x02: "35 [Sunset]",
    0x03: "36 [Cloudman]",
    0x04: "37 [Encounter]",
    0x05: "37 [Encounter]",
    0x06: "38 [Alter Ego]",
    0x07: "39 [Alter Ego]",
    0x08: "40 [Smile]",
    0x09: "41 [Smile]",
    0x0b: "43 [Lion]"
}

CharacterStat1Lookup = {
    1: Dan["Power"],
    2: Con["Power"],
    3: Kaede["Power"],
    4: Coyote["Power"],
    5: Mask["Power"],
    6: Kevin["Power"],
    7: YoungHarman["Power"]
}

ModeLookup = {
    2: "Killer8",
    3: "Killer8",
    5: "Hopper7"
}

DifficultyLookup2 = {
    2: "Bloodbath",
    3: "Bloodbath",
    5: "Swarm"
}

DifficultyLookup = {
    0: "Deadly",
    1: "Deadly"
}

rich_presence_conditional_display(IsOnTitle(), "On Title")
rich_presence_conditional_display(IsOnTargetEnd(), "Wrapping Up the Assignment")
rich_presence_conditional_display(IsOnTargetSelect(), "Selecting a Target")

rich_presence_conditional_display(IsInGame(), "{0} | ASSIGNMENT: No. {1} | {2} [{3}]",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", Mode, ModeLookup, "Killer7"),
    rich_presence_lookup("ModeLookup", Difficulty, DifficultyLookup, "Killer7")
)

rich_presence_display("Playing Killer7")