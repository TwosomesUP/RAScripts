// Alien Syndrome - Measured Updates
// #ID = 10747

gameState = byte(0x0002)
round = byte(0x0052)
totalItemsCollected = byte(0x0a5f)

//Game States
gameState_InGame = 0x80

//Valid Round Values
round1 = 0x00
round2 = 0x01
round3 = 0x02
round4 = 0x03
round5 = 0x04
round6 = 0x05
finalRound = 0x06

//Hostage Arrays
round1_hostages = [
    byte(0x005c),
    byte(0x005e),
    byte(0x005f),
    byte(0x0060),
    byte(0x0061),
    byte(0x0063),
    byte(0x0064),
    byte(0x0066),
    byte(0x0069),
    byte(0x006b),
    byte(0x006c),
    byte(0x006f)
]

round2_hostages = [
    byte(0x005c),
    byte(0x005d),
    byte(0x005e),
    byte(0x005f),
    byte(0x0060),
    byte(0x0063),
    byte(0x0065),
    byte(0x0066),
    byte(0x0067),
    low4(0x0068),
    high4(0x0068),
    byte(0x006a)
]

round3_hostages = [
    byte(0x005c),
    byte(0x005d),
    byte(0x005f),
    byte(0x0060),
    byte(0x0061),
    byte(0x0063),
    byte(0x0065),
    byte(0x0067),
    low4(0x006b),
    high4(0x006b),
    low4(0x006e),
    high4(0x006e)
]

round4_hostages = [
    byte(0x005d),
    byte(0x0060),
    byte(0x0062),
    byte(0x0063),
    byte(0x0064),
    byte(0x0065),
    byte(0x0067),
    low4(0x0068),
    high4(0x0068),
    byte(0x006a),
    byte(0x006c),
    byte(0x006f)
]

round5_hostages = [
    low4(0x005e),
    high4(0x005e),
    byte(0x0062),
    low4(0x0064),
    high4(0x0064),
    byte(0x0068),
    byte(0x0069),
    low4(0x006a),
    high4(0x006a),
    byte(0x006d),
    byte(0x0071),
    byte(0x0072)
]

round6_hostages = [
    byte(0x005f),
    byte(0x0062),
    byte(0x0067),
    byte(0x0068),
    byte(0x0069),
    byte(0x006a),
    byte(0x006b),
    byte(0x006c),
    byte(0x006e),
    byte(0x006f),
    low4(0x0073),
    high4(0x0073)
]

//Total Items Array
roundItemCount = [17,13,15,12,13,14]

//Functions
function inGame() => gameState == gameState_InGame

function hostagesCollected(hostages_array){
    return 
        measured(tally(12, array_map(hostages_array, checkHostage)))
}

function checkHostage(hostage){
    return 
        once(prev(totalItemsCollected) == totalItemsCollected && 
        hostage > prev(hostage))
}

function itemsCollected(inRound){
    itemCount = roundItemCount[inRound]

    return
        inGame() &&
        prev(totalItemsCollected) == itemCount - 1 &&
        measured(totalItemsCollected == itemCount, round == inRound)
}

function totalHostagesCollected(inRound){
    return 
        inGame() &&
        sum_of(range(0x005c, 0x0073), in => prev(bit0(in)) + prev(bit4(in))) < 12 &&
        measured(sum_of(range(0x005c, 0x0073), in => bit0(in) + bit4(in)) == 12, round == inRound)
}

//Hostages

achievement("Test Hostage", "Test", 10, totalHostagesCollected(round1))


achievement(
    title = "Calliope Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Calliope",
    id = 73293, badge = "78614", published = "3/9/2019 9:55:57 AM", modified = "3/12/2019 5:25:48 PM",
    trigger = totalHostagesCollected(round1)
)

achievement(
    title = "Clio Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Clio",
    id = 73296, badge = "78614", published = "3/9/2019 9:56:21 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = totalHostagesCollected(round2)
)

achievement(
    title = "Erato Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Erato",
    id = 73299, badge = "78614", published = "3/9/2019 9:56:53 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = totalHostagesCollected(round3)
)


achievement(
    title = "Euterpe Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Euterpe",
    id = 73302, badge = "78614", published = "3/9/2019 9:57:25 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = totalHostagesCollected(round4)
)

achievement(
    title = "Melpomene Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Melpomene",
    id = 73305, badge = "78614", published = "3/9/2019 9:58:13 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = totalHostagesCollected(round5)
)

achievement(
    title = "Thalia Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Thalia",
    id = 73308, badge = "78614", published = "3/9/2019 9:58:58 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = totalHostagesCollected(round6)
)

//Items

achievement(
    title = "Calliope Collector", points = 10,
    description = "Get All 17 Items in Calliope",
    id = 73292, badge = "78613", published = "3/9/2019 9:55:47 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = itemsCollected(round1)
)

achievement(
    title = "Clio Collector", points = 10,
    description = "Get All 13 Items in Clio",
    id = 73295, badge = "78613", published = "3/9/2019 9:56:14 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = itemsCollected(round2)
)

achievement(
    title = "Erato Collector", points = 10,
    description = "Get All 15 Items in Erato",
    id = 73298, badge = "78613", published = "3/9/2019 9:56:46 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = itemsCollected(round3)
)

achievement(
    title = "Euterpe Collector", points = 10,
    description = "Get All 12 Items in Euterpe",
    id = 73301, badge = "78613", published = "3/9/2019 9:57:13 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = itemsCollected(round4)
)

achievement(
    title = "Melpomene Collector", points = 10,
    description = "Get All 13 Items in Melpomene",
    id = 73304, badge = "78613", published = "3/9/2019 9:57:54 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = itemsCollected(round5)
)

achievement(
    title = "Thalia Collector", points = 10,
    description = "Get All 14 Items in Thalia",
    id = 73307, badge = "78613", published = "3/9/2019 9:58:31 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = itemsCollected(round6)
)