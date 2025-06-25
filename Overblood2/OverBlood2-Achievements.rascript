// OverBlood 2
// #ID = 9264
// Author: TwosomesUP
// RetroAchievements - Achievement Script

// ------------------------- Accessors ------------------------- //
//d104c
Game = {
    "Episode": dword(0x1be9e8),
    "Paused": dword(0xd2f58),
    "MiniGame": dword(0xd2f60),
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
    },
    "Flags": {
        "Episode1":{
            "20YrOldSuit": bit2(0x1beb18),
            "ArmyJacket": bit1(0x1beb20),
            "SpikedBoots": bit2(0x1beb20),
            "LaserKnife": bit4(0x1beb28),
            "InsulatorBoots": bit1(0x1beb38),
            "WetSuit": bit0(0x1beb60)
        },
        "Episode5":{
            "DefeatedPlant": bit4(0x1beaf8)
        },
        "Episode7":{
            "Katana": bit4(0x1beba2),
            "DivaPieces": [
                bit2(0x1beb99),
                bit3(0x1beb79),
                bit0(0x1beb38),
                bit3(0x1beb08),
                bit4(0x1beb08),
                bit0(0x1beb00),
                bit3(0x1beaf9),
                bit7(0x1beba1)
            ]
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
        "ArriveOnBillboardIsland": bit3(0x1bf4dc),
        "OpenedPowerRoomDoor": bit4(0x1bf4db)
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
    },
    "Episode5":{
        "MoonlightBoots": bit1(0x1bf4e1),
        "AntiGravityStation": bit1(0x1bf4cb)
    },
    "Episode6":{
        "MuseumTreasure": bit0(0x1bf4d4),
        "GaveBanana": bit5(0x1bf4cc),
        "GotGhostHouseKey": bit0(0x1bf4e0),
        "UnlockedGhostHouseDoor": bit1(0x1bf4e0)
    },
    "Episode7":{
        "UnlockElevator": bit7(0x1bf4d3), // Use this
        "DeactivateCore": bit3(0x1bf4d3)
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
    "Equipment":{
       "HookShot": 0x01,
        "Transceiver": 0x02,
        "SmallAqualung": 0x03,
        "GravityController": 0x04,
        "FreezePack": 0x05,
        "HeatPack": 0x06,
        "Snooper": 0x07,
        "InstantPlate": 0x08, 
    },
    "Cure":{
       "EmergencySpray": 0x0b,
        "ExtinguisherSpray": 0x0c,
        "PortableAir": 0x0d, 
    },
    "Weapons": {
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
    },
    "Ammo": {
       "MagazineCartridge": 0x20,
        "EnergyPack": 0x21,
        "AirPack": 0x22,
        "BazookaRound": 0x23,
        "MachineGunCartridge": 0x25,
        "OilCartridge": 0x26,
        "FireExtinguisherCartridge": 0x27,
        "MagnumShell": 0x28, 
    },
    "Bombs": {
       "Grenade": 0x2a,
        "TimeBomb": 0x2b,
        "SwitchBomb": 0x2c,
        "BurstBomb": 0x2d,
        "Decoy": 0x2e, 
    },
    "Boots": {
       "BladeBoots": 0x31,
        "CoolSole": 0x32,
        "ShockAbsorber": 0x33,
        "Insulator": 0x34,
        "RubberBoots": 0x35,
        "SpikedBoots": 0x36,
        "MoonlightBoots": 0x37,
        "LeatherBoots": 0x38,
        "HeavyBoots": 0x39, 
    },
    "AcarnoJackets": {
       "WesternJacket": 0x3a,
        "RedLeather": 0x3b,
        "WolfJacket": 0x3c,
        "ArmyJacket": 0x3d,
        "ShieldJacket": 0x3e,
        "ParaJacket": 0x3f,
        "WetSuit": 0x40,
        "DanceOutfit": 0x41,
        "BlackLeather": 0x42, 
    },
    "NavarroSuits": {
        "NavarroCustom": 0x43,
        "HeatProofSuit": 0x44,
        "USCivialSuit": 0x45,
        "ChineseMafiaSuit": 0x46,
        "TigerSuit": 0x47,
        "BatManiacSuit": 0x48,
        "20YrOldSuit": 0x49,
        "LabelPlus": 0x4a,
        "LabelSuit": 0x4b,
    },
    "ChrisSuits": {
        "ExoticPanther": 0x4c,
        "YOMiyabiSuit": 0x4d,
        "FlightWear": 0x4e,
        "YOAngelSuit": 0x4f,
        "PumpkinSuit": 0x50,  
    },
    "KeyItems": {
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
}

ObjectInteractions = {
    "Any": {
      "EastEdgeSiver": {
          "ID": 0x67,
          "Scene": {
              "Begin": 0x102,
              "End": 0x120
          }
      },
      "WindowPayment":{
          "ID": 0x67,
          "Scene": {
              "Begin": 0x56,
              "End": 0x5d
          }
      }
    },
    "Episode4":{
      "DanceComplete":{
          "ID": 0x98,
          "Scene":{
              "Begin": 0x6d,
              "End": 0xc1
          }
      }  
    },
    "Episode5":{
      "River1Complete":{
          "ID": 0x96,
          "Scene":{
              "Begin": 0x186,
              "End": 0x1c7
          }
      },
      "River2Complete":{
          "ID": 0x96,
          "Scene":{
              "Begin": 0x105,
              "End": 0x115
          }
      }
    },
    "Episode6":{
      "JunkyardRace":{
         "ID": 0x98,
          "Scene": {
              "Begin": 0x2d,
              "End": 0x606
          } 
      }
    },
    "Episode7":{
        "Creature1":{
            "ID": 0xda,
            "Scene":{
                "Begin": 0x00,
                "End": 0x31
            }
        },
        "Creature2":{
            "ID": 0xdb,
            "Scene":{
                "Begin": 0x37,
                "End": 0x3a
            }
        },
        "Creature3":{
            "ID": 0xdc,
            "Scene":{
                "Begin": 0x54,
                "End": 0x57
            }
        },
        "Creature4":{
            "ID": 0xde,
            "Scene":{
                "Begin": 0x00,
                "End": 0x88
            }
        },
        "Creature5":{
            "ID": 0xdd,
            "Scene":{
                "Begin": 0x71,
                "End": 0x74
            }
        },
        "JunkbladeRace":{
          "ID": 0xcf,
          "Scene":{
              "Begin": 0x00,
              "End": 0x00
          }
      }  
    },
    "Episode8": {
        "Complete": {
            "ID": 0x00,
            "Scene": {
                "Begin": 0x24,
                "End": 0x27
            }
        }
    }
}

Rooms = {
    "Any":{
      "SiverOtakkiQuestion": [8, 5, 2],
      "WindowShop": [8, 2, 7]
    },
    "Episode1": {
        "SubmarineBay": [1, 5, 0],
        "Submarine": [1, 5, 1],
        "GoldDoorRoom": [1, 3, 4],
        "RedDoorRoom": [1, 3, 3],
        "SilverDoorRoom1": [1, 3, 7],
        "SilverDoorRoom2": [1, 3, 6],
        "SilverDoorRoom3": [1, 3, 5],
        "GumboFight": [1, 3, 0],
        "TurretSequence": [1, 6, 2],
        "TurretSequence_End": [1, 6, 1]
    },
    "Episode2": {
        "KondoFight": [2, 4, 3],
        "KondoFightEnd": [2, 4, 2]
    },
    "Episode3": {
        "SubwayStation": [3, 1, 0],
        "SubwayTracks": [3, 1, 1],
        "SubwayTrain": [3, 1, 2],
        "UndergroundTerminousStation_Cutscene": [3, 0, 0],
        "UndergroundTerminousStation": [3, 2, 0],
        "SperioFight": [3, 2, 8],
        "AntiProton": [3, 2, 8],
        "JunkBladeScene": [3, 2, 9],
        "JunkBladeScene_End": [3, 2, 0xb]
    },
    "Episode4": {
      "DanceSequence": [4, 1, 5],
      "GartludeFight": [4, 1, 2]
    },
    "Episode5": {
        "SiverTreasure": [8, 5, 0],
        "ChurchControlRoom": [8, 1, 2],
        "JungleStart": [5, 1, 0],
        "JungleRiver": [5, 0, 0],
        "RiverPart1": [5, 2, 0],
        "RiverPart1_End": [5, 1, 7],
        "MutantPlant": [5, 1, 3],
        "RiverPart2": [5, 2, 1],
        "RiverPart2_End": [5, 2, 2],
        "AntiGravityStation": [5, 2, 2],
        "TigerFight": [5, 1, 0xd],
        "LadyFight": [5, 3, 2],
        "AdidiFight": [5, 3, 0]
    },
    "Episode6": {
        "MuseumStreet": [8, 3, 3],
        "EastEdgeBridge": [8, 4, 7],
        "GloomAlleyEntrance": [8, 4, 8],
        "GloomAlleyStart": [6, 1, 0],
        "GloomAlleyBar": [6, 1, 2],
        "GhostHouseYard": [6, 1, 3],
        "GhostHouseEntryway": [6, 1, 4],
        "GhostHouseWaterTower": [6, 1, 5],
        "JunkyardHighway": [6, 2, 0],
        "JunkyardRace": [6, 2, 3]
    },
    "Episode7": {
        "AirShip": [7, 0, 4],
        "BurningBridge": [7, 0, 7],
        "AirDock": [7, 1, 0],
        "CreatureRoom": [7, 1, 3],
        "MechMaze": [7, 1, 2],
        "CryoRoom": [7, 1, 4],
        "CrysalRoom": [7, 1, 6],
        "KondoFight": [7, 1, 0xb],
        "Zeno1Fight": [7, 2, 4],
        "TempestFight": [7, 2, 5],
        "EngineCore": [7, 2, 7],
        "Zeno2Fight": [7, 2, 0xd],
        "JunkbladeRace": [7, 2, 0xa]
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

function TriggeredItemFlag(episode, flag){
    return Game["Episode"] == episode &&
        prev(Items["Flags"]["Episode" + episode][flag]) < Items["Flags"]["Episode" + episode][flag]
}

function TriggeredItemFlagCount(episode, flags, measured = false){
    count = length(flags)
    prevTotal = 0
    total = 0
    
    for flag in range(0, count - 1) {
        prevTotal = prevTotal + prev(Items["Flags"]["Episode" + episode][flags[flag]])
        total = total + Items["Flags"]["Episode" + episode][flags[flag]]
    }
    
    countCheck = total >= count
    
    if(measured)
        countCheck = measured(countCheck)
    
    return Game["Episode"] == episode &&
        prevTotal < count &&
        countCheck
}

function CompletedMinigame(episode, room){
    return Game["Episode"] == episode &&
        IsInRoom(Rooms["Episode" + episode][room], true) &&
        prev(Game["MiniGame"]) == 1 &&
        Game["MiniGame"] == 0
}

function CompletedMinigameChallenge(episode, room, points){
    return Game["Episode"] == episode &&
        IsInRoom(Rooms["Episode" + episode][room], true) &&
        Game["ClearStats"]["Episode" + episode]["CP"] >= prev(Game["ClearStats"]["Episode" + episode]["CP"]) + points
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

function IsInAnyRoom(episode, rooms){
    return any_of(rooms, room => IsInRoom(Rooms["Episode" + episode][room]))
}

function RoomTransition(start, end){
    return IsInRoom(start, true) &&
        IsInRoom(end)
}

function DefeatedBoss(episode, map){
    return Game["Episode"] == episode &&
        IsInRoom(Rooms["Episode" + episode][map]) &&
        prev(Enemies["Boss"]["HP"]) != 0x00 &&
        Enemies["Boss"]["HP"] == 0x00
}

function AnswerSiverOtakki(episode){
    return !IsOnTitle() &&
        Game["Episode"] == episode &&
        TriggeredScene(0, "SiverOtakkiQuestion", "EastEdgeSiver", true)
}

function TriggeredScene(episode, room, scene, any = false){
    episodeCheck = always_true()
    sceneIdCheck = always_true()
    sceneEpisode = "Episode" + episode
    
    if (any)
        sceneEpisode = "Any"
    else {
        if (episode != 8)
            episodeCheck = Game["Episode"] == episode
    }
    
    if (episode != 8)
        sceneIdCheck =  Objects["LastInteraction"]["ID"] == ObjectInteractions[sceneEpisode][scene]["ID"]
 
    return episodeCheck &&
        IsInRoom(Rooms[sceneEpisode][room]) &&
        sceneIdCheck &&
        prev(Objects["LastInteraction"]["SceneIndex"]) == ObjectInteractions[sceneEpisode][scene]["Scene"]["Begin"] &&
        Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions[sceneEpisode][scene]["Scene"]["End"]
}

function WasInMinigame(){
    return prior(Game["Map"]["Location"]) == 0xffffffff
}

function SpokeToCreature(number){
    return once(
        Game["Episode"] == 7 &&
        IsInRoom(Rooms["Episode7"]["CreatureRoom"]) &&
        Objects["LastInteraction"]["ID"] == ObjectInteractions["Episode7"]["Creature" + number]["ID"] &&
        prev(Objects["LastInteraction"]["SceneIndex"]) == ObjectInteractions["Episode7"]["Creature" + number]["Scene"]["Begin"] &&
        Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions["Episode7"]["Creature" + number]["Scene"]["End"]
    )
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

// Any Episode - Achievement Functions //

function Any_PayedForWindow(){
    return !IsOnTitle() &&
        TriggeredScene(0, "WindowShop", "WindowPayment", true)
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
        DefeatedBoss(1, "GumboFight")
}

function Episode1_ClearTurret(){
    return !IsOnTitle() &&
        CompletedMinigame(1, "TurretSequence")
}

function Episode1_ClearTurretChallenge(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(1, "TurretSequence", 30)
}

function Episode1_ClearEpisode(){
    return CompletedEpisode(1)
}

function Episode1_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(1)
}

function Episode1_Treasures(){
    return !IsOnTitle() &&
        IsInAnyRoom(1, ["Submarine", "GoldDoorRoom", "RedDoorRoom", "SilverDoorRoom1", "SilverDoorRoom3"]) &&
        TriggeredItemFlagCount(1, ["WetSuit", "ArmyJacket", "SpikedBoots", "20YrOldSuit", "InsulatorBoots", "LaserKnife"], true)
}

function Episode1_EnterPowerRoomWithKey(){
    return !IsOnTitle() &&
        TriggeredEvent(1, "OpenedPowerRoomDoor")
}

function Episode1_EnterTheSubmarine(){
    return !IsOnTitle() &&
        RoomTransition(Rooms["Episode1"]["SubmarineBay"], Rooms["Episode1"]["Submarine"])
}

// Episode 2 - Achievement Functions //

function Episode2_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(2)
}

function Episode2_ReachPagodaTower(){
    return !IsOnTitle() &&
        TriggeredEvent(2, "ArrivedInPagoda")
}

function Episode2_DestroyFirstGuard(){
    return !IsOnTitle() &&
        TriggeredEvent(2, "DefeatedFirstGuardingSystem")
}

function Episode2_DestroySecondGuard(){
    return !IsOnTitle() &&
        TriggeredEvent(2, "DefeatedSecondGuardingSystem")
}

function Episode2_DestroyThirdGuard(){
    return !IsOnTitle() &&
        TriggeredEvent(2, "DefeatedThirdGuardingSystem")
}

function Episode2_DefeatedKondo(){
    return !IsOnTitle() &&
        DefeatedBoss(2, "KondoFight")
}

function Episode2_ClearEpisode(){
    return CompletedEpisode(2)
}

function Episode2_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(2)
}

// Episode 3 - Achievement Functions //

function Episode3_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(3)
}

function Episode3_ReachUndergroundTerminous(){
    return !IsOnTitle() &&
        Game["Episode"] == 3 &&
        RoomTransition(Rooms["Episode3"]["UndergroundTerminousStation_Cutscene"], Rooms["Episode3"]["UndergroundTerminousStation"])
}

function Episode3_DestroyAntiProtonCore(){
    return !IsOnTitle() &&
        TriggeredEvent(3, "PlacedPlasmaBomb")
}

function Episode3_DefeatSperio(){
    return !IsOnTitle() &&
        DefeatedBoss(3, "SperioFight")
}

function Episode3_CompleteJunkbladeScene(){
    return !IsOnTitle() &&
        CompletedMinigame(3, "JunkBladeScene")
}

function Episode3_CompleteJunkbladeScene_NoDamage(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(3, "JunkBladeScene", 80)
}

function Episode3_CompleteEpisode(){
    return CompletedEpisode(3)
}

function Episode3_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(3)
}

// Episode 4 - Achievement Functions //

function Episode4_SiverOtakkiQuestion(){
    return AnswerSiverOtakki(4)
}

function Episode4_CompleteDanceScene(){
    return !IsOnTitle() &&
        CompletedMinigame(4, "DanceSequence")
}

function Episode4_DefeatedGartlude(){
    return !IsOnTitle() &&
        DefeatedBoss(4, "GartludeFight")
}

function Episode4_CompleteDanceScene_MaxCP(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(4, "DanceSequence", 100)
}

function Episode4_ClearEpisode(){
    return CompletedEpisode(4)
}

function Episode4_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(4)
}

