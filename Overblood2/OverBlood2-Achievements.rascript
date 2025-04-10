// OverBlood 2
// #ID = 9264
// Author: TwosomesUP
// RetroAchievements - Achievement Script

// ------------------------- Accessors ------------------------- //

Game = {
    "Episode": dword(0x1be9e8),
    "Paused": dword(0xd2f58),
    "OnTitle": dword(0xd2f64),
    "Episode4Cheat": byte(0x1f79d0),
    "Episode8Unlocked": byte(0xd2fa4),
    "Time":{
        "Overall": {
            "Hours": dword(0x1be99c),
            "Minutes": dword(0x1be9a0),
            "Seconds": dword(0x1be9a4),
            "Frames": dword(0x1be9a8)
        }
    },
    "Map":{
        "Location": dword(0x1be9ac),
        "Area": dword(0x1be9b0),
        "Room": dword(0x1be9b4)
    },
    "ClearStats":{
        "Episode1": {
            "CP": dword(0x1be9bc),
            "Time": dword(0x1bea0c) //Seconds
        },
        "Episode2": {
            "CP": dword(0x1be9c0),
            "Time": dword(0x1bea10) //Seconds
        },
        "Episode3": {
            "CP": dword(0x1be9c4),
            "Time": dword(0x1bea14) //Seconds
        },
        "Episode4": {
            "CP": dword(0x1be9c8),
            "Time": dword(0x1bea18) //Seconds
        },
        "Episode5": {
            "CP": dword(0x1be9cc),
            "Time": dword(0x1bea1c) //Seconds
        },
        "Episode6": {
            "CP": dword(0x1be9d0),
            "Time": dword(0x1bea20) //Seconds
        },
        "Episode7": {
            "CP": dword(0x1be9d4),
            "Time": dword(0x1bea24) //Seconds
        }
    }
}

Character = {
    "ID": dword(0x1bed90),
    "Acarno": {
        "HP": dword(0x1bed94)
    }
}

Objects = {
    "LastInteraction":{
        "ID": dword(0xd3314),
        "SceneIndex": dword(0xd3ac4)
    }
}

Items = {
    "Count": dword(0x1be9e4),
    "LastUsed": {
        "ID": dword(0xd34e0)
    },
    "LastAcquired": {
        "ID": dword(0xd35d4)
    },
    "Inventory": {
        "Start": 0x1beec4,
        "Offsets": {
            "ID": 0x00,
            "Count": 0x04,
        }
    }
}

Enemies = {
    "Boss": {
        "Active": byte(0x186dc8), //Unreliable
        "HP": dword(0x186e4c)
    }
}

Events = {
    "Episode1":{
        "ArriveInEastEdge": bit4(0x1bf4c5),
        "ArriveOnBillboardIsland": bit3(0x1bf4dc)
    },
    "Episode2":{
        "ArrivedInPagoda": bit7(0x1bf4c8),
        "DefeatedFirstGuardingSystem": bit5(0x1bf4c4),
        "DefeatedSecondGuardingSystem": bit6(0x1bf4c4),
        "DefeatedThirdGuardingSystem": bit7(0x1bf4c4)
    },
    "Episode3":{
        "PlacedPlasmaBomb": bit2(0x1bf4d4),
        "DefeatedSperio": bit3(0x1bf4d8)
    }
}

// ------------------------- Accessor Lookups ------------------------- //

EpisodeGoals = {
    "SRank": {
        "Episode1": 301,
        "Episode2": 301,
        "Episode3": 301,
        "Episode4": 251,
        "Episode5": 311,
        "Episode6": 251,
        "Episode7": 351
    }
}

CharacterIDs = {
    "Acarno": 0x00,
    "Chris": 0x01,
    "Navarro": 0x02
}

