// Clock Tower II: The Struggle Within | Clock Tower: Ghost Head
// #ID = 12746
// Author: TwosomesUP
// Achievement Script

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
        "All": {
            "1": bit0(0x6f04a),
            "2": bit1(0x6f04a),
            "3": bit2(0x6f04a),
            "4": bit3(0x6f04a),
            "5": bit4(0x6f04a),
            "6": bit5(0x6f04a),
            "7": bit6(0x6f04a),
            "8": bit7(0x6f04a)
        },
        "Chapter1":{
            "1": bit0(0x6f04a),
            "2": bit1(0x6f04a),
            "3": bit2(0x6f04a),
            "4": bit3(0x6f04a)
        },
        "Chapter2":{
            "5": bit4(0x6f04a),
            "6": bit5(0x6f04a)
        },
        "Chapter3":{
            "7": bit6(0x6f04a),
            "8": bit7(0x6f04a)
        }
    },
    "Room": word(0x70a34),
    "EventPointer": tbyte(0xd9a10),
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

Offsets = {
    "SceneID": 0x14,
    "ObjectID": 0x18,
    "SceneTimer": 0x16
}

Room = {
    "Chapter1": {
        "DiningHallFinale": 0x17,
        "Chapter2Begin": 0x12,
        "AshleysRoom": 0x13
    },
    "Chapter2":{
        "BackDoor": 0x0c,
        "Chapter3Begin": 0x2b,
        "WomensBathroom": 0x3,
        "StaffOffice": 0x7
    },
    "Chapter3": {
        "Hallway3": 0x1,
        "Hallway5": 0xd,
        "MensBathroom": 0xc,
        "WomensBathroom": 0x21
    }
}

Events = {
    "Chapter1": {
        "Begin": bit6(0x708c8),
        "DiningKey": bit0(0x708d1),
        "Leg": bit0(0x708c8),
        "Torso": bit1(0x708c8),
        "Arm": bit2(0x708c8),
        "Head": bit3(0x708c8),
        "Amulet": bit5(0x708d0),
        "Samurai": bit7(0x708ca),
        "MasterBedroomKey": bit2(0x708cb),
        "OilCan": bit6(0x708c9),
        "Letter": bit0(0x708ca),
        "CorridorKey": bit0(0x70968),
        "Lighter": bit4(0x708ca),
        "CursedStatue": bit6(0x708d0),
        "Piano": bit3(0x708cc),
        "DinettePainting": bit2(0x708c9),
        "LivingRoomPainting": bit0(0x708cb),
        "Phone": bit5(0x708d4),
        "Pot": bit6(0x708cd),
        "Pan": bit7(0x708cc),
        "Doll": bit7(0x708cb),
        "ChinaCabinet": bit1(0x708c9),
        "Clock": bit2(0x708d4),
        "Michael": bit3(0x708d6),
        "MichaelTrap": bit6(0x708cb)
    },
    "Chapter2": {
        "Begin": bit4(0x708ec),
        "Newspaper": bit3(0x708ed),
        "StorageRoomKey": bit7(0x708ea),
        "Alex": bit1(0x708ef),
        "Screwdriver": bit0(0x708ef),
        "BackDoorKey": bit7(0x708ee),
        "ZombieNote": bit5(0x708eb),
        "Voice1": bit7(0x708e8),
        "Voice2": bit0(0x708ea),
        "Voice3": bit7(0x708eb),
        "Voice4": bit7(0x708ec),
        "Director": bit6(0x708ee),
        "Shannon": bit6(0x708ef),
        "Bowman": bit7(0x708ed),
        "Chair1": bit3(0x708e9),
        "Chair2": bit5(0x708ea),
        "Chair3": bit4(0x708ed)
    },
    "Chapter3": {
        "Begin": bit5(0x70914),
        "ExamRoomKey": bit7(0x70909),
        "BlueKeyCard": bit3(0x7090b),
        "Wire": bit1(0x7090e),
        "SecurityKey": bit6(0x7090e),
        "DeskKey": bit6(0x7090a),
        "StorageKey": bit7(0x7090e),
        "Lighter": bit5(0x70913),
        "LabKey": bit4(0x70913),
        "HandcuffKey": bit1(0x70910),
        "RedKeyCard": bit1(0x70916),
        "GreenKeyCard": bit7(0x70912),
        "Hatchet": bit3(0x70914),
        "GraveyardKey": bit0(0x70914),
        "LargeDoorKey": bit1(0x70917),
        "BowmanTorso": bit3(0x7090a),
        "BowmanLegs": bit2(0x7090b),
        "TitleCard": bit2(0x70917),
        "Locker1": bit1(0x70918),
        "Locker2": bit6(0x7090b),
        "Locker3": bit3(0x70909),
        "ToyGun": bit0(0x7091a),
        "ShotgunDispenser": bit0(0x70912),
        "Knife": bit0(0x709e4)
    }
}

