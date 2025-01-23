// Clock Tower II: The Struggle Within | Clock Tower: Ghost Head
// #ID = 12746
// Author: TwosomesUP
// Rich Presence Script

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "State": byte(0x57d44),
    "Mode": byte(0x57d64),
    "Ending": {
        "Rank": byte(0x57d65),
        "Sequence": byte(0x76810)
    },
    "Cheats": {
        "Sailor": bit0(0x57d67),
        "Monkey": bit1(0x57d67),
        "Milicana": bit2(0x57d67),
        "Sound": bit3(0x57d67)
    },
    "Chapter": byte(0x5c8f8),
    "Endings": {
        "A": bit0(0x6f048),
        "B": bit1(0x6f048),
        "C": bit2(0x6f048),
        "D": bit3(0x6f048),
        "E": bit4(0x6f048),
        "F": bit5(0x6f048),
        "G": bit6(0x6f048),
        "H": bit7(0x6f048),
        "I": bit0(0x6f049),
        "J": bit1(0x6f049),
        "K": bit2(0x6f049),
        "L": bit3(0x6f049),
        "M": bit4(0x6f049)
    },
    "Hints": {
        "1": bit0(0x6f04a),
        "2": bit1(0x6f04a),
        "3": bit2(0x6f04a),
        "4": bit3(0x6f04a),
        "5": bit4(0x6f04a),
        "6": bit5(0x6f04a),
        "7": bit6(0x6f04a),
        "8": bit7(0x6f04a),
    },
    "Room": word(0x70a34),
    "PlayTime": dword(0x70a54),
    "ScoreAttack": {
        "Rate": dword(0xd84f0),
        "Limit": dword(0xd84f8),
        "Score": dword(0xd9990),
        "Enemies": byte(0xd99ec)
    },
    "TimeAttack": {
        "Time": dword(0x70a54),
        "Enemies": byte(0xd99ec)
    }
}

Alyssa = {
    "Health": byte(0x70a18),
    "IsBates": bit5(0x70a20)
}

// ======================================================================= //
// Data Lookups
// ======================================================================= //

GameStates = {
    "Title": 0,
    "Game": 1,
    "Ending": 2
}

GameModes = {
    "Standard": 0,
    "TimeAttack": 1,
    "ScoreAttack": 2
}


// ======================================================================= //
// Rich Presence Lookups
// ======================================================================= //

CheatLookups = {
    "Monkey": {
        0: "",
        1: "Monkey "
    },
    "Sailor": {
        0: "",
        1: "Sailor "
    },
    "Milicana": {
        0: "",
        1: " using untold power!"
    }
}

ChapterLookups = {
    1: "moving to the next location",
    2: "unraveling mysteries in Chapter 1 | ",
    3: "avoiding the undead in Chapter 2 | ",
    4: "trying not to panic in Chapter 3 | ",
    5: "trying not to panic in Chapter 3 | "
}