ItemIDs = {
    //Equipment
    "HookShot": 0x01,
    "Transceiver": 0x02,
    "SmallAqualung": 0x03,
    "GravityController": 0x04,
    "FreezePack": 0x05,
    "HeatPack": 0x06,
    "Snooper": 0x07,
    "InstantPlate": 0x08,
    //Cure
    "EmergencySpray": 0x0b,
    "ExtinguisherSpray": 0x0c,
    "PortableAir": 0x0d,
    //Weapon
    "AntiqueGun": 0x0f,
    "BigMagnum": 0x10,
    "LaserGun": 0x11,
    "LaserKnife": 0x12,
    "LightSabre": 0x13,
    "SuperLightSabre": 0x14,
    "Katana": 0x15,
    "PowerOfHarbinger": 0x16,
    "MachineGun": 0x17,
    "FlameThrower": 0x18,
    "FireExtinguisher": 0x19,
    "HandBazooka": 0x1a,
    "GrenadeLauncher": 0x1b,
    "HandKnife": 0x1c,
    //Ammo
    "MagazineCartridge": 0x20,
    "EnergyPack": 0x21,
    "AirPack": 0x22,
    "BazookaRound": 0x23,
    "MachineGunCartridge": 0x25,
    "OilCartridge": 0x26,
    "FireExtinguisherCartridge": 0x27,
    "MagnumShell": 0x28,
    //Bombs
    "Grenade": 0x2a,
    "TimeBomb": 0x2b,
    "SwitchBomb": 0x2c,
    "BurstBomb": 0x2d,
    "Decoy": 0x2e,
    //Boots
    "BladeBoots": 0x31,
    "CoolSole": 0x32,
    "ShockAbsorber": 0x33,
    "Insulator": 0x34,
    "RubberBoots": 0x35,
    "SpikedBoots": 0x36,
    "MoonlightBoots": 0x37,
    "LeatherBoots": 0x38,
    "HeavyBoots": 0x39,
    //Acarno Jackets
    "WesternJacket": 0x3a,
    "RedLeather": 0x3b,
    "WolfJacket": 0x3c,
    "ArmyJacket": 0x3d,
    "ShieldJacket": 0x3e,
    "ParaJacket": 0x3f,
    "WetSuit": 0x40,
    "DanceOutfit": 0x41,
    "BlackLeather": 0x42,
    //Navarro Suits
    "NavarroCustom": 0x43,
    "HeatProofSuit": 0x44,
    "USCivialSuit": 0x45,
    "ChineseMafiaSuit": 0x46,
    "TigerSuit": 0x47,
    "BatManiacSuit": 0x48,
    "20YrOldSuit": 0x49,
    "LabelPlus": 0x4a,
    "LabelSuit": 0x4b,
    //Chris Suits
    "ExoticPanther": 0x4c,
    "YOMiyabiSuit": 0x4d,
    "FlightWear": 0x4e,
    "YOAngelSuit": 0x4f,
    "PumpkinSuit": 0x50,
    //Key Items
    "CreditCardChip": 0x51,
    "AirCoolerRepairKit": 0x52,
    "PagodaMap": 0x53,
    "50KCredit": 0x54,
    "BottleEmpty": 0x55,
    "BottleWithOil": 0x56,
    "KeyForGhostHouse": 0x57,
    "KeyForBackdoor": 0x58,
    "BatteryPack": 0x59,
    "DivaPiece": 0x5a,
    "UnknownCapsule": 0x5b,
    "JuiceCan": 0x5c,
    "PlasmaBomb": 0x5d,
    "RedKeyCard": 0x5e,
    "SilverKeyCard": 0x5f,
    "GoldKeyCard": 0x60,
    "Banana": 0x61,
    "KeyForOperatingTrailer": 0x62,
    "SubwayKeyCard": 0x63,
    "HorsemeatBurger": 0x64,
    "GeoStone": 0x65,
    "Emerald": 0x66,
    "Diamond": 0x67,
    "EngineRoomKey": 0x68
}

