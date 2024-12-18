// Rad Racer II
// #ID = 1899
// Author: TwosomesUP
// Retro Achievements - Revision Script

// Accessors

Game = {
    "Cheats": low4(0x12),
    "Stage": byte(0xa),
    "Checkpoints": byte(0x4d),
    "State": byte(0xc),
    "Paused": byte(0x1fa)
}

Player = {
    "Speed": byte(0x5f),
    "Boost": byte(0x714)
}

// Value Dictionaries

GameStates = {
    "Racing": 1,
    "Title": 2,
    "Track": 3
}

Stages = {
    "KeyWest": 0,
    "BigApple": 1,
    "Gettysburg": 2,
    "MonumentValley": 3,
    "LasVegas": 4,
    "RockyMountains": 5,
    "California": 6,
    "BayBridge": 7
}

// Helper Functions

function IsInGame() => Game["State"] == GameStates["Racing"]
function IsPlaying() => IsInGame() && Game["Paused"] != 2

// Achievement Functions

function MaintainSpeed(speed, seconds, excluding){
    validAttempt = IsPlaying()
    
    if(excluding != "")
        validAttempt = validAttempt && Game["Stage"] != Stages[excluding]
    
    return repeated(seconds * 60, validAttempt && Player["Speed"] >= speed) && 
        never(prev(Player["Speed"]) >= speed && Player["Speed"] < speed)
}

function TurboBoostUsed(){
    return IsInGame() &&
        prev(Player["Boost"]) == 0xb9 &&
        Player["Boost"] == 0xff
}

function HitCheckpoint(stage, checkpoint){
    return IsInGame() &&
        Game["Stage"] == Stages[stage] &&
        prev(Game["Checkpoints"]) == checkpoint - 1 &&
        Game["Checkpoints"] == checkpoint
}

function RoadTripChallenge(){
    return all_of(Stages, stage => once(HitCheckpoint(stage, 3))) &&
        disable_when(Game["State"] == GameStates["Title"] && Game["Cheats"] > 0) &&
        (never(prev(Game["State"]) != GameStates["Title"] && Game["State"] == GameStates["Title"]) || always_false())
}

achievement(
    title = "Boy Racer", points = 10,
    description = "Maintain a speed above 250mph for over 10 seconds",
    id = 107510, badge = "117693", published = "4/20/2020 12:00:18 AM", modified = "4/20/2020 11:01:08 PM",
    /* trigger = repeated(600, byte(0x00085F) >= 0xFA) && never(byte(0x00085F) < 0xFA) && unless(byte(0x0001FA) == 0x02) */
    trigger = MaintainSpeed(250, 10, "")
)

// Demote
/* achievement(
    title = "Speed Demon", points = 10,
    description = "Maintain a speed above 250mph for over 20 seconds ",
    id = 107511, badge = "117693", published = "4/20/2020 12:00:29 AM", modified = "4/20/2020 11:01:11 PM",
    trigger = repeated(1200, byte(0x00085F) >= 0xFA) && never(byte(0x00085F) < 0xFA) && unless(byte(0x0001FA) == 0x02)
) */

achievement(
    title = "Hard Drivin", points = 50,
    description = "Maintain a speed above 250mph for over 20 seconds [Excluding Key West]",
    id = 107512, badge = "117693", published = "4/20/2020 12:00:41 AM", modified = "4/20/2020 11:01:14 PM",
    /* trigger = repeated(1200, byte(0x00085F) >= 0xFA) && never(byte(0x00085F) < 0xFA) && byte(0x00080A) > 0x00 &&
              unless(byte(0x0001FA) == 0x02) */
    trigger = MaintainSpeed(250, 20, "KeyWest")
)

achievement(
    title = "Power Start", points = 2,
    description = "Use the Rad Racer II turbo boost ignition",
    id = 107513, badge = "117794", published = "4/20/2020 12:00:48 AM", modified = "4/20/2020 11:01:19 PM",
    /* trigger = byte(0x000714) == 0xFF && prev(byte(0x000714)) == 0xB9 */
    trigger = TurboBoostUsed()
)