// Episode 5 - Achievement Functions //

function Episode5_FoundSiverTreasure(){
    return !IsOnTitle() &&
        TriggeredEvent(5, "MoonlightBoots")
}

function Episode5_ReachJungle(){
    return !IsOnTitle() &&
        Game["Episode"] == 5 &&
        RoomTransition(Rooms["Episode5"]["ChurchControlRoom"], Rooms["Episode5"]["JungleStart"])
}

function Episode5_ClearRiver1(){
    return !IsOnTitle() &&
        CompletedMinigame(5, "RiverPart1")
}

function Episode5_DefeatedPlant(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode5"]["MutantPlant"]) &&
        TriggeredItemFlag(5, "DefeatedPlant")
}

function Episode5_ClearRiver2(){
    return !IsOnTitle() &&
        CompletedMinigame(5, "RiverPart2")
}

function Episode5_DestroyAntiGravityStation(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode5"]["AntiGravityStation"]) &&
        TriggeredEvent(5, "AntiGravityStation")
}

function Episode5_DefeatedTiger(){
    return !IsOnTitle() &&
        DefeatedBoss(5, "TigerFight")
}

function Episode5_DefeatedLady(){
    return !IsOnTitle() &&
        DefeatedBoss(5, "LadyFight")
}

function Episode5_DefeatedAdidi(){
    return !IsOnTitle() &&
        DefeatedBoss(5, "AdidiFight")
}