RoomEvents = {
    "Chapter1": {
        "Poster": {
            "Object": 0x5,
            "StartScene": 0x6,
            "EndScene": 0x6
        }
    },
    "Chapter2":{
        "BroomZombie": {
            "Object": 0x5,
            "StartScene": 0x1,
            "EndScene": 0x1e
        },
        "PanicLights": {
            "Object": 0x4,
            "StartScene": 0x3f,
            "EndScene": 0x3f
        }
    },
    "Chapter3": {
        "Extinguisher": {
            "Object": 0x7,
            "StartScene": 0x1,
            "EndScene": 0x1b
        },
        "Urinal": {
            "Object": 0x2,
            "StartScene": 0xc,
            "EndScene": 0x6
        },
        "Mirror": {
            "Object": 0x2,
            "StartScene": 0x7,
            "EndScene": 0xe
        }   
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

Chapters = {
    "Chapter1": 2,
    "Chapter2": 3,
    "Chapter3_1": 4,
    "Chapter3_2": 5
}

Weapons = {
    "Chapter1": {
        "Pistol": byte(0x70954)
    },
    "Chapter2": {
        "Pistol": byte(0x709a4),
        "Shotgun": byte(0x709a8)
    },
    "Chapter3": {
        "Pistol": byte(0x709cc),
        "Shotgun": byte(0x709d0),
        "MachineGun": byte(0x709d4)
    }
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

function StartedNewGame(){
    return once(IsPlayingStandard() && prev(Events["Chapter1"]["Begin"]) < Events["Chapter1"]["Begin"] && never(IsOnTitle()))
}

function CompletedChapterEvent(chapter, event){
    chapterCheck = always_false() 

    if(chapter == "Chapter3")
        chapterCheck = Game["Chapter"] >= Chapters["Chapter3_1"] &&
            Game["Chapter"] <= Chapters["Chapter3_2"]
    else
        chapterCheck = Game["Chapter"] == Chapters[chapter]

    return NoMilicana() &&
        IsInGame() &&
        chapterCheck &&
        prev(Events[chapter][event]) <
        Events[chapter][event]
}

function TriggerRoomEvent(chapter, room, event){
    chapterCheck = always_false() 

    if(chapter == "Chapter3")
        chapterCheck = Game["Chapter"] >= Chapters["Chapter3_1"] &&
            Game["Chapter"] <= Chapters["Chapter3_2"]
    else
        chapterCheck = Game["Chapter"] == Chapters[chapter]
        
    objectID = word(Game["EventPointer"] + Offsets["ObjectID"])
    sceneID = word(Game["EventPointer"] + Offsets["SceneID"])
    
    return NoMilicana() &&
        IsInGame() &&
        chapterCheck &&
        Game["Room"] == Room[chapter][room] &&
        objectID == RoomEvents[chapter][event]["Object"] &&
        prev(sceneID) == RoomEvents[chapter][event]["StartScene"] &&
        sceneID == RoomEvents[chapter][event]["EndScene"]
}

function TriggerRoomEvent_Timer(chapter, room, event){
    chapterCheck = always_false() 

    if(chapter == "Chapter3")
        chapterCheck = Game["Chapter"] >= Chapters["Chapter3_1"] &&
            Game["Chapter"] <= Chapters["Chapter3_2"]
    else
        chapterCheck = Game["Chapter"] == Chapters[chapter]
        
    objectID = word(Game["EventPointer"] + Offsets["ObjectID"])
    sceneID = word(Game["EventPointer"] + Offsets["SceneID"])
    timer = word(Game["EventPointer"] + Offsets["SceneTimer"])
    
    return NoMilicana() &&
        IsInGame() &&
        chapterCheck &&
        Game["Room"] == Room[chapter][room] &&
        objectID == RoomEvents[chapter][event]["Object"] &&
        sceneID == RoomEvents[chapter][event]["StartScene"] &&
        prev(timer) == 1 &&
        timer == 2
}

function ThreeBroomKills(){
    return measured(repeated(3, TriggerRoomEvent("Chapter2", "WomensBathroom", "BroomZombie")), IsInGame()) &&
        never(Game["Chapter"] != Chapters["Chapter2"])
}

function FiveExtinguisherKills(){
    return measured(tally(5, TriggerRoomEvent("Chapter3", "Hallway3", "Extinguisher"), TriggerRoomEvent("Chapter3", "Hallway5", "Extinguisher")), IsInGame()) &&
        never(Game["Chapter"] < Chapters["Chapter3_1"])
}

function Chapter1FoundBodyParts(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Events["Chapter1"]["Leg"] + Events["Chapter1"]["Torso"] + Events["Chapter1"]["Arm"] + Events["Chapter1"]["Head"]) == 3 &&
        measured((Events["Chapter1"]["Leg"] + Events["Chapter1"]["Torso"] + Events["Chapter1"]["Arm"] + Events["Chapter1"]["Head"]) == 4, IsPlayingStandard())
}

function Chapter1Paintings(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Events["Chapter1"]["DinettePainting"] + Events["Chapter1"]["LivingRoomPainting"]) == 1 &&
        (Events["Chapter1"]["DinettePainting"] + Events["Chapter1"]["LivingRoomPainting"]) == 2
}

function Chapter1PotsAndPans(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Events["Chapter1"]["Pan"] + Events["Chapter1"]["Pot"]) == 1 &&
        (Events["Chapter1"]["Pan"] + Events["Chapter1"]["Pot"]) == 2
}

