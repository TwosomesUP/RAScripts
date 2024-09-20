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

ScreenValues = {
    "NotLoaded": 0x00,
    "Title": 0x03,
    "StartGame": 0x06,
    "InGame": 0x0a,
    "GameOver": 0x0c,
    "Ending": 0x0e,
    "Menu": 0x10,
    "CreditsStart": 0x11,
    "CreditsEnd": 0x13,
    "Fin": 0x15,
    "Congrats": 0x17
}

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
// Lookup Dictionaries
// ======================================================================= //

RankLookup = {
    1: "Apprentice",
    2: "Ranger",
    3: "Soldier",
    4: "Warrior",
    5: "Fighter",
    6: "Swordsman",
    7: "Veteran",
    8: "Knight",
    9: "Champion",
    10: "Hero",
    11: "Master",
    12: "Paradin",
    13: "Warlord",
    14: "Dragonlord",
    15: "Avatar",
    16: "Masterlord"
}

SwordLookup = {
    0x1: "Dagger",
    0x2: "Short Sword",
    0x3: "Long Sword",
    0x4: "Broadsword",
    0x5: "Gladius",
    0x6: "Flamberge",
    0x7: "Rune Blade",
    0x8: "Laser Blade",
    0x9: "Magi Masher",
    0xa: "Bushido Blade",
    0xb: "Ghost Killer",
    0xc: "Dragonslayer",
    0xd: "Blood Blade",
    0xe: "Great Sword",
    0xf: "Death Blade",
    0x81: "Cursed Dagger",
    0x82: "Cursed Short Sword",
    0x83: "Cursed Long Sword",
    0x84: "Cursed Broadsword",
    0x85: "Cursed Gladius",
    0x86: "Cursed Flamberge",
    0x87: "Cursed Rune Blade",
    0x88: "Cursed Laser Blade",
    0x89: "Cursed Magi Masher",
    0x8a: "Cursed Bushido Blade",
    0x8b: "Cursed Ghost Killer",
    0x8c: "Cursed Dragonslayer",
    0x8d: "Cursed Blood Blade",
    0x8e: "Cursed Great Sword",
    0x8f: "Cursed Death Blade"
}

ArmorLookup = {
    0x10: "Robe",
    0x11: "Leathersuit",
    0x12: "Lamellar",
    0x13: "Cuirass",
    0x14: "Chain Mail",
    0x15: "Scale Armor",
    0x16: "Plate Armor",
    0x17: "Battle Suit",
    0x18: "Dragon Suit",
    0x19: "Mystic Suit",
    0x1a: "Power Suit",
    0x90: "Cursed Robe",
    0x91: "Cursed Leathersuit",
    0x92: "Cursed Lamellar",
    0x93: "Cursed Cuirass",
    0x94: "Cursed Chain Mail",
    0x95: "Cursed Scale Armor",
    0x96: "Cursed Plate Armor",
    0x97: "Cursed Battle Suit",
    0x98: "Cursed Dragon Suit",
    0x99: "Cursed Mystic Suit",
    0x9a: "Cursed Power Suit"
}

RingLookup = {
    180: " • Heal Ring",
    181: " • Magic Ring",
    182: " • Food Ring",
    183: " • Sight Ring",
    184: " • Shield Ring",
    185: " • Ogre Ring",
    186: " • Cursed Ring",
    187: " • Hunger Ring",
    188: " • Toy Ring",
    189: " • Shift Ring"
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => !IsOnTitle() && !IsOnGameOver() && !IsInDemo() && Game["Screen"] != ScreenValues["Ending"] && Game["Screen"] < ScreenValues["CreditsStart"]

function IsOnGameOver() => Game["Screen"] == ScreenValues["GameOver"]
function IsOnTitle() => Game["Screen"] == ScreenValues["Title"]
function IsInDemo() => Game["Demo"] == 1
function IsInEnding() => Game["Screen"] == ScreenValues["Ending"] || (Game["Screen"] >= ScreenValues["CreditsStart"] && Game["Screen"] <= ScreenValues["Congrats"])
function StartingGame() => Game["Screen"] == ScreenValues["StartGame"]


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

function CountIdentified(){
    return measured(tally(49, array_map(IdentifiableItems, item => once(IsInGame() && IdentifiableItems[item] == 0 && never(IsOnTitle()) && never(StartingGame())))))
}

// ======================================================================= //
// Rich Presence Definitions
// ======================================================================= //

rich_presence_conditional_display(IsOnTitle(), "Preparing to face the dangers of the Dragon's Labyrinth")

rich_presence_conditional_display(IsInDemo(), "Watching the events of past Heroes conquering the Dragon's Labyrinth")

rich_presence_conditional_display(IsOnGameOver(), "Building the courage to face the Dragon's Labyrinth again")

rich_presence_conditional_display(IsInEnding(), "The Hero bested the Dragon's Labyrinth and found the coveted Dragon's Crystal!")

rich_presence_conditional_display(IsInGame(), "The {0} is navigating the Dragon's Labyrinth on Floor {1} | {2} • {3}{4} | PW: {5} • AC: {6} • Gold: {7} • Continues: {8} • Identified: {9}/49",
    rich_presence_lookup("Rank", Player["Level"], RankLookup),
    rich_presence_value("Floor", Game["Floor"]),
    rich_presence_lookup("Sword", Player["Equipped"]["Weapon"], SwordLookup),
    rich_presence_lookup("Armor", Player["Equipped"]["Armor"], ArmorLookup),
    rich_presence_lookup("Ring", Player["Equipped"]["Ring"] + Player["Equipped"]["IsRingEquipped"] * 100, RingLookup),
    rich_presence_value("PW", Player["PW"] + Player["BasePW"]),
    rich_presence_value("AC", Player["AC"] + Player["BaseAC"]),
    rich_presence_value("Gold", Player["Gold"]),
    rich_presence_value("Continues", Player["Continues"]),
    rich_presence_value("Identified", CountIdentified())
)

rich_presence_display("Searching for the Dragon Crystal")