RoomLookups = {
    0x200: "1F Entryway",
    0x201: "1F Toilet",
    0x202: "1F Bathroom",
    0x203: "1F Guest Bedroom",
    0x204: "1F Dining Hall",
    0x205: "1F Kitchen",
    0x206: "1F Dinette",
    0x207: "1F Storage Room",
    0x208: "1F Master Bedroom",
    0x209: "1F Corridor",
    0x20a: "1F Den",
    0x20b: "Basement",
    0x20c: "2F Stairwell",
    0x20d: "2F Toilet",
    0x20e: "2F Living Room",
    0x20f: "2F Northern Balcony",
    0x210: "2F Shrine Room",
    0x211: "2F Stephanie's Room",
    0x212: "2F Hallway",
    0x213: "2F Ashley's Room",
    0x214: "2F Michael's Room",
    0x215: "2F Southern Balcony",
    0x216: "1F Dinette",
    0x217: "1F Dining Hall",
    0x218: "1F Master Bedroom",
    0x300: "1F Main Hallway",
    0x301: "1F Southern Hallway",
    0x302: "1F Computer Room",
    0x303: "1F Women's Bathroom",
    0x304: "1F Men's Bathroom",
    0x305: "1F Room 102",
    0x306: "1F Room 101",
    0x307: "1F Staff Room",
    0x308: "1F Nurse's Office",
    0x309: "1F Northern Hallway",
    0x30a: "1F Room 103",
    0x30b: "1F Room 104",
    0x30c: "1F Back Door",
    0x30d: "1F Exam Room",
    0x30e: "2F Storage Room",
    0x30f: "2F Main Hallway",
    0x310: "2F Director's Office",
    0x311: "Elevator",
    0x312: "1F Room 103",
    0x400: "1F Reception",
    0x401: "1F Hallway 3",
    0x402: "1F Office 1",
    0x403: "1F Exam Room",
    0x404: "1F Hallway 2",
    0x405: "1F Storeroom 1",
    0x406: "1F Hallway 1",
    0x407: "1F Lab 1",
    0x408: "1F Hallway 4",
    0x409: "1F Courtyard",
    0x40a: "1F Office 2",
    0x40b: "1F Women's Bathroom",
    0x40c: "1F Men's Bathroom",
    0x40d: "1F Hallway 5",
    0x40e: "1F Office 3",
    0x40f: "1F Lab 2",
    0x410: "1F Hallway 6",
    0x411: "1F Showers",
    0x412: "1F Hallway 7",
    0x413: "1F Lab 3",
    0x414: "B1 Graveyard",
    0x415: "2F Hallway 8",
    0x416: "2F Hallway 9",
    0x417: "2F Office 4",
    0x418: "2F Lab 4",
    0x419: "2F Storeroom 2",
    0x41a: "2F Men's Bathroom",
    0x41b: "2F Western Hallway",
    0x41c: "2F Storeroom 3",
    0x41d: "2F Library",
    0x41e: "2F Hallway 10",
    0x51e: "2F Hallway 10",
    0x41f: "2F Office 5",
    0x420: "2F Director's Office",
    0x421: "2F Women's Bathroom",
    0x521: "2F Women's Bathroom",
    0x522: "2F Hallway 11",
    0x523: "2F Eastern Hallway",
    0x524: "2F Server Room",
    0x525: "B1 Lab 5",
    0x526: "B1 Hallway 12",
    0x527: "B1 Lab 6",
    0x528: "B1 Graveyard Entryway",
    0x529: "B1 Hallway 13",
    0x52a: "B1 Incinerator Room",
    0x52b: "B1 Entryway",
    0x52c: "B1 Lab 7",
    0x52d: "B1 Lab 8",
    0x52e: "B2 Hallway 15",
    0x52f: "B2 Morgue",
    0x530: "B2 Morgue 2",
    0x531: "B2 Hallway 16",
    0x532: "B2 Chapel",
    0x533: "B1 Stairwell",
    0x534: "B1 Stairwell 2",
    0x535: "2F Elevator",
    0x536: "1F Elevator",
    0x537: "B2 Chapel Entryway"
}

EndingLookups = {
    "A": {
        0: "-",
        1: "A"
    },
    "B": {
        0: "-",
        1: "B"
    },
    "C": {
        0: "-",
        1: "C"
    },
    "D": {
        0: "-",
        1: "D"
    },
    "E": {
        0: "-",
        1: "E"
    },
    "F": {
        0: "-",
        1: "F"
    },
    "G": {
        0: "-",
        1: "G"
    },
    "H": {
        0: "-",
        1: "H"
    },
    "I": {
        0: "-",
        1: "I"
    },
    "J": {
        0: "-",
        1: "J"
    },
    "K": {
        0: "-",
        1: "K"
    },
    "L": {
        0: "-",
        1: "L"
    },
    "M": {
        0: "-",
        1: "M"
    }
}

HintLookups = {
    "1": {
        0: "-",
        1: "1"
    },
    "2": {
        0: "-",
        1: "2"
    },
    "3": {
        0: "-",
        1: "3"
    },
    "4": {
        0: "-",
        1: "4"
    },
    "5": {
        0: "-",
        1: "5"
    },
    "6": {
        0: "-",
        1: "6"
    },
    "7": {
        0: "-",
        1: "7"
    },
    "8": {
        0: "-",
        1: "8"
    },
}