ObjectInteractions = {
    "Any": {
      "EastEdgeSiver": {
          "ID": 0x67,
          "Scene": {
              "SiverQuestion": 0x102,
              "SiverQuestion_CorrectAnswer": 0x120
          }
      }  
    },
    "Episode4":{
      "DanceComplete":{
          "ID": 0x98,
          "Scene":{
              "DanceEndTransition": 0x6d,
              "DanceEnd": 0xc1
          }
      }  
    },
    "Episode8":{
        "SceneIndex": {
            "UseRepairKit": 0x24,
            "Ending": 0x27
        }
    }
}

Rooms = {
    "Any":{
      "SiverOtakkiQuestion": [8, 5, 2]  
    },
    "Episode1": {
        "GumboFight": [1, 3, 0],
        "TurretSequence": [1, 6, 2],
        "TurretSequence_End": [1, 6, 1]
    },
    "Episode2": {
        "KondoFight": [2, 4, 3]
    },
    "Episode3": {
        "SubwayStation": [3, 1, 0],
        "SubwayTracks": [3, 1, 1],
        "SubwayTrain": [3, 1, 2],
        "UndergroundTerminousStation_Cutscene": [3, 0, 0],
        "UndergroundTerminousStation": [3, 2, 0],
        "JunkBladeScene": [3, 2, 9],
        "JunkBladeScene_End": [3, 2, 0xb]
    },
    "Episode4": {
      "DanceSequence": [4, 1, 5]
    },
    "Episode8": {
        "End": [9, 0, 4]
    }
}

// ------------------------- Helper Functions ------------------------- //

function GetTotalCP(episode){
    CP = 0
    for index in range(1, episode) {
        CP = CP + Game["ClearStats"]["Episode" + index]["CP"]
    }
    return CP
}

function IsEpisode8Unlocked(){
    return Game["Episode8Unlocked"] == 0x01
}

function IsOnTitle(){
    return Game["OnTitle"] == 0x01
}

function TriggeredEvent(episode, event, inverse = false){
    flag = Events["Episode" + episode][event]
    trigger = prev(flag) < flag 
    
    if (inverse)
        trigger = flag < prev(flag)
        
    return Game["Episode"] == episode &&
        trigger  
}

function IsInRoom(map, previous = false){
    trigger = Game["Map"]["Location"] == map[0] &&
        Game["Map"]["Area"] == map[1] &&
        Game["Map"]["Room"] == map[2]
    
    if(previous){
        trigger = prev(Game["Map"]["Location"]) == map[0] &&
        prev(Game["Map"]["Area"] == map[1]) &&
        prev(Game["Map"]["Room"] == map[2])
    }
        
    return trigger
}

function AcquiredItem(id){
    return any_of(range(0, 99), index => 
        Items["Count"] <= index + 1 &&
        dword(Items["Inventory"]["Start"] + (index * 0x0c) + Items["Inventory"]["Offsets"]["ID"]) == id &&
        prev(dword(Items["Inventory"]["Start"] + (index * 0x0c) + Items["Inventory"]["Offsets"]["Count"])) <
        dword(Items["Inventory"]["Start"] + (index * 0x0c) + Items["Inventory"]["Offsets"]["Count"])
    )   
}

function DefeatedBoss(episode, map){
    return Game["Episode"] == episode &&
        IsInRoom(map) &&
        prev(Enemies["Boss"]["HP"]) != 0x00 &&
        Enemies["Boss"]["HP"] == 0x00
}

function AnswerSiverOtakki(episode){
    return !IsOnTitle() &&
        Game["Episode"] == episode &&
        IsInRoom(Rooms["Any"]["SiverOtakkiQuestion"]) &&
        Objects["LastInteraction"]["ID"] == ObjectInteractions["Any"]["EastEdgeSiver"]["ID"] &&
        prev(Objects["LastInteraction"]["SceneIndex"]) == ObjectInteractions["Any"]["EastEdgeSiver"]["Scene"]["SiverQuestion"] &&
        Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions["Any"]["EastEdgeSiver"]["Scene"]["SiverQuestion_CorrectAnswer"]
}

