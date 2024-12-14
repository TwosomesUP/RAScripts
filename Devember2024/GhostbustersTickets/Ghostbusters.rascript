// Ghostbusters
// #ID = 16305

achievement(
    title = "Stay Puft!", points = 10, type="win_condition",
    description = "Successfully bait the Marshmallow Man",
    id = 113851, badge = "124350", published = "6/13/2020 1:13:33 AM", modified = "6/22/2020 1:53:20 PM",
    trigger = byte(0x000013) == 0xC6 && byte(0x000055) == 0xF1
)
