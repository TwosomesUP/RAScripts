// Deathsmiles - Rich Presence
// #ID = 21889

// ======================================================================= //
// Accessors
// ======================================================================= //

GameState = byte(0x38870e)
TutorialFlag = byte(0x53b4f0)

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

Lives = {
    "P1": byte(0x388f38),
    "P2": byte(0x389068)
}

Health = {
    "P1": (word(0x388f3a) / 0x40),
    "P2": (word(0x38906a) / 0x40)
}

Continues = {
    "P1": byte(0x388f66),
    "P2": byte(0x389096)
}

Bombs = byte(0x3887f6)

StageSelectState = byte(0x540316)
SelectedStage = byte(0x5402ea)
SelectedStageLevel = byte(0x5408a6)

DeathMode = byte(0x388822)
EXCompleted = byte(0x388820)

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

HealthLookup = {
    0: "0",
    1: "½",
    2: "1",
    3: "1½",
    4: "2",
    5: "2½",
    6: "3",
    7: "3½",
    8: "4",
    9: "4½",
    10: "5"
}

StageLookup = {
    0: "Port Town",
    1: "Boneyard",
    2: "Forest",
    3: "Swamp",
    4: "Lakeside", 
    5: "Volcano",
    6: "Canyon",
    7: "Castle"
}

LevelLookup = {
    0: "LV1",
    1: "LV2",
    2: "LV3"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => GameState != 0 && TutorialFlag == 0

function IsPlaying2Player() => GetPlayer() == 11
function IsPlayer1() => GetPlayer() == 10
function IsPlayer2() => GetPlayer() == 1

function GetPlayer() => Player1 * 10 + Player2

function GetCharacter(player){
    return Character[player] * 100 + FollettUnlocked * 10 + RosaUnlocked
}

function GetExtends(player){
    return Lives[player] - 3
}

function IsNormalMode() => EXCompleted == 0 && DeathMode == 0
function IsDeathMode() => DeathMode == 1 || DeathMode == 0 && EXCompleted == 1
function IsDeathModeEX() => DeathMode == 1 && EXCompleted == 1 && SelectedStage == 7

rich_presence_conditional_display(IsInGame() && IsPlayer1() && StageSelectState == 1, "{0} | {1} [P1] | Bombs: {2} | Life: {3} | Extends: {4} | Continues: {5}",
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P1"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P1")), 
    rich_presence_value("Continues", Continues["P1"]))

rich_presence_conditional_display(IsInGame() && IsPlayer1() && StageSelectState == 0 && IsNormalMode(), "{0} | {1} [P1] | {2} [{3}] | Bombs: {4} | Life: {5} | Extends: {6} | Continues: {7}",
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_lookup("LevelLookup", SelectedStageLevel, LevelLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P1"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P1")), 
    rich_presence_value("Continues", Continues["P1"]))
    
rich_presence_conditional_display(IsInGame() && IsPlayer1() && StageSelectState == 0 && IsDeathMode(), "{0} | {1} [P1] | {2} [Death Mode] | Bombs: {3} | Life: {4} | Extends: {5} | Continues: {6}",
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P1"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P1")), 
    rich_presence_value("Continues", Continues["P1"]))

rich_presence_conditional_display(IsInGame() && IsPlayer1() && StageSelectState == 0 && IsDeathModeEX(), "{0} | {1} [P1] | {2} [Death Mode EX] | Bombs: {3} | Life: {4} | Extends: {5} | Continues: {6}",
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P1"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P1")), 
    rich_presence_value("Continues", Continues["P1"]))

rich_presence_conditional_display(IsInGame() && IsPlayer2() && StageSelectState == 0 && IsNormalMode(), "{0} | {1} [P2] | {2} [{3}] | Bombs: {4} | Life: {5} | Extends: {6} | Continues: {7}",
    rich_presence_value("Score", Score["P2"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_lookup("LevelLookup", SelectedStageLevel, LevelLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P2"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P2")), 
    rich_presence_value("Continues", Continues["P2"]))
    
rich_presence_conditional_display(IsInGame() && IsPlayer2() && StageSelectState == 0 && IsDeathMode(), "{0} | {1} [P2] | {2} [Death Mode] | Bombs: {3} | Life: {4} | Extends: {5} | Continues: {6}",
    rich_presence_value("Score", Score["P2"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P2"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P2")), 
    rich_presence_value("Continues", Continues["P2"]))

rich_presence_conditional_display(IsInGame() && IsPlayer2() && StageSelectState == 0 && IsDeathModeEX(), "{0} | {1} [P2] | {2} [Death Mode EX] | Bombs: {3} | Life: {4} | Extends: {5} | Continues: {6}",
    rich_presence_value("Score", Score["P2"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_value("Bombs", Bombs),
    rich_presence_lookup("HealthLookup", Health["P2"], HealthLookup),
    rich_presence_value("Extends", GetExtends("P2")), 
    rich_presence_value("Continues", Continues["P2"]))
    
rich_presence_conditional_display(IsInGame() && IsPlaying2Player() && StageSelectState == 1, "{0} [P1]: {1} | {2} [P2]: {3}",
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_value("Score", Score["P2"], "SCORE"))
    
rich_presence_conditional_display(IsInGame() && IsPlaying2Player() && StageSelectState == 0 && IsNormalMode(), "Playing 2 Player | {0} [P1]: {1} | {2} [P2]: {3} | {4} [{5}]",
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_value("Score", Score["P2"], "SCORE"),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup),
    rich_presence_lookup("LevelLookup", SelectedStageLevel, LevelLookup))
    
rich_presence_conditional_display(IsInGame() && IsPlaying2Player() && StageSelectState == 0 && IsDeathMode(), "Playing 2 Player | {0} [P1]: {1} | {2} [P2]: {3} | {4} [Death Mode]",
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_value("Score", Score["P2"], "SCORE"),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup))
    
rich_presence_conditional_display(IsInGame() && IsPlaying2Player() && StageSelectState == 0 && IsDeathModeEX(), "Playing 2 Player | {0} [P1]: {1} | {2} [P2]: {3} | {4} [Death Mode EX]",
    rich_presence_lookup("CharacterLookup", GetCharacter("P1"), CharacterLookup),
    rich_presence_value("Score", Score["P1"], "SCORE"),
    rich_presence_lookup("CharacterLookup", GetCharacter("P2"), CharacterLookup),
    rich_presence_value("Score", Score["P2"], "SCORE"),
    rich_presence_lookup("StageLookup", SelectedStage, StageLookup))

rich_presence_display("Playing Deathsmiles")
