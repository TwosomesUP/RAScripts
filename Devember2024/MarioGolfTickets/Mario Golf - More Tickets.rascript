// Mario Golf
// #ID = 1403

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

// $00C839: [8-bit] Number of holes remaining in current golf session
//          - always 0x00 during shot replay
//          - always 0x01 during practice, challenges, & minigames
//          - max of 0x12 (18 holes)
function numberOfHolesRemainingInCurrentGolfSession() => byte(0x00C839)

// $014555: [8-bit] Player's Score in Match Play
function playerSScoreInMatchPlay() => byte(0x014555)

// $014556: [8-bit] Opponent's Score in Match Play
function opponentSScoreInMatchPlay() => byte(0x014556)

achievement(
    title = "Uncontested Dormie", points = 10,
    description = "Win a Match Play competition without letting the opponent claim a single point. (One Session, Can't Suspend)",
    id = 231035, badge = "256174", published = "7/1/2022 10:02:37 AM", modified = "12/6/2024 10:36:36 PM",
    trigger = gameMode() == 0x02 && 
        playerSScoreInMatchPlay() > 0x00 && 
        opponentSScoreInMatchPlay() == 0x00 &&
        prev(numberOfHolesRemainingInCurrentGolfSession()) > 0 &&
        numberOfHolesRemainingInCurrentGolfSession() == 0x00
)