function Episode5_ClearEpisode(){
    return CompletedEpisode(5)
}

function Episode5_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(5)
}

// Episode 6 - Achievement Functions //

function Episode6_EastEdgeSecret(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode6"]["MuseumStreet"]) &&
        TriggeredEvent(6, "MuseumTreasure")
}

function Episode6_GiveOrphanBanana(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode6"]["EastEdgeBridge"]) &&
        TriggeredEvent(6, "EastEdgeBridge")
}

function Episode6_ReachGloomAlley(){
    return !IsOnTitle() &&
        Game["Episode"] == 6 &&
        RoomTransition(Rooms["Episode6"]["GloomAlleyEntrance"], Rooms["Episode6"]["GloomAlleyStart"])
}

function Episode6_FindGhostHouseKey(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode6"]["GloomAlleyBar"]) &&
        TriggeredEvent(6, "GotGhostHouseKey")
}

function Episode6_AlternateGhostHouse(){
    return !IsOnTitle() &&
        Game["Episode"] == 6 &&
        Events["Episode6"]["UnlockedGhostHouseDoor"] == 0 &&
        (
            (RoomTransition(Rooms["Episode6"]["GhostHouseYard"], Rooms["Episode6"]["GhostHouseEntryway"])) ||
            (RoomTransition(Rooms["Episode6"]["GhostHouseYard"], Rooms["Episode6"]["GhostHouseWaterTower"])) 
        )
}

