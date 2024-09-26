// Dragon Crystal
// #ID = 11586
// Retro Achievements - Achievement Script
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
    "Experience": byte(0x625) + byte(0x626) * 256,
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
    "DroppedItem": byte(0x933),
    "HungerCounter": byte(0x63c),
    "HealCounter": byte(0x63d)
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
    "ToTitle": 0x02,
    "Title": 0x03,
    "ToDemo": 0x04,
    "StartGame": 0x06,
    "NextFloor": 0x08,
    "InGame": 0x0a,
    "GameOver": 0x0c,
    "ToEnding": 0x0d,
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
    "Dragonslayer": 0x0c,
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
            "Experience": 1,
            "Weapon": 0x0b
        },
        {
            "MinFloor": 17,
            "MaxFloor": 20,
            "Experience": 72,
            "Weapon": 0x0b
        },
        {
            "MinFloor": 25,
            "MaxFloor": 28,
            "Experience": 110,
            "Weapon": 0x0b
        }
    ],
    "Witch": [
        {
            "MinFloor": 9,
            "MaxFloor": 12,
            "Experience": 25,
            "Weapon": 0x09
        },
        {
            "MinFloor": 21,
            "MaxFloor": 24,
            "Experience": 60,
            "Weapon": 0x09
        }
    ],
    "Myst": [
        {
            "MinFloor": 10,
            "MaxFloor": 12,
            "Experience": 48,
            "Weapon": 0x0a
        },
        {
            "MinFloor": 21,
            "MaxFloor": 24,
            "Experience": 150,
            "Weapon": 0x0a
        }
    ],
    "Dragon": [
        {
            "MinFloor": 29,
            "MaxFloor": 30,
            "Experience": 250,
            "Weapon": 0x0c
        }
    ]
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => Game["Screen"] == ScreenValues["InGame"]

function IsOnGameOver() => Game["Screen"] == ScreenValues["GameOver"]
function IsOnTitle() => Game["Screen"] <= ScreenValues["ToDemo"]
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

function GetPlayerPW(){
    return Player["PW"] + Player["BasePW"]
}

function GetPlayerAC(){
    return Player["AC"] + Player["BaseAC"]
}

function PlayerPerformedAction() {
    return prev(Player["HungerCounter"]) != Player["HungerCounter"]
}

// ======================================================================= //
// Achievement Functions
// ======================================================================= //

function ReachFloor(floor){
    return !IsInDemo() && prev(Game["Floor"]) == floor - 1 && Game["Floor"] == floor
}

function ClearGame(){
    return !IsInDemo() &&
        Game["Floor"] == 30 &&
        prev(Game["Screen"]) == ScreenValues["ToEnding"] &&
        Game["Screen"] == ScreenValues["Ending"]
}

function ClearGameNoContinue(){
    return ClearGame() &&
        disable_when(Player["Continues"] > 0, IsOnTitle())
}

function ClearGameNoDropping(){
    return ClearGame() &&
        disable_when(!IsInDemo() && Player["DroppedItem"] >= 0x20 && Player["DroppedItem"] < 0x50, IsOnTitle()) &&
        disable_when(!IsInDemo() && Player["ThrownItem"] >= 0x20 && Player["ThrownItem"] < 0x50, IsOnTitle())
}

function ClearFloorWithActionLimit(limit){
    return prev(Game["Floor"]) > 0 && trigger_when(prev(Game["Floor"]) == Game["Floor"] - 1) &&
        disable_when(repeated(limit, !IsInDemo() && PlayerPerformedAction())) && 
        (
            never(!IsInDemo() && prev(Game["Screen"]) == ScreenValues["NextFloor"] && Game["Screen"] == ScreenValues["InGame"]) ||
            (
                never(IsOnTitle()) &&
                never(IsInDemo()) &&
                never(IsOnGameOver())
            )
        )
}

function ClearFloorsWithHungerRing(){
    return measured
        (
            repeated
            (
                5, 
                !IsInDemo() && 
                Player["Equipped"]["Ring"] == ItemValues["HungerRing"] && 
                Player["Equipped"]["IsRingEquipped"] == 1 && 
                prev(Game["Floor"]) > 0 && 
                prev(Game["Floor"]) == Game["Floor"] - 1
            )
        ) &&
        (
            never(!IsInDemo() && Player["UsedItem"] == ItemValues["TravelRod"]) &&
            never(!IsInDemo() && Player["Equipped"]["Ring"] != ItemValues["HungerRing"]) &&
            never(!IsInDemo() && Player["Equipped"]["IsRingEquipped"] == 0) &&
            never(IsOnGameOver()) &&
            never(IsOnTitle()) &&
            never(IsInDemo())
        )
}

