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
    "Floor": byte(0x1c)
}

EnemyStart = 0x140
EnemySize = 0x20
EnemyIDOffset = 0x3
EnemyHealthOffset = 0x1a
EnemyCount = 20

function GetEnemy(index){
    start = EnemyStart + (index * 32)

    return 
    {
        "ID": byte(start + EnemyIDOffset),
        "Health": byte(start + EnemyHealthOffset)
    }
}

// ======================================================================= //
// Value Dictionaries
// ======================================================================= //

EnemyIDs = {
    "Toad": [0x23,0x2e],
    "Ooze": [0x20,0x22],
    "Scorpion": [0x2f,0x3a],
    "Crystal": [0x3d,0x40],
    "Phantom": [0x42,0x4c],
    "Orb": [0x4e,0x55],
    "Witch": [0x58,0x62],
    "Myst": [0x65,0x67],
    "Demijaw": [0x69,0x6b],
    "Kraken": [0x6c,0x6f],
    "Root": [0x70,0x74],
    "Snail": [0x78,0x80],
    "Dragon": [0x81,0x8c],
    "Sword": [0x95,0xa0],
    "Rod": [0xad,0xb8]
}

// ======================================================================= //
// Helper Functions
// ======================================================================= //

function IsEnemy(index, id){
    enemy = GetEnemy(index)
    return enemy["ID"] >= EnemyIDs[id][0] && enemy["ID"] <= EnemyIDs[id][1]
}

function EnemyDied(index){
    enemy = GetEnemy(index)
    return prev(enemy["Health"]) > 0 && enemy["Health"] == 0
}

function DidEnemyDie(id){
    return any_of(range(0,EnemyCount, index => IsEnemy(index, id) && EnemyDied(index)))
}
