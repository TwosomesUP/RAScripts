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
        (never(prev(Game["State"]) == GameStates["Title"] && Game["State"] != GameStates["Title"] && Game["Stage"] == 0) || always_false())
}

// Backup Logic: 0xH085f>=250.600._R:0xH085f<250_P:0xH01fa=2
achievement(
    title = "Boy Racer", points = 10,
    description = "Maintain a speed of 250mph or faster for 10 seconds or more",
    id = 107510, badge = "117693",
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

// Reduce to 25 points
// Backup Logic: 0xH085f>=250.1200._R:0xH085f<250_0xH080a>0_P:0xH01fa=2
achievement(
    title = "Hard Drivin", points = 25,
    description = "Maintain a speed of 250mph or faster for 20 seconds or more [Excluding Key West]",
    id = 107512, badge = "117693",
    /* trigger = repeated(1200, byte(0x00085F) >= 0xFA) && never(byte(0x00085F) < 0xFA) && byte(0x00080A) > 0x00 &&
              unless(byte(0x0001FA) == 0x02) */
    trigger = MaintainSpeed(250, 20, "KeyWest")
)

// Reduce to 1 point
// Backup Logic: 0xH0714=255_d0xH0714=185
achievement(
    title = "Power Start", points = 1,
    description = "Use the Rad Racer II turbo boost ignition",
    id = 107513, badge = "117794",
    /* trigger = byte(0x000714) == 0xFF && prev(byte(0x000714)) == 0xB9 */
    trigger = TurboBoostUsed()
)

// Reduce to 3 points
// Backup Logic: 0xH080a=0_0xH084d=1_p0xH084d=0
achievement(
    title = "Key West I", points = 3, type="progression",
    description = "Reach the first checkpoint in Key West",
    id = 107514, badge = "117699",
    /* trigger = byte(0x00080A) == 0x00 && byte(0x00084D) == 0x01 && prior(byte(0x00084D)) == 0x00 */
    trigger = HitCheckpoint("KeyWest", 1)
)

// Reduce to 3 points
// Backup Logic: 0xH080a=0_0xH084d=2_p0xH084d=1
achievement(
    title = "Key West II", points = 3, type="progression",
    description = "Reach the second checkpoint in Key West",
    id = 107515, badge = "117699",
    /* trigger = byte(0x00080A) == 0x00 && byte(0x00084D) == 0x02 && prior(byte(0x00084D)) == 0x01 */
    trigger= HitCheckpoint("KeyWest", 2)
)

// Backup Logic: 0xH080a=0_d0xH084d!=3_0xH084d=3
achievement(
    title = "Key West Conch", points = 5, type="progression",
    description = "Reach the final checkpoint in Key West",
    id = 107516, badge = "117699",
    /* trigger = byte(0x00080A) == 0x00 && prev(byte(0x00084D)) != 0x03 && byte(0x00084D) == 0x03 */
    trigger = HitCheckpoint("KeyWest", 3)
)

// Reduce to 3 points
// Backup Logic: 0xH080a=1_p0xH080a=0_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Big Apple I", points = 3, type="progression",
    description = "Reach the first checkpoint in the Big Apple",
    id = 107517, badge = "117701",
    /* trigger = byte(0x00080A) == 0x01 && prior(byte(0x00080A)) == 0x00 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BigApple", 1)
)

// Reduce to 3 points
// Backup Logic: 0xH080a=1_p0xH080a=0_0xH084d=2_p0xH084d=1_0xH0812=0
achievement(
    title = "Big Apple II", points = 3, type="progression",
    description = "Reach the second checkpoint in the Big Apple",
    id = 107518, badge = "117701",
    /* trigger = byte(0x00080A) == 0x01 && prior(byte(0x00080A)) == 0x00 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BigApple", 2)
)

// Backup Logic: 0xH080a=1_p0xH080a=0_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "Gotham Racer", points = 5, type="progression",
    description = "Reach the final checkpoint in the Big Apple",
    id = 107519, badge = "117701",
    /* trigger = byte(0x00080A) == 0x01 && prior(byte(0x00080A)) == 0x00 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("BigApple", 3)
)

// Reduce to 3 points
// Backup Logic: 0xH080a=2_p0xH080a=1_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Gettysburg I", points = 3, type="progression",
    description = "Reach the first checkpoint in Gettysburg",
    id = 107520, badge = "117703",
    /* trigger = byte(0x00080A) == 0x02 && prior(byte(0x00080A)) == 0x01 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("Gettysburg", 1)
)

// Reduce to 3 points
// Backup Logic: 0xH0c=1_0xH0a=2_d0xH4d=1_0xH4d=2_N:d0xH0c!=2_Z:0xH0c=2_N:0xH0c=2_P:0xL12>0.1.
achievement(
    title = "Gettysburg II", points = 3, type="progression",
    description = "Reach the second checkpoint in Gettysburg",
    id = 107521, badge = "117703",
    /* trigger = byte(0x00000C) == 0x01 && byte(0x00000A) == 0x02 && prev(byte(0x00004D)) == 0x01 && byte(0x00004D) == 0x02 &&
              disable_when(byte(0x00000C) == 0x02 && low4(0x000012) > 0x00,
                  until=prev(byte(0x00000C)) != 0x02 && byte(0x00000C) == 0x02
              ) */
    trigger = HitCheckpoint("Gettysburg", 2)
)

