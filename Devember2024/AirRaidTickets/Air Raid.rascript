// Air Raid
// #ID = 16277

Mode = byte(0x6f)
Score = low4(0x2a) + high4(0x2a) * 10 + 
    low4(0x29) * 100 + high4(0x29) * 1000 +
    low4(0x28) * 10000 + high4(0x28) * 100000
    
    
function GotHighScore(in_mode, in_score){
    return Mode == in_mode &&
        prev(Score) < in_score &&
        Score >= in_score
}

achievement(
    title = "Mode 3 Contender", points = 25,
    description = "Score 10,000 in mode 3",
    id = 113128, badge = "123649", published = "6/7/2020 3:07:31 PM", modified = "6/8/2020 2:44:41 PM",
    /* trigger = byte(0x00006F) == 0x02 && byte(0x000028) >= 0x01 */
    trigger = GotHighScore(2, 10000)
)
