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

IdentifiableItemsByType = {
    "Scroll": {
        "Blade": byte(0x935),
        "Shield": byte(0x936),
        "Norust": byte(0x937),
        "Bless": byte(0x938),
        "Map": byte(0x939),
        "Shift": byte(0x93a),
        "Mad": byte(0x93b),
        "Magi": byte(0x93c),
        "Gas": byte(0x93d),
        "Ghost": byte(0x93e),
        "Dragon": byte(0x93f),
        "Summon": byte(0x940),
        "Blank": byte(0x941),
        "Potion": byte(0x942),
    },
    "Rod": {
        "Flame": byte(0x945),
        "Flash": byte(0x946),
        "Thunder": byte(0x947),
        "Travel": byte(0x948),
        "Wind": byte(0x949),
        "Berserk": byte(0x94a),
        "Reshape": byte(0x94b),
        "Silent": byte(0x94c),
        "Drain": byte(0x94d),
        "Spirit": byte(0x94e),
        "Wood": byte(0x94f),
        "Wither": byte(0x950),  
    },
    "Potion": {
        "Minheal": byte(0x955),
        "Midheal": byte(0x956),
        "Slow": byte(0x957),
        "Slowfix": byte(0x958),
        "Fog": byte(0x959),
        "Daze": byte(0x95a),
        "Cure": byte(0x95b),
        "Freeze": byte(0x95c),
        "Power": byte(0x95d),
        "Reflex": byte(0x95e),
        "Maxheal": byte(0x95f),
        "Water": byte(0x960),
        "Wither": byte(0x961),
    },
    "Ring": {
        "Heal": byte(0x965),
        "Magic": byte(0x966),
        "Food": byte(0x967),
        "Sight": byte(0x968),
        "Shield": byte(0x969),
        "Ogre": byte(0x96a),
        "Cursed": byte(0x96b),
        "Hunger": byte(0x96c),
        "Toy": byte(0x96d),
        "Shift": byte(0x96e) 
    }
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
    "SlipThroughTime": 0x2c,
    "SwappedHitpoints": 0x2d,
    "SpeedImproved": 0x31,
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

PotionSlots = [
    byte(0x0920),
    byte(0x0921),
    byte(0x0922),
    byte(0x0923),
    byte(0x0924),
    byte(0x0925),
    byte(0x0926),
    byte(0x0927)
]

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsInGame() => Game["Screen"] == ScreenValues["InGame"]

function IsOnGameOver() => Game["Screen"] == ScreenValues["GameOver"]
function IsOnTitle() => Game["Screen"] <= ScreenValues["ToDemo"]
function IsInDemo() => Game["Demo"] == 1
function IsInEnding() => Game["Screen"] >= 0x0d && Game["Screen"] != 0x0f && Game["Screen"] != 0x10
function StartingGame() => Game["Screen"] == ScreenValues["StartGame"]
function NotInEnding() => Game["Screen"] != 0x0d && Game["Screen"] != 0x0e && Game["Screen"] < 0x11

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
    return measured(tally(10, array_map(IdentifiableItems, item => !IsInDemo() && Player["ThrownItem"] == ItemValues[item] && prev(IdentifiableItems[item]) != 0 && IdentifiableItems[item] == 0))) &&
        never(IsOnTitle())
}