function Episode6_ReachJunkyard(){
    return !IsOnTitle() &&
        Game["Episode"] == 6 &&
        RoomTransition(Rooms["Episode6"]["GhostHouseYard"], Rooms["Episode6"]["JunkyardHighway"])
}

function Episode6_WinJunkyardRace(){
    return !IsOnTitle() &&
        CompletedMinigame(6, "JunkyardRace")
}

function Episode6_ClearEpisode(){
    return CompletedEpisode(6)
}

function Episode6_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(6)
}

// Episode 7 - Achievement Functions //

function Episode7_UnlockedEpisode8(){
    return CompletedEpisode(7) &&
        prev(!IsEpisode8Unlocked()) &&
        IsEpisode8Unlocked()
}

function Episode7_ReachShangrila(){
    return !IsOnTitle() &&
        Game["Episode"] == 7 &&
        RoomTransition(Rooms["Episode7"]["AirShip"], Rooms["Episode7"]["AirDock"])
}

function Episode7_CreatureClues(){
    return measured(tally(5, 
            once(SpokeToCreature(1)),
            once(SpokeToCreature(2)),
            once(SpokeToCreature(3)),
            once(SpokeToCreature(4)),
            once(SpokeToCreature(5))
        )) &&
        never(IsOnTitle()) &&
        never(Game["Episode"] != 7)
}