function Chapter1Poltergeist(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Events["Chapter1"]["Doll"] + Events["Chapter1"]["ChinaCabinet"] + Events["Chapter1"]["Clock"]) == 2 &&
        measured((Events["Chapter1"]["Doll"] + Events["Chapter1"]["ChinaCabinet"] + Events["Chapter1"]["Clock"]) == 3, IsInGame())
}

function Chapter1MichaelTrap(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Events["Chapter1"]["Michael"] + Events["Chapter1"]["MichaelTrap"]) == 1 &&
        (Events["Chapter1"]["Michael"] + Events["Chapter1"]["MichaelTrap"]) == 2
}

function CompletedChapter1() {
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Game["Room"]) == Room["Chapter1"]["DiningHallFinale"] &&
        Game["Room"] == Room["Chapter1"]["Chapter2Begin"]
}

function Chapter2FoundVoices(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter2"] &&
        prev(Events["Chapter2"]["Voice1"] + Events["Chapter2"]["Voice2"] + Events["Chapter2"]["Voice3"] + Events["Chapter2"]["Voice4"]) == 3 &&
        measured((Events["Chapter2"]["Voice1"] + Events["Chapter2"]["Voice2"] + Events["Chapter2"]["Voice3"] + Events["Chapter2"]["Voice4"]) == 4, IsInGame())
}

function Chapter2Chairs(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter2"] &&
        prev(Events["Chapter2"]["Chair1"] + Events["Chapter2"]["Chair2"] + Events["Chapter2"]["Chair3"]) == 2 &&
        measured((Events["Chapter2"]["Chair1"] + Events["Chapter2"]["Chair2"] + Events["Chapter2"]["Chair3"]) == 3, IsInGame())
}

