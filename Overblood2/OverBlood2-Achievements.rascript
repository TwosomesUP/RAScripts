// OverBlood 2
// #ID = 9264
// Author: TwosomesUP
// RetroAchievements - Achievement Script

// ------------------------- Accessors ------------------------- //
//d104c
Game = {
    "Episode": dword(0x1be9e8),
    "Paused": dword(0xd2f58),
    "Cutscene": dword(0xd2f54),
    "MiniGame": dword(0xd2f60),
    "OnTitle": dword(0xd2f64),
    "Episode4Cheat": byte(0x1f79d0),
    "Episode8Unlocked": byte(0xd2fa4),
    "Timer": byte(0x1e3ad4),
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
    "Index": dword(0x1bed90),
    "Start": 0x1bed94,
    "Size": 0x4c,
    "Offsets": {
        "Health": 0x00,
        "Air": 0x04,
        "GravityControllerStatus": 0x08,
        "WeaponSlot": 0x0c,
        "ClothingSlot": 0x10,
        "BootsSlot": 0x014
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
    "SelectedItem": {
        "ID": word(0xd35cc),
        "Slot": word(0xd35ce),
        "Action": word(0xd35d2)
    },
    "Inventory": {
        "Acarno": {
            "WeaponSlot": dword(0x1bed8c),
            "ClothingSlot": dword(0x1beda4),
            "BootsSlot": dword(0x1beda8) 
        },
        "EquippedWeaponSlot": dword(0x1bed8c),
        "EquippedClothingSlot": dword(0x1beda4),
        "EquippedBootsSlot": dword(0x1beda8),
        "State": word(0xd2f04),
        "Start": 0x1beec4,
        "SlotSize": 0xc,
        "Offsets": {
            "ID": 0x00,
            "Category": 0x02,
            "Count": 0x04,
            "Ammo": 0x0a
        }
    },
    "Flags": {
        "Episode1":{
            "Treasures":{
                "20YrOldSuit": bit2(0x1beb18),
                "ArmyJacket": bit1(0x1beb20),
                "SpikedBoots": bit2(0x1beb20),
                "LaserKnife": bit4(0x1beb28),
                "InsulatorBoots": bit1(0x1beb38),
                "WetSuit": bit0(0x1beb60)
            }
        },
        "Episode2":{
            "Treasures": {
                "FireExtinguisher": bit4(0x1beb22), // second guard tower drop
                "HeavyBoots": bit2(0x1beb23), // second guard tower drop
                "HeatProofSuit": bit0(0x1beb49), // second guardian drop
                "LightSabre": bit0(0x1beaf8), // first guard tower drop
                "SuperLightSabre": bit7(0x1beb78), // third guard tower drop
                "FlameThrower": bit4(0x1beb29), // second guard tower drop
                "HandBazooka": bit4(0x1beb08), // first guard tower drop
            },
            "DrillGems": {
                "DrillEmeralds1": bit5(0x1beb58), // 5 Emeralds
                "DrillDiamonds1": bit7(0x1beb58), // 4 Diamonds
                "DrillDiamonds2": bit6(0x1beb58), // 2 Diamonds
                "DrillGeoStones": bit4(0x1beb58), // 10 Geo Stones
            },
            "Monitors":{
                "Monitor1": bit1(0x1beb70),
                "Monitor2": bit2(0x1beb70),
                "Monitor3": bit3(0x1beb70),
                "Monitor4": bit4(0x1beb70),
                "Monitor5": bit5(0x1beb70),
                "Monitor6": bit6(0x1beb70),
                "Monitor7": bit7(0x1beb70),
                "Monitor8": bit0(0x1beb71),
                "Monitor9": bit1(0x1beb71),
                "Monitor10": bit2(0x1beb71),
                "Monitor11": bit3(0x1beb71),
                "Monitor12": bit4(0x1beb71),
                "Monitor13": bit5(0x1beb71),
                "Monitor14": bit6(0x1beb71),
                "Monitor15": bit7(0x1beb71),
                "Monitor16": bit0(0x1beb72),
                "Monitor17": bit1(0x1beb72),
                "Monitor18": bit2(0x1beb72),
                "Monitor19": bit3(0x1beb72),
                "Monitor20": bit4(0x1beb72),
                "Monitor21": bit5(0x1beb72),
                "Monitor22": bit6(0x1beb72),
                "Monitor23": bit7(0x1beb72),
                "Monitor24": bit0(0x1beb73)
            },
            "OilTanks": {
                "Tank1": bit0(0x1beb38),
                "Tank2": bit1(0x1beb38),
                "Tank3": bit2(0x1beb38),
            }
        },
        "Episode3":{
            "Train":{
                "Item1": bit0(0x1beaf0),
                "Item2": bit1(0x1beaf0),
                "Item3": bit2(0x1beaf0),
                "Item4": bit0(0x1beaf1),
                "Item5": bit3(0x1beaf0),
                "Item6": bit4(0x1beaf0),
                "Item7": bit6(0x1beaf0),
                "Item8": bit5(0x1beaf0),
                "Item9": bit7(0x1beaf0)
            },  
            "Treasures":{
                "LaserGun": bit0(0x1beaf1),
                "BigMagnum": bit0(0x1beb08)
            },
            "Mech": {
                "Part1": bit0(0x1beb20),
                "Part2": bit1(0x1beb20),
                "Part3": bit2(0x1beb20),
                "Part4": bit3(0x1beb20),
                "Part5": bit4(0x1beb20),
                "Part6": bit5(0x1beb20),
                "Part7": bit6(0x1beb20),
                "Part8": bit7(0x1beb20),
                "Part9": bit0(0x1beb21),
                "Part10": bit3(0x1beb22),
                "Part11": bit4(0x1beb22),
                "Part12": bit4(0x1beb21),
                "Part13": bit5(0x1beb21),
                "Part14": bit6(0x1beb21),
            }
        },
        "Episode4":{
            "Treasures":{
                "BatManiac": bit2(0x1beaf8)
            }  
        },
        "Episode5":{
            "ChurchGems": {
                "Gem1": bit6(0x1bebb0),
                "Gem2": bit7(0x1bebb0)
            },
            "Plant": {
                "Defeated": bit4(0x1beaf8)
            },
            "Lasers": {
                "Laser1": bit4(0x1beb20),
                "Laser2": bit5(0x1beb20),
                "Laser3": bit6(0x1beb20)
            },
            "Treasures": {
                "MiyabiSuit": bit5(0x1beb68)
            }
        },
        "Episode6":{
            "Treasures": {
                "MachineGun": bit4(0x1beb01)
            },
            "AlleyGems": {
                "Gem1": bit1(0x1beae0),
                "Gem2": bit2(0x1beae0),
                "Gem3": bit3(0x1beae0),
                "Gem4": bit4(0x1beae0),
                "Gem5": bit0(0x1beae8),
                "Gem6": bit1(0x1beae8),
                "Gem7": bit2(0x1beae8)
            }
        },
        "Episode7":{
            "Treasures": {
                "Katana": bit4(0x1beba2),
            },
            "DivaPieces": {
                "Piece1": bit2(0x1beb99),
                "Piece2": bit3(0x1beb79),
                "Piece3": bit0(0x1beb38),
                "Piece4": bit3(0x1beb08),
                "Piece5": bit4(0x1beb08),
                "Piece6": bit0(0x1beb00),
                "Piece7": bit3(0x1beaf9),
                "Piece8": bit7(0x1beba1)
            }
        }
    }
}

EnemyList = {
    "Start": 0x186dc4,
    "Size": 0x244,
    "Offsets":{
        "Index": 0x0,
        "Active": 0x4,
        "ID": 0x8,
        "State": 0x10,
        "HP": 0x88
    },
    "Enemies":{
        "Plant":{
            "HP": dword(0x1d3770),
            "Room": "MutantPlant",
            "Tentacles": [
                dword(0x1d3758),
                dword(0x1d375c),
                dword(0x1d3760),
                dword(0x1d3764),
                dword(0x1d3768),
                dword(0x1d376c)
            ]
        },
        "Gumbo": {
            "ID": 0x51,
            "Room": "GumboFight",
            "Index": 0
        },
        "FirstGuardian": {
            "ID": 0x52,
            "Room": "FirstGuardian",
            "Index": 0
        },
        "SecondGuardian": {
            "ID": 0x53,
            "Room": "SecondGuardian",
            "Index": 0
        },
        "ThirdGuardian": {
            "ID": 0x54,
            "Room": "ThirdGuardian",
            "Index": 0,
            "States": {
                "InWater": 0x06,
                "DeathByIce": 0x0c
            }
        },
        "Kondo": {
            "ID": 0x55,
            "Room": "KondoFight",
            "Index": 1
        },
        "Sperio": {
            "ID": 0x57,
            "Room": "SperioFight",
            "Index": 1
        },
        "Gartlude": {
            "ID": 0x59,
            "Room": "GartludeFight",
            "Index": 0
        },
        "Tiger": {
            "ID": 0x4d,
            "Room": "TigerFight",
            "Index": 0
        },
        "Lady": {
            "ID": 0x5b,
            "Room": "LadyFight",
            "Index": 0
        },
        "Adidi": {
            "ID": 0x5a,
            "Room": "AdidiFight",
            "Index": 0
        },
        "Kondo2": {
            "ID": 0x5e,
            "Room": "KondoFight",
            "Index": 0
        },
        "Zeno": {
            "ID": 0x5c,
            "Room": "Zeno1Fight",
            "Index": 0
        },
        "Tempest": {
            "ID": 0x5d,
            "Room": "TempestFight",
            "Index": 0
        },
        "Zeno2": {
            "ID": 0x5f,
            "Room": "Zeno2Fight",
            "Index": 0
        },
        "Siver": {
            "ID": 0x4,
            "Room": "GhostHouseYard",
            "Index": 0
        },
        "TRex": {
            "ID": 0x49,
            "Room": "TRexRiver",
            "Index": 0,
            "States": {
                "Trapped": 0x5,
                "Dead": 0x06
            }
        }
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
        "Trailers":{
            "UsedCrane1": bit1(0x1bf4dd),
            "UsedCrane2": bit2(0x1bf4de)
        },
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
        "LightSabre": [2, 1, 3],
        "HandBazooka": [2, 1, 5],
        "FirstGuardian": [2, 1, 5],
        "FireExtinguisher": [2, 2, 0],
        "FlameThrower": [2, 2, 1],
        "OilTanks": [2, 2, 3],
        "SecondGuardian": [2, 2, 6],
        "UnderwaterPassage": [2, 3, 1],
        "ControlRoom": [2, 3, 4],
        "ThirdGuardian": [2, 3, 6],
        "SuperLightSabre": [2, 3, 5],
        "KondoFight": [2, 4, 3],
        "KondoFightEnd": [2, 4, 2]
    },
    "Episode3": {
        "SubwayStation": [3, 1, 0],
        "SubwayTracks": [3, 1, 1],
        "SubwayTrain": [3, 1, 2],
        "TrailerRoom1": [3, 2, 1],
        "TrailerRoom2": [3, 2, 8],
        "MechRoom": [3, 2, 5],
        "Magnum": [3, 2, 2],
        "UndergroundTerminousStation_Cutscene": [3, 0, 0],
        "UndergroundTerminousStation": [3, 2, 0],
        "SperioFight": [3, 2, 8],
        "AntiProton": [3, 2, 8],
        "JunkBladeScene": [3, 2, 9],
        "JunkBladeScene_End": [3, 2, 0xb]
    },
    "Episode4": {
      "DanceSequence": [4, 1, 5],
      "BatManiac": [4, 1, 3],
      "GartludeFight": [4, 1, 2]
    },
    "Episode5": {
        "SiverTreasure": [8, 5, 0],
        "Church": [8, 1, 1],
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
        "AdidiFight": [5, 3, 0],
        "TRexRiver": [5, 1, 1],
        "Lasers": [5, 1 , 0xb],
        "MiyabiSuit": [5, 3, 6]
    },
    "Episode6": {
        "MuseumStreet": [8, 3, 3],
        "EastEdgeBridge": [8, 4, 7],
        "GloomAlleyEntrance": [8, 4, 8],
        "GloomAlley1": [6, 1, 0],
        "GloomAlley2": [6, 1, 1],
        "GloomAlleyBar": [6, 1, 2],
        "GhostHouseYard": [6, 1, 3],
        "GhostHouse": [6, 1, 4],
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

function TriggeredEventFlagCount(episode, category, measured = false, challenge = false){
    flags = Events["Episode" + episode][category]
    count = length(flags)
    
    prevTotal = sum_of(flags, flag => prev(flags[flag]))
    total = sum_of(flags, flag => flags[flag])
  
    countCheck = total >= count
    episodeCheck = Game["Episode"] == episode
    prevCheck = prevTotal < count
    
    if(measured)
        countCheck = measured(countCheck, episodeCheck)
    else 
        countCheck = countCheck && episodeCheck      
        
    trigger = countCheck
    
    if(!challenge)
        trigger = prevCheck && countCheck
    
    return trigger
}

function TriggeredItemFlag(episode, category, flag){
    return Game["Episode"] == episode &&
        prev(Items["Flags"]["Episode" + episode][category][flag]) < Items["Flags"]["Episode" + episode][category][flag]
}

function TriggeredItemFlagCount(episode, category, measured = false, challenge = false){
    flags = Items["Flags"]["Episode" + episode][category]
    count = length(flags)
    
    prevTotal = sum_of(flags, flag => prev(flags[flag]))
    total = sum_of(flags, flag => flags[flag])
  
    countCheck = total >= count
    episodeCheck = Game["Episode"] == episode
    prevCheck = prevTotal < count
    
    if(measured)
        countCheck = measured(countCheck, episodeCheck)
    else 
        countCheck = countCheck && episodeCheck      
        
    trigger = countCheck
    
    if(!challenge)
        trigger = prevCheck && countCheck
    
    return trigger
}

function CompletedMinigame(episode, room){
    return Game["Episode"] == episode &&
        IsInRoom(episode, room, true) &&
        prev(Game["MiniGame"]) == 1 &&
        Game["MiniGame"] == 0
}

function CompletedMinigameChallenge(episode, room, points, prev = true){
    return Game["Episode"] == episode &&
        IsInRoom(episode, room, prev) &&
        Game["ClearStats"]["Episode" + episode]["CP"] >= prev(Game["ClearStats"]["Episode" + episode]["CP"]) + points
}

function IsInRoom(episode, room, previous = false){
    episodeLookup = "Episode" + episode
    
    if(episode == 0)
        episodeLookup = "Any"

    map = Rooms[episodeLookup][room]
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
    return any_of(rooms, room => IsInRoom(episode, room))
}

function RoomTransition(episode, start, end){
    return IsInRoom(episode, start, true) &&
        IsInRoom(episode, end)
}

function GetEnemyHP(index){
    start = EnemyList["Start"]
    size = EnemyList["Size"]
    offset = EnemyList["Offsets"]["HP"]
    slot = index * size
    hp = dword(start + slot + offset)
    
    return hp
}

function GetEnemyID(index){
    start = EnemyList["Start"]
    size = EnemyList["Size"]
    offset = EnemyList["Offsets"]["ID"]
    slot = index * size
    id = dword(start + slot + offset)
    
    return id
}

function GetEnemyState(index){
    start = EnemyList["Start"]
    size = EnemyList["Size"]
    offset = EnemyList["Offsets"]["State"]
    slot = index * size
    state = dword(start + slot + offset)
    
    return state
}

function IsEnemyActive(index, name){
    id = GetEnemyID(index)
    enemyID = EnemyList["Enemies"][name]["ID"]
    
    return id == enemyID
}

function IsEnemyDamaged(index){
    hp = GetEnemyHP(index)
    return hp < 0xb40
}

function IsEnemyInState(index, name, state){
    enemy = EnemyList["Enemies"][name] 
    states = enemy["States"]
    enemyState = GetEnemyState(index)
    value = states[state]
    
    return enemyState == value
}

function EnemyStateChanged(index, name, state1, state2){
    enemy = EnemyList["Enemies"][name] 
    states = enemy["States"]
    enemyState = GetEnemyState(index)
    value1 = states[state1]
    value2 = states[state2]
    
    return prev(enemyState) == value1 && enemyState == value2
}

function GetEnemyIndex(name){
    enemy = EnemyList["Enemies"][name]
    index = enemy["Index"]
    return index
}

function GetEnemyRoom(name){
    enemy = EnemyList["Enemies"][name]
    room = enemy["Room"]
    return room
}

function DefeatedBoss(episode, name, challenge = false){
    index = GetEnemyIndex(name)
    room = GetEnemyRoom(name)
    
    trigger = Game["Episode"] == episode
    health = GetEnemyHP(index)
    roomCheck = IsInRoom(episode, room)
        
    bossCheck = prev(health) != 0x00 && health == 0x00
    
    if(!challenge)
        trigger = trigger && roomCheck
    else
        bossCheck = trigger_when(bossCheck)

    trigger = trigger && bossCheck

    return trigger
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
    else 
    {
        if (episode != 8)
            episodeCheck = Game["Episode"] == episode
    }
    
    if (episode != 8)
        sceneIdCheck =  Objects["LastInteraction"]["ID"] == ObjectInteractions[sceneEpisode][scene]["ID"]
 
    return episodeCheck &&
        IsInRoom(episode, room) &&
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
        IsInRoom(7,"CreatureRoom") &&
        Objects["LastInteraction"]["ID"] == ObjectInteractions["Episode7"]["Creature" + number]["ID"] &&
        prev(Objects["LastInteraction"]["SceneIndex"]) == ObjectInteractions["Episode7"]["Creature" + number]["Scene"]["Begin"] &&
        Objects["LastInteraction"]["SceneIndex"] == ObjectInteractions["Episode7"]["Creature" + number]["Scene"]["End"]
    )
}

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

function GetCharacterHealth(){
    index = Character["Index"]
    start = Character["Start"]
    size = Character["Size"]
    healthOffset = Character["Offsets"]["Health"]
    
    characterOffset = index * size
    healthAddress = start + characterOffset + healthOffset
    
    return dword(healthAddress)
}

function UsedItem(type, name, reduced = true){
    item = ItemIDs[type][name]
    selected = Items["SelectedItem"]["ID"]
    slot = Items["SelectedItem"]["Slot"]
    start = Items["Inventory"]["Start"]
    size = Items["Inventory"]["SlotSize"]
    offset = Items["Inventory"]["Offsets"]["Count"]
    
    address = start + (slot * size) + offset
    count = word(address)
    
    trigger = selected == item
    
    if (reduced)
        trigger = trigger && prev(count) > count
    
    return trigger
}

function PlayerHealed(){
    return 
    (
        UsedItem("Cure", "EmergencySpray") ||
        UsedItem("KeyItems", "JuiceCan") ||
        UsedItem("KeyItems", "Banana") ||
        UsedItem("KeyItems", "HorsemeatBurger")
    )
}

function PlayerTookDamage(){
    health = GetCharacterHealth()
    return prev(health) > health
}

function GetPlayerHealthPercentage(){
    health = GetCharacterHealth()
    maxHealth = 2880.00
    return (health / maxHealth) * 100.00
}

function BossIsActive(name){
    index = GetEnemyIndex(name)
    return IsEnemyActive(index, name)
}

function IsBossDamaged(name){
    index = GetEnemyIndex(name)
    return IsEnemyDamaged(index)
}

function BossTookDamage(name){
    index = GetEnemyIndex(name)
    health = GetEnemyHP(index)
    return prev(health) > health
}

function BossStateChange(name, state1, state2){
    index = GetEnemyIndex(name)
    return EnemyStateChanged(index, name, state1, state2)
}

function BossInState(name, state){
    index = GetEnemyIndex(name)
    return IsEnemyInState(index, name, state)
}

function GetCharacterItemSlot(type){
    index = Character["Index"]
    start = Character["Start"]
    size = Character["Size"]
    slotOffset = Character["Offsets"][type + "Slot"]
    
    characterOffset = index * size
    slotAddress = start + characterOffset + slotOffset
    
    return dword(slotAddress)
}

function GetWeaponSlotAddress(){
    inventoryStart = Items["Inventory"]["Start"]
    slotSize = Items["Inventory"]["SlotSize"]
    equippedSlot = GetCharacterItemSlot("Weapon")
    slotOffset = slotSize * equippedSlot
    
    return inventoryStart + slotOffset
}

function HasWeaponEquipped(name){
    idOffset = Items["Inventory"]["Offsets"]["ID"]
    
    idAddress = (GetWeaponSlotAddress()) + idOffset
    weaponId = word(idAddress)
    
    return weaponId == ItemIDs["Weapons"][name]
}

function GetWeaponAmmoCount(){
    ammoOffset = Items["Inventory"]["Offsets"]["Ammo"]
    
    ammoAddress = (GetWeaponSlotAddress()) + ammoOffset
    ammoCount = word(ammoAddress)

    return ammoCount
}

function ReloadedWeapon(){
    ammoCount = GetWeaponAmmoCount()
    
    return prev(ammoCount) < ammoCount
}

function CountWeaponShots(limit){
    ammoCount = GetWeaponAmmoCount()
    
    return repeated(limit, prev(ammoCount) > ammoCount)
}

function ResetBossChallenge(episode, room){
    return 
    (
        always_false() || 
        (

            never(IsOnTitle()) && 
            never(GetCharacterHealth() == 0) &&
            never(GetCharacterHealth() > 0xb40) &&
            never(!IsInRoom(episode, room))
        ) 
    )
}

function CutsceneTriggered(){
    return prev(Game["Cutscene"]) < Game["Cutscene"]
}

// ------------------------- Achievement Functions ------------------------- //

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

function Episode1_EnterTheSubmarine(){
    return !IsOnTitle() &&
        RoomTransition(1,"SubmarineBay", "Submarine")
}

function Episode1_Treasures(){
    return !IsOnTitle() &&
        IsInAnyRoom(1, ["Submarine", "GoldDoorRoom", "RedDoorRoom", "SilverDoorRoom1", "SilverDoorRoom3"]) &&
        TriggeredItemFlagCount(1, "Treasures", true)
}

function Episode1_EnterPowerRoomWithKey(){
    return !IsOnTitle() &&
        TriggeredEvent(1, "OpenedPowerRoomDoor")
}

function Episode1_DefeatedGumbo(){
    return !IsOnTitle() &&
        BossIsActive("Gumbo") &&
        DefeatedBoss(1, "Gumbo")
}

function Episode1_DefeatGumbo_NoHeal(){
    return BossIsActive("Gumbo") &&
        DefeatedBoss(1, "Gumbo", true) &&
        disable_when
        (
            BossIsActive("Gumbo") && 
            IsBossDamaged("Gumbo") && 
            PlayerHealed()
        ) &&
        ResetBossChallenge(1, "GumboFight")
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
        BossIsActive("FirstGuardian") &&
        DefeatedBoss(2, "FirstGuardian")
}

function Episode2_FirstGuardChallenge(){
    return BossIsActive("FirstGuardian") &&
        HasWeaponEquipped("LightSabre") &&
        DefeatedBoss(2, "FirstGuardian", true) &&
        disable_when
        (
            BossIsActive("FirstGuardian") && 
            IsBossDamaged("FirstGuardian") && 
            HasWeaponEquipped("LightSabre") &&
            prev(HasWeaponEquipped("LightSabre")) &&
            ReloadedWeapon()
        ) &&
        disable_when
        (
            BossIsActive("FirstGuardian") &&
            IsBossDamaged("FirstGuardian") &&
            !HasWeaponEquipped("LightSabre") &&
            BossTookDamage("FirstGuardian")
        ) &&
        ResetBossChallenge(2, "FirstGuardian")
}

function Episode2_DestroyOilTanks(){
    return !IsOnTitle() &&
        IsInRoom(2, "OilTanks") &&
        TriggeredItemFlagCount(2, "OilTanks", true)
}

function Episode2_DestroySecondGuard(){
    return !IsOnTitle() &&
        BossIsActive("SecondGuardian") &&
        DefeatedBoss(2, "SecondGuardian")
}

function Episode2_SecondGuardChallenge(){
    return BossIsActive("SecondGuardian") &&
        HasWeaponEquipped("AntiqueGun") &&
        DefeatedBoss(2, "SecondGuardian", true) &&
        disable_when
        (
            BossIsActive("SecondGuardian") && 
            IsBossDamaged("SecondGuardian") && 
            HasWeaponEquipped("AntiqueGun") &&
            CountWeaponShots(19)
        ) &&
        disable_when
        (
            BossIsActive("SecondGuardian") &&
            IsBossDamaged("SecondGuardian") &&
            !HasWeaponEquipped("AntiqueGun") &&
            BossTookDamage("SecondGuardian")
        ) &&
        ResetBossChallenge(2, "SecondGuardian")
}

function Episode2_DangerousGems(){
    return !IsOnTitle() &&
        IsInRoom(2, "UnderwaterPassage") &&
        TriggeredItemFlagCount(2, "DrillGems", true)
}

function Episode2_DestroyMonitors(){
    return !IsOnTitle() &&
        IsInRoom(2, "ControlRoom") &&
        TriggeredItemFlagCount(2, "Monitors", true)
}

function Episode2_Treasures(){
    return !IsOnTitle() &&
        IsInAnyRoom(2, ["LightSabre", "HandBazooka", "FireExtinguisher", "FlameThrower", "SecondGuardian", "SuperLightSabre"]) &&
        TriggeredItemFlagCount(2, "Treasures", true)
}

function Episode2_DestroyThirdGuard(){
    return !IsOnTitle() &&
        BossIsActive("ThirdGuardian") &&
        DefeatedBoss(2, "ThirdGuardian")
}

function Episode2_ThirdGuardChallenge(){
    return !IsOnTitle() &&
        BossIsActive("ThirdGuardian") &&
        UsedItem("Equipment", "FreezePack", false) &&
        BossInState("ThirdGuardian", "DeathByIce") &&
        DefeatedBoss(2, "ThirdGuardian")
}

function Episode2_DefeatedKondo(){
    return !IsOnTitle() &&
        BossIsActive("Kondo") &&
        DefeatedBoss(2, "Kondo")
}

function Episode2_KondoChallenge(){
    return BossIsActive("Kondo") &&
        HasWeaponEquipped("SuperLightSabre") &&
        DefeatedBoss(2, "Kondo", true) &&
        disable_when
        (
            BossIsActive("Kondo") && 
            IsBossDamaged("Kondo") && 
            prev(GetPlayerHealthPercentage()) > 25 &&
            GetPlayerHealthPercentage() < 25
        ) &&
        disable_when
        (
            BossIsActive("Kondo") && 
            IsBossDamaged("Kondo") && 
            GetPlayerHealthPercentage() < 25 &&
            PlayerTookDamage()
        ) &&
        disable_when
        (
            BossIsActive("Kondo") &&
            IsBossDamaged("Kondo") &&
            !HasWeaponEquipped("SuperLightSabre") &&
            BossTookDamage("Kondo")
        ) &&
        ResetBossChallenge(2, "KondoFight")
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

function Episode3_SubwayTrainItems(){
    return !IsOnTitle() &&
        IsInRoom(3, "SubwayTrain") &&
        TriggeredItemFlagCount(3, "Train", true, true) &&
        CutsceneTriggered()
}

function Episode3_ReachUndergroundTerminous(){
    return !IsOnTitle() &&
        Game["Episode"] == 3 &&
        RoomTransition(3, "UndergroundTerminousStation_Cutscene", "UndergroundTerminousStation")
}

function Episode3_Treasures(){
    return !IsOnTitle() &&
        IsInAnyRoom(3, ["SubwayTrain", "Magnum"]) &&
        TriggeredItemFlagCount(3, "Treasures", true)
}

function Episode3_GiantMech(){
    return !IsOnTitle() &&
        IsInRoom(3, "MechRoom") &&
        TriggeredItemFlagCount(3, "Mech", true)
}

function Episode3_TrailerLifts(){
    rooms = [
        "TrailerRoom1",
        "TrailerRoom2"
    ]

    return !IsOnTitle() &&
        IsInAnyRoom(3, rooms) &&
        TriggeredEventFlagCount(3, "Trailers", true)
}

function Episode3_DestroyAntiProtonCore(){
    return !IsOnTitle() &&
        TriggeredEvent(3, "PlacedPlasmaBomb")
}

function Episode3_DefeatSperio(){
    return !IsOnTitle() &&
        BossIsActive("Sperio") &&
        DefeatedBoss(3, "Sperio")
}

function Episode3_SperioChallenge(){
    return BossIsActive("Sperio") &&
        HasWeaponEquipped("BigMagnum") &&
        DefeatedBoss(3, "Sperio", true) &&
        disable_when
        (
            BossIsActive("Sperio") && 
            IsBossDamaged("Sperio") && 
            HasWeaponEquipped("BigMagnum") &&
            CountWeaponShots(6)
        ) &&
        disable_when
        (
            BossIsActive("Sperio") &&
            IsBossDamaged("Sperio") &&
            !HasWeaponEquipped("BigMagnum") &&
            BossTookDamage("Sperio")
        ) &&
        ResetBossChallenge(3, "SperioFight")
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

function Episode4_CompleteDanceScene_MaxCP(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(4, "DanceSequence", 100, false)
}

function Episode4_BatManiac(){
    return !IsOnTitle() &&
        IsInRoom(4, "BatManiac") &&
        TriggeredItemFlag(4, "Treasures", "BatManiac")
}

function Episode4_DefeatedGartlude(){
    return !IsOnTitle() &&
        BossIsActive("Gartlude") &&
        DefeatedBoss(4, "Gartlude")
}

function Episode4_GartludeChallenge(){
    timer = Game["Timer"]
    return timer >= 40 && Episode4_DefeatedGartlude()
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

function Episode5_ChurchEmeralds(){
    return !IsOnTitle() &&
        IsInRoom(5, "Church") &&
        TriggeredItemFlagCount(5, "ChurchGems", true)
}

function Episode5_ReachJungle(){
    return !IsOnTitle() &&
        Game["Episode"] == 5 &&
        RoomTransition(5, "ChurchControlRoom", "JungleStart")
}

function Episode5_TRexChallenge(){
    return !IsOnTitle() &&
        BossIsActive("TRex") &&
        BossInState("TRex", "Dead") &&
        DefeatedBoss(5, "TRex")
}

function Episode5_River1Challenge(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(5, "RiverPart1", 40, false)
}

function Episode5_DefeatedPlant(){
    plant = EnemyList["Enemies"]["Plant"]
    hp = plant["HP"]
    room = plant["Room"]    

    return !IsOnTitle() &&
        IsInRoom(5, room) &&
        prev(hp) != 0 && hp == 0
}

function Episode5_PlantChallenge(){
    plant = EnemyList["Enemies"]["Plant"]
    tentacles = plant["Tentacles"]
    room = plant["Room"]
    tentacleCheck = tally_of(tentacles, 6, tentacle => IsInRoom(5, room) && prev(tentacle) > 0 && tentacle == 0)

    return measured(tentacleCheck, IsInRoom(5, room)) &&
        Episode5_DefeatedPlant()
}

function Episode5_River2Challenge(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(5, "RiverPart2", 40, false)
}

function Episode5_DestroyAntiGravityStation(){
    return !IsOnTitle() &&
        IsInRoom(5, "AntiGravityStation") &&
        TriggeredEvent(5, "AntiGravityStation")
}

function Episode5_LaserCannons(){
    return !IsOnTitle() &&
        IsInRoom(5, "Lasers") &&
        TriggeredItemFlagCount(5, "Lasers", true)
}

function Episode5_DefeatedTiger(){
    return !IsOnTitle() &&
        BossIsActive("Tiger") &&
        DefeatedBoss(5, "Tiger")
}

function Episode5_TigerChallenge(){
    return BossIsActive("Tiger") &&
        HasWeaponEquipped("HandBazooka") &&
        DefeatedBoss(5, "Tiger", true) &&
        disable_when
        (
            BossIsActive("Tiger") && 
            IsBossDamaged("Tiger") && 
            HasWeaponEquipped("HandBazooka") &&
            CountWeaponShots(7)
        ) &&
        disable_when
        (
            BossIsActive("Tiger") &&
            IsBossDamaged("Tiger") &&
            !HasWeaponEquipped("HandBazooka") &&
            BossTookDamage("Tiger")
        ) &&
        ResetBossChallenge(5, "TigerFight")
}

function Episode5_MiyabiSuit(){
    return !IsOnTitle() &&
        IsInRoom(5, "MiyabiSuit") &&
        TriggeredItemFlag(5, "Treasures", "MiyabiSuit")
}

function Episode5_DefeatedLady(){
    return !IsOnTitle() &&
        BossIsActive("Lady") &&
        DefeatedBoss(5, "Lady")
}

function Episode5_LadyChallenge(){
    return BossIsActive("Lady") &&
        DefeatedBoss(5, "Lady", true) &&
        disable_when
        (
            BossIsActive("Lady") && 
            IsBossDamaged("Lady") && 
            PlayerTookDamage()
        ) &&
        ResetBossChallenge(5, "LadyFight")
}

function Episode5_DefeatedAdidi(){
    return !IsOnTitle() &&
        BossIsActive("Adidi") &&
        DefeatedBoss(5, "Adidi")
}

function Episode5_ClearEpisode(){
    return CompletedEpisode(5)
}

function Episode5_AdidiChallenge(){
    return BossIsActive("Adidi") &&
        HasWeaponEquipped("SuperLightSabre") &&
        DefeatedBoss(5, "Adidi", true) &&
        disable_when
        (
            BossIsActive("Adidi") && 
            IsBossDamaged("Adidi") && 
            prev(GetPlayerHealthPercentage()) > 25 &&
            GetPlayerHealthPercentage() < 25
        ) &&
        disable_when
        (
            BossIsActive("Adidi") && 
            IsBossDamaged("Adidi") && 
            GetPlayerHealthPercentage() < 25 &&
            PlayerTookDamage()
        ) &&
        disable_when
        (
            BossIsActive("Adidi") &&
            IsBossDamaged("Adidi") &&
            !HasWeaponEquipped("SuperLightSabre") &&
            BossTookDamage("Adidi")
        ) &&
        ResetBossChallenge(5, "AdidiFight")
}

function Episode5_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(5)
}

// Episode 6 - Achievement Functions //

function Episode6_EastEdgeSecret(){
    return !IsOnTitle() &&
        IsInRoom(6, "MuseumStreet") &&
        TriggeredEvent(6, "MuseumTreasure")
}

function Episode6_GloomAlleyGems(){
    rooms = [
        "GloomAlley1",
        "GloomAlley2"
    ]
    
    return !IsOnTitle() &&
        IsInAnyRoom(6, rooms) &&
        TriggeredItemFlagCount(6, "AlleyGems", true)
}

function Episode6_ReachGloomAlley(){
    return !IsOnTitle() &&
        Game["Episode"] == 6 &&
        RoomTransition(6, "GloomAlleyEntrance", "GloomAlley1")
}

function Episode6_FindGhostHouseKey(){
    return !IsOnTitle() &&
        IsInRoom(6, "GloomAlleyBar") &&
        TriggeredEvent(6, "GotGhostHouseKey")
}

function Episode6_EvilSiver(){
    return !IsOnTitle() &&
        BossIsActive("Siver") &&
        DefeatedBoss(6, "Siver")
}

function Episode6_AlternateGhostHouse(){
    return !IsOnTitle() &&
        Game["Episode"] == 6 &&
        Events["Episode6"]["UnlockedGhostHouseDoor"] == 0 &&
        (
            (RoomTransition(6, "GhostHouseYard", "GhostHouse")) ||
            (RoomTransition(6, "GhostHouseYard", "GhostHouseWaterTower")) 
        )
}

function Episode6_MachineGun(){
    return !IsOnTitle() &&
        IsInRoom(6, "GhostHouse") &&
        TriggeredItemFlag(6, "Treasures", "MachineGun")
}

function Episode6_ReachJunkyard(){
    return !IsOnTitle() &&
        Game["Episode"] == 6 &&
        RoomTransition(6, "GhostHouseYard", "JunkyardHighway")
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

function Episode7_ReachShangrila(){
    return !IsOnTitle() &&
        Game["Episode"] == 7 &&
        RoomTransition(7, "AirShip", "AirDock")
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

function Episode7_ActivateElevator(){
    return !IsOnTitle() &&
    TriggeredEvent(7, "UnlockElevator")
}

function Episode7_AcquiredKatana(){
    return !IsOnTitle() &&
        IsInRoom(7, "BurningBridge") &&
        TriggeredItemFlag(7, "Treasures", "Katana")
}

function Episode7_DefeatedKondo(){
    return !IsOnTitle() &&
        BossIsActive("Kondo2") &&
        DefeatedBoss(7, "Kondo2")
}

function Episode7_KondoChallenge(){
    return always_false()
}

// TO DO: Get room ids for each piece
function Episode7_GotDivaPieces(){
    return !IsOnTitle() &&
        // IsInRoom(2, "OilTanks") &&
        TriggeredItemFlagCount(7, "DivaPieces", true)
}

function Episode7_DefeatedZeno1(){
    return BossIsActive("Zeno") &&
        DefeatedBoss(7, "Zeno")
}

function Episode7_Zeno1Challenge(){
    return always_false()
}

function Episode7_DefeatedTempest(){
    return !IsOnTitle() &&
        BossIsActive("Tempest") &&
        DefeatedBoss(7, "Tempest")
}

function Episode7_TempestChallenge(){
    return always_false()
}

function Episode7_DeactivatedCore(){
    return !IsOnTitle() &&
        TriggeredEvent(7, "DeactivateCore")
}

function Episode7_DefeatedZeno2(){
    return BossIsActive("Zeno2") &&
        DefeatedBoss(7, "Zeno2")
}

function Episode7_Zeno2Challenge(){
    return always_false()
}

function Episode7_CompletedJunkbladeEscape(){
    return !IsOnTitle() &&
        CompletedMinigame(7, "JunkbladeRace")
}

function Episode7_JunkbladeChallenge(){
    return always_false()
}

function Episode7_CompletedEpisode(){
    return CompletedEpisode(7)
}

function Episode7_ClearEpisode_SRank(){
    return CompletedEpisodeWithSRank(7)
}

function Episode7_UnlockedEpisode8(){
    return CompletedEpisode(7) &&
        prev(!IsEpisode8Unlocked()) &&
        IsEpisode8Unlocked()
}

// Episode 8 - Achievement Functions //

function Episode8_AllSnacks(){
    return always_false()
}

function Episode8_Completed(){
    return !IsOnTitle() &&
        IsEpisode8Unlocked() &&
        TriggeredScene(8, "End", "Complete")
}

function Episode8_EmergencySpayChallenge(){
    return always_false()
}

// ------------------------- Achievement Definitions ------------------------- //

// -- Episode 1 -- //

achievement("East Edge", "Reach East Edge City", points = 2, type = "progression",
    trigger = Episode1_ReachEastEdge()
)

achievement("Window Pain", "Break an Array Bridge Shop Window and pay for your actions", points = 3,
    trigger = Any_PayedForWindow()
)

achievement("Siver Otakki - Episode 1", "Correctly answer Siver Otakki's question in Episode 1", points = 2, type = "missable",
    trigger = Episode1_SiverOtakkiQuestion()
)

achievement("Billboard Island", "Reach Billboard Island", points = 2, type = "progression",
    trigger = Episode1_ReachBillboardIsland()
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

achievement("Gumbo", "Defeat Gumbo the Robot on Billboard Island", points = 3, type = "progression",
    trigger = Episode1_DefeatedGumbo()
)

achievement("No Heal - Gumbo", "Defeat Gumbo the Robot on Billboard Island without healing", points = 10, type = "missable",
    trigger = Episode1_DefeatGumbo_NoHeal()
)

achievement("Turret", "Clear the Turret Sequence on Billboard Island", points = 3, type = "progression",
    trigger = Episode1_ClearTurret()
)

achievement("Clear Challenge - Turret", "Gain 30 or more CP during the Turret Sequence on Billboard Island", points = 5, type = "missable",
    trigger = Episode1_ClearTurretChallenge()
)

achievement("Encounters", "Escape Billboard Island and Clear Episode 1", points = 5, type = "progression",
    trigger = Episode1_ClearEpisode()
)

achievement("S Rank - Episode 1", "Clear Episode 1 with an S Rank", points = 10, type = "missable",
    trigger = Episode1_ClearEpisode_SRank()
)

// -- Episode 2 -- //

achievement("Siver Otakki - Episode 2", "Correctly answer Siver Otakki's question in Episode 2", points = 2, type = "missable",
    trigger = Episode2_SiverOtakkiQuestion()
)

achievement("Pagoda Tower", "Reach the Pagoda Tower", points = 2, type = "progression",
    trigger = Episode2_ReachPagodaTower()
)

achievement("First Guarding", "Destroy the First Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DestroyFirstGuard()
)

achievement("First Guardian - Challenge", "With the Light Sabre equipped, defeated the First Guardian in the Pagoda Tower without recharging", points = 10, type = "missable",
    trigger = Episode2_FirstGuardChallenge()
)

achievement("Oil Tanks", "Destroy all 3 Oil Tanks in the Pagoda Tower", points = 3, type = "missable",
    trigger = Episode2_DestroyOilTanks()
)

achievement("Second Guarding", "Destroy the Second Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DestroySecondGuard()
)

achievement("Second Guardian - Challenge", "With the Antique Gun equipped, defeat the Second Guardian in the Pagoda Tower in 18 shots or less", points = 10, type = "missable",
    trigger = Episode2_SecondGuardChallenge()
)

achievement("Dangerous Gems", "Find all 4 gems in the Pagoda Tower Third Guarding System Underwater Passage", points = 10, type = "missable",
    trigger = Episode2_DangerousGems()
)

achievement("Monitors", "Break all of the Monitors in the Pagoda Tower Control Room", points = 3, type = "missable",
    trigger = Episode2_DestroyMonitors()
)

achievement("Pagoda Treasures", "Find all Weapons, Clothing, and Boots hidden in the Pagoda Tower", points = 10, type = "missable",
    trigger = Episode2_Treasures()
)

achievement("Third Guarding", "Destroy the Third Guarding System in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DestroyThirdGuard()
)

achievement("Third Guardian - Challenge", "Defeat the Third Guardian in the Pagoda Tower by freezing it in its tracks", points = 10, type = "missable",
    trigger = Episode2_ThirdGuardChallenge()
)

achievement("Kondo", "Defeat Kondo in the Pagoda Tower", points = 3, type = "progression",
    trigger = Episode2_DefeatedKondo()
)

achievement("Kondo - Challenge", "With the Super Light Sabre equipped, defeat Kondo in the Pagoda Tower without dropping below 25% health", points = 10, type = "missable",
    trigger = Episode2_KondoChallenge()
)

achievement("Awakening", "Escape the Pagoda Tower and Clear Episode 2", points = 5, type = "progression",
    trigger = Episode2_ClearEpisode()
)

achievement("S Rank - Episode 2", "Clear Episode 2 with an S Rank", points = 10, type = "missable",
    trigger = Episode2_ClearEpisode_SRank()
)

// -- Episode 3 -- //

achievement("Siver Otakki - Episode 3", "Correctly answer Siver Otakki's question in Episode 3", points = 2, type = "missable",
    trigger = Episode3_SiverOtakkiQuestion()
)

achievement("Subway Train", "Collect all items on the Subway Train before time runs out", points = 10, type = "missable",
    trigger = Episode3_SubwayTrainItems()
)

achievement("Underground Terminous", "Reach the Underground Terminous", points = 2, type = "progression",
    trigger = Episode3_ReachUndergroundTerminous()
)

achievement("Terminous Treasures", "Find the Laser Gun and Big Magnum in the Underground Terminous (and train)", points = 10, type = "missable",
    trigger = Episode3_Treasures()
)

achievement("Giant Mech", "Destroy all of the Giant Mech's parts in the Underground Terminous", points = 3, type = "missable",
    trigger = Episode3_GiantMech()
)

achievement("Trailer Lift", "Have both Tailer Lifts raised in the Underground Terminous", points = 3, type = "missable",
    trigger = Episode3_TrailerLifts()
)

achievement("Anti Proton", "Place the Plasma Bomba and destroy the Anti Proton Core in the Underground Terminous", points = 2, type = "progression",
    trigger = Episode3_DestroyAntiProtonCore()
)

achievement("Sperio", "Defeat Sperio in the Underground Terminous", points = 3, type = "progression",
    trigger = Episode3_DefeatSperio()
)

achievement("Sperio - Challenge", "With the Big Magnum equipped, defeat Sperio in the Underground Terminous in 5 shots or less", points = 10, type = "missable",
    trigger = Episode3_SperioChallenge()
)

achievement("No Damage - Terminous Junkblade", "Clear the Junkblade sequence in the Underground Terminous without taking damage", points = 10, type = "missable",
    trigger = Episode3_CompleteJunkbladeScene_NoDamage()
)

achievement("Underground Space", "Escape the Underground Terminous on Sperio's Junkblade and Clear Episode 3", points = 5, type = "progression",
    trigger = Episode3_CompleteEpisode()
)

achievement("S Rank - Episode 3", "Clear Episode 3 with an S Rank", points = 10, type = "missable",
    trigger = Episode3_ClearEpisode_SRank()
)

// -- Episode 4 -- //

achievement("Siver Otakki - Episode 4", "Correctly answer Siver Otakki's question in Episode 4", points = 2, type = "missable",
    trigger = Episode4_SiverOtakkiQuestion()
)

achievement("Dance Sequence", "Clear the Dance Sequence in the Aqua Liberty Ballroom", points = 3, type = "progression",
    trigger = Episode4_CompleteDanceScene()
)

achievement("Hard Dancing", "Passionately clear the Dance Sequence in the Aqua Liberty Ballroom and gain the maximum CP possible", points = 5, type = "missable",
    trigger = Episode4_CompleteDanceScene_MaxCP()
)

achievement("Bat Maniac", "Find the Bat Maniac Outfit in the Aqua Liberty Ballroom", points = 3, type = "missable",
    trigger = Episode4_BatManiac()
)

achievement("Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom Station", points = 3, type = "progression",
    trigger = Episode4_DefeatedGartlude()
)

achievement("Quick Kill - Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom with 40 seconds or more left on the timer", points = 10, type = "missable",
    trigger = Episode4_GartludeChallenge()
)

achievement("Bloody Rose", "Escape the Aqua Liberty Ballroom and Clear Episode 4", points = 5, type = "progression",
    trigger = Episode4_ClearEpisode()
)

achievement("S Rank - Episode 4", "Clear Episode 4 with an S Rank", points = 10, type = "missable",
    trigger = Episode4_ClearEpisode_SRank()
)

// -- Episode 5 -- //

achievement("Siver Otakki - Episode 5", "Find Siver Otakki's Special Treasure in Episode 5", points = 5, type = "missable",
    trigger = Episode5_FoundSiverTreasure()
)

achievement("Church Emeralds", "Find all gems in the East Edge Church in Episode 5", points = 3, type = "missable",
    trigger = Episode5_ChurchEmeralds()
)

achievement("Jungle", "Reach the Jungle", points = 2, type = "progression",
    trigger = Episode5_ReachJungle()
)

achievement("T-Rex", "Defeat a T-Rex using a Quicksand trap in the Jungle", points = 5, type = "missable",
    trigger = Episode5_TRexChallenge()
)

achievement("No Damage - River Ride 1", "Clear the River Ride part 1 in the Jungle without taking damage", points = 5, type = "missable",
    trigger = Episode5_River1Challenge()
)

achievement("Mutated Plant", "Defeat the Mutated Plant in the Jungle", points = 3, type = "progression",
    trigger = Episode5_DefeatedPlant()
)

achievement("Monsterous Tentacles", "Destroy all of the Mutated Plant's tentacles before defeating it, in the Jungle", points = 5, type = "missable",
    trigger = Episode5_PlantChallenge()
)

achievement("No Damage - River Ride 2", "Clear the River Ride part 2 in the Jungle without taking damage", points = 5, type = "missable",
    trigger = Episode5_River2Challenge()
)

achievement("Anti Gravity", "Destroy Anti Gravity Defense Station in the Jungle", points = 3, type = "progression",
    trigger = Episode5_DestroyAntiGravityStation()
)

achievement("Laser Cannons", "Destroy all 3 Laser Cannons in the Jungle", points = 5, type = "missable",
    trigger = Episode5_LaserCannons()
)

achievement("Tiger", "Defeat Tiger in the Jungle", points = 5, type = "progression",
    trigger = Episode5_DefeatedTiger()
)

achievement("Tiger - Challenge", "With the Bazooka equipped, defeat Tiger in the Jungle in 6 shots or less", points = 10, type = "missable",
    trigger = Episode5_TigerChallenge()
)

achievement("Miyabi Suit", "Find the Y.O. Miyabi Suit in the Jamelgalda Prison", points = 3, type = "missable",
    trigger = Episode5_MiyabiSuit()
)

achievement("Lady", "Defeat Lady in the Jamelgalda Prison", points = 5, type = "progression",
    trigger = Episode5_DefeatedLady()
)

achievement("No Heal - Lady", "Defeated Lady in the Jamelgalda without taking damage", points = 10, type = "missable",
    trigger = Episode5_LadyChallenge()
)

achievement("Deceptive Jungle", "Defeat Adidi, escape the Jamelgalda Prison, and clear Episode 5", points = 10, type = "progression",
    trigger = Episode5_ClearEpisode()
)

achievement("No Heal - Adidi", "With the Super Light Sabre equipped, defeat Adidi in the Jamelgalda Prison without dropping below 25% health", points = 10, type = "missable",
    trigger = Episode5_AdidiChallenge()
)

achievement("S Rank - Episode 5", "Clear Episode 5 with an S Rank", points = 10, type = "missable",
    trigger = Episode5_ClearEpisode_SRank()
)

// -- Episode 6 -- //

achievement("East Edge Treasure", "Find the hidden East Edge Treasure in Episode 6", points = 3, type = "missable",
    trigger = Episode6_EastEdgeSecret()
)

achievement("Gloom Alley", "Reach Gloom Alley", points = 3, type = "progression",
    trigger = Episode6_ReachGloomAlley()
)

achievement("Geo Stones", "Find all gems in the Gloom Alley Streets", points = 3, type = "missable",
    trigger = Episode6_GloomAlleyGems()
)

achievement("Ghost House", "Find the Ghost House Key", points = 3, type = "missable",
    trigger = Episode6_FindGhostHouseKey()
)

achievement("Agressive Siver", "Defeat a Mysterious Adversary in Episode 6", points = 10, type = "missable",
    trigger = Episode6_EvilSiver()
)

achievement("Breaking and Entering", "Enter the Ghost House without unlocking the front door", points = 3, type = "missable",
    trigger = Episode6_AlternateGhostHouse()
)

achievement("Machine Gun", "Find the Machine Gun in the Gloom Alley Ghost House", points = 3, type = "missable",
    trigger = Episode6_MachineGun()
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

achievement("S Rank - Episode 6", "Clear Episode 6 with an S Rank", points = 10, type = "missable",
    trigger = Episode6_ClearEpisode_SRank()
)

// -- Episode 7 -- //

achievement("Shangri-la", "Reach Shangri-la", points = 3, type = "progression",
    trigger = Episode7_ReachShangrila()
)

achievement("Monsterous Clues", "Listen to all clues from a set of sagely creatures in Shangri-la", points = 2, type = "missable",
    trigger = Episode7_CreatureClues()
)

achievement("Elevator", "Activate the Shangri-la Elevator", points = 5, type = "progression",
    trigger = Episode7_ActivateElevator()
)

achievement("Katana", "Find the Katana in Shangri-la", points = 3, type = "missable",
    trigger = Episode7_AcquiredKatana()
)

achievement("Kondo 2", "Defeat Kondo in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_DefeatedKondo()
)

achievement("No Heal - Kondo 2", "With the Katana equipped, defeat Kondo in Shangri-la without healing", points = 10, type = "missable",
    trigger = Episode7_KondoChallenge()
)

achievement("Diva Pieces", "Find all Diva Pieces in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_GotDivaPieces()
)

achievement("Zeno", "Defeat Zeno in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_DefeatedZeno1()
)

achievement("Minimum Damage - Zeno", "Defeat Zeno in Shangri-la with 50% or more health remaining", points = 10, type = "missable",
    trigger = Episode7_Zeno1Challenge()
)

achievement("Tempest", "Defeat Tempest in Shangri-la", points = 5, type = "progression",
    trigger = Episode7_DefeatedTempest()
)

achievement("No Damage - Tempest", "Defeat Tempest in Shangri-la without taking damage", points = 10, type = "missable",
    trigger = Episode7_TempestChallenge()
)

achievement("Power Source", "Destroy the Shangri-la Power Source", points = 5, type = "progression",
    trigger = Episode7_DeactivatedCore()
)

achievement("Zeno 2", "Defeat Traveler Zeno in Shangri-la", points = 10, type = "progression",
    trigger = Episode7_DefeatedZeno2()
)

achievement("Minimum Damage - Zeno 2", "Defeat Traveler Zeno in Shangri-la with 50% or more health remaining", points = 10, type = "missable",
    trigger = Episode7_Zeno2Challenge()
)

achievement("Shangri-la Junkblade", "Escape Shangri-la on your Junkblade", points = 10, type = "progression",
    trigger = Episode7_CompletedJunkbladeEscape()
)

achievement("No Damage - Shangri-la Junkblade", "Clear the Shangri-la Junkblade sequence without taking damage", points = 10, type = "missable",
    trigger = Episode7_JunkbladeChallenge()
)

achievement("Another Future", "Prevent an uncertain future and clear Episode 7", points = 25, type = "win_condition",
    trigger = Episode7_CompletedEpisode()
)

achievement("S Rank - Episode 7", "Clear Episode 7 with an S Rank", points = 10, type = "missable",
    trigger = Episode7_ClearEpisode_SRank()
)

achievement("Unlock Episode 8", "Clear Episode 7 after acquiring a total of 2000 CP or more", points = 10, type = "missable",
    trigger = Episode7_UnlockedEpisode8()
)

// -- Episode 8 -- //

achievement("Snacks", "Find all snacks in Episode 8", points = 10,
    trigger = Episode8_AllSnacks()
)

achievement("Final Break Down", "Clear Episode 8", points = 10,
    trigger = Episode8_Completed()
)

achievement("Emergency Spray", "Clear Episode 8 with 5 or more Emergency Sprays remaining", points = 25,
    trigger = Episode8_EmergencySpayChallenge()
)