achievement(
    title = "Key West I", points = 5, type="progression",
    description = "Reach the first checkpoint in Key West",
    id = 107514, badge = "117699", published = "4/20/2020 12:00:56 AM", modified = "4/20/2020 11:01:23 PM",
    /* trigger = byte(0x00080A) == 0x00 && byte(0x00084D) == 0x01 && prior(byte(0x00084D)) == 0x00 */
    trigger = HitCheckpoint("KeyWest", 1)
)

achievement(
    title = "Key West II", points = 5, type="progression",
    description = "Reach the second checkpoint in Key West",
    id = 107515, badge = "117699", published = "4/20/2020 12:01:01 AM", modified = "4/20/2020 11:01:25 PM",
    /* trigger = byte(0x00080A) == 0x00 && byte(0x00084D) == 0x02 && prior(byte(0x00084D)) == 0x01 */
    trigger= HitCheckpoint("KeyWest", 2)
)

achievement(
    title = "Key West Conch", points = 5, type="progression",
    description = "Reach the final checkpoint in Key West",
    id = 107516, badge = "117699", published = "4/20/2020 12:01:07 AM", modified = "4/21/2020 6:54:59 PM",
    /* trigger = byte(0x00080A) == 0x00 && prev(byte(0x00084D)) != 0x03 && byte(0x00084D) == 0x03 */
    trigger = HitCheckpoint("KeyWest", 3)
)

achievement(
    title = "Big Apple I", points = 5, type="progression",
    description = "Reach the first checkpoint in the Big Apple",
    id = 107517, badge = "117701", published = "4/20/2020 12:01:11 AM", modified = "4/21/2020 11:01:52 AM",
    /* trigger = byte(0x00080A) == 0x01 && prior(byte(0x00080A)) == 0x00 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BigApple", 1)
)

achievement(
    title = "Big Apple II", points = 5, type="progression",
    description = "Reach the second checkpoint in the Big Apple",
    id = 107518, badge = "117701", published = "4/20/2020 12:01:14 AM", modified = "4/21/2020 11:01:54 AM",
    /* trigger = byte(0x00080A) == 0x01 && prior(byte(0x00080A)) == 0x00 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BigApple", 2)
)

achievement(
    title = "Gotham Racer", points = 5, type="progression",
    description = "Reach the final checkpoint in the Big Apple",
    id = 107519, badge = "117701", published = "4/20/2020 12:01:16 AM", modified = "4/21/2020 6:53:04 PM",
    /* trigger = byte(0x00080A) == 0x01 && prior(byte(0x00080A)) == 0x00 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("BigApple", 3)
)

achievement(
    title = "Gettysburg I", points = 5, type="progression",
    description = "Reach the first checkpoint in Gettysburg",
    id = 107520, badge = "117703", published = "4/20/2020 12:01:21 AM", modified = "4/21/2020 11:01:56 AM",
    /* trigger = byte(0x00080A) == 0x02 && prior(byte(0x00080A)) == 0x01 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("Gettysburg", 1)
)

achievement(
    title = "Gettysburg II", points = 5, type="progression",
    description = "Reach the second checkpoint in Gettysburg",
    id = 107521, badge = "117703", published = "4/20/2020 12:01:25 AM", modified = "12/15/2024 7:24:34 PM",
    /* trigger = byte(0x00000C) == 0x01 && byte(0x00000A) == 0x02 && prev(byte(0x00004D)) == 0x01 && byte(0x00004D) == 0x02 &&
              disable_when(byte(0x00000C) == 0x02 && low4(0x000012) > 0x00,
                  until=prev(byte(0x00000C)) != 0x02 && byte(0x00000C) == 0x02
              ) */
    trigger = HitCheckpoint("Gettysburg", 2)
)

