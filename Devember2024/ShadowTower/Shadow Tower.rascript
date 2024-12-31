// Shadow Tower
// #ID = 16230

WorldID = word(0x1cf1cc)

MemCard1State = low4(0x7568)
MemCard2State = low4(0x7569)

OverallKills = word(0x198f58)
HostileRockCavernKills = byte(0x1cd10d)

Timer = dword(0x198f5c)

Worlds = {
    "HostileRockCavern": 0x3dc0
}

// Trigger if kills go from 11 to 12, or if the boss kills a knight on you then trigger if kills go from 10 to 11
function HostileRockCavern_AllKills(){
    return MemCard1State == 1 && prev(MemCard1State) == 1 &&
        MemCard2State == 1 && prev(MemCard2State) == 1 &&
        (
            (prev(HostileRockCavernKills) == 11 && HostileRockCavernKills == 12) ||
            (once(WorldID == Worlds["HostileRockCavern"] && OverallKills == prev(OverallKills) + 2) && prev(HostileRockCavernKills) == 10 && HostileRockCavernKills == 11 && never(WorldID == 0))
        ) &&
        unless(Timer == 0)
}

achievement(
    title = "Hostile Rock Cavern", points = 10,
    description = "Get 100% in Hostile Rock Cavern",
    id = 116788, badge = "127879", published = "7/7/2020 12:18:39 PM", modified = "7/19/2020 9:28:32 PM",
    /* trigger = prev(byte(0x1CD10D)) == 0x0B && byte(0x1CD10D) == 0x0C && prev(low4(0x007568)) == 0x01 &&
              low4(0x007568) == 0x01 && prev(low4(0x007569)) == 0x01 && low4(0x007569) == 0x01 &&
              unless(dword(0x198F5C) == 0x00)*/
    trigger = HostileRockCavern_AllKills()
)
