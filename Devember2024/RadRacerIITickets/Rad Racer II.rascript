// Rad Racer II
// #ID = 1899

CheatsUsed = low4(0x12)
Stage = byte(0xa)
Checkpoints = byte(0x4d)
GameState = byte(0xc)

function HitCheckpoint(in_stage, in_checkpoint){
    return GameState == 1 &&
        Stage == in_stage &&
        prev(Checkpoints) == in_checkpoint - 1 &&
        Checkpoints == in_checkpoint &&
        disable_when(GameState == 2 && CheatsUsed > 0, prev(GameState) != 2 && GameState == 2)
}

achievement(
    title = "Gettysburg II", points = 5, type="progression",
    description = "Reach the second checkpoint in Gettysburg",
    id = 107521, badge = "117703", published = "4/20/2020 12:01:25 AM", modified = "4/21/2020 11:01:59 AM",
    /* trigger = byte(0x00080A) == 0x02 && prior(byte(0x00080A)) == 0x01 && byte(0x00084D) == 0x02 &&
              prior(byte(0x00084D)) == 0x01 && byte(0x000812) == 0x00 */
              
    trigger = HitCheckpoint(2, 2)
)