function CompletedChapter2() {
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter2"] &&
        prev(Game["Room"]) == Room["Chapter2"]["BackDoor"] &&
        Game["Room"] == Room["Chapter2"]["Chapter3Begin"]
}

function Chapter3BowmanParts(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] >= Chapters["Chapter3_1"] &&
        Game["Chapter"] <= Chapters["Chapter3_2"] &&
        prev(Events["Chapter3"]["BowmanTorso"] + Events["Chapter3"]["BowmanLegs"]) == 1 &&
        measured((Events["Chapter3"]["BowmanTorso"] + Events["Chapter3"]["BowmanLegs"]) == 2, IsInGame())
}

function Chapter3LockerZombies(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] >= Chapters["Chapter3_1"] &&
        Game["Chapter"] <= Chapters["Chapter3_2"] &&
        prev(Events["Chapter3"]["Locker1"] + Events["Chapter3"]["Locker2"] + Events["Chapter3"]["Locker3"]) == 2 &&
        measured((Events["Chapter3"]["Locker1"] + Events["Chapter3"]["Locker2"] + Events["Chapter3"]["Locker3"]) == 3, IsInGame())
}

function ClearedGameWithRank(rank){
    endSequence = (prev(Game["Ending"]["Sequence"]) == EndingSequences["Credits"] ||
        prev(Game["Ending"]["Sequence"]) == EndingSequences["RankASplash"])
    
    /*if(rank == "A")
        endSequence = prev(Game["Ending"]["Sequence"]) == EndingSequences["RankASplash"]*/
        
    endSequence = endSequence && Game["Ending"]["Sequence"] == EndingSequences["RankScreen"]

    return NoMilicana() &&
        IsInEnding() &&
        Game["Mode"] == GameModes["Standard"] &&
        Game["Ending"]["Rank"] == EndingRanks[rank] &&
        endSequence
}

function ClearedARankInTwoHours(){
    return ClearedGameWithRank("A") &&
        GetTotalSeconds() <= 9000
}

function UnlockedAllEndings(){
    return NoMilicana() &&
        prev(sum_of(Game["Endings"], ending => Game["Endings"][ending])) == 12 &&
        measured(sum_of(Game["Endings"], ending => Game["Endings"][ending]) == 13, IsInGame())
}

function ClearedTimeAttack(){
    return NoMilicana() &&
        IsPlayingTimeAttack() &&
        GetTotalSeconds() > 1 &&
        GetTotalSeconds() <= 600 &&
        prev(Game["TimeAttack"]["Enemies"]) != 0 &&
        Game["TimeAttack"]["Enemies"] == 0
}

function ClearedScoreAttack(){
    return NoMilicana() &&
        IsPlayingScoreAttack() &&
        Game["ScoreAttack"]["Score"] >= 100000 &&
        prev(Game["ScoreAttack"]["Enemies"]) != 0 &&
        Game["ScoreAttack"]["Enemies"] == 0
}

function FoundChapter1Hints(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(sum_of(Game["Hints"]["Chapter1"], hint => Game["Hints"]["Chapter1"][hint])) == 3 &&
        sum_of(Game["Hints"]["Chapter1"], hint => Game["Hints"]["Chapter1"][hint]) == 4
}

function FoundChapter2Hints(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter2"] &&
        prev(sum_of(Game["Hints"]["Chapter2"], hint => Game["Hints"]["Chapter2"][hint])) == 1 &&
        sum_of(Game["Hints"]["Chapter2"], hint => Game["Hints"]["Chapter2"][hint]) == 2
}

function FoundChapter3Hints(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] >= Chapters["Chapter3_1"] && 
        Game["Chapter"] <= Chapters["Chapter3_2"] &&
        prev(sum_of(Game["Hints"]["Chapter3"], hint => Game["Hints"]["Chapter3"][hint])) == 1 &&
        sum_of(Game["Hints"]["Chapter3"], hint => Game["Hints"]["Chapter3"][hint]) == 2
}

