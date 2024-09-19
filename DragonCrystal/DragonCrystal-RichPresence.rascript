// Dragon Crystal
// #ID = 11586
// Retro Achievements - Rich Presence Script
// Author: TwosomesUP

// ======================================================================= //
// Accessors
// ======================================================================= //

Game = {
    "Demo": byte(0x6),
    "Screen": byte(0x18),
    "Floor": byte(0x1c),
    "Message": byte(0xac4)
}

Player = {
    "PW": byte(0x618),
    "AC": byte(0x61a),
    "Level": byte(0x61f),
    "Food": low4(0x620) + high4(0x620) * 10,
    "Health": byte(0x621) + byte(0x622) * 256,
    "MaxHealth": byte(0x623) + byte(0x624) * 256,
    "Experience": word(0x625) + byte(0x626) * 256,
    "Gold": low4(0x62b) + high4(0x62b) * 10 + low4(0x62c) * 100 + high4(0x62c) * 1000,
    "BasePW": byte(0x62f),
    "BaseAC": byte(0x630),
    "Status": {
        "Norust": byte(0x631),
        "Paralyzed": byte(0x632),
        "Sluggish": byte(0x633),
        "Poisoned": byte(0x634),
        "Fogged": byte(0x635),
        "Dizzy": byte(0x636)
    },
    "Continues": byte(0x63e),
    "Equipped": {
        "Weapon": byte(0x900),
        "Armor": byte(0x908),
        "Ring": byte(0x928),
        "IsRingEquipped": byte(0x930)
    },
    "UsedItem": byte(0x931),
    "ThrownItem": byte(0x932),
    "DroppedItem": byte(0x933)
}

Inventory = {
    "Start": {
        "Sword": 0x900,
        "Armor": 0x908,
        "Scroll": 0x910,
        "Rod": 0x918,
        "Potion": 0x920,
        "Ring": 0x928
    },
    "Slots": 8
}

IdentifiableItems = {
     "BladeScroll": byte(0x935),
     "ShieldScroll": byte(0x936),
     "NorustScroll": byte(0x937),
     "BlessScroll": byte(0x938),
     "MapScroll": byte(0x939),
     "ShiftScroll": byte(0x93a),
     "MadScroll": byte(0x93b),
     "MagiScroll": byte(0x93c),
     "GasScroll": byte(0x93d),
     "GhostScroll": byte(0x93e),
     "DragonScroll": byte(0x93f),
     "SummonScroll": byte(0x940),
     "BlankScroll": byte(0x941),
     "PotionScroll": byte(0x942),
     
     "FlameRod": byte(0x945),
     "FlashRod": byte(0x946),
     "ThunderRod": byte(0x947),
     "TravelRod": byte(0x948),
     "WindRod": byte(0x949),
     "BerserkRod": byte(0x94a),
     "ReshapeRod": byte(0x94b),
     "SilentRod": byte(0x94c),
     "DrainRod": byte(0x94d),
     "SpiritRod": byte(0x94e),
     "WoodRod": byte(0x94f),
     "WitherRod": byte(0x950),

     "MinhealPotion": byte(0x955),
     "MidhealPotion": byte(0x956),
     "SlowPotion": byte(0x957),
     "SlowfixPotion": byte(0x958),
     "FogPotion": byte(0x959),
     "DazePotion": byte(0x95a),
     "CurePotion": byte(0x95b),
     "FreezePotion": byte(0x95c),
     "PowerPotion": byte(0x95d),
     "ReflexPotion": byte(0x95e),
     "MaxhealPotion": byte(0x95f),
     "WaterPotion": byte(0x960),
     "WitherPotion": byte(0x961),

     "HealRing": byte(0x965),
     "MagicRing": byte(0x966),
     "FoodRing": byte(0x967),
     "SightRing": byte(0x968),
     "ShieldRing": byte(0x969),
     "OgreRing": byte(0x96a),
     "CursedRing": byte(0x96b),
     "HungerRing": byte(0x96c),
     "ToyRing": byte(0x96d),
     "ShiftRing": byte(0x96e)
}

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

EquipmentValues = {
    "Dagger": 0x01,
    "ShortSword": 0x02,
    "LongSword": 0x03,
    "Broadsword": 0x04,
    "Gladius": 0x05,
    "Flameberge": 0x06,
    "RuneBlade": 0x07,
    "LaserBlade": 0x08,
    "MagiMasher": 0x09,
    "BushidoBlade": 0x0a,
    "GhostKiller": 0x0b,
    "DragonSlayer": 0x0c,
    "BloodBlade": 0x0d,
    "GreatSword": 0x0e,
    "DeathBlade": 0x0f,

    "Robe": 0x10,
    "Leathersuit": 0x11,
    "Lamellar": 0x12,
    "Cuirass": 0x13,
    "ChainMail": 0x14,
    "ScaleArmor": 0x15,
    "PlateArmor": 0x16,
    "BattleSuit": 0x17,
    "DragonSuit": 0x18,
    "MysticSuit": 0x19,
    "PowerSuit": 0x1a
}

