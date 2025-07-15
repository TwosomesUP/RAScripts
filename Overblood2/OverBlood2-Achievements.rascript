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
        },
        "Episode8":{
            "Snacks": {
                "Snack1": bit0(0x1beaf8),
                "Snack2": bit4(0x1beaf8),
                "Snack3": bit5(0x1beaf8),
                "Snack4": bit3(0x1beb03)
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
        },
        "DestroyCore":{
            "ID": 0xe0,
            "Scene": {
              "Begin": 0x263,
              "End": 0x273
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
        "JunkbladeRace": [7, 2, 0xa],
        "Diva1": [7, 1, 3],
        "Diva2": [7, 1, 4],
        "Diva3": [7, 1, 5],
        "Diva4": [7, 2, 0xc],
        "Diva5": [7, 0, 7],
        "Diva6": [7, 2, 8],
        "Diva7": [7, 1, 0xb]
    },
    "Episode8": {
        "Room1": [9, 0, 1],
        "Room2": [9, 0, 2],
        "Room3": [9, 0, 3],
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
    if(episode == 8)
        episodeCheck = Game["Map"]["Location"] == 0x9
    
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

function HasItem(type, name, max){
    inventoryCount = Items["Count"]    
    inventory = Items["Inventory"]
    start = inventory["Start"]
    size = inventory["SlotSize"]
    offsets = inventory["Offsets"]
    idOffset = offsets["ID"]
    countOffset = offsets["Count"]
    
    itemId = ItemIDs[type][name]
    
    conditions = []
    
    for index in range(0, max - 1){
        slotOffset = index * size
        slotAddress = start + slotOffset
        
        id = word(slotAddress + idOffset)
        count = word(slotAddress + countOffset)
        
        condition = inventoryCount >= index && id == itemId && count > 0
        
        array_push(conditions, condition)
    }
    
    return any_of(conditions, condition => condition)
}

function HasItemAmount(type, name, amount, max){
    inventoryCount = Items["Count"]    
    inventory = Items["Inventory"]
    start = inventory["Start"]
    size = inventory["SlotSize"]
    offsets = inventory["Offsets"]
    idOffset = offsets["ID"]
    countOffset = offsets["Count"]
    
    itemId = ItemIDs[type][name]
    
    conditions = []
    
    for index in range(0, max - 1){
        slotOffset = index * size
        slotAddress = start + slotOffset
        
        id = word(slotAddress + idOffset)
        count = word(slotAddress + countOffset)
        
        condition = inventoryCount >= index && id == itemId && count >= amount
        
        array_push(conditions, condition)
    }
    
    return any_of(conditions, condition => condition)
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
    return BossIsActive("Kondo2") &&
        HasWeaponEquipped("Katana") &&
        DefeatedBoss(7, "Kondo2", true) &&
        disable_when
        (
            BossIsActive("Kondo2") && 
            IsBossDamaged("Kondo2") && 
            prev(GetPlayerHealthPercentage()) > 25 &&
            GetPlayerHealthPercentage() < 25
        ) &&
        disable_when
        (
            BossIsActive("Kondo2") && 
            IsBossDamaged("Kondo2") && 
            GetPlayerHealthPercentage() < 25 &&
            PlayerTookDamage()
        ) &&
        disable_when
        (
            BossIsActive("Kondo2") &&
            IsBossDamaged("Kondo2") &&
            !HasWeaponEquipped("Katana") &&
            BossTookDamage("Kondo2")
        ) &&
        ResetBossChallenge(7, "KondoFight")
}

function Episode7_GotDivaPieces(){
    rooms = [
        "Diva1",
        "Diva2",
        "Diva3",
        "Diva4",
        "Diva5",
        "Diva6",
        "Diva7"
    ]
    
    return !IsOnTitle() &&
        IsInAnyRoom(7, rooms) &&
        TriggeredItemFlagCount(7, "DivaPieces", true)
}

function Episode7_DefeatedZeno1(){
    return BossIsActive("Zeno") &&
        DefeatedBoss(7, "Zeno")
}

function Episode7_Zeno1Challenge(){
    return BossIsActive("Zeno") &&
        DefeatedBoss(7, "Zeno", true) &&
        GetPlayerHealthPercentage() >= 50
}

function Episode7_DefeatedTempest(){
    return !IsOnTitle() &&
        BossIsActive("Tempest") &&
        DefeatedBoss(7, "Tempest")
}

function Episode7_TempestChallenge(){
    return BossIsActive("Tempest") &&
        DefeatedBoss(7, "Tempest", true) &&
        disable_when
        (
            BossIsActive("Tempest") && 
            IsBossDamaged("Tempest") && 
            PlayerTookDamage()
        ) &&
        ResetBossChallenge(7, "TempestFight")
}

function Episode7_DeactivatedCore(){
    return !IsOnTitle() &&
        TriggeredScene(7, "EngineCore", "DestroyCore")
}

function Episode7_DefeatedZeno2(){
    return BossIsActive("Zeno2") &&
        DefeatedBoss(7, "Zeno2")
}

function Episode7_Zeno2Challenge(){
    return BossIsActive("Zeno2") &&
        DefeatedBoss(7, "Zeno2", true) &&
        GetPlayerHealthPercentage() >= 50
}

function Episode7_CompletedJunkbladeEscape(){
    return !IsOnTitle() &&
        CompletedMinigame(7, "JunkbladeRace")
}

function Episode7_JunkbladeChallenge(){
    return !IsOnTitle() &&
        CompletedMinigameChallenge(7, "JunkbladeRace", 120, true)
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
    rooms = [
        "Room1",
        "Room2",
        "Room3",
        "End"
    ]
    
    return !IsOnTitle() &&
        IsInAnyRoom(8, rooms) &&
        TriggeredItemFlagCount(8, "Snacks", true)
}

function Episode8_Completed(){
    return !IsOnTitle() &&
        IsEpisode8Unlocked() &&
        TriggeredScene(8, "End", "Complete")
}

function Episode8_EmergencySpayChallenge(){
    return Episode8_Completed() &&
        HasItemAmount("Cure", "EmergencySpray", 4, 100)
}

// ------------------------- Achievement Definitions ------------------------- //

// -- Episode 1 -- //

achievement("Episode 1 - East Edge", "Arrive in East Edge City in Episode 1", points = 2, type = "progression", id = 532506,
    trigger = Episode1_ReachEastEdge()
)

achievement("Window Pain", "Break a window at the Array Bridge Shop and pay for the damages", points = 3, id = 532507,
    trigger = Any_PayedForWindow()
)

achievement("Episode 1 - Billboard Island", "Arrive on Billboard Island in Episode 1", points = 2, type = "progression", id = 532508,
    trigger = Episode1_ReachBillboardIsland()
)

achievement("Episode 1 - Siver Otakki", "Correctly answer Siver Otakki's question in Episode 1", points = 2, type = "missable", id = 532509,
    trigger = Episode1_SiverOtakkiQuestion()
)

achievement("Episode 1 - Submarine", "Solve the Submarine Bay puzzle and enter the Submarine on Billboard Island in Episode 1", points = 5, type = "missable", id = 532510,
    trigger = Episode1_EnterTheSubmarine()
)

achievement("Billboard Island Treasures", "Find all hidden weapons, clothing items, and boots on Billboard Island in Episode 1", points = 10, type = "missable", id = 532511,
    trigger = Episode1_Treasures()
)

achievement("Episode 1 - Power Room Door", "Enter the Power Room Door on Billboard Island in Episode 1 using the Silver Key", points = 3, type = "missable", id = 532512,
    trigger = Episode1_EnterPowerRoomWithKey()
)

achievement("Episode 1 - Gumbo", "Defeat Gumbo the Robot on Billboard Island in Episode 1", points = 3, type = "progression", id = 532513,
    trigger = Episode1_DefeatedGumbo()
)

achievement("Episode 1 - Gumbo Challenge", "Defeat Gumbo the Robot on Billboard Island in Episode 1 without taking damage", points = 10, type = "missable", id = 532514,
    trigger = Episode1_DefeatGumbo_NoHeal()
)

achievement("Episode 1 - Turrets", "Complete the Turret Sequence on Billboard Island in Episode 1", points = 3, type = "progression", id = 532515,
    trigger = Episode1_ClearTurret()
)

achievement("Episode 1 - Turret Challenge", "Complete the Turret Sequence on Billboard Island in Episode 1 after destroying 10 or more helicopters", points = 5, type = "missable", id = 532516,
    trigger = Episode1_ClearTurretChallenge()
)

achievement("Encounters", "Escape Billboard Island and complete Episode 1", points = 5, type = "progression", id = 532517,
    trigger = Episode1_ClearEpisode()
)

achievement("Episode 1 - S Rank", "Complete Episode 1 with an S Rank", points = 10, type = "missable", id = 532518,
    trigger = Episode1_ClearEpisode_SRank()
)

// -- Episode 2 -- //

achievement("Episode 2 - Siver Otakki", "Correctly answer Siver Otakki's question in Episode 2", points = 2, type = "missable", id = 532519,
    trigger = Episode2_SiverOtakkiQuestion()
)

achievement("Episode 2 - Pagoda Tower", "Arrive in the Pagoda Tower in Episode 2", points = 2, type = "progression", id = 532520,
    trigger = Episode2_ReachPagodaTower()
)

achievement("Episode 2 - First Guardian", "Destroy the First Guarding System in the Pagoda Tower in Episode 2", points = 3, type = "progression", id = 532521,
    trigger = Episode2_DestroyFirstGuard()
)

achievement("Episode 2 - First Guardian Challenge", "With the Light Sabre equipped, defeated the First Guardian in the Pagoda Tower in Episode 2 without recharging", points = 10, type = "missable", id = 532522,
    trigger = Episode2_FirstGuardChallenge()
)

achievement("Episode 2 - Oil Tanks", "Destroy all 3 Oil Tanks in the Pagoda Tower in Episode 2", points = 3, type = "missable", id = 532523,
    trigger = Episode2_DestroyOilTanks()
)

achievement("Episode 2 - Second Guardian", "Destroy the Second Guarding System in the Pagoda Tower in Episode 2", points = 3, type = "progression", id = 532524,
    trigger = Episode2_DestroySecondGuard()
)

achievement("Episode 2 - Second Guardian Challenge", "With the Antique Gun equipped, defeat the Second Guardian in the Pagoda Tower in Episode 2 in 18 shots or less", points = 10, type = "missable", id = 532525,
    trigger = Episode2_SecondGuardChallenge()
)

achievement("Hazardous Gems", "Find all gem stones protected by hazards in the Pagoda Tower Third Guarding System Underwater Passage in Episode 2", points = 10, type = "missable", id = 532526,
    trigger = Episode2_DangerousGems()
)

achievement("Episode 2 - Monitors", "Break all of the Monitors in the Pagoda Tower Control Room in Episode 2", points = 3, type = "missable", id = 532527,
    trigger = Episode2_DestroyMonitors()
)

achievement("Pagoda Tower Treasures", "Find all hidden weapons, clothing items, and boots in the Pagoda Tower in Episode 2", points = 10, type = "missable", id = 532528,
    trigger = Episode2_Treasures()
)

achievement("Episode 2 - Third Guardian", "Destroy the Third Guarding System in the Pagoda Tower in Episode 2", points = 3, type = "progression", id = 532529,
    trigger = Episode2_DestroyThirdGuard()
)

achievement("Episode 2 - Third Guardian Challenge", "Destroy the Third Guardian in the Pagoda Tower in Episode 2 by freezing it in its tracks", points = 10, type = "missable", id = 532530,
    trigger = Episode2_ThirdGuardChallenge()
)

achievement("Episode 2 - Kondo", "Defeat Kondo in the Pagoda Tower in Episode 2", points = 3, type = "progression", id = 532531,
    trigger = Episode2_DefeatedKondo()
)

achievement("Episode 2 - Kondo Challenge", "With the Super Light Sabre equipped, defeat Kondo in the Pagoda Tower in Episode 2 without dropping below 25% health", points = 10, type = "missable", id = 532532,
    trigger = Episode2_KondoChallenge()
)

achievement("Awakening", "Escape the Pagoda Tower and complete Episode 2", points = 5, type = "progression", id = 532533,
    trigger = Episode2_ClearEpisode()
)

achievement("Episode 2 - S Rank", "Complete Episode 2 with an S Rank", points = 10, type = "missable", id = 532534,
    trigger = Episode2_ClearEpisode_SRank()
)

// -- Episode 3 -- //

achievement("Episode 3 - Siver Otakki", "Correctly answer Siver Otakki's question in Episode 3", points = 2, type = "missable", id = 532535,
    trigger = Episode3_SiverOtakkiQuestion()
)

achievement("Train Treasure Tracker", "Collect all items on the Subway Train in Episode 3 before time runs out", points = 10, type = "missable", id = 532536,
    trigger = Episode3_SubwayTrainItems()
)

achievement("Episode 3 - Underground Terminous", "Arrive in the Underground Terminous in Episode 3", points = 2, type = "progression", id = 532537,
    trigger = Episode3_ReachUndergroundTerminous()
)

achievement("Terminous Treasures", "Find the Laser Gun and Big Magnum in the Underground Terminous in Episode 3", points = 10, type = "missable", id = 532538,
    trigger = Episode3_Treasures()
)

achievement("Episode 3 - Giant Mech", "Destroy all of the Giant Mech's parts in the Underground Terminous in Episode 3", points = 3, type = "missable", id = 532539,
    trigger = Episode3_GiantMech()
)

achievement("Episode 3 - Trailer Lift", "Operate and have both Trailer Lifts raised in the Underground Terminous in Episode 3", points = 3, type = "missable", id = 532540,
    trigger = Episode3_TrailerLifts()
)

achievement("Episode 3 - Anti Proton", "Place the Plasma Bomb and destroy the Anti Proton Core in the Underground Terminous in Episode 3", points = 2, type = "progression", id = 532541,
    trigger = Episode3_DestroyAntiProtonCore()
)

achievement("Episode 3 - Sperio", "Defeat Sperio in the Underground Terminous in Episode 3", points = 3, type = "progression", id = 532542,
    trigger = Episode3_DefeatSperio()
)

achievement("Episode 3 - Sperio Challenge", "With the Big Magnum equipped, defeat Sperio in the Underground Terminous in Episode 3 in 5 shots or less", points = 10, type = "missable", id = 532543,
    trigger = Episode3_SperioChallenge()
)

achievement("Episode 3 - Terminous Junkblade Challenge", "Complete the Junkblade sequence in the Underground Terminous in Episode 3 without taking damage and gain the maximum amount of CP possible", points = 10, type = "missable",  id = 532544,
    trigger = Episode3_CompleteJunkbladeScene_NoDamage()
)

achievement("Underground Space", "Escape the Underground Terminous on Sperio's Junkblade and complete Episode 3", points = 5, type = "progression", id = 532545,
    trigger = Episode3_CompleteEpisode()
)

achievement("Episode 3 - S Rank", "Complete Episode 3 with an S Rank", points = 10, type = "missable", id = 532546,
    trigger = Episode3_ClearEpisode_SRank()
)

// -- Episode 4 -- //

achievement("Episode 4 - Siver Otakki", "Correctly answer Siver Otakki's question in Episode 4", points = 2, type = "missable", id = 532547,
    trigger = Episode4_SiverOtakkiQuestion()
)

achievement("Episode 4 - Dance Sequence", "Complete the Dance Sequence in the Aqua Liberty Ballroom in Episode 4", points = 3, type = "progression", id = 532548,
    trigger = Episode4_CompleteDanceScene()
)

achievement("Episode 4 - Dance Challenge", "Passionately finish the Dance sequence in the Aqua Liberty Ballroom in Episode 4 and gain the maximum amount of CP possible", points = 5, type = "missable", id = 532549,
    trigger = Episode4_CompleteDanceScene_MaxCP()
)

achievement("Aqua Liberty Treasures", "Find the Bat Maniac Outfit in the Aqua Liberty Ballroom in Episode 4", points = 3, type = "missable", id = 532550,
    trigger = Episode4_BatManiac()
)

achievement("Episode 4 - Gartlude", "Defeat Gartlude in the Aqua Liberty Ballroom Station in Episode 4", points = 3, type = "progression", id = 532551,
    trigger = Episode4_DefeatedGartlude()
)

achievement("Episode 4 - Gartlude Challenge", "Defeat Gartlude in the Aqua Liberty Ballroom in Episode 4 with 40 seconds or more left on the timer", points = 10, type = "missable", id = 532552,
    trigger = Episode4_GartludeChallenge()
)

achievement("Bloody Rose", "Escape the Aqua Liberty Ballroom and complete Episode 4", points = 5, type = "progression", id = 532553,
    trigger = Episode4_ClearEpisode()
)

achievement("Episode 4 - S Rank", "Complete Episode 4 with an S Rank", points = 10, type = "missable", id = 532554,
    trigger = Episode4_ClearEpisode_SRank()
)

// -- Episode 5 -- //

achievement("Otakki Treasure", "Find Siver Otakki's Special Treasure in Episode 5", points = 5, type = "missable", id = 532555,
    trigger = Episode5_FoundSiverTreasure()
)

achievement("Divine Gems", "Find all gems in the East Edge Church in Episode 5", points = 3, type = "missable", id = 532556,
    trigger = Episode5_ChurchEmeralds()
)

achievement("Episode 5 - Jungle", "Arrive in the Jungle in Episode 5", points = 2, type = "progression", id = 532557,
    trigger = Episode5_ReachJungle()
)

achievement("Episode 5 - T-Rex", "Defeat a T-Rex using a Quicksand trap in the Jungle in Episode 5", points = 5, type = "missable", id = 532558,
    trigger = Episode5_TRexChallenge()
)

achievement("Episode 5 - River Ride 1", "Complete the River Ride part 1 in the Jungle in Episode 5 without taking damage and gain the maximum amount of CP possible", points = 5, type = "missable", id = 532559,
    trigger = Episode5_River1Challenge()
)

achievement("Episode 5 - Mutated Plant", "Defeat the Mutated Plant in the Jungle in Episode 5", points = 3, type = "progression", id = 532560,
    trigger = Episode5_DefeatedPlant()
)

achievement("Monsterous Tentacles", "Destroy all of the Mutated Plant's tentacles before defeating it, in the Jungle in Episode 5", points = 5, type = "missable", id = 532561,
    trigger = Episode5_PlantChallenge()
)

achievement("Episode 5 - River Ride 2", "Complete the River Ride part 2 in the Jungle in Episode 5 without taking damage and gain the maximum amount of CP possible", points = 5, type = "missable", id = 532562,
    trigger = Episode5_River2Challenge()
)

achievement("Episode 5 - Anti Gravity Defense", "Destroy Anti Gravity Defense Station in the Jungle in Episode 5", points = 3, type = "progression", id = 532563,
    trigger = Episode5_DestroyAntiGravityStation()
)

achievement("Episode 5 - Laser Cannons", "Destroy all 3 Laser Cannons in the Jungle in Episode 5", points = 5, type = "missable", id = 532564,
    trigger = Episode5_LaserCannons()
)

achievement("Episode 5 - Tiger", "Defeat Tiger in the Jungle in Episode 5", points = 5, type = "progression", id = 532565,
    trigger = Episode5_DefeatedTiger()
)

achievement("Episode 5 - Tiger Challenge", "With the Bazooka equipped, defeat Tiger in the Jungle in Episode 5 in 5 shots or less", points = 10, type = "missable", id = 532566,
    trigger = Episode5_TigerChallenge()
)

achievement("Jamelgalda Treasures", "Find the Y.O. Miyabi Suit in the Jamelgalda Prison in Episode 5", points = 3, type = "missable", id = 532567,
    trigger = Episode5_MiyabiSuit()
)

achievement("Episode 5 - Lady", "Defeat Lady in the Jamelgalda Prison in Episode 5", points = 5, type = "progression", id = 532568,
    trigger = Episode5_DefeatedLady()
)

achievement("Episode 5 - Lady Challenge", "Defeat Lady in the Jamelgalda in Episode 5 without taking damage", points = 10, type = "missable", id = 532569,
    trigger = Episode5_LadyChallenge()
)

achievement("Deceptive Jungle", "Defeat Adidi, escape the Jamelgalda Prison, and complete Episode 5", points = 10, type = "progression", id = 532570,
    trigger = Episode5_ClearEpisode()
)

achievement("Episode 5 - Adidi Challenge", "With the Super Light Sabre equipped, defeat Adidi in the Jamelgalda Prison in Episode 5 without dropping below 25% health", points = 10, type = "missable", id = 532572,
    trigger = Episode5_AdidiChallenge()
)

achievement("Episode 5 - S Rank", "Complete Episode 5 with an S Rank", points = 10, type = "missable", id = 532573,
    trigger = Episode5_ClearEpisode_SRank()
)

// -- Episode 6 -- //

achievement("East Edge Treasure", "Find the hidden East Edge Treasure in Episode 6", points = 3, type = "missable", id = 532574,
    trigger = Episode6_EastEdgeSecret()
)

achievement("Episode 6 - Gloom Alley", "Arrive in Gloom Alley in Episode 6", points = 3, type = "progression", id = 532575,
    trigger = Episode6_ReachGloomAlley()
)

achievement("Gloomy Gems", "Find all gems in the Gloom Alley Streets in Episode 6", points = 3, type = "missable", id = 532576,
    trigger = Episode6_GloomAlleyGems()
)

achievement("Episode 6 - Ghost House", "Find the Ghost House Key in the Gloom Alley Streets in Episode 6", points = 3, type = "missable", id = 532577,
    trigger = Episode6_FindGhostHouseKey()
)

achievement("Frenemies", "Defeat a Mysterious Adversary in Episode 6", points = 10, type = "missable", id = 532578,
    trigger = Episode6_EvilSiver()
)

achievement("Breaking and Entering", "Enter the Ghost House in Episode 6 without unlocking the front door", points = 3, type = "missable", id = 532579,
    trigger = Episode6_AlternateGhostHouse()
)

achievement("Ghost House Treasures", "Find the Machine Gun in the Ghost House in Episode 6", points = 3, type = "missable", id = 532580,
    trigger = Episode6_MachineGun()
)

achievement("Episode 6 - Junkyard", "Arrive in the Junkyard in Episode 6", points = 3, type = "progression", id = 532581,
    trigger = Episode6_ReachJunkyard()
)

achievement("Episode 6 - Junkyard Race", "Win the Junkyard Race in Episode 6", points = 5, type = "progression", id = 532582,
    trigger = Episode6_WinJunkyardRace()
)

achievement("Edgy Kids", "Discover your hidden powers and complete Episode 6", points = 10, type = "progression", id = 532583,
    trigger = Episode6_ClearEpisode()
)

achievement("Episode 6 - S Rank", "Complete Episode 6 with an S Rank", points = 10, type = "missable", id = 532584,
    trigger = Episode6_ClearEpisode_SRank()
)

// -- Episode 7 -- //

achievement("Episode 7 - Shangri-la", "Arrive in Shangri-la in Episode 7", points = 3, type = "progression", id = 532585,
    trigger = Episode7_ReachShangrila()
)

achievement("Monsterous Clues", "Listen to all clues from a set of sagely creatures in Shangri-la in Episode 7", points = 2, type = "missable", id = 532586,
    trigger = Episode7_CreatureClues()
)

achievement("Episode 7 - Elevator", "Activate the Shangri-la Elevator in Episode 7", points = 5, type = "progression", id = 532587,
    trigger = Episode7_ActivateElevator()
)

achievement("Shangri-la Treasure", "Find the Katana in Shangri-la in Episode 7", points = 3, type = "missable", id = 532588,
    trigger = Episode7_AcquiredKatana()
)

achievement("Episode 7 - Kondo", "Defeat Kondo in Shangri-la in Episode 7", points = 5, type = "progression", id = 532589,
    trigger = Episode7_DefeatedKondo()
)

achievement("Episode 7 - Kondo Challenge", "With the Katana equipped, defeat Kondo in Shangri-la in Episode 7 without healing", points = 10, type = "missable", id = 532590,
    trigger = Episode7_KondoChallenge()
)

achievement("Episode 7 - Diva Pieces", "Find all Diva Pieces in Shangri-la in Episode 7", points = 5, type = "progression", id = 532591,
    trigger = Episode7_GotDivaPieces()
)

achievement("Episode 7 - Zeno", "Defeat Zeno in Shangri-la in Episode 7", points = 5, type = "progression", id = 532592,
    trigger = Episode7_DefeatedZeno1()
)

achievement("Episode 7 - Zeno Challenge", "Defeat Zeno in Shangri-la in Episode 7 with 50% or more health remaining", points = 10, type = "missable", id = 532593,
    trigger = Episode7_Zeno1Challenge()
)

achievement("Episode 7 - Tempest", "Defeat Tempest in Shangri-la in Episode 7", points = 5, type = "progression", id = 532594,
    trigger = Episode7_DefeatedTempest()
)

achievement("Episode 7 - Tempest Challenge", "Defeat Tempest in Shangri-la in Episode 7 without taking damage", points = 10, type = "missable", id = 532595,
    trigger = Episode7_TempestChallenge()
)

achievement("Episode 7 - Power Source", "Destroy the Shangri-la in Episode 7 Power Source", points = 5, type = "progression", id = 532596,
    trigger = Episode7_DeactivatedCore()
)

achievement("Episode 7 - Traveler Zeno", "Defeat Traveler Zeno in Shangri-la in Episode 7", points = 10, type = "progression", id = 532597,
    trigger = Episode7_DefeatedZeno2()
)

achievement("Episode 7 - Traveler Zeno Challenge", "Defeat Traveler Zeno in Shangri-la in Episode 7 with 50% or more health remaining", points = 10, type = "missable", id = 532598,
    trigger = Episode7_Zeno2Challenge()
)

achievement("Episode 7 - Junkblade Escape", "Escape Shangri-la on your Junkblade in Episode 7", points = 10, type = "progression", id = 532599,
    trigger = Episode7_CompletedJunkbladeEscape()
)

achievement("Episode 7 - Junkblade Escape Challenge", "Complete the Shangri-la Junkblade sequence without taking damage in Episode 7 and gain the maximum amount of CP possible", points = 10, type = "missable", id = 532600,
    trigger = Episode7_JunkbladeChallenge()
)

achievement("Another Future", "Prevent an uncertain future and complete Episode 7", points = 25, type = "win_condition", id = 532601,
    trigger = Episode7_CompletedEpisode()
)

achievement("Episode 7 - S Rank", "Complete Episode 7 with an S Rank", points = 10, type = "missable", id = 532602,
    trigger = Episode7_ClearEpisode_SRank()
)

achievement("Unlock Episode 8", "Complete Episode 7 after acquiring a total of 2000 CP or more", points = 10, type = "missable", id = 532603,
    trigger = Episode7_UnlockedEpisode8()
)

// -- Episode 8 -- //

achievement("Episode 8 - Snacks", "Find all snacks in Episode 8", points = 10, id = 532604,
    trigger = Episode8_AllSnacks()
)

achievement("Final Break Down", "Complete Episode 8", points = 10, id = 532605,
    trigger = Episode8_Completed()
)

achievement("Episode 8 - Emergency Spray", "Complete Episode 8 with 4 or more Emergency Sprays remaining", points = 25, id = 532606,
    trigger = Episode8_EmergencySpayChallenge()
)