function FoundAllHints(){
    return NoMilicana() &&
        Game["Chapter"] >= Chapters["Chapter1"] &&
        Game["Chapter"] <= Chapters["Chapter3_2"] &&
        prev(sum_of(Game["Hints"]["All"], hint => Game["Hints"]["All"][hint])) == 7 &&
        measured(sum_of(Game["Hints"]["All"], hint => Game["Hints"]["All"][hint]) == 8, IsInGame())
}

function Chapter1FoundPistol(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter1"] &&
        prev(Weapons["Chapter1"]["Pistol"]) <
        Weapons["Chapter1"]["Pistol"]
}

function Chapter2FoundShotgun(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] == Chapters["Chapter2"] &&
        prev(Weapons["Chapter2"]["Shotgun"]) <
        Weapons["Chapter2"]["Shotgun"]
}

function Chapter3FoundPistol(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] >= Chapters["Chapter3_1"] &&
        Game["Chapter"] <= Chapters["Chapter3_2"] &&
        prev(Weapons["Chapter3"]["Pistol"]) <
        Weapons["Chapter3"]["Pistol"]
}

function Chapter3FoundMachineGun(){
    return NoMilicana() &&
        IsInGame() &&
        Game["Chapter"] >= Chapters["Chapter3_1"] &&
        Game["Chapter"] <= Chapters["Chapter3_2"] &&
        prev(Weapons["Chapter3"]["MachineGun"]) <
        Weapons["Chapter3"]["MachineGun"]
}

// ======================================================================= //
// Achievement Functions - Progression
// ======================================================================= //

achievement("Bon Appetit", "Find the Dining Key in Chapter 1", points = 2, type="progression", id = 494711,
    trigger = CompletedChapterEvent("Chapter1", "DiningKey")
)

achievement("Head, Shoulders, Knees and Toes", "Find all of the misplaced body parts in Chapter 1", points = 2, type="progression", id = 494712,
    trigger = Chapter1FoundBodyParts()
)

achievement("Gotta Be Me", "Find the Amulet in Chapter 1", points = 2, type="progression", id = 494713,
    trigger = CompletedChapterEvent("Chapter1", "Amulet")
)

achievement("Bring Me to Life", "Get a fright from the Samurai Armor in Chapter 1", points = 2, type="progression", id = 494714,
    trigger = CompletedChapterEvent("Chapter1", "Samurai")
)

achievement("Keeper of the Key", "Find the Master Bedroom Key in Chapter 1", points = 2, type="progression", id = 494715,
    trigger = CompletedChapterEvent("Chapter1", "MasterBedroomKey")
)

achievement("Because We Can Can", "Find the Oil Can in Chapter 1", points = 2, type="progression", id = 494716,
    trigger = CompletedChapterEvent("Chapter1", "OilCan")
)

achievement("A Letter from Home", "Read a letter from your father unfolding the mystery of the curse in Chapter 1", points = 2, type="progression", id = 494717,
    trigger = CompletedChapterEvent("Chapter1", "Letter")
)

achievement("Hallpass", "Find the Corridor Key in Chapter 1", points = 2, type="progression", id = 494718,
    trigger = CompletedChapterEvent("Chapter1", "CorridorKey")
)

achievement("Light it Up", "Find the Lighter in Chapter 1", points = 2, type="progression", id = 494719,
    trigger = CompletedChapterEvent("Chapter1", "Lighter")
)

achievement("Hot Tip", "Find the Cursed Statue in Chapter 1", points = 2, type="progression", id = 494720,
    trigger = CompletedChapterEvent("Chapter1", "CursedStatue")
)

achievement("Burn it to the Ground", "Ward off the curse haunting the Tates and complete Chapter 1", points = 5, type="progression", id = 494721,
    trigger = CompletedChapter1()
)

achievement("Start Spreadin' the News", "Unveil more information about the mysterious curse in Chapter 2", points = 3, type="progression", id = 494722,
    trigger = CompletedChapterEvent("Chapter2", "Newspaper")
)