function Episode7_CryoRoom(){
    return !IsOnTitle() &&
        Game["Episode"] == 7 &&
        RoomTransition(Rooms["Episode7"]["MechMaze"], Rooms["Episode7"]["CryoRoom"])
}

function Episode7_ActivateElevator(){
    return !IsOnTitle() &&
    TriggeredEvent(7, "UnlockElevator")
}

function Episode7_GotDivaPieces(){
    return !IsOnTitle() &&
        prev(sum_of(Items["Flags"]["Episode7"]["DivaPieces"], item => item)) == 7 &&
        measured(sum_of(Items["Flags"]["Episode7"]["DivaPieces"], item => item) == 8, Game["Episode"] == 7)
}

function Episode7_DefeatedKondo(){
    return !IsOnTitle() &&
        DefeatedBoss(7, "KondoFight")
}

function Episode7_DefeatedZeno1(){
    return DefeatedBoss(7, "Zeno1Fight")
}

function Episode7_DefeatedTempest(){
    return !IsOnTitle() &&
        DefeatedBoss(7, "TempestFight")
}

function Episode7_DeactivatedCore(){
    return !IsOnTitle() &&
        TriggeredEvent(7, "DeactivateCore")
}

function Episode7_DefeatedZeno2(){
    return DefeatedBoss(7, "Zeno2Fight")
}

function Episode7_CompletedJunkbladeEscape(){
    return !IsOnTitle() &&
        CompletedMinigame(7, "JunkbladeRace")
}

function Episode7_CompletedEpisode(){
    return CompletedEpisode(7)
}

function Episode7_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(7)
}

function Episode7_AcquiredKatana(){
    return !IsOnTitle() &&
        IsInRoom(Rooms["Episode7"]["BurningBridge"]) &&
        TriggeredItemFlag(7, "Katana")
}

// Episode 8 - Achievement Functions //

function Episode8_Completed(){
    return !IsOnTitle() &&
        IsEpisode8Unlocked() &&
        TriggeredScene(8, "End", "Complete")
}

// ------------------------- Achievement Definitions - Progression ------------------------- //

// -- Episode 1 -- //