// Backup Logic: 0xH080a=2_p0xH080a=1_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "Confederate Pride", points = 5, type="progression",
    description = "Reach the final checkpoint in Gettysburg",
    id = 107522, badge = "117703",
    /* trigger = byte(0x00080A) == 0x02 && prior(byte(0x00080A)) == 0x01 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("Gettysburg", 3)
)

// Reduce to 3 points
// Backup Logic: 0xH080a=3_p0xH080a=2_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Monument Valley I", points = 3, type="progression",
    description = "Reach the first checkpoint in Monument Valley",
    id = 107523, badge = "117704",
    /* trigger = byte(0x00080A) == 0x03 && prior(byte(0x00080A)) == 0x02 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("MonumentValley", 1)
)

// Reduce to 3 points
// Backup Logic: 0xH080a=3_p0xH080a=2_0xH084d=2_p0xH084d=1_0xH0812=0
achievement(
    title = "Monument Valley II", points = 3, type="progression",
    description = "Reach the second checkpoint in Monument Valley",
    id = 107524, badge = "117704",
    /* trigger = byte(0x00080A) == 0x03 && prior(byte(0x00080A)) == 0x02 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("MonumentValley", 2)
)

// Backup Logic: 0xH080a=3_p0xH080a=2_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "Hard Ridin' Cowboy", points = 5, type="progression",
    description = "Reach the final checkpoint in Monument Valley",
    id = 107525, badge = "117704",
    /* trigger = byte(0x00080A) == 0x03 && prior(byte(0x00080A)) == 0x02 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("MonumentValley", 3)
)

// Reduce to 5 points
// Backup Logic: 0xH080a=4_p0xH080a=3_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Las Vegas I", points = 5, type="progression",
    description = "Reach the first checkpoint in Las Vegas Blvd",
    id = 107526, badge = "117706",
    /* trigger = byte(0x00080A) == 0x04 && prior(byte(0x00080A)) == 0x03 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("LasVegas", 1)
)

// Reduce to 5 points
// Backup Logic: 0xH080a=4_p0xH080a=3_0xH084d=2_p0xH084d=1_0xH0812=0
achievement(
    title = "Las Vegas II", points = 5, type="progression",
    description = "Reach the second checkpoint in Las Vegas Blvd.",
    id = 107527, badge = "117706",
    /* trigger = byte(0x00080A) == 0x04 && prior(byte(0x00080A)) == 0x03 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("LasVegas", 2)
)

// Backup Logic: 0xH080a=4_p0xH080a=3_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "Welcome to Las Vegas", points = 10, type="progression",
    description = "Reach the final checkpoint in Las Vegas Blvd.",
    id = 107528, badge = "117706",
    /* trigger = byte(0x00080A) == 0x04 && prior(byte(0x00080A)) == 0x03 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("LasVegas", 3)
)

// Reduce to 5 points
// Backup Logic: 0xH080a=5_p0xH080a=4_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Rocky Mountains I", points = 5, type="progression",
    description = "Reach the first checkpoint in the Rocky Mountains",
    id = 107529, badge = "117707",
    /* trigger = byte(0x00080A) == 0x05 && prior(byte(0x00080A)) == 0x04 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("RockyMountains", 1)
)

// Reduce to 5 points
// Backup Logic: 0xH080a=5_p0xH080a=4_0xH084d=2_p0xH084d=1_0xH0812=0
achievement(
    title = "Rocky Mountains II", points = 5, type="progression",
    description = "Reach the second checkpoint in the Rocky Mountains",
    id = 107530, badge = "117707",
    /* trigger = byte(0x00080A) == 0x05 && prior(byte(0x00080A)) == 0x04 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("RockyMountains", 2)
)

// Reduced to 10 points
// Backup Logic: 0xH080a=5_p0xH080a=4_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "That John Denver's full of...", points = 10, type="progression",
    description = "Reach the final checkpoint in the Rocky Mountains",
    id = 107531, badge = "117707",
    /* trigger = byte(0x00080A) == 0x05 && prior(byte(0x00080A)) == 0x04 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("RockyMountains", 3)
)

// Reduce to 10 points
// Backup Logic: 0xH080a=6_p0xH080a=5_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Twilight California I", points = 10, type="progression",
    description = "Reach the first checkpoint in Twilight California",
    id = 107532, badge = "117709",
    /* trigger = byte(0x00080A) == 0x06 && prior(byte(0x00080A)) == 0x05 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("California", 1)
)

// Reduce to 10 points
// Backup Logic: 0xH080a=6_p0xH080a=5_0xH084d=2_p0xH084d=1_0xH0812=0
achievement(
    title = "Twilight California II", points = 10, type="progression",
    description = "Reach the second checkpoint in Twilight California",
    id = 107533, badge = "117709",
    /* trigger = byte(0x00080A) == 0x06 && prior(byte(0x00080A)) == 0x05 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("California", 2)
)

// Backup Logic: 0xH080a=6_p0xH080a=5_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "Purple Haze", points = 25, type="progression",
    description = "Reach the final checkpoint in Twilight California",
    id = 107534, badge = "117709",
    /* trigger = byte(0x00080A) == 0x06 && prior(byte(0x00080A)) == 0x05 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("California", 3)
)

// Reduce to 10 points
// Backup Logic: 0xH080a=7_p0xH080a=6_0xH084d=1_p0xH084d=0_0xH0812=0
achievement(
    title = "Bay Bridge I", points = 10, type="progression",
    description = "Reach the first checkpoint on Bay Bridge",
    id = 107535, badge = "117711",
    /* trigger = byte(0x00080A) == 0x07 && prior(byte(0x00080A)) == 0x06 && byte(0x00084D) == 0x01 &&
              prior(byte(0x00084D)) == 0x00 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BayBridge", 1)
)

// Reduce to 10 points
// Backup Logic: 0xH080a=7_p0xH080a=6_0xH084d=2_p0xH084d=1_0xH0812=0
achievement(
    title = "Bay Bridge II", points = 10, type="progression",
    description = "Reach the second checkpoint on Bay Bridge",
    id = 107536, badge = "117711",
    /* trigger = byte(0x00080A) == 0x07 && prior(byte(0x00080A)) == 0x06 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
    trigger = HitCheckpoint("BayBridge", 2)
)

// Reduce to 25 points
// Backup Logic: 0xH080a=7_p0xH080a=6_d0xH084d!=3_0xH084d=3_0xH0812=0_0xH000d<=1
achievement(
    title = "The City by the Bay", points = 25, type = "win_condition",
    description = "Complete the game and by reaching the final checkpoint on Bay Bridge",
    id = 107537, badge = "117711",
    /* trigger = byte(0x00080A) == 0x07 && prior(byte(0x00080A)) == 0x06 && prev(byte(0x00084D)) != 0x03 &&
              byte(0x00084D) == 0x03 && byte(0x000812) == 0x00 && byte(0x00000D) <= 0x01 */
    trigger = HitCheckpoint("BayBridge", 3)
)

achievement("Rad Road Trip", "Without using Stage Select, complete all 8 courses", points = 50, id = 553600,
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