achievement("Under Your Skin", "Find the Storage Key in Chapter 2", points = 3, type="progression", id = 494723,
    trigger = CompletedChapterEvent("Chapter2", "StorageRoomKey")
)

achievement("Mad Science", "Discover how science plays a part in this mystery in Chapter 2", points = 3, type="progression", id = 494724,
    trigger = CompletedChapterEvent("Chapter2", "Alex")
)

achievement("It's Gonna Be Alright", "Find the Screwdriver in Chapter 2", points = 3, type="progression", id = 494725,
    trigger = CompletedChapterEvent("Chapter2", "Screwdriver")
)

achievement("Baby Come Back", "Find the Backdoor Key in Chapter 2", points = 3, type="progression", id = 494726,
    trigger = CompletedChapterEvent("Chapter2", "BackDoorKey")
)

achievement("In Your Head", "Discover the cause of the living dead in Chapter 2", points = 3, type="progression", id = 494727,
    trigger = CompletedChapterEvent("Chapter2", "ZombieNote")
)

achievement("Is Anybody There?", "Get spooked by a set of disembodied voices in Chapter 2", points = 3, type="progression", id = 494728,
    trigger = Chapter2FoundVoices()
)

achievement("Not Today, Baby", "Confront a key player in this scientific mishap in Chapter 2", points = 3, type="progression", id = 494729,
    trigger = CompletedChapterEvent("Chapter2", "Shannon")
)

achievement("But I Won't Do That", "Hatch an escape plan in Chapter 2", points = 3, type="progression", id = 494730,
    trigger = CompletedChapterEvent("Chapter2", "Bowman")
)

achievement("Alone in the Crowd", "Escape the infested Hospital and complete Chapter 2", points = 10, type="progression", id = 494731,
    trigger = CompletedChapter2()
)

achievement("Lost and Found", "Find the Exam Room Key in Chapter 3", points = 4, type="progression", id = 494732,
    trigger = CompletedChapterEvent("Chapter3", "ExamRoomKey")
)

achievement("I Got the Blues", "Find the Blue Key Card in Chapter 3", points = 4, type="progression", id = 494733,
    trigger = CompletedChapterEvent("Chapter3", "BlueKeyCard")
)

achievement("High Wire", "Find the Wire in Chapter 3", points = 4, type="progression", id = 494734,
    trigger = CompletedChapterEvent("Chapter3", "Wire")
)

achievement("Locker Room Lady", "Find the Security Key in Chapter 3", points = 4, type="progression", id = 494735,
    trigger = CompletedChapterEvent("Chapter3", "SecurityKey")
)

achievement("Dirt on Your Hands", "Find the Desk Key in Chapter 3", points = 4, type="progression", id = 494736,
    trigger = CompletedChapterEvent("Chapter3", "DeskKey")
)

achievement("She’s an Open Book", "Find the Storage Key in Chapter 3", points = 4, type="progression", id = 494737,
    trigger = CompletedChapterEvent("Chapter3", "StorageKey")
)

achievement("Light My Fire", "Find the Lighter in Chapter 3", points = 4, type="progression", id = 494738,
    trigger = CompletedChapterEvent("Chapter3", "Lighter")
)

achievement("Hot Key", "Find the Lab Key in Chapter 3", points = 4, type="progression", id = 494739,
    trigger = CompletedChapterEvent("Chapter3", "LabKey")
)

achievement("Breakin' the Law", "Find the Handcuff Key in Chapter 3", points = 4, type="progression", id = 494740,
    trigger = CompletedChapterEvent("Chapter3", "HandcuffKey")
)

achievement("Turn on the Red Light", "Find the Red Key Card in Chapter 3", points = 4, type="progression", id = 494741,
    trigger = CompletedChapterEvent("Chapter3", "RedKeyCard")
)

achievement("Green Light", "Find the Green Key Card in Chapter 3", points = 4, type="progression", id = 494742,
    trigger = CompletedChapterEvent("Chapter3", "GreenKeyCard")
)

