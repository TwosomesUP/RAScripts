// Devil's Crush: Naxat Pinball
// #ID = 2291

Score = (byte(0x205) * 0x64) + (byte(0x20c) * 0x6400) + (byte(0x213) * 0x640000)
Balls = byte(0xd52)
Speed = byte(0x22c)

function IsPlaying() => byte(0x254) == 0x0 && byte(0xd) == 0x3
function IsSlow() => Speed == 1
function IsFast() => Speed == 0

SpeedLookup = {
    0x00: "Fast",
    0x01: "Slow"
}

rich_presence_conditional_display(IsPlaying(), "Score: {0} | Balls: {1} | Mode: {2}",
    rich_presence_value("Score", Score, format="POINTS"),
    rich_presence_value("Balls", Balls),
    rich_presence_lookup("Speed", Speed, SpeedLookup)
)

rich_presence_display("Playing Devil's Crush: Naxat Pinball")