function ClearFirst5FloorsWithDefaultEquipment(){
    return all_of
    (
        range(1,5), 
        floor => once
        (
            !IsInDemo() &&
            Player["Equipped"]["Weapon"] == EquipmentValues["Dagger"] && 
            Player["Equipped"]["Armor"] == EquipmentValues["Robe"] && 
            prev(Game["Floor"] == floor) && Game["Floor"] == floor + 1 && 
            never(IsOnTitle())
        )
    ) &&
    disable_when(!IsInDemo() && Player["UsedItem"] == ItemValues["TravelRod"], IsOnTitle()) &&
    disable_when(!IsInDemo() && Player["Equipped"]["Weapon"] != EquipmentValues["Dagger"], IsOnTitle()) &&
    disable_when(!IsInDemo() && Player["Equipped"]["Armor"] != EquipmentValues["Robe"], IsOnTitle())
}

function ClearFirst10FloorsWithoutItems(){
    return all_of
    (
        range(1,10), 
        floor => once
        (
            !IsInDemo() && 
            prev(Game["Floor"] == floor) && Game["Floor"] == floor + 1 && 
            never(IsOnTitle())
        )
    ) &&
    disable_when(!IsInDemo() && Player["Equipped"]["IsRingEquipped"] == 1, IsOnTitle()) &&
    disable_when(!IsInDemo() && Player["UsedItem"] != 0, IsOnTitle())
}

function AchievedLevel(level){
    return !IsInDemo() &&
        prev(Player["Level"]) < level &&
        Player["Level"] >= level
}

function AchievedPW(pw){
    return !IsInDemo() &&
        prev(Player["PW"]) < pw &&
        Player["PW"] >= pw
}

function AchievedAC(ac){
    return !IsInDemo() &&
        prev(Player["AC"]) < ac &&
        Player["AC"] >= ac
}

function AchievedGold(gold){
    return !IsInDemo() &&
        prev(Player["Gold"]) < gold &&
        Player["Gold"] >= gold
}

