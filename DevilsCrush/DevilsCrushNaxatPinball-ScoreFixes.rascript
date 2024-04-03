// Devil's Crush: Naxat Pinball
// #ID = 2291

Score = (byte(0x205) * 0x64) + (byte(0x20c) * 0x6400) + (byte(0x213) * 0x640000)
Balls = byte(0xd52)
Speed = byte(0x22c)

function IsPlaying() => byte(0x254) == 0x0 && byte(0xd) == 0x3
function IsSlow() => Speed == 1
function IsFast() => Speed == 0

function DisableIfPasswordUsed(){
    return disable_when(dword(0x1f8) == 0xe2545845)
}

function FirstShotMillion(){
    return Balls >= 3 && PointChallenge(1000000)
}

function SlowMillion(){
    return IsSlow() && PointChallenge(1000000)
}

function FastMillion(){
    return IsFast() && PointChallenge(1000000)
}

function PointChallenge(points){
    return IsPlaying() && prev(Score) < points && Score >= points && DisableIfPasswordUsed()
}

achievement(
    title = "One Shot, One Million", points = 5,
    description = "Score a million points with your first ball.",
    id = 136509, badge = "151178", published = "12/31/2020 10:18:19 AM", modified = "12/31/2020 10:18:19 AM",
    trigger = FirstShotMillion()
)

achievement(
    title = "A Slow Millionaire", points = 5,
    description = "Score your first million in the slow mode.",
    id = 136508, badge = "151181", published = "12/31/2020 10:18:15 AM", modified = "1/26/2021 3:34:40 PM",
    trigger = SlowMillion()
)

achievement(
    title = "A Fast Millionaire", points = 5,
    description = "Score your first million in the fast mode.",
    id = 136507, badge = "151182", published = "12/31/2020 10:18:09 AM", modified = "12/31/2020 10:18:09 AM",
    trigger = FastMillion()
)

achievement(
    title = "5M", points = 10, type="progression",
    description = "Score 5.000.000 points",
    id = 136510, badge = "151166", published = "12/31/2020 10:18:25 AM", modified = "12/31/2020 10:18:25 AM",
    trigger = PointChallenge(5000000)
)

achievement(
    title = "10M", points = 10, type="progression",
    description = "Score 10.000.000 points",
    id = 136511, badge = "151176", published = "12/31/2020 10:18:30 AM", modified = "12/31/2020 10:18:30 AM",
    trigger = PointChallenge(10000000)
)

achievement(
    title = "50M", points = 10, type="progression",
    description = "Score 50.000.000 points",
    id = 136512, badge = "151165", published = "12/31/2020 10:18:34 AM", modified = "12/31/2020 10:18:34 AM",
    trigger = PointChallenge(50000000)
)

achievement(
    title = "100M", points = 10, type="progression",
    description = "Score 100.000.000 points",
    id = 136513, badge = "151169", published = "12/31/2020 10:18:38 AM", modified = "12/31/2020 10:18:38 AM",
    trigger = PointChallenge(100000000)
)

achievement(
    title = "250M", points = 25, type="progression",
    description = "Score 250.000.000 points",
    id = 136514, badge = "151168", published = "12/31/2020 10:18:42 AM", modified = "12/31/2020 10:18:42 AM",
    trigger = PointChallenge(250000000)
)

achievement(
    title = "500M", points = 25, type="progression",
    description = "Score 500.000.000 points",
    id = 136515, badge = "151167", published = "12/31/2020 10:18:47 AM", modified = "12/31/2020 10:18:47 AM",
    trigger = PointChallenge(500000000)
)

achievement(
    title = "It's All Over", points = 50, type="win_condition",
    description = "You did it, you score 999.999.900 points!",
    id = 136516, badge = "151171", published = "12/31/2020 10:18:55 AM", modified = "12/31/2020 10:18:55 AM",
    trigger = PointChallenge(999999900)
)