AlyssaLookups = {
    0: "Alyssa",
    1: "Bates"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsOnTitle() => Game["State"] == GameStates["Title"]
function IsInGame() => Game["State"] == GameStates["Game"]
function IsInEnding() => Game["State"] == GameStates["Ending"]

function IsPlayingStandard() => IsInGame() && Game["Mode"] == GameModes["Standard"]
function IsPlayingTimeAttack() => IsInGame() && Game["Mode"] == GameModes["TimeAttack"]
function IsPlayingScoreAttack() => IsInGame() && Game["Mode"] == GameModes["ScoreAttack"]

function GetRoomID(){
    return Game["Chapter"] * 0x100 + Game["Room"]
}

function GetTotalSeconds() => Game["PlayTime"] / 30

function GetHours() => GetTotalSeconds() / 3600

function GetMinutes() {
    total_seconds = GetTotalSeconds()
    hours = total_seconds / 3600
    remaining_seconds = total_seconds - (hours * 3600)
    return remaining_seconds
}

function GetSeconds() {
    total_seconds = GetTotalSeconds()
    hours = total_seconds / 3600
    remaining_seconds = total_seconds - (hours * 3600)
    minutes = remaining_seconds / 60
    remaining_seconds = remaining_seconds - (minutes * 60)
    return remaining_seconds
}

rich_presence_conditional_display(IsOnTitle(), "{0}{1}Alyssa is exploring their options{2} | 📜 {3} {4} {5} {6} {7} {8} {9} {10} {11} {12} {13} {14} {15} | 🔎 {16} {17} {18} {19} {20} {21} {22} {23}",
    rich_presence_lookup("MonkeySuit", Game["Cheats"]["Monkey"], CheatLookups["Monkey"]),
    rich_presence_lookup("SailorSuit", Game["Cheats"]["Sailor"], CheatLookups["Sailor"]),
    rich_presence_lookup("Milicana", Game["Cheats"]["Milicana"], CheatLookups["Milicana"]),
    rich_presence_lookup("EndingA", Game["Endings"]["A"], EndingLookups["A"]),
    rich_presence_lookup("EndingB", Game["Endings"]["B"], EndingLookups["B"]),
    rich_presence_lookup("EndingC", Game["Endings"]["C"], EndingLookups["C"]),
    rich_presence_lookup("EndingD", Game["Endings"]["D"], EndingLookups["D"]),
    rich_presence_lookup("EndingE", Game["Endings"]["E"], EndingLookups["E"]),
    rich_presence_lookup("EndingF", Game["Endings"]["F"], EndingLookups["F"]),
    rich_presence_lookup("EndingG", Game["Endings"]["G"], EndingLookups["G"]),
    rich_presence_lookup("EndingH", Game["Endings"]["H"], EndingLookups["H"]),
    rich_presence_lookup("EndingI", Game["Endings"]["I"], EndingLookups["I"]),
    rich_presence_lookup("EndingJ", Game["Endings"]["J"], EndingLookups["J"]),
    rich_presence_lookup("EndingK", Game["Endings"]["K"], EndingLookups["K"]),
    rich_presence_lookup("EndingL", Game["Endings"]["L"], EndingLookups["L"]),
    rich_presence_lookup("EndingM", Game["Endings"]["M"], EndingLookups["M"]),
    rich_presence_lookup("Hint1", Game["Hints"]["1"], HintLookups["1"]),
    rich_presence_lookup("Hint2", Game["Hints"]["2"], HintLookups["2"]),
    rich_presence_lookup("Hint3", Game["Hints"]["3"], HintLookups["3"]),
    rich_presence_lookup("Hint4", Game["Hints"]["4"], HintLookups["4"]),
    rich_presence_lookup("Hint5", Game["Hints"]["5"], HintLookups["5"]),
    rich_presence_lookup("Hint6", Game["Hints"]["6"], HintLookups["6"]),
    rich_presence_lookup("Hint7", Game["Hints"]["7"], HintLookups["7"]),
    rich_presence_lookup("Hint8", Game["Hints"]["8"], HintLookups["8"])
)

rich_presence_conditional_display(IsInEnding(), "{0}{1}{2} is reflecting on past actions{3} | 📜 {4} {5} {6} {7} {8} {9} {10} {11} {12} {13} {14} {15} {16} | 🔎 {17} {18} {19} {20} {21} {22} {23} {24} | 🕓 {25}",
    rich_presence_lookup("MonkeySuit", Game["Cheats"]["Monkey"], CheatLookups["Monkey"]),
    rich_presence_lookup("SailorSuit", Game["Cheats"]["Sailor"], CheatLookups["Sailor"]),
    rich_presence_lookup("Alyssa", Alyssa["IsBates"], AlyssaLookups),
    rich_presence_lookup("Milicana", Game["Cheats"]["Milicana"], CheatLookups["Milicana"]),
    rich_presence_lookup("EndingA", Game["Endings"]["A"], EndingLookups["A"]),
    rich_presence_lookup("EndingB", Game["Endings"]["B"], EndingLookups["B"]),
    rich_presence_lookup("EndingC", Game["Endings"]["C"], EndingLookups["C"]),
    rich_presence_lookup("EndingD", Game["Endings"]["D"], EndingLookups["D"]),
    rich_presence_lookup("EndingE", Game["Endings"]["E"], EndingLookups["E"]),
    rich_presence_lookup("EndingF", Game["Endings"]["F"], EndingLookups["F"]),
    rich_presence_lookup("EndingG", Game["Endings"]["G"], EndingLookups["G"]),
    rich_presence_lookup("EndingH", Game["Endings"]["H"], EndingLookups["H"]),
    rich_presence_lookup("EndingI", Game["Endings"]["I"], EndingLookups["I"]),
    rich_presence_lookup("EndingJ", Game["Endings"]["J"], EndingLookups["J"]),
    rich_presence_lookup("EndingK", Game["Endings"]["K"], EndingLookups["K"]),
    rich_presence_lookup("EndingL", Game["Endings"]["L"], EndingLookups["L"]),
    rich_presence_lookup("EndingM", Game["Endings"]["M"], EndingLookups["M"]),
    rich_presence_lookup("Hint1", Game["Hints"]["1"], HintLookups["1"]),
    rich_presence_lookup("Hint2", Game["Hints"]["2"], HintLookups["2"]),
    rich_presence_lookup("Hint3", Game["Hints"]["3"], HintLookups["3"]),
    rich_presence_lookup("Hint4", Game["Hints"]["4"], HintLookups["4"]),
    rich_presence_lookup("Hint5", Game["Hints"]["5"], HintLookups["5"]),
    rich_presence_lookup("Hint6", Game["Hints"]["6"], HintLookups["6"]),
    rich_presence_lookup("Hint7", Game["Hints"]["7"], HintLookups["7"]),
    rich_presence_lookup("Hint8", Game["Hints"]["8"], HintLookups["8"]),
    rich_presence_value("Time", Game["PlayTime"] / 30, "SECS")
)

rich_presence_conditional_display(IsPlayingStandard(), "{0}{1}{2} is {3}{4}{5} | 📜 {6} {7} {8} {9} {10} {11} {12} {13} {14} {15} {16} {17} {18} | 🔎 {19} {20} {21} {22} {23} {24} {25} {26} | 🕓 {27}",
    rich_presence_lookup("MonkeySuit", Game["Cheats"]["Monkey"], CheatLookups["Monkey"]),
    rich_presence_lookup("SailorSuit", Game["Cheats"]["Sailor"], CheatLookups["Sailor"]),
    rich_presence_lookup("Alyssa", Alyssa["IsBates"], AlyssaLookups),
    rich_presence_lookup("Chapter", Game["Chapter"], ChapterLookups),
    rich_presence_lookup("Room", GetRoomID(), RoomLookups),
    rich_presence_lookup("Milicana", Game["Cheats"]["Milicana"], CheatLookups["Milicana"]),
    rich_presence_lookup("EndingA", Game["Endings"]["A"], EndingLookups["A"]),
    rich_presence_lookup("EndingB", Game["Endings"]["B"], EndingLookups["B"]),
    rich_presence_lookup("EndingC", Game["Endings"]["C"], EndingLookups["C"]),
    rich_presence_lookup("EndingD", Game["Endings"]["D"], EndingLookups["D"]),
    rich_presence_lookup("EndingE", Game["Endings"]["E"], EndingLookups["E"]),
    rich_presence_lookup("EndingF", Game["Endings"]["F"], EndingLookups["F"]),
    rich_presence_lookup("EndingG", Game["Endings"]["G"], EndingLookups["G"]),
    rich_presence_lookup("EndingH", Game["Endings"]["H"], EndingLookups["H"]),
    rich_presence_lookup("EndingI", Game["Endings"]["I"], EndingLookups["I"]),
    rich_presence_lookup("EndingJ", Game["Endings"]["J"], EndingLookups["J"]),
    rich_presence_lookup("EndingK", Game["Endings"]["K"], EndingLookups["K"]),
    rich_presence_lookup("EndingL", Game["Endings"]["L"], EndingLookups["L"]),
    rich_presence_lookup("EndingM", Game["Endings"]["M"], EndingLookups["M"]),
    rich_presence_lookup("Hint1", Game["Hints"]["1"], HintLookups["1"]),
    rich_presence_lookup("Hint2", Game["Hints"]["2"], HintLookups["2"]),
    rich_presence_lookup("Hint3", Game["Hints"]["3"], HintLookups["3"]),
    rich_presence_lookup("Hint4", Game["Hints"]["4"], HintLookups["4"]),
    rich_presence_lookup("Hint5", Game["Hints"]["5"], HintLookups["5"]),
    rich_presence_lookup("Hint6", Game["Hints"]["6"], HintLookups["6"]),
    rich_presence_lookup("Hint7", Game["Hints"]["7"], HintLookups["7"]),
    rich_presence_lookup("Hint8", Game["Hints"]["8"], HintLookups["8"]),
    rich_presence_value("Time", Game["PlayTime"] / 30, "SECS")
)

rich_presence_conditional_display(IsPlayingTimeAttack(), "{0}{1}{2} is dispatching zombies quickly{3} | 💀 {4}/19 | 🕓 {5}",
    rich_presence_lookup("MonkeySuit", Game["Cheats"]["Monkey"], CheatLookups["Monkey"]),
    rich_presence_lookup("SailorSuit", Game["Cheats"]["Sailor"], CheatLookups["Sailor"]),
    rich_presence_lookup("Alyssa", Alyssa["IsBates"], AlyssaLookups),
    rich_presence_lookup("Milicana", Game["Cheats"]["Milicana"], CheatLookups["Milicana"]),
    rich_presence_value("Zombies", Game["TimeAttack"]["Enemies"]),
    rich_presence_value("Time", Game["PlayTime"] / 30, "SECS")
)

rich_presence_conditional_display(IsPlayingScoreAttack(), "{0}{1}{2} is dispatching zombies for sport{3} | 💀 {4}/16 | 🏆 {5}",
    rich_presence_lookup("MonkeySuit", Game["Cheats"]["Monkey"], CheatLookups["Monkey"]),
    rich_presence_lookup("SailorSuit", Game["Cheats"]["Sailor"], CheatLookups["Sailor"]),
    rich_presence_lookup("Alyssa", Alyssa["IsBates"], AlyssaLookups),
    rich_presence_lookup("Milicana", Game["Cheats"]["Milicana"], CheatLookups["Milicana"]),
    rich_presence_value("Zombies", Game["ScoreAttack"]["Enemies"]),
    rich_presence_value("Score", Game["ScoreAttack"]["Score"], "POINTS")
)

rich_presence_display("Experiencing the horrors of Clock Tower II: The Struggle Within")

