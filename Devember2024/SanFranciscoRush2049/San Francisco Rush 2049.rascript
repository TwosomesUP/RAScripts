// San Francisco Rush 2049
// #ID = 10333

Difficulty = byte(0x13a727)
Races = byte(0x13a726)
PasswordEntry = byte(0x3b3417)
CheatMenu = byte(0x1164a2)
Standing = byte(0x154452)
Mode = byte(0x14a110)

Modes = {
    "Circuit": 0x3
}

Difficulties = {
    "Extreme": 0x3
}

function StreetRacingKing(){
    return  CheatMenu == 0 &&
        Difficulty == Difficulties["Extreme"] && 
        Mode == Modes["Circuit"] &&
        Standing == 0 &&
        prev(Races) == 23 &&
        Races == 24 &&
        disable_when(PasswordEntry == 1)
}

achievement(
    title = "Street Racing King", points = 50,
    description = "Finish Extreme Circuit mode in 1st place without using any passwords and without opening the menu",
    id = 158301, badge = "178230", published = "6/10/2021 9:41:41 PM", modified = "9/21/2021 1:42:21 AM",
    /*trigger = unless(once(byte(0x3B3417) == 0x01)) && byte(0x1164A2) == 0x00 && byte(0x154452) == 0x00 &&
              byte(0x152033) == 0x03 && byte(0x14A110) == 0x03 && byte(0x3B9A86) == 0x18*/
    trigger = StreetRacingKing()
)