// ------------------------- Achievement Functions ------------------------- //

function CompletedEpisode(episode){
    return !IsOnTitle() &&
        Game["Episode"] == episode &&
        prev(Game["ClearStats"]["Episode" + episode]["Time"]) == 0 &&
        Game["ClearStats"]["Episode" + episode]["Time"] > 0
}

function CompletedEpisodeWithSRank(episode){
    return CompletedEpisode(episode) &&
        Game["ClearStats"]["Episode" + episode]["CP"] >= EpisodeGoals["SRank"]["Episode" + episode]
}

// Episode 1 - Achievement Functions //

function Episode1_ReachEastEdge(){
    return !IsOnTitle() &&
        TriggeredEvent(1, "ArriveInEastEdge")
}

function Episode1_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(1)
}

function Episode1_ReachBillboardIsland(){
    return !IsOnTitle() &&
        TriggeredEvent(1, "ArriveOnBillboardIsland")
}

function Episode1_DefeatedGumbo(){
    return !IsOnTitle() &&
        DefeatedBoss(1, Rooms["Episode1"]["GumboFight"])
}

function Episode1_ClearTurret(){
    return !IsOnTitle() &&
        Game["Episode"] == 1 &&
        IsInRoom(Rooms["Episode1"]["TurretSequence"], true) &&
        IsInRoom(Rooms["Episode1"]["TurretSequence_End"])
}

function Episode1_ClearTurretChallenge(){
    return Episode1_ClearTurret() &&
        Game["ClearStats"]["Episode1"]["CP"] >= prior(Game["ClearStats"]["Episode1"]["CP"]) + 30
}

function Episode1_ClearEpisode(){
    return CompletedEpisode(1)
}

function Episode1_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(1)
}

// Episode 2 - Achievement Functions //

function Episode2_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(2)
}

function Episode2_DefeatedKondo(){
    return !IsOnTitle() &&
        DefeatedBoss(2, Rooms["Episode2"]["KondoFight"])
}

// Episode 3 - Achievement Functions //

function Episode3_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(3)
}

function Episode3_ReachUndergroundTerminous(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode3"]["UndergroundTerminousStation_Cutscene"], true) &&
        IsInRoom(Rooms["Episode3"]["UndergroundTerminousStation"])
}

function Episode3_CompleteJunkbladeScene(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode3"]["JunkBladeScene"], true) &&
        IsInRoom(Rooms["Episode3"]["JunkBladeScene_End"])
}

function Episode3_CompleteJunkbladeScene_NoDamage(){
    return Episode3_CompleteJunkbladeScene() &&
        Game["ClearStats"]["Episode3"]["CP"] ==
        prior(Game["ClearStats"]["Episode3"]["CP"]) + 80
}

// Episode 4 - Achievement Functions //

function Episode4_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(4)
}

function Episode4_CompleteDanceScene(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode4"]["DanceSequence"]) &&
        Objects["LastInteraction"]["ID"] == ObjectInteractions["Episode4"]["DanceComplete"]["ID"] &&
        prev(Objects["LastInteraction"]["SceneIndex"]) == ObjectInteractions["Episode4"]["DanceComplete"]["Scene"]["DanceEndTransition"] &&
        Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions["Episode4"]["DanceComplete"]["Scene"]["DanceEnd"]
}

function Episode4_CompleteDanceScene_MaxCP(){
    return Episode4_CompleteDanceScene() &&
        Game["Episode4Cheat"] != 1 &&
        Game["ClearStats"]["Episode4"]["CP"] == prior(Game["ClearStats"]["Episode4"]["CP"]) + 100
}

// Episode 7 - Achievement Functions //

function Episode7_UnlockedEpisode8(){
    return CompletedEpisode(7) &&
        prev(!IsEpisode8Unlocked()) &&
        IsEpisode8Unlocked()
}

