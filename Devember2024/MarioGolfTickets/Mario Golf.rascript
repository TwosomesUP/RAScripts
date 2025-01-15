// Mario Golf
// #ID = 1403

// 0xff == Ball in Hole
BallState = byte(0xcaac)
BallStates = {
    "InHole": 0xff
}

PlayStyle = byte(0xc834)

function GotAnEagle(){
    return Player() == 0 &&
        Shots() > 0 &&
        Course() > 0 && 
        Course() <= 4 &&
        Par() - Shots() == 2 &&
        prev(BallState) != BallStates["InHole"] &&
        BallState == BallStates["InHole"]
}

function PitchAndPuttChallenge(){
    return Player() == 0 &&
        all_of(range(1, 18), hole =>
            once(
                Shots() > 0 &&
                PlayStyle == 3 &&
                Course() == 6 &&
                Hole() == hole &&
                Par() - Shots() >= 1 &&
                prev(BallState) != BallStates["InHole"] &&
                BallState == BallStates["InHole"]
            )
        ) &&
        never(PlayStyle > 0 && PlayStyle != 3 && PlayStyle != 9)
}

//////////////////////////////////////////////////////////////

// $00C4C0: [8-bit] The True Music ID
function theTrueMusicId() => byte(0x00C4C0)

// $00C834: [8-bit] Game Mode
//          - 1=Tournament
//          - 2=Match Play
//          - 3=Stroke Play
//          - 4=Practice
//          - 8=Best Shot Replay
//          9=Marion Clubhouse
function gameMode() => byte(0x00C834)

// $00C835: - 0x00 when you're playing (0x01 when opponent is)
function Player() => byte(0x00C835)

// $00C836: 8-bit Course ID
//          
//          1 - Marion Course
//          2 - Palm Course
//          3 - Dune Course
//          4 - Links Course
function Course() => byte(0x00C836)
function Hole() => byte(0xc837)
function CourseWord() => word(0xc836)

// $00C8A0: Shots on Current Hole
function Shots() => byte(0x00C8A0)

// $014325: [8-bit] Par for current hole
function Par() => byte(0x014325)

achievement(
    title = "Birdie King of Pitch & Putt", points = 10,
    description = "Score a -1 or better on each of the 18 holes at the Pitch & Putt course. (One Session, Stroke Play)",
    id = 231030, badge = "256169", published = "7/1/2022 10:02:02 AM", modified = "7/22/2022 9:52:33 PM",
    /*trigger = repeated(10, gameMode() == 0x03 && CourseWord() == 0x106 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x206 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x306 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x406 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x506 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x606 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x706 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x806 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x906 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0xA06 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0xB06 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0xC06 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0xD06 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0xE06 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0xF06 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x1006 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x1106 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D) &&
              repeated(10, gameMode() == 0x03 && CourseWord() == 0x1206 && theTrueMusicId() > 0x9A && theTrueMusicId() < 0x9D)*/
     trigger = PitchAndPuttChallenge()
          
)

achievement(
    title = "Eagle", points = 5,
    description = "Score a -2 on any hole.",
    id = 231033, badge = "256172",
    /*trigger = CourseID() > 0x00 && gameMode() <= 0x04 && (Par() - Shots()) == 0x02 &&
              repeated(30, theTrueMusicId() == 0x9B) && never(Player() != 0x00) &&
              never(Shots() == 0x00) && never(Shots() < prev(Shots()))*/
    trigger = GotAnEagle()
)