achievement(
    title = "Confederate Pride", points = 5, type="progression",
    description = "Reach the final checkpoint in Gettysburg",
    id = 107522, badge = "117703", published = "4/20/2020 12:01:28 AM", modified = "4/21/2020 6:52:10 PM",
    /* trigger = byte(0x00080A) == 0x02 && prior(byte(0x00080A)) == 0x01 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("Gettysburg", 3)
)

achievement(
    title = "Monument Valley I", points = 5, type="progression",
    description = "Reach the first checkpoint in Monument Valley",
    id = 107523, badge = "117704", published = "4/20/2020 12:01:31 AM", modified = "4/21/2020 11:02:01 AM",
    /* trigger = byte(0x00080A) == 0x03 && prior(byte(0x00080A)) == 0x02 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("MonumentValley", 1)
)

achievement(
    title = "Monument Valley II", points = 5, type="progression",
    description = "Reach the second checkpoint in Monument Valley",
    id = 107524, badge = "117704", published = "4/20/2020 12:01:34 AM", modified = "4/21/2020 11:02:03 AM",
    /* trigger = byte(0x00080A) == 0x03 && prior(byte(0x00080A)) == 0x02 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("MonumentValley", 2)
)

achievement(
    title = "Hard Ridin' Cowboy", points = 5, type="progression",
    description = "Reach the final checkpoint in Monument Valley",
    id = 107525, badge = "117704", published = "4/20/2020 12:01:37 AM", modified = "4/21/2020 6:53:31 PM",
    /* trigger = byte(0x00080A) == 0x03 && prior(byte(0x00080A)) == 0x02 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("MonumentValley", 3)
)

achievement(
    title = "Las Vegas I", points = 10, type="progression",
    description = "Reach the first checkpoint in Las Vegas Blvd",
    id = 107526, badge = "117706", published = "4/20/2020 12:01:40 AM", modified = "4/21/2020 11:02:05 AM",
    /* trigger = byte(0x00080A) == 0x04 && prior(byte(0x00080A)) == 0x03 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("LasVegas", 1)
)

achievement(
    title = "Las Vegas II", points = 10, type="progression",
    description = "Reach the second checkpoint in Las Vegas Blvd.",
    id = 107527, badge = "117706", published = "4/20/2020 12:01:43 AM", modified = "4/21/2020 11:02:07 AM",
    /* trigger = byte(0x00080A) == 0x04 && prior(byte(0x00080A)) == 0x03 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("LasVegas", 2)
)

achievement(
    title = "Welcome to Las Vegas", points = 10, type="progression",
    description = "Reach the final checkpoint in Las Vegas Blvd.",
    id = 107528, badge = "117706", published = "4/20/2020 12:01:46 AM", modified = "4/21/2020 6:55:14 PM",
    /* trigger = byte(0x00080A) == 0x04 && prior(byte(0x00080A)) == 0x03 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("LasVegas", 3)
)

achievement(
    title = "Rocky Mountains I", points = 10, type="progression",
    description = "Reach the first checkpoint in the Rocky Mountains",
    id = 107529, badge = "117707", published = "4/20/2020 12:01:50 AM", modified = "4/21/2020 11:02:10 AM",
    /* trigger = byte(0x00080A) == 0x05 && prior(byte(0x00080A)) == 0x04 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("RockyMountains", 1)
)

achievement(
    title = "Rocky Mountains II", points = 25, type="progression",
    description = "Reach the second checkpoint in the Rocky Mountains",
    id = 107530, badge = "117707", published = "4/20/2020 12:01:54 AM", modified = "4/21/2020 11:02:12 AM",
    /* trigger = byte(0x00080A) == 0x05 && prior(byte(0x00080A)) == 0x04 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("RockyMountains", 2)
)

achievement(
    title = "That John Denver's full of...", points = 25, type="progression",
    description = "Reach the final checkpoint in the Rocky Mountains",
    id = 107531, badge = "117707", published = "4/20/2020 12:01:58 AM", modified = "4/21/2020 6:56:02 PM",
    /* trigger = byte(0x00080A) == 0x05 && prior(byte(0x00080A)) == 0x04 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("RockyMountains", 3)
)

achievement(
    title = "Twilight California I", points = 25, type="progression",
    description = "Reach the first checkpoint in Twilight California",
    id = 107532, badge = "117709", published = "4/20/2020 12:02:01 AM", modified = "4/21/2020 11:02:14 AM",
    /* trigger = byte(0x00080A) == 0x06 && prior(byte(0x00080A)) == 0x05 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("California", 1)
)

achievement(
    title = "Twilight California II", points = 25, type="progression",
    description = "Reach the second checkpoint in Twilight California",
    id = 107533, badge = "117709", published = "4/20/2020 12:02:07 AM", modified = "4/21/2020 11:02:16 AM",
    /* trigger = byte(0x00080A) == 0x06 && prior(byte(0x00080A)) == 0x05 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("California", 2)
)

achievement(
    title = "Purple Haze", points = 25, type="progression",
    description = "Reach the final checkpoint in Twilight California",
    id = 107534, badge = "117709", published = "4/20/2020 12:02:13 AM", modified = "4/21/2020 6:56:00 PM",
    /* trigger = byte(0x00080A) == 0x06 && prior(byte(0x00080A)) == 0x05 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("California", 3)
)

achievement(
    title = "Bay Bridge I", points = 25, type="progression",
    description = "Reach the first checkpoint on Bay Bridge",
    id = 107535, badge = "117711", published = "4/20/2020 12:02:20 AM", modified = "4/21/2020 11:02:19 AM",
    /* trigger = byte(0x00080A) == 0x07 && prior(byte(0x00080A)) == 0x06 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BayBridge", 1)
)

achievement(
    title = "Bay Bridge II", points = 25, type="progression",
    description = "Reach the second checkpoint on Bay Bridge",
    id = 107536, badge = "117711", published = "4/20/2020 12:02:24 AM", modified = "4/21/2020 11:02:21 AM",
    /* trigger = byte(0x00080A) == 0x07 && prior(byte(0x00080A)) == 0x06 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BayBridge", 2)
)

achievement(
    title = "The City by the Bay", points = 50,
    description = "Complete the game and by reaching the final checkpoint on Bay Bridge",
    id = 107537, badge = "117711", published = "4/20/2020 12:02:27 AM", modified = "4/21/2020 6:55:58 PM",
    /* trigger = byte(0x00080A) == 0x07 && prior(byte(0x00080A)) == 0x06 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("BayBridge", 3)
)

achievement("Rad Road Trip", "Without using Stage Select, complete all 8 courses", points = 50, 
    trigger = RoadTripChallenge()
)

/* Unofficial Achievements
achievement(
    title = "IGNORE", points = 0,
    description = "IGNORE",
    id = 60220, badge = "63162", published = "5/16/2018 9:49:19 PM", modified = "4/20/2020 12:10:10 AM",
    trigger = 0x00
)

achievement(
    title = "IGNORE", points = 0,
    description = "Maintain a speed above 250mph for over 10 seconds [Excluding Key West]",
    id = 60221, badge = "63163", published = "5/16/2018 9:49:27 PM", modified = "4/20/2020 8:34:52 PM",
    trigger = 0x00
)

achievement(
    title = "IGNORE", points = 0,
    description = "IGNORE",
    id = 60222, badge = "63164", published = "5/16/2018 9:49:31 PM", modified = "4/20/2020 8:35:18 PM",
    trigger = 0x00
)

achievement(
    title = "Midnight Racer", points = 3,
    description = "Learn about the special stage select feature, and race at midnight in Key West",
    id = 107509, badge = "117697", published = "4/20/2020 12:00:06 AM", modified = "8/18/2021 1:54:08 PM",
    trigger = byte(0x00000C) == 0x03 && byte(0x000012) >= 0x08
)
Unofficial Achievements */