achievement("Can't Cut it Alone", "Find the Hatchet in Chapter 3", points = 4, type="progression", id = 494743,
    trigger = CompletedChapterEvent("Chapter3", "Hatchet")
)

achievement("Graveyard Smash", "Find the Graveyard Key in Chapter 3", points = 4, type="progression", id = 494744,
    trigger = CompletedChapterEvent("Chapter3", "GraveyardKey")
)

achievement("Breaking Up Is Hard to Do", "Find the Large Door Key in Chapter 3", points = 4, type="progression", id = 494745,
    trigger = CompletedChapterEvent("Chapter3", "LargeDoorKey")
)

achievement("Fight from the Inside", "Discover the truth and complete Chapter 3 with an Ending Rank of A", points = 25, type="win_condition", id = 494746,
    trigger = ClearedGameWithRank("A")
)

// ======================================================================= //
// Achievement Functions - Ending Challenges
// ======================================================================= //

achievement("Bulletproof", "Complete the game with an Ending Rank of B", points = 10, id = 494747,
    trigger = ClearedGameWithRank("B")
)

achievement("Caretaker", "Complete the game with an Ending Rank of C", points = 10, id = 494748,
    trigger = ClearedGameWithRank("C")
)

achievement("Dilemma", "Complete the game with an Ending Rank of D", points = 10, id = 494749,
    trigger = ClearedGameWithRank("D")
)

achievement("Empty", "Complete the game with an Ending Rank of E", points = 10, id = 494750,
    trigger = ClearedGameWithRank("E")
)

achievement("Frantic", "Complete the game with an Ending Rank of F", points = 10, id = 494751,
    trigger = ClearedGameWithRank("F")
)

achievement("Grievous", "Complete the game with an Ending Rank of G", points = 10, id = 494752,
    trigger = ClearedGameWithRank("G")
)

achievement("Hostile", "Complete the game with an Ending Rank of H", points = 5, id = 494753,
    trigger = ClearedGameWithRank("H")
)

achievement("Ignition", "Complete the game with an Ending Rank of I", points = 5, id = 494754,
    trigger = ClearedGameWithRank("I")
)

achievement("Jaded", "Complete the game with an Ending Rank of J", points = 5, id = 494755,
    trigger = ClearedGameWithRank("J")
)

achievement("Killjoy", "Complete the game with an Ending Rank of K", points = 5, id = 494756,
    trigger = ClearedGameWithRank("K")
)

achievement("Linger", "Complete the game with an Ending Rank of L", points = 5, id = 494757,
    trigger = ClearedGameWithRank("L")
)

achievement("Misstep", "Complete the game with an Ending Rank of M", points = 5, id = 494758,
    trigger = ClearedGameWithRank("M")
)

achievement("Time After Time", "Unlock all Ending Ranks", points = 50, id = 494759,
    trigger = UnlockedAllEndings()
)

// ======================================================================= //
// Achievement Functions - Play Challenges
// ======================================================================= //

achievement("Get a Clue", "Find all Hints in Chapter 1", points = 5, id = 494760,
    trigger = FoundChapter1Hints()
)

achievement("Helping Hand", "Find all Hints in Chapter 2", points = 5, id = 494761,
    trigger = FoundChapter2Hints()
)

achievement("Tip the Balance", "Find all Hints in Chapter 3", points = 5, id = 494762,
    trigger = FoundChapter3Hints()
)

achievement("Secret Secrets", "Find all 8 Hints", points = 10, id = 494763,
    trigger = FoundAllHints()
)

achievement("Life in the Fast Lane", "Clear Time Attack Mode in 10 minutes or less", points = 10, id = 494764,
    trigger = ClearedTimeAttack()
)

achievement("For the Win", "Clear Score Attack Mode with a score of 100,000 points or more", points = 10, id = 494765,
    trigger = ClearedScoreAttack()
)