function EquippedAllGreenSwords(){
    return measured(tally(3, once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["ShortSword"] && Player["Equipped"]["Weapon"] == EquipmentValues["ShortSword"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["LongSword"] && Player["Equipped"]["Weapon"] == EquipmentValues["LongSword"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Broadsword"] && Player["Equipped"]["Weapon"] == EquipmentValues["Broadsword"]))) &&
        never(IsOnTitle())
}

function EquippedAllRedSwords(){
    return measured(tally(4, once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Gladius"] && Player["Equipped"]["Weapon"] == EquipmentValues["Gladius"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Flameberge"] && Player["Equipped"]["Weapon"] == EquipmentValues["Flameberge"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["RuneBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["RuneBlade"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["LaserBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["LaserBlade"]))) &&
        never(IsOnTitle())
}

function EquippedAllBlueSwords(){
    return measured(tally(4, once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["MagiMasher"] && Player["Equipped"]["Weapon"] == EquipmentValues["MagiMasher"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["BushidoBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["BushidoBlade"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["GhostKiller"] && Player["Equipped"]["Weapon"] == EquipmentValues["GhostKiller"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Dragonslayer"] && Player["Equipped"]["Weapon"] == EquipmentValues["Dragonslayer"]))) &&
        never(IsOnTitle())
}

function EquippedAllPurpleSwords(){
    return measured(tally(3, once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["BloodBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["BloodBlade"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["GreatSword"] && Player["Equipped"]["Weapon"] == EquipmentValues["GreatSword"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["DeathBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["DeathBlade"]))) &&
        never(IsOnTitle())
}

function EquippedAllLightArmor(){
    return measured(tally(2, once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["Leathersuit"] && Player["Equipped"]["Armor"] == EquipmentValues["Leathersuit"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["Lamellar"] && Player["Equipped"]["Armor"] == EquipmentValues["Lamellar"]))) &&
        never(IsOnTitle())
}

function EquippedAllMediumArmor(){
    return measured(tally(3, once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["Cuirass"] && Player["Equipped"]["Armor"] == EquipmentValues["Cuirass"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["ChainMail"] && Player["Equipped"]["Armor"] == EquipmentValues["ChainMail"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["ScaleArmor"] && Player["Equipped"]["Armor"] == EquipmentValues["ScaleArmor"]))) &&
        never(IsOnTitle())
}

function EquippedAllHeavyArmor(){
    return measured(tally(5, once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["PlateArmor"] && Player["Equipped"]["Armor"] == EquipmentValues["PlateArmor"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["BattleSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["BattleSuit"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["DragonSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["DragonSuit"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["MysticSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["MysticSuit"]),
        once(!IsInDemo() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["PowerSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["PowerSuit"]))) &&
        never(IsOnTitle())
}

function KilledMonsters(count){
    return measured(repeated(100, !IsInDemo() && prev(Player["Experience"]) < Player["Experience"])) &&
        never(IsOnTitle())
}

function KilledMonsterType(type, count){
    monsters = Enemies[type]
    return measured
        (
            tally
            (
                count, 
                array_map
                (
                    monsters, 
                    monster => 
                        !IsInDemo() &&
                        Player["Equipped"]["Weapon"] == monster["Weapon"] &&
                        Game["Floor"] >= monster["MinFloor"] && 
                        Game["Floor"] <= monster["MaxFloor"] && 
                        Player["Experience"] == prev(Player["Experience"]) + monster["Experience"]
                )
             )
        ) &&
        never(IsOnTitle())
}

function GreatSwordOoze(){
    return !IsInDemo() &&
        prev(Game["Message"]) != Message["SwordDoesntCut"] &&
        Game["Message"] == Message["SwordDoesntCut"]
}

function FoundSecretPassage(){
    return !IsInDemo() &&
        prev(Game["Message"]) != Message["Path"] &&
        Game["Message"] == Message["Path"]
}

function EquippedRing(ring){
    return !IsInDemo() &&
        prev(Player["Equipped"]["Ring"]) != ItemValues[ring] &&
        Player["Equipped"]["Ring"] == ItemValues[ring] &&
        Player["Equipped"]["IsRingEquipped"] == 1
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //

achievement("[DRAFT] Floor 5", "Reach Floor 5", points = 1, type = "progression", id = 464794,
    trigger = ReachFloor(5)
)

achievement("[DRAFT] Floor 10", "Reach Floor 10", points = 1, type = "progression", id = 464795,
    trigger = ReachFloor(10)
)

achievement("[DRAFT] Floor 15", "Reach Floor 15", points = 3, type = "progression", id = 464796,
    trigger = ReachFloor(15)
)

achievement("[DRAFT] Floor 20", "Reach Floor 20", points = 3, type = "progression", id = 464797,
    trigger = ReachFloor(20)
)

achievement("[DRAFT] Floor 25", "Reach Floor 25", points = 5, type = "progression", id = 464798,
    trigger = ReachFloor(25)
)

achievement("[DRAFT] Floor 30", "Reach Floor 30", points = 5, type = "progression", id = 464799,
    trigger = ReachFloor(30)
)

achievement("[DRAFT] Clear Game", "Collect the Dragon Orb on Floor 30 and return to the real world", points = 10, type = "win_condition", id = 464800,
    trigger = ClearGame()
)

// ======================================================================= //
// Achievement Definitions - Play Challenges
// ======================================================================= //

achievement("[DRAFT] 100 Actions", "Clear any floor in 100 actions or less", points = 10, id = 464801,
    trigger = ClearFloorWithActionLimit(100)
)

achievement("[DRAFT] Hunger Ring", "Without removing it or using a continue, clear 5 floors sequentially while equipped with the Hunger Ring [No Travel Rod]", points = 5, id = 464802,
    trigger = ClearFloorsWithHungerRing()
)

achievement("[DRAFT] Base Equipment", "Clear the first 5 floors equipped with the Dagger and Robe", points = 5, id = 464803,
    trigger = ClearFirst5FloorsWithDefaultEquipment()
)

achievement("[DRAFT] No Items", "Clear the first 10 floors without using a potion, scroll, or equipping a ring", points = 10, id = 464804,
    trigger = ClearFirst10FloorsWithoutItems()
)

achievement("[DRAFT] No Continues", "Clear the game without using a continue", points = 25, id = 464805,
    trigger = ClearGameNoContinue()
)

achievement("[DRAFT] No Dropping", "Clear the game without dropping or thowing any Scrolls, Rods, or Potions", points = 25, id = 464806,
    trigger = ClearGameNoDropping()
)

achievement("[DRAFT] Warrior", "Become a Warrior by reaching Level 4", points = 1, id = 464807,
    trigger = AchievedLevel(4)
)

achievement("[DRAFT] Knight", "Become a Knight by reaching Level 8", points = 3, id = 464808,
    trigger = AchievedLevel(8)
)

achievement("[DRAFT] Paradin", "Become a Paradin by reaching Level 12", points = 5, id = 464809,
    trigger = AchievedLevel(12)
)

achievement("[DRAFT] Masterlord", "Become a Masterlord by reaching Level 16", points = 10, id = 464810,
    trigger = AchievedLevel(16)
)

achievement("[DRAFT] Defense", "Reach an AC of 55 or more in a single run", points = 10, id = 464811,
    trigger = AchievedAC(55)
)

achievement("[DRAFT] Power", "Reach a PW of 75 or more in a single run", points = 10, id = 464812,
    trigger = AchievedPW(75)
)

achievement("[DRAFT] Gold", "Collect 10,000 Gold in a single run", points = 10, id = 464813,
    trigger = AchievedGold(10000)
)

// ======================================================================= //
// Achievement Definitions - Weapon Challenges
// ======================================================================= //

achievement("[DRAFT] Green Swords", "Find and equip the Short Sword, Long Sword, and Broadsword in a single run", points = 5, id = 464814,
    trigger = EquippedAllGreenSwords()
)

achievement("[DRAFT] Red Swords", "Find and equip the Gladius, Flamberge, Rune Blade, and Laser Blade in a single run", points = 5, id = 464815,
    trigger = EquippedAllRedSwords()
)

achievement("[DRAFT] Blue Swords", "Find and equip the Magi Masher, Bushido Blade, Ghost Killer, and Dragonslayer in a single run", points = 5, id = 464816,
    trigger = EquippedAllBlueSwords()
)

achievement("[DRAFT] Purple Swords", "Find and equip the Blood Blade, Great Sword, and Death Blade in a single run", points = 5, id = 464817,
    trigger = EquippedAllPurpleSwords()
)

achievement("[DRAFT] 100 Monsters", "Kill 100 monsters in a single run", points = 5, id = 464818,
    trigger = KilledMonsters(100)
)

achievement("[DRAFT] Witches", "Kill 10 Witches while having the Magi Masher equipped in a single run", points = 5, id = 464819,
    trigger = KilledMonsterType("Witch", 10)
)

achievement("[DRAFT] Mysts", "Kill 10 Mysts while having the Bushido Blade equipped in a single run", points = 5, id = 464820,
    trigger = KilledMonsterType("Myst", 10)
)

achievement("[DRAFT] Phantoms", "Kill 10 Phantoms while having the Ghost Killer equipped in a single run", points = 5, id = 464821, 
    trigger = KilledMonsterType("Phantom", 10)
)

achievement("[DRAFT] Dragons", "Kill 5 Dragons using the Dragonslayer in a single run", points = 10, id = 464822,
    trigger = KilledMonsterType("Dragon", 5)
)

achievement("[DRAFT] Ooze Attack", "Attempt to kill an Ooze with a Great Sword", points = 2, id = 464823,
    trigger = GreatSwordOoze()
)

// ======================================================================= //
// Achievement Definitions - Armor Challenges
// ======================================================================= //

achievement("[DRAFT] Light Armor", "Find and equip the Leathersuit and Lamellar in a single run", points = 5, id = 464824,
    trigger = EquippedAllLightArmor()
)

achievement("[DRAFT] Medium Armor", "Find and equip the Cuirass, Chain Mail, and Scale Armor in a single run", points = 5, id = 464825,
    trigger = EquippedAllMediumArmor()
)

achievement("[DRAFT] Heavy Armor", "Find and equip the Plate Armor, Battle Suit, Dragon Suit, Mystic Suit, and Power Suit in a single run", points = 5, id = 464826,
    trigger = EquippedAllHeavyArmor()
)

// ======================================================================= //
// Achievement Definitions - Ring Challenges
// ======================================================================= //

achievement("[DRAFT] Hidden Passage", "Reveal a hidden passage with the Sight Ring equipped", points = 2, id = 464827,
    trigger = FoundSecretPassage()
)

achievement("[DRAFT] Food", "Find and equip a Food Ring and stave off starvation", points = 2, id = 464828,
    trigger = EquippedRing("FoodRing")
)

achievement("[DRAFT] Shield", "Find and equip a Shield Ring to increase your defense", points = 2, id = 464829,
    trigger = EquippedRing("ShieldRing")
)

achievement("[DRAFT] Ogre", "Find and equip an Ogre Ring to increase your attack power", points = 2, id = 464830,
    trigger = EquippedRing("OgreRing")
)

// ======================================================================= //
// Achievement Definitions - Item Challenges
// ======================================================================= //

achievement("[DRAFT] Throw Items", "Identify any 10 items by throwing them in a single run", points = 5, id = 464831,
    trigger = always_false()
)

achievement("[DRAFT] Use Items", "Identify any 10 items by using them in a single run", points = 5, id = 464832,
    trigger = always_false()
)

achievement("[DRAFT] Scrolls", "Identify all 14 Scrolls in a single run", points = 10, id = 464833,
    trigger = always_false()
)

achievement("[DRAFT] Rods", "Identify all 12 Rods in a single run", points = 10, id = 464834,
    trigger = always_false()
)

achievement("[DRAFT] Potions", "Identify all 13 Potions in a single run", points = 10, id = 464835,
    trigger = always_false()
)

achievement("[DRAFT] Rings", "Identify all 10 Rings in a single run", points = 10, id = 464836,
    trigger = always_false()
)

achievement("[DRAFT] Rod Kills", "Kill 10 enemies with Rods while equipped with the Magic Ring in a single run", points = 5, id = 464837,
    trigger = always_false()
)

achievement("[DRAFT] Toy Ring", "Kill an enemy while wearing a Toy Ring by throwing a Blank Scroll, Wood Rod, or Water Potion at it", points = 5, id = 464838,
    trigger = always_false()
)

achievement("[DRAFT] Wind Rod", "Spirit a monster away by using a Wind Rod", points = 2, id = 464839,
    trigger = always_false()
)

achievement("[DRAFT] Silent Rod", "Prevent 5 enemies from applying status effects with Silent Rods in a single run", points = 5, id = 464840,
    trigger = always_false()
)

achievement("[DRAFT] Drain Rod", "Come out on top with more HP after using a Drain Rod on an enemy", points = 5, id = 464841,
    trigger = always_false()
)

achievement("[DRAFT] Status Effect", "Inflict a status effect on an enemy by throwing a Slow, Fog, Daze or Freeze potion at them", points = 2, id = 464842,
    trigger = always_false()
)

achievement("[DRAFT] Uncurse", "Uncurse 2 or more pieces of equipment using a single Bless Scroll", points = 5, id = 464843,
    trigger = always_false()
)

achievement("[DRAFT] Cure", "Cure 2 or more status effects using a single Cure Potion", points = 5, id = 464844,
    trigger = always_false()
)

achievement("[DRAFT] Sluggish", "Cure yourself of sluggishness by using a Slowfix Potion", points = 2, id = 464845,
    trigger = always_false()
)

achievement("[DRAFT] Heal", "Restore health by using a Minheal, Midheal, or Maxheal Potion", points = 2, id = 464846,
    trigger = always_false()
)

achievement("[DRAFT] Power Potion", "Increase your Base PW 5 times using Power Potions in a single playthrough", points = 10, id = 464847,
    trigger = always_false()
)

achievement("[DRAFT] Reflex Potion", "Increase your Base AC 5 times using Reflex Potions in a single playthrough", points = 10, id = 464848,
    trigger = always_false()
)

achievement("[DRAFT] Laser Blade", "Use a Blade Scroll while equipped with the Laser Blade", points = 5, id = 464849,
    trigger = always_false()
)

achievement("[DRAFT] Power Shield", "Use a Shield Scroll while equipped with the Power Suit", points = 5, id = 464850,
    trigger = always_false()
)

achievement("[DRAFT] Mystic Norust", "Use a Norust Scroll while equipped with the Mystic Armor", points = 5, id = 464851,
    trigger = always_false()
)

achievement("[DRAFT] Map Scroll", "Use a Map Scroll to reveal the current floor", points = 2, id = 464852,
    trigger = always_false()
)

achievement("[DRAFT] Mad Scroll", "Use a Mad Scroll to dizzy all monsters on the current floor", points = 2, id = 464853,
    trigger = always_false()
)

achievement("[DRAFT] Summon Scroll", "Use a Summon Scroll or Spirit Rod to summon a monster", points = 2, id = 464854,
    trigger = always_false()
)

achievement("[DRAFT] Reshape Rod", "Use Reshape Rods to transform a monsters into a different monster", points = 2, id = 464855,
    trigger = always_false()
)

achievement("[DRAFT] Travel Rod", "Use a Travel Rod to advance 1 floor", points = 2, id = 464856,
    trigger = always_false()
)

achievement("[DRAFT] Potion Scroll", "Transform 8 potions into Midheals with a single Potion Scroll", points = 5, id = 464857,
    trigger = always_false()
)

