// Devil's Crush: Naxat Pinball
// #ID = 2291

Score = (byte(0x205) * 0x64) + (byte(0x20c) * 0x6400) + (byte(0x213) * 0x640000)
Balls = byte(0xd52)

function IsPlaying() => byte(0x254) == 0x0 && byte(0xd) == 0x3

function DisableIfPasswordUsed(){
    return disable_when(dword(0x1f8) == 0xe2545845)
}

function firstShotMillion(){
    return IsPlaying() && Balls >= 3 && prev(Score) < 1000000 && Score > 1000000 && DisableIfPasswordUsed()
}

// Ticket 70640: After entering the devilsatan password, saving, and then loading the save, this and a few other points
//               based achievement popped.
//               RetroAchievements Hash: 92fbe89d4c87bf283dbfbeac69a64e6e
//               Emulator: RetroArch (Beetle PCE (v.1.29))
//               Emulator Version: 1.17
achievement(
    title = "One Shot, One Million", points = 5,
    description = "Score a million points with your first ball.",
    id = 136509, badge = "151178", published = "12/31/2020 10:18:19 AM", modified = "12/31/2020 10:18:19 AM",
    trigger = firstShotMillion()
)

// Ticket 70639: After entering the devilsatan password, saving, and then loading the save, this and a few other points
//               based achievement popped.
//               RetroAchievements Hash: 92fbe89d4c87bf283dbfbeac69a64e6e
//               Emulator: RetroArch (Beetle PCE (v.1.29))
//               Emulator Version: 1.17
achievement(
    title = "50M", points = 10, type="progression",
    description = "Score 50.000.000 points",
    id = 136512, badge = "151165", published = "12/31/2020 10:18:34 AM", modified = "12/31/2020 10:18:34 AM",
    trigger = byte(0x000254) == 0x00 && unless(once(dword(0x0001F8) == 0xE2545845)) &&
              ((byte(0x00020C) >= 0xA1 && byte(0x000205) >= 0x20 && byte(0x000213) >= 0x07) ||
               (byte(0x000213) >= 0x08))
)

// Ticket 70637: After entering the devilsatan password, saving, and then loading the save, this and a few other points
//               based achievement popped.
//               RetroAchievements Hash: 92fbe89d4c87bf283dbfbeac69a64e6e
//               Emulator: RetroArch (Beetle PCE (v.1.29))
//               Emulator Version: 1.17
achievement(
    title = "100M", points = 10, type="progression",
    description = "Score 100.000.000 points",
    id = 136513, badge = "151169", published = "12/31/2020 10:18:38 AM", modified = "12/31/2020 10:18:38 AM",
    trigger = byte(0x000254) == 0x00 && unless(once(dword(0x0001F8) == 0xE2545845)) &&
              ((byte(0x00020C) >= 0x42 && byte(0x000205) >= 0x40 && byte(0x000213) >= 0x0F) ||
               (byte(0x000213) >= 0x10))
)

// Ticket 70638: After entering the devilsatan password, saving, and then loading the save, this and a few other points
//               based achievement popped.
//               RetroAchievements Hash: 92fbe89d4c87bf283dbfbeac69a64e6e
//               Emulator: RetroArch (Beetle PCE (v.1.29))
//               Emulator Version: 1.17
achievement(
    title = "250M", points = 25, type="progression",
    description = "Score 250.000.000 points",
    id = 136514, badge = "151168", published = "12/31/2020 10:18:42 AM", modified = "12/31/2020 10:18:42 AM",
    trigger = byte(0x000254) == 0x00 && unless(once(dword(0x0001F8) == 0xE2545845)) &&
              ((byte(0x00020C) >= 0x25 && byte(0x000205) >= 0x9F && byte(0x000213) >= 0x26) ||
               (byte(0x000213) >= 0x27))
)

// Ticket 70636: After entering the devilsatan password, saving, and then loading the save, this and a few other points
//               based achievement popped.
//               RetroAchievements Hash: 92fbe89d4c87bf283dbfbeac69a64e6e
//               Emulator: RetroArch (Beetle PCE (v.1.29))
//               Emulator Version: 1.17
achievement(
    title = "500M", points = 25, type="progression",
    description = "Score 500.000.000 points",
    id = 136515, badge = "151167", published = "12/31/2020 10:18:47 AM", modified = "12/31/2020 10:18:47 AM",
    trigger = byte(0x000254) == 0x00 && unless(once(dword(0x0001F8) == 0xE2545845)) &&
              ((byte(0x00020C) >= 0x4B && byte(0x000205) >= 0x40 && byte(0x000213) >= 0x4C) ||
               (byte(0x000213) >= 0x4D))
)
