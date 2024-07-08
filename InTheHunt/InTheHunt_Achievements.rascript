// In the Hunt
// #ID = 11869

Stage = byte(0x11084)
StageState = byte(0x11081)
SmallEnemyCount = word(0x11120)
LargeEnemyCount = word(0x11122)
ActivePlayer = byte(0x11266)
ScreenScrollState = byte(0x118cd)
Timer = byte(0x1c8a0)
TreasureBalls = byte(0x1111a)

function GetScore(){
    return low4(0x11220) +
        high4(0x11220) * 10 +
        low4(0x11221) * 100 +
        high4(0x11221) * 1000 +
        low4(0x11222) * 10000 +
        high4(0x11222) * 100000 +
        low4(0x11223) * 1000000 +
        high4(0x11223) * 10000000
}

achievement("Test Treasure Balls", "Test Treasure Balls", points = 0,
    trigger = Stage == 0x04 && 
        ActivePlayer == 0x01 && 
        StageState == 0x0b && 
        prev(ScreenScrollState) != 0xff && 
        ScreenScrollState == 0xff &&
        measured(repeated(15, Stage == 0x04 && StageState == 0x0b && prev(TreasureBalls) != TreasureBalls))
)

achievement("Test Timer", "Test Timer", points = 0,
    trigger = prev(ScreenScrollState) != 0xff && ScreenScrollState == 0xff &&
        measured(SmallEnemyCount + LargeEnemyCount >= 75, Stage == 0x00 && StageState == 0x0b && ActivePlayer == 0x01) &&
        disable_when(repeated(120, Timer < prev(Timer)), StageState != 0x0b || Stage != 0x00 || ActivePlayer != 0x01)
)

achievement(
    title = "Anchors Away!", points = 0,
    description = "While fighting Argok on Stage 1, expose its innards by destroying its anchors",
    trigger = Stage == 0x00 && 
              StageState == 0x0b &&
              ActivePlayer == 0x01 && 
              ScreenScrollState == 0xFF &&
              (GetScore() - prev(GetScore())) == 10000
)

achievement(
    title = "Call to Arms!", points = 0,
    description = "While fighting Manriki on Stage 3, pacify the boss by destroying both laser reattachment arms",
    trigger = repeated(2, (GetScore() - prev(GetScore())) == 10000) && 
              never(Stage != 2) && 
              never(ActivePlayer != 1) &&
              never(ScreenScrollState != 0xff) &&
              never(StageState != 0x0b)
)

//Aiming for 80% destruction in Stage 3
//This accounts for potential false positives:
//  - if multiple small enemies are killed on the same frame
//  - if a small enemy is killed on the same frame as a small building
//  - if the large ship at the beginning is shot and its aux parts are destroyed
//False positives will only count toward the small building count
achievement(
    title = "Destroy it All!", points = 0,
    description = "While playing Stage 3, gain bonus points by causing a significant amount of collateral damage",
    trigger = repeated(50, (GetScore() - prev(GetScore())) == 200) && 
              repeated(12, (GetScore() - prev(GetScore())) == 500) &&  
              repeated(3, (GetScore() - prev(GetScore())) == 3000) &&
              prev(ScreenScrollState) != 0xff && ScreenScrollState == 0xff &&
              never(Stage != 2) && 
              never(ActivePlayer != 1) &&
              never(StageState != 0x0b)
)

