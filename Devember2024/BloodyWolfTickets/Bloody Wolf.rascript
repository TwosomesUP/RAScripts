// Bloody Wolf
// #ID = 2275

Player = {
    "X": byte(0x508),
    "Y": byte(0x50b),
    "XOverflow": byte(0x507),
    "Y16": word(0x50a),
    "Lives": byte(0x505)
}

Game = {
    "Stage": byte(0x32),
    "Cheats": byte(0x21),
    "Screen": high4(0x20)
}

function NoDamageStage(in_stage){
    return Game["Cheats"] == 0 &&
        trigger_when(Game["Screen"] == 0xc) &&
        prev(Game["Stage"]) == in_stage &&
        trigger_when(Game["Stage"] == in_stage + 1) &&
        disable_when(Game["Stage"] == in_stage && prev(Player["Lives"]) > 0 && Player["Lives"] == 0, Game["Screen"] <= 1)
}

achievement(
    title = "Stage 4 Perfect", points = 10,
    description = "Complete stage 4 without dying.",
    id = 131350, badge = "145007", published = "11/1/2020 11:42:00 AM", modified = "10/23/2023 1:11:39 AM",
    /* trigger = trigger_when(byte(0x000508) == 0xA7) && trigger_when(byte(0x00050B) == 0x43) &&
              trigger_when(byte(0x000507) == 0x04) && trigger_when(byte(0x00050A) == 0x08) &&
              trigger_when(prior(byte(0x000087)) == 0x07) && trigger_when(byte(0x000087) == 0x08) &&
              trigger_when(byte(0x000032) == 0x03) && byte(0x000021) == 0x00 && never(byte(0x000505) == 0x00) &&
              once(byte(0x000087) == 0x0A) && never(byte(0x000032) != 0x03) */
    trigger = NoDamageStage(3)
)
