// Killer7
// #ID = 7032
Disc = byte(0x00000006)

Difficulty = bit0(0x002b7a6e)

//Remove the values of bits 4 and 7 to just get the values of Killer8 and Hopper7
Mode = high4(0x002b7a6f) - ((bit7(0x002b7a6f) * 8) + bit4(0x002b7a6f))
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

ModeLookup = {
    0: "Killer7 [Deadly]",
    1: "Killer7 [Normal]",
    2: "Killer8 [Bloodbath]",
    4: "Hopper7 [Face the Swarm]"
}

function IsKiller7() => CalculateModeAndDifficulty() == 0 || CalculateModeAndDifficulty() == 1
function IsKiller8() => CalculateModeAndDifficulty() == 2
function IsHopper7() => CalculateModeAndDifficulty() == 4

function IsInGame() => GamePointer != 0
function IsOnTitle() => GamePointer == 0 && ScenePointer == 0
function IsOnTargetEnd() => GamePointer == 0 && ScenePointer != 0 && any_of(TargetEndScreens, scene => ScenePointer == TargetEndScreens[scene])
function IsOnTargetSelect() => GamePointer == 0 && ScenePointer != 0 && none_of(TargetEndScreens, scene => ScenePointer == TargetEndScreens[scene])

function CalculateModeAndDifficulty(){
    return Mode + Difficulty
}

function CharacterHasStats(){
    return (SelectedCharacter > 0 && SelectedCharacter < 7) || IsYoungHarman
}

function GetCharacterStat1(){
    return CharacterStat1Lookup[SelectedCharacter]
}

rich_presence_conditional_display(IsOnTitle(), "On Title")
rich_presence_conditional_display(IsOnTargetEnd(), "Wrapping Up the Assignment")
rich_presence_conditional_display(IsOnTargetSelect(), "Selecting a Target")

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsDan, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Waver LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("DanPower", Dan["Power"]),
    rich_presence_value("DanSpeed", Dan["Speed"]),
    rich_presence_value("DanWaver", Dan["Waver"]),
    rich_presence_value("DanCriticals", Dan["Critical"])
)

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsCon, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Waver LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("ConPower", Con["Power"]),
    rich_presence_value("ConSpeed", Con["Speed"]),
    rich_presence_value("ConWaver", Con["Waver"]),
    rich_presence_value("ConCriticals", Con["Critical"])
)

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsCoyote, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Waver LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("CoyotePower", Coyote["Power"]),
    rich_presence_value("CoyoteSpeed", Coyote["Speed"]),
    rich_presence_value("CoyoteWaver", Coyote["Waver"]),
    rich_presence_value("CoyoteCriticals", Coyote["Critical"])
)

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsKaede, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Waver LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("KaedePower", Kaede["Power"]),
    rich_presence_value("KaedeSpeed", Kaede["Speed"]),
    rich_presence_value("KaedeWaver", Kaede["Waver"]),
    rich_presence_value("KaedeCriticals", Kaede["Critical"])
)

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsKevin, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Invisibility LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("KevinPower", Kevin["Power"]),
    rich_presence_value("KevinSpeed", Kevin["Speed"]),
    rich_presence_value("KevinInvisiblity", Kevin["Invisibility"]),
    rich_presence_value("KevinCriticals", Kevin["Critical"])
)

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsMask, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Waver LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("MaskPower", Mask["Power"]),
    rich_presence_value("MaskSpeed", Mask["Speed"]),
    rich_presence_value("MaskWaver", Mask["Waver"]),
    rich_presence_value("MaskCriticals", Mask["Critical"])
)

rich_presence_conditional_display(IsInGame() && CharacterHasStats() && IsYoungHarman, "{0} | ASSIGNMENT: No. {1} | {2} | Power LV{3} • Speed LV{4} • Waver LV{5} • Criticals LV{6}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode"),
    rich_presence_value("YoungHarmanPower", YoungHarman["Power"]),
    rich_presence_value("YoungHarmanSpeed", YoungHarman["Speed"]),
    rich_presence_value("YoungHarmanWaver", YoungHarman["Waver"]),
    rich_presence_value("YoungHarmanCriticals", YoungHarman["Critical"])
)

rich_presence_conditional_display(IsInGame() && !CharacterHasStats(), "{0} | ASSIGNMENT: No. {1} | {2}",
    rich_presence_lookup("CharacterLookup", SelectedCharacter, StandardCharacterLookup),
    rich_presence_lookup("TargetLookup", Mission, TargetLookup),
    rich_presence_lookup("ModeLookup", CalculateModeAndDifficulty(), ModeLookup, "Unknown Mode")
)

rich_presence_display("Playing Killer7")