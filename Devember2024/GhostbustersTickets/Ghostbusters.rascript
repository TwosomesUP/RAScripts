// Ghostbusters
// #ID = 16305

GameState = byte(0x13)
BaitState = byte(0x55)

function BaitedMarshmallowMan(){
    return GameState == 0xc6 &&
        prev(BaitState) == 0xf0 &&
        BaitState == 0xf1
}

achievement(
    title = "Stay Puft!", points = 10, type="win_condition",
    description = "Successfully bait the Marshmallow Man",
    id = 113851, badge = "124350", published = "6/13/2020 1:13:33 AM", modified = "6/22/2020 1:53:20 PM",
    /* trigger = byte(0x000013) == 0xC6 && byte(0x000055) == 0xF1 */
    trigger = BaitedMarshmallowMan()
)
