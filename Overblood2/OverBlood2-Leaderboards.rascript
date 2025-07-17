// OverBlood 2
// #ID = 9264
// Author: TwosomesUP
// RetroAchievements - Rich Presence Script

// ------------------------- Accessors ------------------------- //

Game = {
    "Loaded": dword(0xd2f40),
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
    "Episode1":{
        "E": {
            "Min": 0,
            "Max": 100
        },
        "D": {
            "Min": 101,
            "Max": 150
        },
        "C": {
            "Min": 151,
            "Max": 200
        },
        "B": {
            "Min": 201,
            "Max": 250
        },
        "A": {
            "Min": 251,
            "Max": 300
        },
        "S": {
            "Min": 301,
            "Max": 600
        }
    },
    "Episode2":{
        "E": {
            "Min": 0,
            "Max": 100
        },
        "D": {
            "Min": 101,
            "Max": 150
        },
        "C": {
            "Min": 151,
            "Max": 200
        },
        "B": {
            "Min": 201,
            "Max": 250
        },
        "A": {
            "Min": 251,
            "Max": 300
        },
        "S": {
            "Min": 301,
            "Max": 600
        }
    },
    "Episode3":{
        "E": {
            "Min": 0,
            "Max": 100
        },
        "D": {
            "Min": 101,
            "Max": 150
        },
        "C": {
            "Min": 151,
            "Max": 200
        },
        "B": {
            "Min": 201,
            "Max": 250
        },
        "A": {
            "Min": 251,
            "Max": 300
        },
        "S": {
            "Min": 301,
            "Max": 600
        }
    },
    "Episode4":{
        "E": {
            "Min": 0,
            "Max": 50
        },
        "D": {
            "Min": 51,
            "Max": 100
        },
        "C": {
            "Min": 101,
            "Max": 150
        },
        "B": {
            "Min": 151,
            "Max": 200
        },
        "A": {
            "Min": 201,
            "Max": 250
        },
        "S": {
            "Min": 251,
            "Max": 500
        }
    },
    "Episode5":{
        "E": {
            "Min": 0,
            "Max": 110
        },
        "D": {
            "Min": 111,
            "Max": 160
        },
        "C": {
            "Min": 161,
            "Max": 210
        },
        "B": {
            "Min": 211,
            "Max": 260
        },
        "A": {
            "Min": 261,
            "Max": 310
        },
        "S": {
            "Min": 311,
            "Max": 600
        }
    },
    "Episode6":{
        "E": {
            "Min": 0,
            "Max": 50
        },
        "D": {
            "Min": 51,
            "Max": 100
        },
        "C": {
            "Min": 101,
            "Max": 150
        },
        "B": {
            "Min": 151,
            "Max": 200
        },
        "A": {
            "Min": 201,
            "Max": 250
        },
        "S": {
            "Min": 251,
            "Max": 500
        }
    },
    "Episode7":{
        "E": {
            "Min": 0,
            "Max": 150
        },
        "D": {
            "Min": 151,
            "Max": 200
        },
        "C": {
            "Min": 201,
            "Max": 250
        },
        "B": {
            "Min": 251,
            "Max": 300
        },
        "A": {
            "Min": 301,
            "Max": 350
        },
        "S": {
            "Min": 351,
            "Max": 700
        }
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

function IsGameLoaded(){
    loaded = Game["Loaded"]
    return loaded != 0
}

function IsOnTitle(){
    return Game["OnTitle"] == 0x01
}

function IsInGame(){
    title = Game["OnTitle"]
    miniGame = Game["MiniGame"]
    return IsGameLoaded() && (title != 0x01 || (title == 0x01 && miniGame == 0x01))
}

function IsInMiniGame(){
    miniGame = Game["MiniGame"]
    return miniGame == 0x01
}

function IsInEpisode8(){
    location = Game["Map"]["Location"]
    return location == 0x09
}

function IsEpisode8Unlocked(){
    episodeUnlocked = Game["Episode8Unlocked"]
    return episodeUnlocked == 0x01
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
function GetEpisodeClearTime(episode){
    clearStats = Game["ClearStats"]
    episodeStats = clearStats["Episode" + episode]
    time = episodeStats["Time"]
    
    return time
}

function GetEpisodeCP(episode){
    clearStats = Game["ClearStats"]
    episodeStats = clearStats["Episode" + episode]
    cp = episodeStats["CP"]
    
    return cp
}

function GetRankValues(episode, rank){
    values = []
    
    episodeValues = EpisodeGoals["Episode" + episode][rank]
    array_push(values, episodeValues["Min"])
    array_push(values, episodeValues["Max"])
    
    return values
}

function GetRankConditions(episode){
    currentEpisode = GetEpisode()
    points = GetEpisodeCP(episode)
    
    conditions = []
    
    eRank = GetRankValues(episode, "E")
    dRank = GetRankValues(episode, "D")
    cRank = GetRankValues(episode, "C")
    bRank = GetRankValues(episode, "B")
    aRank = GetRankValues(episode, "A")
    sRank = GetRankValues(episode, "S")
    
    array_push(conditions, measured(0, currentEpisode >= episode && points >= eRank[0] && points <= eRank[1]))
    array_push(conditions, measured(1, currentEpisode >= episode && points >= dRank[0] && points <= dRank[1]))
    array_push(conditions, measured(2, currentEpisode >= episode && points >= cRank[0] && points <= cRank[1]))
    array_push(conditions, measured(3, currentEpisode >= episode && points >= bRank[0] && points <= bRank[1]))
    array_push(conditions, measured(4, currentEpisode >= episode && points >= aRank[0] && points <= aRank[1]))
    array_push(conditions, measured(5, currentEpisode >= episode && points >= sRank[0] && points <= sRank[1]))
    array_push(conditions, measured(6, currentEpisode < episode))
    
    return conditions
}

function GetRank(episode){
    return max_of(GetRankConditions(episode))
}

function GetTotalCP(){
    points = []
    
    array_push(points, GetEpisodeCP(1))    
    array_push(points, GetEpisodeCP(2))    
    array_push(points, GetEpisodeCP(3))    
    array_push(points, GetEpisodeCP(4))    
    array_push(points, GetEpisodeCP(5))    
    array_push(points, GetEpisodeCP(6))    
    array_push(points, GetEpisodeCP(7))    
    
    return sum_of(points, value => value)
}

function GetEpisode(){
    episode = Game["Episode"]
    return episode
}

function GetGameTime(){
    timeParts = Game["Time"]["Overall"]
    hours = timeParts["Hours"]
    minutes = timeParts["Minutes"]
    seconds = timeParts["Seconds"]
    frames = timeParts["Frames"]
    
    hours = hours * 60 * 60
    minutes = minutes * 60
    
    return hours + minutes + seconds
}

function GetCharacter(){
    character = Character["Index"]
    return character
}

function GetCharacterHealth(){
    index = GetCharacter()
    start = Character["Start"]
    size = Character["Size"]
    healthOffset = Character["Offsets"]["Health"]
    
    characterOffset = index * size
    healthAddress = start + characterOffset + healthOffset
    
    return dword(healthAddress)
}

function GetPlayerHealthPercentage(){
    health = GetCharacterHealth()
    maxHealth = 2880.00
    return (health / maxHealth) * 100.00
}

function GetInventoryCount(){
    count = Items["Count"]
    return count
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

function GetClothingSlotAddress(){
    inventoryStart = Items["Inventory"]["Start"]
    slotSize = Items["Inventory"]["SlotSize"]
    equippedSlot = GetCharacterItemSlot("Clothing")
    slotOffset = slotSize * equippedSlot
    
    return inventoryStart + slotOffset
}

function GetBootsSlotAddress(){
    inventoryStart = Items["Inventory"]["Start"]
    slotSize = Items["Inventory"]["SlotSize"]
    equippedSlot = GetCharacterItemSlot("Boots")
    slotOffset = slotSize * equippedSlot
    
    return inventoryStart + slotOffset
}

function GetEquippedWeapon(){
    idOffset = Items["Inventory"]["Offsets"]["ID"]
    idAddress = (GetWeaponSlotAddress()) + idOffset
    weaponId = word(idAddress)
    
    return weaponId
}

function GetWeaponAmmoCount(){
    ammoOffset = Items["Inventory"]["Offsets"]["Ammo"]
    
    ammoAddress = (GetWeaponSlotAddress()) + ammoOffset
    ammoCount = word(ammoAddress)

    return ammoCount
}

function GetEquippedClothing(){
    idOffset = Items["Inventory"]["Offsets"]["ID"]
    idAddress = (GetClothingSlotAddress()) + idOffset
    clothingId = word(idAddress)
    
    return clothingId
}

function GetEquippedBoots(){
    idOffset = Items["Inventory"]["Offsets"]["ID"]
    idAddress = (GetBootsSlotAddress()) + idOffset
    bootsId = word(idAddress)
    
    return bootsId
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

// ------------------------- Leaderboard Functions ------------------------- //

function EpisodeSubmit(episode){
    currentEpisode = GetEpisode()
    time = GetEpisodeClearTime(episode)
    return !IsOnTitle() &&
        currentEpisode == episode &&
        prev(time) == 0 && time > 0
}

function Episode8Submit(){
    return !IsOnTitle() &&
        IsEpisode8Unlocked() &&
        TriggeredScene(8, "End", "Complete")
}


// ------------------------- Leaderboard Definitions ------------------------- //

leaderboard("Episode 1 - Highest CP", "Complete Episode 1 with the highest CP possible",
    start = EpisodeSubmit(1),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(1)
)


leaderboard("Episode 2 - Highest CP", "Complete Episode 2 with the highest CP possible",
    start = EpisodeSubmit(2),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(2)
)


leaderboard("Episode 3 - Highest CP", "Complete Episode 3 with the highest CP possible",
    start = EpisodeSubmit(3),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(3)
)


leaderboard("Episode 4 - Highest CP", "Complete Episode 4 with the highest CP possible",
    start = EpisodeSubmit(4),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(4)
)


leaderboard("Episode 5 - Highest CP", "Complete Episode 5 with the highest CP possible",
    start = EpisodeSubmit(5),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(5)
)


leaderboard("Episode 6 - Highest CP", "Complete Episode 6 with the highest CP possible",
    start = EpisodeSubmit(6),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(6)
)


leaderboard("Episode 7 - Highest CP", "Complete Episode 7 with the highest CP possible",
    start = EpisodeSubmit(7),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeCP(7)
)

leaderboard("Overall - Highest CP", "Complete the game with the highest overall CP possible",
    start = EpisodeSubmit(7),
    cancel = always_false(),
    submit = always_true(),
    value = GetTotalCP()
)

leaderboard("Episode 1 - Best Time", "Complete Episode 1 as fast as possible",
    start = EpisodeSubmit(1),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(1),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 2 - Best Time", "Complete Episode 2 as fast as possible",
    start = EpisodeSubmit(2),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(2),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 3 - Best Time", "Complete Episode 3 as fast as possible",
    start = EpisodeSubmit(3),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(3),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 4 - Best Time", "Complete Episode 4 as fast as possible",
    start = EpisodeSubmit(4),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(4),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 5 - Best Time", "Complete Episode 5 as fast as possible",
    start = EpisodeSubmit(5),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(5),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 6 - Best Time", "Complete Episode 6 as fast as possible",
    start = EpisodeSubmit(6),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(6),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 7 - Best Time", "Complete Episode 7 as fast as possible",
    start = EpisodeSubmit(7),
    cancel = always_false(),
    submit = always_true(),
    value = GetEpisodeClearTime(7),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Episode 8 - Best Time", "Complete Episode 8 as fast as possible",
    start = Episode8Submit(),
    cancel = always_false(),
    submit = always_true(),
    value = GetGameTime(),
    format = "SECS",
    lower_is_better=true
)

leaderboard("Overall - Best Time", "Complete the game as fast as possible",
    start = EpisodeSubmit(7),
    cancel = always_false(),
    submit = always_true(),
    value = GetGameTime(),
    format = "SECS",
    lower_is_better=true
)
