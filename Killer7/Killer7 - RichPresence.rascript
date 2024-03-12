// Killer7
// #ID = 7032
Disc = byte(0x00000006)

Difficulty = bit0(0x002b7a6e)
Mode = byte(0x002b7a6f)

function IsKiller7() => bit5(Mode) != 1 && bit6(Mode) != 1
function IsKiller8() => bit5(Mode) == 1
function IsHopper7() => bit6(Mode) == 1

GameState = dword_be(0x002b7580)
ScenePointer = dword_be(0x002b7538)

GameStates = {
    "None": 0x00,
    "TargetEnd": 0x10
}

TargetSelectScreens = {
    "TargetSelect1": 0x8077ae00,
    "TargetSelect2": 0x8077b5e0,
    "TargetSelect3": 0x8077c4a0,
    "TargetSelect4": 0x8077d040,
    "TargetSelect5": 0x8077d9e0,
    "TargetSelect6": 0x8077e0e0,
    "TargetSelect7": 0x8077e540,
    "TargetSelect8": 0x8077e700
}

function IsInGame() => GameState > GameStates["None"]
function IsOnTitle() => (GameState == GameStates["None"] || GameState == GameStates["TargetEnd"]) && ScenePointer == 0
function IsOnTargetSelect() => GameState == GameStates["TargetEnd"] && any_of(TargetSelectScreens, scene => ScenePointer == TargetSelectScreens[scene])

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
    1: "Dan",
    2: "Con",
    3: "KAEDE",
    4: "Coyote",
    5: "Mask de",
    6: "Kevin",
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
    0x00: "Angel",
    0x01: "Sunset",
    0x02: "Sunset",
    0x03: "Cloudman",
    0x04: "Encounter",
    0x05: "Encounter",
    0x06: "Alter Ego",
    0x07: "Alter Ego",
    0x08: "Smile",
    0x09: "Smile",
    0x0b: "Lion"
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

rich_presence_conditional_display(IsOnTitle(), "The Killer 7 are preparing for their next assignment")
rich_presence_conditional_display(IsOnTargetSelect(), "The Killer 7 are selecting their next target")

rich_presence_conditional_display(IsInGame() && !IsYoungHarman && !IsOldHarman && !IsGarcian, "{0} Smith is seeking out their next target on assignment [{1}]",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup)
)

rich_presence_display("Playing Killer7")