function IdentifyUsedItems(){
    return measured(tally(10, array_map(IdentifiableItems, item => !IsInDemo() && Player["UsedItem"] == ItemValues[item] && prev(IdentifiableItems[item]) != 0 && IdentifiableItems[item] == 0))) &&
        never(IsOnTitle())
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
    return !IsInDemo() && NotInEnding() && prev(Game["Floor"]) == floor - 1 && Game["Floor"] == floor
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
        disable_when(Player["UsedItem"] == ItemValues["TravelRod"]) &&
        (
            never(!IsInDemo() && prev(Game["Screen"]) == ScreenValues["NextFloor"] && Game["Screen"] == ScreenValues["InGame"]) ||
            (
                never(IsOnTitle()) &&
                never(IsInDemo()) &&
                never(IsOnGameOver()) &&
                never(Game["Screen"] >= 0x0d && Game["Screen"] <= 0x0e) &&
                never(Game["Screen"] >= 0x11)
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
    disable_when(!IsInDemo() && !IsOnTitle() && Player["UsedItem"] == ItemValues["TravelRod"], IsOnTitle()) &&
    disable_when(!IsInDemo() && !IsOnTitle() && prev(Player["Equipped"]["Weapon"]) == EquipmentValues["Dagger"] && Player["Equipped"]["Weapon"] != EquipmentValues["Dagger"], IsOnTitle()) &&
    disable_when(!IsInDemo() && !IsOnTitle() && prev(Player["Equipped"]["Weapon"]) == EquipmentValues["Robe"] && Player["Equipped"]["Armor"] != EquipmentValues["Robe"], IsOnTitle())
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
    disable_when(!IsInDemo() && !IsOnTitle() && prev(Player["Equipped"]["IsRingEquipped"]) == 0 && Player["Equipped"]["IsRingEquipped"] == 1, IsOnTitle()) &&
    disable_when(!IsInDemo() && !IsOnTitle() && Player["UsedItem"] != 0, IsOnTitle())
}

function AchievedLevel(level){
    return !IsInDemo() &&
        NotInEnding() &&
        prev(Player["Level"]) < level &&
        Player["Level"] >= level
}

function AchievedPW(pw){
    return !IsInDemo() &&
        NotInEnding() &&
        prev(Player["PW"] + Player["BasePW"]) < pw &&
        Player["PW"] + Player["BasePW"] >= pw
}

function AchievedAC(ac){
    return !IsInDemo() &&
        NotInEnding() &&
        prev(Player["AC"] + Player["BaseAC"]) < ac &&
        Player["AC"] + Player["BaseAC"] >= ac
}

function AchievedGold(gold){
    return !IsInDemo() &&
        NotInEnding() &&
        prev(Player["Gold"]) < gold &&
        Player["Gold"] >= gold
}

function EquippedAllGreenSwords(){
    return measured(tally(3, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["ShortSword"] && Player["Equipped"]["Weapon"] == EquipmentValues["ShortSword"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["LongSword"] && Player["Equipped"]["Weapon"] == EquipmentValues["LongSword"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Broadsword"] && Player["Equipped"]["Weapon"] == EquipmentValues["Broadsword"]))) &&
        never(IsOnTitle())
}

function EquippedAllRedSwords(){
    return measured(tally(4, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Gladius"] && Player["Equipped"]["Weapon"] == EquipmentValues["Gladius"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Flameberge"] && Player["Equipped"]["Weapon"] == EquipmentValues["Flameberge"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["RuneBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["RuneBlade"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["LaserBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["LaserBlade"]))) &&
        never(IsOnTitle())
}

function EquippedAllBlueSwords(){
    return measured(tally(4, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["MagiMasher"] && Player["Equipped"]["Weapon"] == EquipmentValues["MagiMasher"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["BushidoBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["BushidoBlade"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["GhostKiller"] && Player["Equipped"]["Weapon"] == EquipmentValues["GhostKiller"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["Dragonslayer"] && Player["Equipped"]["Weapon"] == EquipmentValues["Dragonslayer"]))) &&
        never(IsOnTitle())
}

function EquippedAllPurpleSwords(){
    return measured(tally(3, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["BloodBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["BloodBlade"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["GreatSword"] && Player["Equipped"]["Weapon"] == EquipmentValues["GreatSword"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Weapon"]) != EquipmentValues["DeathBlade"] && Player["Equipped"]["Weapon"] == EquipmentValues["DeathBlade"]))) &&
        never(IsOnTitle())
}

function EquippedAllLightArmor(){
    return measured(tally(2, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["Leathersuit"] && Player["Equipped"]["Armor"] == EquipmentValues["Leathersuit"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["Lamellar"] && Player["Equipped"]["Armor"] == EquipmentValues["Lamellar"]))) &&
        never(IsOnTitle())
}

function EquippedAllMediumArmor(){
    return measured(tally(3, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["Cuirass"] && Player["Equipped"]["Armor"] == EquipmentValues["Cuirass"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["ChainMail"] && Player["Equipped"]["Armor"] == EquipmentValues["ChainMail"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["ScaleArmor"] && Player["Equipped"]["Armor"] == EquipmentValues["ScaleArmor"]))) &&
        never(IsOnTitle())
}

function EquippedAllHeavyArmor(){
    return measured(tally(5, once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["PlateArmor"] && Player["Equipped"]["Armor"] == EquipmentValues["PlateArmor"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["BattleSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["BattleSuit"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["DragonSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["DragonSuit"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["MysticSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["MysticSuit"]),
        once(!IsInDemo() && NotInEnding() && prev(Player["Equipped"]["Armor"]) != EquipmentValues["PowerSuit"] && Player["Equipped"]["Armor"] == EquipmentValues["PowerSuit"]))) &&
        never(IsOnTitle())
}

function KilledMonsters(count){
    return measured(repeated(100, !IsInDemo() && NotInEnding() && prev(Player["Experience"]) < Player["Experience"])) &&
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
                        NotInEnding() &&
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
        Player["Equipped"]["Ring"] == ItemValues["SightRing"] &&
        Player["Equipped"]["IsRingEquipped"] == 1 &&
        prev(Game["Message"]) != Message["Path"] &&
        Game["Message"] == Message["Path"]
}

function EquippedRing(ring){
    return !IsInDemo() &&
        prev(Player["Equipped"]["Ring"]) != ItemValues[ring] &&
        Player["Equipped"]["Ring"] == ItemValues[ring] &&
        Player["Equipped"]["IsRingEquipped"] == 1
}

function IdentifiedAllItems(type){
    items = IdentifiableItemsByType[type]
    return measured(tally(length(items), array_map(items, item => !IsInDemo() && NotInEnding() && prev(items[item]) != 0 && items[item] == 0))) &&
        never(IsOnTitle())
}

function RodKills(){
    return measured
    (
        tally
        (
            10, 
            array_map
            (
                range(0,0xf), 
                index => 
                !IsInDemo() && 
                Player["Equipped"]["Ring"] == ItemValues["MagicRing"] &&
                Player["Equipped"]["IsRingEquipped"] == 1 &&
                prev(Player["UsedItem"]) == 0x30 + index &&
                Player["UsedItem"] != 0x30 + index &&
                prev(Player["Experience"]) < Player["Experience"]
            )
        )
    ) && 
    never(IsOnTitle())
}

function ToyRingKill(){
    items = ["BlankScroll", "WoodRod", "WaterPotion"]
    return any_of
    (
        items, 
        item => 
        !IsInDemo() &&
        Player["Equipped"]["Ring"] == ItemValues["ToyRing"] &&
        Player["Equipped"]["IsRingEquipped"] == 1 &&
        prev(Player["ThrownItem"]) == ItemValues[item] && 
        Player["ThrownItem"] != ItemValues[item] &&
        prev(Player["Experience"]) < Player["Experience"]
    )
}

function UseWindRod(){
    return !IsInDemo() &&
        prev(Game["Message"]) != Message["MonstersBlownAway"] &&
        Game["Message"] == Message["MonstersBlownAway"]
}

function UsedSlowfixPotion(){
    return !IsInDemo() &&
        prev(Game["Message"]) != Message["SpeedImproved"] &&
        Game["Message"] == Message["SpeedImproved"]
}

function UseSilentRod(){
    return measured
    (
        repeated
        (
            3, 
            !IsInDemo() &&
            prev(Game["Message"]) != Message["Deflected"] &&
            Game["Message"] == Message["Deflected"]
        )
    ) &&
    never(IsOnTitle())
}

function UseDrainRod(){
    return !IsInDemo() &&
       Player["UsedItem"] == ItemValues["DrainRod"] && 
       prev(Player["Health"]) < Player["Health"]
}

function InflictStatusEffect(){
    items = ["SlowPotion", "FogPotion", "DazePotion", "FreezePotion"]
    
    itemMessages = {
        "SlowPotion": 0x18,
        "FogPotion": 0x16,
        "DazePotion": 0x16,
        "FreezePotion": 0x17
    }
    
    return any_of
    (
        items,
        item =>
        !IsInDemo() &&
        prev(Player["ThrownItem"]) == ItemValues[item] &&
        Player["ThrownItem"] != ItemValues[item] &&
        prev(Game["Message"]) != itemMessages[item] &&
        Game["Message"] == itemMessages[item]
    )
}

function UseBlessScroll() {
    return tally
    (
        2, 
        once(!IsInDemo() && Player["UsedItem"] == ItemValues["BlessScroll"] && prev(Player["Equipped"]["Weapon"]) != Player["Equipped"]["Weapon"]),
        once(!IsInDemo() && Player["UsedItem"] == ItemValues["BlessScroll"] && prev(Player["Equipped"]["Armor"]) != Player["Equipped"]["Armor"]),
        once(!IsInDemo() && Player["UsedItem"] == ItemValues["BlessScroll"] && prev(Player["Equipped"]["Ring"]) != Player["Equipped"]["Ring"])
    ) && never(prev(Player["UsedItem"]) == ItemValues["BlessScroll"] && Player["UsedItem"] != ItemValues["BlessScroll"])
}

function UseCurePotion() {
    return tally
    (
        2,
        once(!IsInDemo() && Player["UsedItem"] == ItemValues["CurePotion"] && prev(Player["Status"]["Poisoned"]) > 0 && Player["Status"]["Poisoned"] == 0),
        once(!IsInDemo() && Player["UsedItem"] == ItemValues["CurePotion"] && prev(Player["Status"]["Fogged"]) > 0 && Player["Status"]["Fogged"] == 0),
        once(!IsInDemo() && Player["UsedItem"] == ItemValues["CurePotion"] && prev(Player["Status"]["Dizzy"]) > 0 && Player["Status"]["Dizzy"] == 0)
    ) && never(prev(Player["UsedItem"]) == ItemValues["CurePotion"] && Player["UsedItem"] != ItemValues["CurePotion"])
}

function UseHealPotions(){
    potions = ["MinhealPotion", "MidhealPotion", "MaxhealPotion"]
    
    return any_of
    (
        potions,
        potion =>
        !IsInDemo() &&
        Player["UsedItem"] == ItemValues[potion] &&
        prev(Player["Health"]) < Player["Health"]
    )
}

function UsePowerPotions(){
    return measured
    (
        repeated
        (
            3, 
            !IsInDemo() &&
            prev(Player["UsedItem"]) != ItemValues["PowerPotion"] &&
            Player["UsedItem"] == ItemValues["PowerPotion"]
        )
    ) &&
    never(IsOnTitle())
}

function UseReflexPotions(){
    return measured
    (
        repeated
        (
            3, 
            !IsInDemo() &&
            prev(Player["UsedItem"]) != ItemValues["ReflexPotion"] &&
            Player["UsedItem"] == ItemValues["ReflexPotion"]
        )
    ) &&
    never(IsOnTitle())
}

function UseBladeScrollWithLaserBlade(){
    return !IsInDemo() &&
        Player["Equipped"]["Weapon"] == EquipmentValues["LaserBlade"] &&
        prev(Player["UsedItem"]) != ItemValues["BladeScroll"] &&
        Player["UsedItem"] == ItemValues["BladeScroll"]
}

function UseShieldScrollWithPowerSuit(){
    return !IsInDemo() &&
        Player["Equipped"]["Armor"] == EquipmentValues["PowerSuit"] &&
        prev(Player["UsedItem"]) != ItemValues["ShieldScroll"] &&
        Player["UsedItem"] == ItemValues["ShieldScroll"]
}

function UseNorustScrollWithMysticSuit(){
    return !IsInDemo() &&
        Player["Equipped"]["Armor"] == EquipmentValues["MysticSuit"] &&
        prev(Player["UsedItem"]) != ItemValues["NorustScroll"] &&
        Player["UsedItem"] == ItemValues["NorustScroll"]
}

function UseMapScroll(){
    return !IsInDemo() &&
        prev(Player["UsedItem"]) != ItemValues["MapScroll"] &&
        Player["UsedItem"] == ItemValues["MapScroll"]
}

function UseMadScroll(){
    return !IsInDemo() &&
        prev(Player["UsedItem"]) != ItemValues["MadScroll"] &&
        Player["UsedItem"] == ItemValues["MadScroll"]
}

function SummonAMonster(){
    items = ["SummonScroll", "SpiritRod"]
    
    return any_of
    (
        items,
        item =>
        !IsInDemo() &&
        prev(Player["UsedItem"]) != ItemValues[item] &&
        Player["UsedItem"] == ItemValues[item]
    )
}

function UseReshapeRod(){
    return !IsInDemo() &&
        prev(Player["UsedItem"]) == ItemValues["ReshapeRod"] &&
        Player["UsedItem"] != ItemValues["ReshapeRod"] &&
        prev(Game["Message"]) != Message["Mutates"] &&
        Game["Message"] == Message["Mutates"]
}

function UseTravelRod(){
    return !IsInDemo() &&
       prev(Game["Message"]) != Message["SlipThroughTime"] &&
       Game["Message"] == Message["SlipThroughTime"]
}

function UserPotionScroll(){
    return tally
    (
        8,
        array_map
        (
            range(0,7),
            index => 
            !IsInDemo() &&
            Player["UsedItem"] == ItemValues["PotionScroll"] &&
            prev(PotionSlots[index]) != ItemValues["MidhealPotion"] &&
            PotionSlots[index] == ItemValues["MidhealPotion"]
        )
    ) &&
    never(prev(Player["UsedItem"]) == ItemValues["PotionScroll"] && Player["UsedItem"] != ItemValues["PotionScroll"])
}

// ======================================================================= //
// Achievement Definitions - Progression
// ======================================================================= //

achievement("From the Ground Up", "Reach Floor 5", points = 1, type = "progression", id = 464794,
    trigger = ReachFloor(5)
)

achievement("Rise to the Occasion", "Reach Floor 10", points = 1, type = "progression", id = 464795,
    trigger = ReachFloor(10)
)

achievement("Over the Hump", "Reach Floor 15", points = 3, type = "progression", id = 464796,
    trigger = ReachFloor(15)
)

achievement("Climb the Ladder", "Reach Floor 20", points = 3, type = "progression", id = 464797,
    trigger = ReachFloor(20)
)

achievement("Come a Long Way", "Reach Floor 25", points = 5, type = "progression", id = 464798,
    trigger = ReachFloor(25)
)

achievement("To the Top", "Reach Floor 30", points = 5, type = "progression", id = 464799,
    trigger = ReachFloor(30)
)

achievement("The World at Your Feet", "Collect the Dragon Orb on Floor 30 and return to the real world", points = 10, type = "win_condition", id = 464800,
    trigger = ClearGame()
)

// ======================================================================= //
// Achievement Definitions - Play Challenges
// ======================================================================= //

achievement("Under the Wire", "Clear any floor in 100 actions or less", points = 10, id = 464801,
    trigger = ClearFloorWithActionLimit(100)
)

achievement("Hunger Like No Other", "Without removing it or using a continue, clear 5 floors sequentially while equipped with the Hunger Ring [No Travel Rod]", points = 5, id = 464802,
    trigger = ClearFloorsWithHungerRing()
)

achievement("From Square One", "Clear the first 5 floors equipped with the Dagger and Robe", points = 5, id = 464803,
    trigger = ClearFirst5FloorsWithDefaultEquipment()
)

achievement("Meager Start", "Clear the first 10 floors without using a potion, scroll, or equipping a ring", points = 10, id = 464804,
    trigger = ClearFirst10FloorsWithoutItems()
)

achievement("With Flying Colors", "Clear the game without using a continue", points = 25, id = 464805,
    trigger = ClearGameNoContinue()
)

achievement("Tight Fisted", "Clear the game without dropping or thowing any Scrolls, Rods, or Potions", points = 25, id = 464806,
    trigger = ClearGameNoDropping()
)

achievement("Sprout", "Become a Warrior by reaching Level 4", points = 1, id = 464807,
    trigger = AchievedLevel(4)
)

achievement("Seedling", "Become a Knight by reaching Level 8", points = 3, id = 464808,
    trigger = AchievedLevel(8)
)

achievement("Sapling", "Become a Paradin by reaching Level 12", points = 5, id = 464809,
    trigger = AchievedLevel(12)
)

achievement("Mighty Oak", "Become a Masterlord by reaching Level 16", points = 10, id = 464810,
    trigger = AchievedLevel(16)
)

achievement("Dressed for Success", "Reach an AC of 55 or more in a single run", points = 10, id = 464811,
    trigger = AchievedAC(55)
)

achievement("Power Trip", "Reach a PW of 75 or more in a single run", points = 10, id = 464812,
    trigger = AchievedPW(75)
)

achievement("Rags to Riches", "Collect 5000 Gold in a single run", points = 10, id = 464813,
    trigger = AchievedGold(5000)
)

// ======================================================================= //
// Achievement Definitions - Weapon Challenges
// ======================================================================= //

achievement("Green Thumb", "Find and equip the Short Sword, Long Sword, and Broadsword in a single run", points = 5, id = 464814,
    trigger = EquippedAllGreenSwords()
)

achievement("Caught Red Handed", "Find and equip the Gladius, Flamberge, Rune Blade, and Laser Blade in a single run", points = 5, id = 464815,
    trigger = EquippedAllRedSwords()
)

achievement("Out of the Blue", "Find and equip the Magi Masher, Bushido Blade, Ghost Killer, and Dragonslayer in a single run", points = 5, id = 464816,
    trigger = EquippedAllBlueSwords()
)

achievement("Born in the Purple", "Find and equip the Blood Blade, Great Sword, and Death Blade in a single run", points = 5, id = 464817,
    trigger = EquippedAllPurpleSwords()
)

achievement("Killer Instinct", "Kill 100 monsters in a single run", points = 5, id = 464818,
    trigger = KilledMonsters(100)
)

achievement("Witch Hunt", "Kill 10 Witches while having the Magi Masher equipped in a single run", points = 5, id = 464819,
    trigger = KilledMonsterType("Witch", 10)
)

achievement("Brave the Elements", "Kill 10 Mysts while having the Bushido Blade equipped in a single run", points = 5, id = 464820,
    trigger = KilledMonsterType("Myst", 10)
)

achievement("Give up the Ghost", "Kill 10 Phantoms while having the Ghost Killer equipped in a single run", points = 5, id = 464821, 
    trigger = KilledMonsterType("Phantom", 10)
)

achievement("Tipping the Scales", "Kill 5 Dragons using the Dragonslayer in a single run", points = 10, id = 464822,
    trigger = KilledMonsterType("Dragon", 5)
)

achievement("Doesn't Make the Cut", "Attempt to kill an Ooze with a Great Sword", points = 2, id = 464823,
    trigger = GreatSwordOoze()
)

// ======================================================================= //
// Achievement Definitions - Armor Challenges
// ======================================================================= //

achievement("Light Speed", "Find and equip the Leathersuit and Lamellar in a single run", points = 5, id = 464824,
    trigger = EquippedAllLightArmor()
)

achievement("Happy Medium", "Find and equip the Cuirass, Chain Mail, and Scale Armor in a single run", points = 5, id = 464825,
    trigger = EquippedAllMediumArmor()
)

achievement("Heavy Hitter", "Find and equip the Plate Armor, Battle Suit, Dragon Suit, Mystic Suit, and Power Suit in a single run", points = 5, id = 464826,
    trigger = EquippedAllHeavyArmor()
)

// ======================================================================= //
// Achievement Definitions - Ring Challenges
// ======================================================================= //

achievement("Secret Weapon", "Reveal a hidden passage with the Sight Ring equipped", points = 2, id = 464827,
    trigger = FoundSecretPassage()
)

achievement("Satiated", "Find and equip a Food Ring and stave off starvation", points = 2, id = 464828,
    trigger = EquippedRing("FoodRing")
)

achievement("Play it Safe", "Find and equip a Shield Ring to increase your defense", points = 2, id = 464829,
    trigger = EquippedRing("ShieldRing")
)

achievement("Ironclad", "Find and equip an Ogre Ring to increase your attack power", points = 2, id = 464830,
    trigger = EquippedRing("OgreRing")
)

// ======================================================================= //
// Achievement Definitions - Item Challenges
// ======================================================================= //

achievement("Calculated Risk", "Identify any 10 items by throwing them in a single run", points = 5, id = 464831,
    trigger = IdentifyThrownItems()
)

achievement("Roll the Dice", "Identify any 10 items by using them in a single run", points = 5, id = 464832,
    trigger = IdentifyUsedItems()
)

achievement("Just Scroll with It", "Identify all 14 Scrolls in a single run", points = 10, id = 464833,
    trigger = IdentifiedAllItems("Scroll")
)

achievement("Carrot or Stick", "Identify all 12 Rods in a single run", points = 10, id = 464834,
    trigger = IdentifiedAllItems("Rod")
)

achievement("Take a Sip", "Identify all 13 Potions in a single run", points = 10, id = 464835,
    trigger = IdentifiedAllItems("Potion")
)

achievement("Covered in Bling", "Identify all 10 Rings in a single run", points = 10, id = 464836,
    trigger = IdentifiedAllItems("Ring")
)

achievement("Magic Bullet", "Kill 10 enemies by using Rods while equipped with the Magic Ring in a single run", points = 5, id = 464837,
    trigger = RodKills()
)

achievement("False Confidence", "Kill an enemy while wearing a Toy Ring by throwing a Blank Scroll, Wood Rod, or Water Potion at it", points = 5, id = 464838,
    trigger = ToyRingKill()
)

achievement("Death Blow", "Spirit a monster away by using a Wind Rod", points = 2, id = 464839,
    trigger = UseWindRod()
)

achievement("Preventable Illness", "Attempt to prevent 3 enemies from applying status effects with Silent Rods in a single run", points = 5, id = 464840,
    trigger = UseSilentRod()
)

achievement("Circle the Drain", "Come out on top with more HP after using a Drain Rod on an enemy", points = 5, id = 464841,
    trigger = UseDrainRod()
)

achievement("Splash Zone", "Inflict a status effect on an enemy by throwing a Slow, Fog, Daze, or Freeze potion at them", points = 2, id = 464842,
    trigger = InflictStatusEffect()
)

achievement("Fresh Fit", "Uncurse 2 or more pieces of equipment using a single Bless Scroll", points = 5, id = 464843,
    trigger = UseBlessScroll()
)

achievement("Clean Slate", "Cure 2 or more status effects using a single Cure Potion", points = 5, id = 464844,
    trigger = UseCurePotion()
)

achievement("Rapid Recovery", "Cure yourself of sluggishness by using a Slowfix Potion", points = 2, id = 464845,
    trigger = UsedSlowfixPotion()
)

achievement("Top Form", "Restore health by using a Minheal, Midheal, or Maxheal Potion", points = 2, id = 464846,
    trigger = UseHealPotions()
)

achievement("Protein Shake", "Increase your Base PW 3 times using Power Potions in a single playthrough", points = 10, id = 464847,
    trigger = UsePowerPotions()
)

achievement("Energy Drink", "Increase your Base AC 3 times using Reflex Potions in a single playthrough", points = 10, id = 464848,
    trigger = UseReflexPotions()
)

achievement("Strong Arm", "Use a Blade Scroll while equipped with the Laser Blade", points = 5, id = 464849,
    trigger = UseBladeScrollWithLaserBlade()
)

achievement("Strong Suit", "Use a Shield Scroll while equipped with the Power Suit", points = 5, id = 464850,
    trigger = UseShieldScrollWithPowerSuit()
)

achievement("Double Down", "Use a Norust Scroll while equipped with the Mystic Suit", points = 5, id = 464851,
    trigger = UseNorustScrollWithMysticSuit()
)

achievement("Street Smart", "Use a Map Scroll to reveal the current floor", points = 2, id = 464852,
    trigger = UseMapScroll()
)

achievement("Punch Drunk", "Use a Mad Scroll to dizzy all monsters on the current floor", points = 2, id = 464853,
    trigger = UseMadScroll()
)

achievement("Faux Pas", "Use a Summon Scroll or Spirit Rod to summon a monster", points = 2, id = 464854,
    trigger = SummonAMonster()
)

achievement("Play with Fire", "Use Reshape Rods to transform a monsters into a different monster", points = 2, id = 464855,
    trigger = UseReshapeRod()
)

achievement("Go the Extra Mile", "Use a Travel Rod to advance 1 floor", points = 2, id = 464856,
    trigger = UseTravelRod()
)

achievement("Recursive Remedy", "Transform 8 potions into Midheals with a single Potion Scroll", points = 5, id = 464857,
    trigger = UserPotionScroll()
)

