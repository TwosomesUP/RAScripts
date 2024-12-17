// Moto Roader
// #ID = 2308

Heat = byte(0xaca)
Course = byte(0xb54)
CheatsEnabled = byte(0x140c)
GlobalPosition = byte(0xb3f)
ResultFlag = byte(0xb3e)

Courses = {
    "Normal": 0x8,
    "World1": 0xa,
    "World2": 0xc,
    "Technical": 0xe,
    "Corridor": 0x10,
    "Strange": 0x12,
    "Trap": 0x14
}

function WonOverall(in_course){
    return CheatsEnabled == 0 &&
        Course == Courses[in_course] &&
        Heat == 8 &&
        GlobalPosition == 0 &&
        prev(ResultFlag) == 0 &&
        ResultFlag == 1
}

// Backup Logic: d0xH000aca=7_0xH000aca=8_0xH000b54=8_0xH00140c=0_0xH000b3f=0
achievement(
    title = "Normal Winner", points = 10, type="win_condition",
    description = "Win the Normal competition",
    id = 105984, badge = "115461", published = "4/3/2020 12:29:21 PM", modified = "4/3/2020 12:29:21 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x08 && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("Normal")
)

achievement(
    title = "World 1 Winner", points = 10,
    description = "Win the World 1 competition",
    id = 105993, badge = "115471", published = "4/3/2020 12:30:05 PM", modified = "4/3/2020 12:30:05 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x0A && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("World1")
)

// Backup Logic: d0xH000aca=7_0xH000aca=8_0xH000b54=12_0xH00140c=0_0xH000b3f=0
achievement(
    title = "World 2 Winner", points = 10,
    description = "Win the World 2 competition",
    id = 106002, badge = "115480", published = "4/3/2020 12:30:53 PM", modified = "4/3/2020 12:30:53 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x0C && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("World2")
)

// Backup Logic: d0xH000aca=7_0xH000aca=8_0xH000b54=14_0xH00140c=0_0xH000b3f=0
achievement(
    title = "Technical Winner", points = 10,
    description = "Win the Technical competition",
    id = 106011, badge = "115515", published = "4/3/2020 12:31:55 PM", modified = "4/3/2020 12:31:55 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x0E && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("Technical")
)

// Backup Logic: d0xH000aca=7_0xH000aca=8_0xH000b54=16_0xH00140c=0_0xH000b3f=0
achievement(
    title = "Corridor Winner", points = 10,
    description = "Win the Corridor competition",
    id = 106020, badge = "115506", published = "4/3/2020 12:32:54 PM", modified = "4/3/2020 12:32:54 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x10 && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("Corridor")
)

// Backup Logic: d0xH000aca=7_0xH000aca=8_0xH000b54=18_0xH00140c=0_0xH000b3f=0
achievement(
    title = "Strange Winner", points = 10,
    description = "Win the Strange competition",
    id = 106029, badge = "115490", published = "4/3/2020 12:33:44 PM", modified = "4/4/2020 2:18:48 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x12 && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("Strange")
)

// Backup Logic: d0xH000aca=7_0xH000aca=8_0xH000b54=20_0xH00140c=0_0xH000b3f=0
achievement(
    title = "It's a Trap!", points = 10,
    description = "Win the Trap competition",
    id = 106038, badge = "115516", published = "4/3/2020 12:34:24 PM", modified = "4/3/2020 12:34:24 PM",
    /*trigger = prev(byte(0x000ACA)) == 0x07 && byte(0x000ACA) == 0x08 && byte(0x000B54) == 0x14 && byte(0x00140C) == 0x00 &&
              byte(0x000B3F) == 0x00*/
    trigger = WonOverall("Trap")
)