achievement("Bang Bang", "Find the Pistol in Chapter 1", points = 5, id = 494766,
    trigger = Chapter1FoundPistol()
)

achievement("Change Your Tune", "Enjoy an impromptu serenade in Chapter 1", points = 2, id = 494767,
    trigger = CompletedChapterEvent("Chapter1", "Piano")
)

achievement("Look At This Photograph", "Curate the Tate's artwork in Chapter 1", points = 3, id = 494768,
    trigger = Chapter1Paintings()
)

achievement("Isn't it Ironic", "Break the fourth wall in Chapter 1", points = 2, id = 494769,
    trigger = TriggerRoomEvent_Timer("Chapter1", "AshleysRoom", "Poster")
)

achievement("Hold the Phone", "Take a call in Chapter 1", points = 3, id = 494770,
    trigger = CompletedChapterEvent("Chapter1", "Phone")
)

achievement("Keep Cooking", "Defend yourself with pots and pans in Chapter 1", points = 5, id = 494771,
    trigger = Chapter1PotsAndPans()
)

achievement("Ghost in the Machine", "Witness three ghostly encounters in Chapter 1", points = 5, id = 494772,
    trigger = Chapter1Poltergeist()
)

achievement("Dead Fall", "Witness the relocation of a friend's remains in Chapter 1", points = 5, id = 494773,
    trigger = CompletedChapterEvent("Chapter1", "MichaelTrap")
)

achievement("Extra Protection", "Find the Shotgun in Chapter 2", points = 5, id = 494774,
    trigger = Chapter2FoundShotgun()
)

achievement("Sweep Dreams", "In a single session, sweep the undead away in Chapter 2", points = 5, id = 494775,
    trigger = ThreeBroomKills()
)

achievement("This isn't Good", "Observe a set of flashing panic lights in Chapter 2", points = 2, id = 494776,
    trigger = TriggerRoomEvent("Chapter2", "StaffOffice", "PanicLights")
)

achievement("Chairing is Caring", "Offer a seat to three zombies in Chapter 2", points = 5, id = 494777,
    trigger = Chapter2Chairs()
)

achievement("Pistol Packin' RN", "Find the Pistol in Chapter 3", points = 5, id = 494778,
    trigger = Chapter3FoundPistol()
)

achievement("Shoot from the Hip", "Find the Machine Gun in Chapter 3", points = 3, id = 494779,
    trigger = Chapter3FoundMachineGun()
)

achievement("Body Check", "Find all of a friend's remains in Chapter 3", points = 3, id = 494780,
    trigger = Chapter3BowmanParts()
)

achievement("Put em on Blast", "In a single session, extinguish five threats in Chapter 3", points = 5, id = 494781,
    trigger = FiveExtinguisherKills()
)

achievement("Participation Award", "Insist on trying to relieve yourself in Chapter 3", points = 3, id = 494782,
    trigger = TriggerRoomEvent("Chapter3", "MensBathroom", "Urinal")
)

achievement("Curiosity", "Find the Chapter 3 title card", points = 3, id = 494783,
    trigger = CompletedChapterEvent("Chapter3", "TitleCard")
)

achievement("Dead-ication", "Free three zombie stowaways in Chapter 3", points = 5, id = 494784,
    trigger = Chapter3LockerZombies()
)

achievement("Shooting Blanks", "Find the use for a Model Gun in Chapter 3", points = 5, id = 494785,
    trigger = CompletedChapterEvent("Chapter3", "ShotgunDispenser")
)

achievement("Sharp Observation", "Find the Knife in Chapter 3", points = 3, id = 494786,
    trigger = CompletedChapterEvent("Chapter3", "Knife")
)

achievement("The Ugly Truth", "Witness the consequences of your own reflection in Chapter 3", points = 3, id = 495373,
    trigger = TriggerRoomEvent("Chapter3", "WomensBathroom", "Mirror")
)

achievement("I Will Survive", "Complete the game with an Ending Rank of A in 2.5 hours or less", points = 25, id = 494787,
    trigger = ClearedARankInTwoHours()
)