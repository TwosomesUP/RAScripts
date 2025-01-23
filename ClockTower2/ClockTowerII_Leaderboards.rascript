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

EndingRanks = {
    "A": 0x00,
    "B": 0x01,
    "C": 0x02,
    "D": 0x03,
    "E": 0x04,
    "F": 0x05,
    "G": 0x06,
    "H": 0x07,
    "I": 0x08,
    "J": 0x09,
    "K": 0x0a,
    "L": 0x0b,
    "M": 0x0c
}

EndingSequences = {
    "ToEnding": 0x00,
    "Cutscene": 0x01,
    "ToCredits": 0x02,
    "Credits": 0x03,
    "RankScreen": 0x04,
    "RankScreenFade": 0x05,
    "ToTitle": 0x08,
    "RankASplash": 0x09
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

function GetTotalSeconds() => Game["PlayTime"] / 30

function NoMilicana() => Game["Cheats"]["Milicana"] == 0

// ======================================================================= //
// Leaderboard Functions
// ======================================================================= //

function EndingAStart(){
    return IsInEnding() &&
        Game["Mode"] == GameModes["Standard"] &&
        Game["Ending"]["Rank"] == EndingRanks["A"] &&
        prev(Game["Ending"]["Sequence"]) == EndingSequences["RankASplash"] &&
        Game["Ending"]["Sequence"] == EndingSequences["RankScreen"] &&
        disable_when(Game["Cheats"]["Milicana"] != 0)
}

function EndingMStart(){
    return IsInEnding() &&
        Game["Mode"] == GameModes["Standard"] &&
        Game["Ending"]["Rank"] == EndingRanks["M"] &&
        prev(Game["Ending"]["Sequence"]) == EndingSequences["Credits"] &&
        Game["Ending"]["Sequence"] == EndingSequences["RankScreen"] &&
        disable_when(Game["Cheats"]["Milicana"] != 0)
}


function SubmitTime(){
    return GetTotalSeconds()
}

leaderboard("Speed Run Challenge - RANK A", "Beat the game with an Ending Rank of A with the fastest in-game time [No Milicana]",
    start = EndingAStart(),
    cancel = always_false(),
    submit = always_true(),
    value = SubmitTime(),
    format = "SECS"
)

leaderboard("Speed Run Challenge - RANK M", "Beat the game with an Ending Rank of M with the fastest in-game time [No Milicana]",
    start = EndingMStart(),
    cancel = always_false(),
    submit = always_true(),
    value = SubmitTime(),
    format = "SECS"
)