// Episode 8 - Achievement Functions //

function Episode8_Completed(){
    return !IsOnTitle() &&
        IsEpisode8Unlocked() &&
        IsInRoom(Rooms["Episode8"]["End"]) &&
        prev(Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions["Episode8"]["SceneIndex"]["UseRepairKit"]) &&
        Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions["Episode8"]["SceneIndex"]["Ending"]
}

// ------------------------- Achievement Definitions - Progression ------------------------- //

// -- Episode 1 -- //

achievement("East Edge", "Reach East Edge City", points = 2, type = "progression",
    trigger = Episode1_ReachEastEdge()
)

achievement("Billboard Island", "Reach Billboard Island", points = 2, type = "progression",
    trigger = Episode1_ReachBillboardIsland()
)

achievement("Gumbo", "Defeat Gumbo the Robot on Billboard Island", points = 3, type = "progression",
    trigger = Episode1_DefeatedGumbo()
)

achievement("Turret", "Clear the Turret Sequence on Billboard Island", points = 3, type = "progression",
    trigger = Episode1_ClearTurret()
)

achievement("Encounters", "Escape Billboard Island and Clear Episode 1", points = 5, type = "progression",
    trigger = Episode1_ClearEpisode()
)

// -- Episode 2 -- //

achievement("Pagoda Tower", "Reach the Pagoda Tower", points = 2, type = "progression",
    trigger = always_false()
)

achievement("First Guarding", "Destroy the First Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Second Guarding", "Destroy the Second Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Third Guarding", "Destroy the Third Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Kondo", "Defeat Kondo in the Pagoda Tower", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Awakening", "Escape the Pagoda Tower and Clear Episode 2", points = 5, type = "progression",
    trigger = always_false()
)

// -- Episode 3 -- //

achievement("Underground Terminous", "Reach the Underground Terminous", points = 2, type = "progression",
    trigger = always_false()
)

achievement("Anti Proton", "Destroy the Anti Proton Core with the Plasma Bomb in the Underground Terminous", points = 2, type = "progression",
    trigger = always_false()
)

achievement("Sperio", "Defeat Sperio in the Underground Terminous", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Underground Space", "Escape the Underground Terminous on Sperio's Junkblade and Clear Episode 3", points = 5, type = "progression",
    trigger = always_false()
)

// -- Episode 4 -- //

achievement("Dance Sequence", "Clear the Dance Sequence in the Aqua Liberty Ballroom", points = 2, type = "progression",
    trigger = always_false()
)

achievement("Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom Station", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Bloody Rose", "Escape the Aqua Liberty Ballroom and Clear Episode 4", points = 5, type = "progression",
    trigger = always_false()
)

// -- Episode 5 -- //

achievement("Jungle", "Reach the Jungle", points = 2, type = "progression",
    trigger = always_false()
)

achievement("River Ride 1", "Clear the River Ride Part 1 in the Jungle", points = 2, type = "progression",
    trigger = always_false()
)

achievement("Mutated Plant", "Defeat the Mutated Plant in the Jungle", points = 3, type = "progression",
    trigger = always_false()
)

achievement("River Ride 2", "Clear the River Ride Part 2 in the Jungle", points = 2, type = "progression",
    trigger = always_false()
)

achievement("Anti Gravity", "Destroy Anti Gravity Defense Station in the Jungle", points = 2, type = "progression",
    trigger = always_false()
)

achievement("Tiger", "Defeat Tiger in the Jungle", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Lady", "Defeat Lady in the Jamelgalda Prison", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Adidi", "Defeat Adidi in the Jamelgalda Prison", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Deceptive Jungle", "Escape the Jamelgalda Prison and clear Episode 5", points = 10, type = "progression",
    trigger = always_false()
)

// -- Episode 6 -- //

achievement("Gloom Alley", "Reach Gloom Alley", points = 3, type = "progression",
    trigger = always_false()
)

