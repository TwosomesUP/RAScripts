// In the Hunt
// #ID = 11869

Stage = byte(0x11084)
ActivePlayer = byte(0x11266)
ScreenScrollState = byte(0x118cd)

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

achievement(
    title = "Anchors Away!", points = 0,
    description = "While fighting Argok on Stage 1, expose its innards by destroying its anchors",
    trigger = Stage == 0x00 && ActivePlayer == 0x01 && ScreenScrollState == 0xFF &&
              (GetScore() - prev(GetScore())) == 10000
)

achievement(
    title = "Call to Arms!", points = 0,
    description = "While fighting Manriki on Stage 3, pacify the boss by destroying both laser reattachment arms",
    trigger = repeated(2, (GetScore() - prev(GetScore())) == 10000) && 
              never(Stage != 2) && 
              never(ActivePlayer != 1) &&
              never(ScreenScrollState != 0xff)
)