achievement("East Edge", "Reach East Edge City", points = 2, type = "progression",
    trigger = Episode1_ReachEastEdge()
)

achievement("Billboard Island", "Reach Billboard Island", points = 2, type = "progression",
    trigger = Episode1_ReachBillboardIsland()
)

achievement("Siver Otakki - Episode 1", "Correctly answer Siver Otakki's question in Episode 1", points = 2, type = "missable",
    trigger = Episode1_SiverOtakkiQuestion()
)

achievement("Submarine", "Solve the Submarine Bay puzzle and enter the Submarine", points = 5, type = "missable",
    trigger = Episode1_EnterTheSubmarine()
)

achievement("Billboard Treasures", "Find all Weapons, Clothing, and Boots hidden on Billboard Island", points = 10, type = "missable",
    trigger = Episode1_Treasures()
)

achievement("Power Room Door", "Enter the Power Room Door on Billboard Island using the Silver Key", points = 3, type = "missable",
    trigger = Episode1_EnterPowerRoomWithKey()
)

achievement("No Heal - Gumbo", "Defeat Gumbo the Robot on Billboard Island without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Clear Challenge - Turret", "Gain 30 or more CP during the Turret Sequence on Billboard Island", points = 5, type = "missable",
    trigger = Episode1_ClearTurretChallenge()
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

achievement("S Rank - Episode 1", "Clear Episode 1 with an S Rank", points = 10, type = "missable",
    trigger = Episode1_ClearEpisode_SRank()
)

// -- Episode 2 -- //

achievement("Pagoda Tower", "Reach the Pagoda Tower", points = 2, type = "progression",
    trigger = Episode2_ReachPagodaTower()
)

achievement("First Guarding", "Destroy the First Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DestroyFirstGuard()
)

achievement("Second Guarding", "Destroy the Second Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DestroySecondGuard()
)

achievement("Third Guarding", "Destroy the Third Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DestroyThirdGuard()
)

achievement("Kondo", "Defeat Kondo in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DefeatedKondo()
)

achievement("Awakening", "Escape the Pagoda Tower and Clear Episode 2", points = 5, type = "progression",
    trigger = Episode2_ClearEpisode()
)

// -- Episode 3 -- //

achievement("Underground Terminous", "Reach the Underground Terminous", points = 2, type = "progression",
    trigger = Episode3_ReachUndergroundTerminous()
)

achievement("Anti Proton", "Destroy the Anti Proton Core with the Plasma Bomb in the Underground Terminous", points = 2, type = "progression",
    trigger = Episode3_DestroyAntiProtonCore()
)

achievement("Sperio", "Defeat Sperio in the Underground Terminous", points = 3, type = "progression",
    trigger = Episode3_DefeatSperio()
)

achievement("Underground Space", "Escape the Underground Terminous on Sperio's Junkblade and Clear Episode 3", points = 5, type = "progression",
    trigger = Episode3_CompleteEpisode()
)

// -- Episode 4 -- //

achievement("Dance Sequence", "Clear the Dance Sequence in the Aqua Liberty Ballroom", points = 2, type = "progression",
    trigger = Episode4_CompleteDanceScene()
)

achievement("Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom Station", points = 3, type = "progression",
    trigger = Episode4_DefeatedGartlude()
)

achievement("Bloody Rose", "Escape the Aqua Liberty Ballroom and Clear Episode 4", points = 5, type = "progression",
    trigger = Episode4_ClearEpisode()
)

// -- Episode 5 -- //

achievement("Jungle", "Reach the Jungle", points = 2, type = "progression",
    trigger = Episode5_ReachJungle()
)

achievement("Mutated Plant", "Defeat the Mutated Plant in the Jungle", points = 3, type = "progression",
    trigger = Episode5_DefeatedPlant()
)

achievement("Anti Gravity", "Destroy Anti Gravity Defense Station in the Jungle", points = 2, type = "progression",
    trigger = Episode5_DestroyAntiGravityStation()
)

achievement("Tiger", "Defeat Tiger in the Jungle", points = 5, type = "progression",
    trigger = Episode5_DefeatedTiger()
)

achievement("Lady", "Defeat Lady in the Jamelgalda Prison", points = 5, type = "progression",
    trigger = Episode5_DefeatedLady()
)

achievement("Deceptive Jungle", "Defeat Adidi, escape the Jamelgalda Prison, and clear Episode 5", points = 10, type = "progression",
    trigger = Episode5_ClearEpisode()
)

// -- Episode 6 -- //

achievement("Gloom Alley", "Reach Gloom Alley", points = 3, type = "progression",
    trigger = Episode6_ReachGloomAlley()
)

achievement("Ghost House", "Find the Ghost House Key", points = 3, type = "missable",
    trigger = Episode6_FindGhostHouseKey()
)

achievement("Breaking and Entering", "Enter the Ghost House without unlocking the front door", points = 3, type = "missable",
    trigger = Episode6_AlternateGhostHouse()
)

achievement("Junkyard", "Reach the Junkyard", points = 3, type = "progression",
    trigger = Episode6_ReachJunkyard()
)

achievement("Junkyard Race", "Win the Junkyard Race", points = 5, type = "progression",
    trigger = Episode6_WinJunkyardRace()
)

achievement("Edgy Kids", "Discover your hidden powers and clear Episode 6", points = 10, type = "progression",
    trigger = Episode6_ClearEpisode()
)

// -- Episode 7 -- //

achievement("Shangri-la", "Reach Shangri-la", points = 3, type = "progression",
    trigger = Episode7_ReachShangrila()
)

achievement("Cryo Room", "Find a familiar location from Raz's past", points = 1, type = "missable",
    trigger = Episode7_CryoRoom()
)

achievement("Elevator", "Activate the Shangri-la Elevator", points = 5, type = "progression",
    trigger = Episode7_ActivateElevator()
)

achievement("Kondo 2", "Defeat Kondo in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_DefeatedKondo()
)

achievement("Diva Pieces", "Find all Diva Pieces in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_GotDivaPieces()
)

achievement("Zeno", "Defeat Zeno in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_DefeatedZeno1()
)

achievement("Tempest", "Defeat Tempest in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_DefeatedTempest()
)

achievement("Power Source", "Destroy the Shangri-la Power Source", points = 5, type = "progression",
    trigger = Episode7_DeactivatedCore()
)

achievement("Zeno 2", "Defeat Traveler Zeno in Shangri-la", points = 10, type = "progression",
    trigger = Episode7_DefeatedZeno2()
)

achievement("Shangri-la Junkblade", "Escape Shangri-la on your Junkblade", points = 10, type = "progression",
    trigger = Episode7_CompletedJunkbladeEscape()
)

achievement("Another Future", "Prevent an uncertain future and clear Episode 7", points = 25, type = "win_condition",
    trigger = Episode7_CompletedEpisode()
)

// ------------------------- Achievement Definitions - Challenges ------------------------- //

// -- Any -- //

achievement("Window Pain", "Break an Array Bridge Shop Window and pay for your actions", points = 3,
    trigger = Any_PayedForWindow()
)

// -- Episode 2 -- //

achievement("Siver Otakki - Episode 2", "Correctly answer Siver Otakki's question in Episode 2", points = 2, type = "missable",
    trigger = Episode2_SiverOtakkiQuestion()
)

achievement("Fire Extinguisher", "Find the Fire Extinguisher in the Pagoda Tower", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Heavy Boots", "Find the Heavy Boot in the Pagoda Tower", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Heat Proof", "Find the Heat Proof Suit in the Pagoda Tower", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Oil Tanks", "Destroy all 3 Oil Tanks in the Pagoda Tower", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Monitors", "Break all of the Monitors in the Pagoda Tower Control Room", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Super Light Sabre", "Find the Super Light Sabre in the Pagoda Tower", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Flame Thrower", "Find the Flame Thrower in the Pagoda Tower", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Dangerous Gems", "Find all 4 gems in the Pagoda Tower Third Guarding System Underwater Passage", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Heal - First Guardian", "Defeat the First Guardian in the Pagoda Tower without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Second Guardian", "Defeat the Second Guardian in the Pagoda Tower without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Third Guardian", "Defeat the Third Guardian in the Pagoda Tower without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Kondo", "Defeat the Kondo in the Pagoda Tower without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("S Rank - Episode 2", "Clear Episode 2 with an S Rank", points = 10, type = "missable",
    trigger = Episode2_ClearEpisode_SRank()
)

// -- Episode 3 -- //

achievement("Siver Otakki - Episode 3", "Correctly answer Siver Otakki's question in Episode 3", points = 2, type = "missable",
    trigger = Episode3_SiverOtakkiQuestion()
)

achievement("Subway Train", "Collect all items on the Subway Train before time runs out", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Big Magnum", "Find the Big Magnum in the Underground Terminous", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Giant Mech", "Destroy all of the Giant Mech's parts in the Underground Terminous", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Trailer Lift", "Operate both Trailer Lifts in the Underground Terminous", points = 3, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Sperio", "Defeat Sperio in the Underground Terminous without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Damage - Terminous Junkblade", "Clear the Junkblade sequence in the Underground Terminous without taking damage", points = 10, type = "missable",
    trigger = Episode3_CompleteJunkbladeScene_NoDamage()
)

achievement("S Rank - Episode 3", "Clear Episode 3 with an S Rank", points = 10, type = "missable",
    trigger = Episode3_ClearEpisode_SRank()
)

// -- Episode 4 -- //

achievement("Siver Otakki - Episode 4", "Correctly answer Siver Otakki's question in Episode 4", points = 2, type = "missable",
    trigger = Episode4_SiverOtakkiQuestion()
)

achievement("Hard Dancing", "Clear the Dance sequence in the Aqua Liberty Ballroom with passion", points = 5, type = "missable",
    trigger = Episode4_CompleteDanceScene_MaxCP()
)

achievement("Bat Maniac", "Find the Bat Maniac Outfit in the Aqua Liberty Ballroom", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Quick Kill - Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom in 20 seconds or less", points = 10, type = "missable",
    trigger = always_false()
)

achievement("S Rank - Episode 4", "Clear Episode 4 with an S Rank", points = 10, type = "missable",
    trigger = Episode4_ClearEpisode_SRank()
)

// -- Episode 5 -- //

achievement("Siver Otakki - Episode 5", "Find Siver Otakki's Special Treasure in Episode 5", points = 5, type = "missable",
    trigger = Episode5_FoundSiverTreasure()
)

achievement("Church Emeralds", "Find all gems in the East Edge Church in Episode 5", points = 3, type = "missable",
    trigger = always_false()
)

achievement("T-Rex", "Defeat a T-Rex using a Quicksand trap in the Jungle", points = 5, type = "missable",
    trigger = always_false()
)

achievement("Laser Cannons", "Destroy all 4 Laser Cannons in the Jungle", points = 5, type = "missable",
    trigger = always_false()
)

achievement("No Damage - River Ride 1", "Clear the River Ride part 1 in the Jungle without taking damage", points = 5, type = "missable",
    trigger = always_false()
)

achievement("Monsterous Tentacles", "Destroy all of the Mutated Plant's tentacles before defeating it, in the Jungle", points = 5, type = "missable",
    trigger = always_false()
)

achievement("No Damage - River Ride 2", "Clear the River Ride part 2 in the Jungle without taking damage", points = 5, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Tiger", "Defeat Tiger in the Jungle without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Miyabi Suit", "Find the Y.O. Miyabi Suit in the Jamelgalda Prison", points = 3, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Lady", "Defeat Lady in the Jamelgalda Prison without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Heal - Adidi", "Defeat Adidi in the Jamelgalda Prison without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("S Rank - Episode 5", "Clear Episode 5 with an S Rank", points = 10, type = "missable",
    trigger = Episode5_ClearEpisode_SRank()
)

// -- Episode 6 -- //


achievement("East Edge Treasure", "Find the hidden East Edge Treasure in Episode 6", points = 3, type = "missable",
    trigger = Episode6_EastEdgeSecret()
)

achievement("Geo Stones", "Find all gems in the Gloom Alley Streets", points = 3, type = "missable",
    trigger = always_false()
)

achievement("Agressive Siver", "Defeat a Mysterious Adversary in Episode 6", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Machine Gun", "Find the Machine Gun in the Gloom Alley Ghost House", points = 3, type = "missable",
    trigger = always_false()
)

achievement("S Rank - Episode 6", "Clear Episode 6 with an S Rank", points = 10, type = "missable",
    trigger = Episode6_ClearEpisode_SRank()
)

// -- Episode 7 -- //

achievement("Monsterous Clues", "Listen to all clues from a set of sagely creatures in Shangri-la", points = 2, type = "missable",
    trigger = Episode7_CreatureClues()
)

achievement("Katana", "Find the Katana in Shangri-la", points = 3, type = "missable",
    trigger = Episode7_AcquiredKatana()
)

achievement("No Heal - Kondo 2", "Defeat Kondo in Shangri-la without healing", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Minimum Damage - Zeno", "Defeat Zeno in Shangri-la with 50% or more health remaining", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Damage - Tempest", "Defeat Tempest in Shangri-la without taking damage", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Minimum Damage - Zeno 2", "Defeat Traveler Zeno in Shangri-la with 50% or more health remaining", points = 10, type = "missable",
    trigger = always_false()
)

achievement("No Damage - Shangri-la Junkblade", "Clear the Shangri-la Junkblade sequence without taking damage", points = 10, type = "missable",
    trigger = always_false()
)

achievement("S Rank - Episode 7", "Clear Episode 7 with an S Rank", points = 10, type = "missable",
    trigger = Episode7_ClearEpisode_SRank()
)

// -- Episode 8 -- //

achievement("Unlock Episode 8", "Clear Episode 7 after acquiring a total of 2000 CP or more", points = 10, type = "missable",
    trigger = always_false()
)

achievement("Snacks", "Find all snacks in Episode 8", points = 10,
    trigger = always_false()
)

achievement("Final Break Down", "Clear Episode 8", points = 10,
    trigger = Episode8_Completed()
)

achievement("Emergency Spray", "Clear Episode 8 with 5 or more Emergency Sprays remaining", points = 25,
    trigger = always_false()
)