// Removed progression since this can be skipped
achievement("Ghost House", "Reach the Ghost House", points = 3,
    trigger = always_false()
)

achievement("Junkyard", "Reach the Junkyard", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Junkyard Race", "Win the Junkyard Race", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Edgy Kids", "Discover you hidden powers and clear Episode 6", points = 10, type = "progression",
    trigger = always_false()
)

// -- Episode 7 -- //

achievement("Shangri-la", "Reach Shangri-la", points = 3, type = "progression",
    trigger = always_false()
)

achievement("Elevator", "Activate the Shangri-la Elevator", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Diva Pieces", "Find all Diva Pieces in Shangri-la", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Kondo 2", "Defeat Kondo in Shangri-la", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Zeno", "Defeat Zeno in Shangri-la", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Tempest", "Defeat Tempest in Shangri-la", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Power Source", "Destroy the Shangri-la Power Source", points = 5, type = "progression",
    trigger = always_false()
)

achievement("Zeno 2", "Defeat Traveler Zeno in Shangri-la", points = 10, type = "progression",
    trigger = always_false()
)

achievement("Shangri-la Junkblade", "Escape Shangri-la on your Junkblade", points = 10, type = "progression",
    trigger = always_false()
)

achievement("Another Future", "Prevent an uncertain future and clear Episode 7", points = 25, type = "win_condition",
    trigger = always_false()
)

// ------------------------- Achievement Definitions - Challenges ------------------------- //

// -- Any -- //

achievement("Window Pain", "Break an Array Bridge Shop Window and pay for your actions", points = 3,
    trigger = always_false()
)

achievement("Pumpkin Cake", "Admire the Bar Maids butt in Pumpkin Hall", points = 1,
    trigger = always_false()
)

achievement("Weapons", "Collect all Weapons", points = 10,
    trigger = always_false()
)

achievement("Boots", "Collect all Boots", points = 10,
    trigger = always_false()
)

achievement("Clothes - Acarno", "Collect all of Acarno's Clothing", points = 10,
    trigger = always_false()
)

achievement("Clothes - Chris", "Collect all of Chris' Clothing", points = 10,
    trigger = always_false()
)

achievement("Clothes - Navarro", "Collect all of Navarro's Clothing", points = 10,
    trigger = always_false()
)

// -- Episode 1 -- //

achievement("Siver Otakki - Episode 1", "Correctly answer Siver Otakki's question in Episode 1", points = 2,
    trigger = Episode1_SiverOtakkiQuestion()
)

achievement("Power Room Door", "Enter the Power Room Door on Billboard Island using the Silver Key", points = 3,
    trigger = always_false()
)

achievement("20 Year Old", "Find the 20 Yr Old Suit on Billboard Island", points = 3,
    trigger = always_false()
)

achievement("Army Jacket", "Find the Army Jacket and Spiked Boots on Billboard Island", points = 3,
    trigger = always_false()
)

achievement("Laser Knife", "Find the Laser Knife on Billboard Island", points = 3,
    trigger = always_false()
)

achievement("Insulator", "Find the Insulator Boots on Billboard Island", points = 3,
    trigger = always_false()
)

achievement("Wet Suit", "Find the Wet Suit on Billboard Island", points = 3,
    trigger = always_false()
)

achievement("No Heal - Gumbo", "Defeat Gumbo the Robot on Billboard Island without healing", points = 10,
    trigger = always_false()
)

achievement("Clear Challenge - Turret", "Gain 30 or more CP during the Turret Sequence on Billboard Island", points = 5,
    trigger = Episode1_ClearTurretChallenge()
)

achievement("S Rank - Episode 1", "Clear Episode 1 with an S Rank", points = 10,
    trigger = Episode1_ClearEpisode_SRank()
)

// -- Episode 2 -- //

achievement("Siver Otakki - Episode 2", "Correctly answer Siver Otakki's question in Episode 2", points = 2,
    trigger = Episode2_SiverOtakkiQuestion()
)

