// Congo Bongo
// #ID = 16346

Loop = high4(0x3)
Player = byte(0x0)
Deaths = low4(0x6d)
ExtraLife = byte(0x6e)
Playing = byte(0x6c)
DeathFrames = byte(0x22)

function FourDeathlessLoops(){
    return Player == 0 &&
        Deaths == 0 &&
        trigger_when(prev(Loop) == 4 && Loop == 5) &&
        disable_when(prev(Deaths) < Deaths) &&
        disable_when(prev(ExtraLife) == 1 && ExtraLife == 0) &&
        ((never(Loop == 0) && never(Deaths == 8 && prev(DeathFrames) == 0x2a && DeathFrames == 0x29)) || always_false())
}

achievement(
    title = "Congo Bongo!", points = 50,
    description = "Light Congo on fire four times and begin again, without losing a life",
    id = 113920, badge = "240397", published = "6/14/2020 3:48:08 AM", modified = "12/12/2022 1:48:13 PM",
    /* trigger = once(prev(high4(0x000003)) == 0x00 && high4(0x000003) == 0x01) &&
              trigger_when(prev(high4(0x000003)) == 0x04) && trigger_when(high4(0x000003) == 0x05) &&
              byte(0x000000) == 0x00 && never(high4(0x000003) == 0x00) && \
              never(low4(0x00006D) > prev(low4(0x00006D))) */
    trigger = FourDeathlessLoops()
)
