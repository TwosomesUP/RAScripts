// Deathsmiles - Rich Presence
// #ID = 21889

// ======================================================================= //
// Accessors
// ======================================================================= //

GameState = byte(0x38870e)

Player1 = byte(0x60b0a)
Player2 = byte(0x60b0e)

FollettUnlocked = byte(0x38861d)
RosaUnlocked = byte(0x38861c)

//Selected character for each player
Character = {
    "P1": byte(0x53b546),
    "P2": byte(0x53b5ca)
}

//Score for each player
Score = {
    "P1": (word(0x388f60) * 0x10000 + word(0x388f62)),
    "P2": (word(0x389090) * 0x10000 + word(0x389092))
}

// ======================================================================= //
// Lookups
// ======================================================================= //

CharacterLookup = {
    0: "Windia",
    1: "Casper",
    10: "Casper",
    110: "Windia",
    210: "Follett",
    310: "Rosa",
    11: "Casper",
    111: "Windia",
    211: "Follett",
    311: "Rosa"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => GameState == 1

function IsPlaying2Player() => GetPlayer() == 11
function IsPlayer1() => GetPlayer() == 10
function IsPlayer2() => GetPlayer() == 1

function GetPlayer() => Player1 * 10 + Player2

function GetCharacter(player){
    return Character[player] * 100 + FollettUnlocked * 10 + RosaUnlocked
}

rich_presence_conditional_display(IsInGame() && IsPlayer1(), "{0} | {1} [P1]",
    rich_presence_value("Score", Score["P1"]),
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup))
    
rich_presence_display("Playing Deathsmiles")
