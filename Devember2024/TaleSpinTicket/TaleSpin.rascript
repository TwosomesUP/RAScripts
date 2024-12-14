// TaleSpin
// #ID = 2577

LevelID = byte(0xcd67)
Boss3State = byte(0xce30)
PlayerHealth = byte(0xcdaa)
PlayerLives = byte(0xcd65)
PlayerContinues = byte(0xcd66)
CheatEnabled = byte(0xceec)

function IsFightingBoss3() => Boss3State == 1
function IsOnLevel3() => LevelID == 2
function NoCheats() => CheatEnabled == 0

function DamagelessLevel3Boss(){
    return IsOnLevel3() &&
        NoCheats() &&
        PlayerHealth > 0 &&
        prev(IsFightingBoss3()) &&
        trigger_when(!IsFightingBoss3()) &&
        disable_when(IsOnLevel3() && IsFightingBoss3() && prev(PlayerHealth) > PlayerHealth, !IsOnLevel3() || prev(PlayerLives) > PlayerLives || prev(PlayerContinues) > PlayerContinues)
}

achievement(
    title = "Crocodile Temple (flawless)", points = 10,
    description = "Destroyed stage 3 boss without getting hit",
    id = 156156, badge = "175860",
    /*trigger = prev(byte(0x00C1F2)) == 1 && byte(0x00C1F2) == 0 && byte(0x00CD67) == 2 &&
              never((byte(0x00CE30) == 1 && byte(0x00CDAA) < prev(byte(0x00CDAA)))) &&
              once(prev(byte(0x00CE30)) == 0 && byte(0x00CE30) == 1) && byte(0x00CEEC) == 0 &&
              never((byte(0x00DDFC) == 136 && high4(0x00DDFA) == 4)) &&
              once(byte(0x00CD67) == 0 && byte(0x00DDFC) == 133) && never(byte(0x00CD67) == 3)*/
    trigger = DamagelessLevel3Boss()
)