ItemValues = {
    "BladeScroll": 0x20,
    "ShieldScroll": 0x21,
    "NorustScroll": 0x22,
    "BlessScroll": 0x23,
    "MapScroll": 0x24,
    "ShiftScroll": 0x25,
    "MadScroll": 0x26,
    "MagiScroll": 0x27,
    "GasScroll": 0x28,
    "GhostScroll": 0x29,
    "DragonScroll": 0x2a,
    "SummonScroll": 0x2b,
    "BlankScroll": 0x2c,
    "PotionScroll": 0x2d,

    "FlameRod": 0x30,
    "FlashRod": 0x31,
    "ThunderRod": 0x32,
    "TravelRod": 0x33,
    "WindRod": 0x34,
    "BerserkRod": 0x35,
    "ReshapeRod": 0x36,
    "SilentRod": 0x37,
    "DrainRod": 0x38,
    "SpiritRod": 0x39,
    "WoodRod": 0x3a,
    "WitherRod": 0x3b,

    "MinhealPotion": 0x40,
    "MidhealPotion": 0x41,
    "SlowPotion": 0x42,
    "SlowfixPotion": 0x43,
    "FogPotion": 0x44,
    "DazePotion": 0x45,
    "CurePotion": 0x46,
    "FreezePotion": 0x47,
    "PowerPotion": 0x48,
    "ReflexPotion": 0x49,
    "MaxhealPotion": 0x4a,
    "WaterPotion": 0x4b,
    "WitherPotion": 0x4c,

    "HealRing": 0x50,
    "MagicRing": 0x51,
    "FoodRing": 0x52,
    "SightRing": 0x53,
    "ShieldRing": 0x54,
    "OgreRing": 0x55,
    "CursedRing": 0x56,
    "HungerRing": 0x57,
    "ToyRing": 0x58,
    "ShiftRing": 0x59
}

Message = {
    "Victory": 0x9,
    "Path": 0xe,
    "MonstersEnraged": 0x15, 
    "MonstersConfused": 0x16, //Fog Potion, Daze Potion, Mad Scroll
    "MonstersParalyzed": 0x17, //Freeze Potion
    "MonstersHesitate": 0x18, //Slow Potion, Wither Potion
    "MonstersBlownAway": 0x1a,
    "FoundMap": 0x20,
    "Enemy": 0x24,
    "Deflected": 0x2a,
    "Mutates": 0x2b,
    "SwappedHitpoints": 0x2d,
    "SwordDoesntCut": 0x3c,
    "MonsterSummoned": 0x4f
}

Enemies = {
    "Phantom": [
        {
            "MinFloor": 5,
            "MaxFloor": 8,
            "Experience": 1
        },
        {
            "MinFloor": 17,
            "MaxFloor": 20,
            "Experience": 72
        },
        {
            "MinFloor": 25,
            "MaxFloor": 28,
            "Experience": 110
        }
    ],
    "Witch": [
        {
            "MinFloor": 9,
            "MaxFloor": 12,
            "Experience": 25
        },
        {
            "MinFloor": 21,
            "MaxFloor": 24,
            "Experience": 60
        }
    ],
    "Myst": [
        {
            "MinFloor": 10,
            "MaxFloor": 12,
            "Experience": 48
        },
        {
            "MinFloor": 21,
            "MaxFloor": 24,
            "Experience": 150
        }
    ],
    "Dragon": [
        {
            "MinFloor": 29,
            "MaxFloor": 30,
            "Experience": 250
        }
    ]
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsEquipmentCursed(type){
    return bit7(Inventory["Start"][type]) == 1
}

function GetCursedEquipmentID(type, name){
    return Items[type][name] + 0x80
}

function GetItemIndex(type, name){
    return Items[type][name] & 0xf
}

function IdentifyThrownItems(){
    return measured(tally(10, array_map(IdentifiableItems, item => Player["ThrownItem"] == ItemValues[item] && prev(IdentifiableItems[item]) != 0 && IdentifiableItems[item] == 0)))
}

function IdentifyUsedItems(){
    return measured(tally(10, array_map(IdentifiableItems, item => Player["UsedItem"] == ItemValues[item] && prev(IdentifiableItems[item]) != 0 && IdentifiableItems[item] == 0)))
}

function AllIdentified(){
    return measured(tally(49, array_map(IdentifiableItems, item => prev(IdentifiableItems[item]) != 0 && IdentifiableItems[item] == 0)))
}