achievement("Fire Extinguisher", "Find the Fire Extinguisher in the Pagoda Tower", points = 3,
    trigger = always_false()
)

achievement("Heavy Boots", "Find the Heavy Boot in the Pagoda Tower", points = 3,
    trigger = always_false()
)

achievement("Heat Proof", "Find the Heat Proof Suit in the Pagoda Tower", points = 3,
    trigger = always_false()
)

achievement("Oil Tanks", "Destroy all 3 Oil Tanks in the Pagoda Tower", points = 3,
    trigger = always_false()
)

achievement("Monitors", "Break all of the Monitors in the Pagoda Tower Control Room", points = 3,
    trigger = always_false()
)

achievement("Super Light Sabre", "Find the Super Light Sabre in the Pagoda Tower", points = 3,
    trigger = always_false()
)

achievement("Flame Thrower", "Find the Flame Thrower in the Pagoda Tower", points = 3,
    trigger = always_false()
)

achievement("Dangerous Gems", "Find all 4 gems in the Pagoda Tower Third Guarding System Underwater Passage", points = 10,
    trigger = always_false()
)

achievement("No Heal - First Guardian", "Defeat the First Guardian in the Pagoda Tower without healing", points = 10,
    trigger = always_false()
)

achievement("No Heal - Second Guardian", "Defeat the Second Guardian in the Pagoda Tower without healing", points = 10,
    trigger = always_false()
)

achievement("No Heal - Third Guardian", "Defeat the Third Guardian in the Pagoda Tower without healing", points = 10,
    trigger = always_false()
)

achievement("No Heal - Kondo", "Defeat the Kondo in the Pagoda Tower without healing", points = 10,
    trigger = always_false()
)

achievement("S Rank - Episode 2", "Clear Episode 2 with an S Rank", points = 10,
    trigger = always_false()
)

// -- Episode 3 -- //

achievement("Siver Otakki - Episode 3", "Correctly answer Siver Otakki's question in Episode 3", points = 2,
    trigger = Episode3_SiverOtakkiQuestion()
)

achievement("Subway Train", "Collect all items on the Subway Train before time runs out", points = 10,
    trigger = always_false()
)

achievement("Big Magnum", "Find the Big Magnum in the Underground Terminous", points = 3,
    trigger = always_false()
)

achievement("Giant Mech", "Destroy all of the Giant Mech's parts in the Underground Terminous", points = 3,
    trigger = always_false()
)

achievement("Trailer Lift", "Operate both Trailer Lifts in the Underground Terminous", points = 3,
    trigger = always_false()
)

achievement("No Heal - Sperio", "Defeat Sperio in the Underground Terminous without healing", points = 10,
    trigger = always_false()
)

achievement("No Damage - Terminous Junkblade", "Clear the Junkblade sequence in the Underground Terminous without taking damage", points = 10,
    trigger = always_false()
)

achievement("S Rank - Episode 3", "Clear Episode 3 with an S Rank", points = 10,
    trigger = always_false()
)

// -- Episode 4 -- //

achievement("Siver Otakki - Episode 4", "Correctly answer Siver Otakki's question in Episode 4", points = 2,
    trigger = Episode4_SiverOtakkiQuestion()
)

achievement("Hard Dancing", "Clear the Dance sequence in the Aqua Liberty Ballroom with passion", points = 5,
    trigger = always_false()
)

achievement("Bat Maniac", "Find the Bat Maniac Outfit in the Aqua Liberty Ballroom", points = 3,
    trigger = always_false()
)

achievement("No Heal - Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom without healing", points = 10,
    trigger = always_false()
)

achievement("S Rank - Episode 4", "Clear Episode 4 with an S Rank", points = 10,
    trigger = always_false()
)

// -- Episode 5 -- //

achievement("Siver Otakki - Episode 5", "Find Siver Otakki's Special Treasure in Episode 5", points = 5,
    trigger = always_false()
)

achievement("Church Emeralds", "Find all gems in the East Edge Church in Episode 5", points = 3,
    trigger = always_false()
)

achievement("T-Rex", "Defeat a T-Rex using a Quicksand trap in the Jungle", points = 5,
    trigger = always_false()
)

achievement("Laser Cannons", "Destroy all 4 Laser Cannons in the Jungle", points = 5,
    trigger = always_false()
)

achievement("No Damage - River Ride 1", "Clear the River Ride part 1 in the Jungle without taking damage", points = 5,
    trigger = always_false()
)

achievement("Monsterous Tentacles", "Destroy all of the Mutated Plant's tentacles before defeating it, in the Jungle", points = 5,
    trigger = always_false()
)

achievement("No Damage - River Ride 2", "Clear the River Ride part 2 in the Jungle without taking damage", points = 5,
    trigger = always_false()
)

achievement("No Heal - Tiger", "Defeat Tiger in the Jungle without healing", points = 10,
    trigger = always_false()
)

achievement("Miyabi Suit", "Find the Y.O. Miyabi Suit in the Jamelgalda Prison", points = 3,
    trigger = always_false()
)

achievement("No Heal - Lady", "Defeat Lady in the Jamelgalda Prison without healing", points = 10,
    trigger = always_false()
)

achievement("No Heal - Adidi", "Defeat Adidi in the Jamelgalda Prison without healing", points = 10,
    trigger = always_false()
)

achievement("S Rank - Episode 5", "Clear Episode 5 with an S Rank", points = 10,
    trigger = always_false()
)

// -- Episode 6 -- //


achievement("East Edge Treasure", "Find the hidden East Edge Treasure in Episode 6", points = 3,
    trigger = always_false()
)

achievement("Geo Stones", "Find all gems in the Gloom Alley Streets", points = 3,
    trigger = always_false()
)

achievement("Agressive Siver", "Defeat a Mysterious Adversary in Episode 6", points = 10,
    trigger = always_false()
)

achievement("Machine Gun", "Find the Machine Gun in the Gloom Alley Ghost House", points = 3,
    trigger = always_false()
)

achievement("S Rank - Episode 6", "Clear Episode 6 with an S Rank", points = 10,
    trigger = always_false()
)

// -- Episode 7 -- //

achievement("Monsterous Clues", "Listen to all clues from a set of sagely creatures in Shangri-la", points = 2,
    trigger = always_false()
)

achievement("Katana", "Find the Katana in Shangri-la", points = 3,
    trigger = always_false()
)

achievement("No Heal - Kondo 2", "Defeat Kondo in Shangri-la without healing", points = 10,
    trigger = always_false()
)

achievement("Minimum Damage - Zeno", "Defeat Zeno in Shangri-la with 50% or more health remaining", points = 10,
    trigger = always_false()
)

achievement("No Damage - Tempest", "Defeat Tempest in Shangri-la without taking damage", points = 10,
    trigger = always_false()
)

achievement("Minimum Damage - Zeno 2", "Defeat Traveler Zeno in Shangri-la with 50% or more health remaining", points = 10,
    trigger = always_false()
)

achievement("No Damage - Shangri-la Junkblade", "Clear the Shangri-la Junkblade sequence without taking damage", points = 10,
    trigger = always_false()
)

achievement("S Rank - Episode 7", "Clear Episode 7 with an S Rank", points = 10,
    trigger = always_false()
)

// -- Episode 8 -- //

achievement("Unlock Episode 8", "Clear Episode 7 after acquiring a total of 2000 CP or more", points = 10,
    trigger = always_false()
)

achievement("Snacks", "Find all snacks in Episode 8", points = 10, 
    trigger = always_false()
)

achievement("Final Break Down", "Clear Episode 8", points = 10,
    trigger = always_false()
)

achievement("Emergency Spray", "Clear Episode 8 with 5 or more Emergency Sprays remaining", points = 25,
    trigger = always_false()
)