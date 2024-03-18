// Legacy of Kain: Soul Reaver 2
// #ID = 9685

reaverHunger = float(0x002e7f34)
reaverKillEffect = dword(0x00268fc0)

swimmingState = byte(0x0023a109)
executionAction = bit0(0x0023effa)

planeState = byte(0x0023a114)
PlaneStates = {
    "Spectral": 0x01,
    "Material": 0x00
}

heldItemType = dword(0x01fd3670)
HeldItemTypes = {
    "Claws":        0x00000000, //No Item
    "AirForgeAxe":  0x00000001,
    "Spear":        0x00000001, //Also Axe/Halbert
    "Sword":        0x00000002,
    "Torch":        0x00000002,
    "Reaver":       0x00001000,
    "Item":         0x0000000b  //Non-Weapon
}

animationIndex = dword(0x0026d23c)
Animations = {
    //Rend Executions (Claws)
    "Rend_Claw_SarafanPriestess":   0x20,
    "Rend_Claw_SwordHunter":        0x44,
    "Rend_Claw_SwordSarafan":       0x45,
    "Rend_Claw_SpearHunter":        0x47,
    "Rend_Claw_CannonHunter":       0x3a,
    "Rend_Claw_GreaterThrall":      0x5a,
    "Rend_Claw_SwordThrall":        0x5b,
    "Rend_Claw_SorcererThrall":     0x54,
    
    //Cleave Executions (Swords and Air Forge Axe)
    "Cleave_AFA_GreaterThrall":     0x59,
    "Cleave_AFA_SwordThrall":       0x5a,
    "Cleave_AFA_SorcererThrall":    0x53,
    "Cleave_Sword_All":             0x10b,
    
    //Immolate Executions (Torch)
    "Immolate_Torch_All":           0x86,
    
    //Impale Executions (Spear, Trident, Axe, Halbert, and Staff)
    "Impale_Spear_All":             0x3b,
    "Impale_Spear_RedDemon":        0x22
}

screenId = dword(0x0023bcb0)
ScreenIds = {
    "InGame": 0x01
}

DarkReaverAcquired = bit4(0x01fd3799)
LightReaverAcquired = bit5(0x01fd3799)
AirReaverAcquired = bit6(0x01fd3799)
FireReaverAcquired = bit7(0x01fd3799)

cameraState = bit2(0x0023e954)
CameraStates = {
    "Cutscene": 0x01,
    "InGame": 0x00
}

darkChronicles1 = 0x00768d38
darkChronicles2 = 0x00768d39
darkChronicles3 = 0x00768d3a
DarkChronicles = {
    "Arrival": bit1(darkChronicles1),
    "TheReaverConvergence": bit2(darkChronicles1),
    "TheHeartOfDarkness": bit3(darkChronicles1),
    "TheCorruptionOfThePillars": bit4(darkChronicles1),
    "TheElderGod": bit5(darkChronicles1),
    "TheVampireVorador": bit6(darkChronicles1),
    "TheEldersWarning": bit7(darkChronicles1),
    "HistoryAndDestinyCollide": bit0(darkChronicles2),
    "TimeStreaming": bit1(darkChronicles2),
    "MoebiussMartyredSpirit": bit2(darkChronicles2),
    "ArielsLament": bit3(darkChronicles2),
    "RazielDefiesTheElder": bit4(darkChronicles2),
    "TheRuinedAerie": bit5(darkChronicles2),
    "TheTenthGuardian": bit6(darkChronicles2),
    "TheDeathOfJanosAudron": bit7(darkChronicles2),
    "TheFinalTransgression": bit0(darkChronicles3),
    "CorneredInTheStronghold": bit1(darkChronicles3),
    "Vengeance": bit2(darkChronicles3),
    "Renunciation": bit3(darkChronicles3),
    "FullCircle": bit4(darkChronicles3),
}

levelId = dword(0x0023bba8)
levels = {
    //Dark Chronicles Unlock Rooms
    "Arrival": 0x1b, //Arrived in the Distant Past
    "TheReaverConvergence": 0x82, //Got Enhanced Wraith Blade
    "TheHeartOfDarkness": 0x82, //Janos Audron Mural (Non-Achievement)
    "TheCorruptionOfThePillars": 0x03, //Meet Kain at Pillars
    "TheElderGod": 0x89, //Meet the Elder God 
    "TheVampireVorador": 0x8e, //Meet Vorador
    "TheEldersWarning": 0x89, //Elder Warns Raziel
    "HistoryAndDestinyCollide": 0x82, //Meet Kain at Stronghold
    "TimeStreaming": 0x1c, //Arrived in the Dark Future
    "MoebiussMartyredSpirit": 0x24, //Meet Spirit Moebius
    "ArielsLament": 0x2b, //Meet Ariel
    "RazielDefiesTheElder": 0x30, //Raziel defies the Elder God
    "TheRuinedAerie": 0x3e, //Meet Kain at Janos Audron's Retreat
    "TheTenthGuardian": 0x5f, //Meet Janos Audron
    "TheDeathOfJanosAudron": 0x5f, //The Death of Janos Audron
    "TheFinalTransgression": 0x6e, //Meet the Elder God for the last time (Non-Achievement?)
    "CorneredInTheStronghold": 0x7b, //Acquire the Soul Reaver
    "Vengeance": 0x7d, //Pre-Turel Fight (Non-Achievement)
    "Renunciation": 0x7f, //Pre-Raziel Fight (Non-Achievement)
    "FullCircle": 0x7f, //Raziel Defeated and Destiny comes full circle
    
    "LightForgeRoom": 0x0d,
    "AirForgeRoom": 0x43,
    "FireForgeRoom": 0x6a,
    
    //Dark Shrine
    "DarkShrine_Entrance": 0x8e,
    "DarkShrine_Room1": 0x91,
    "DarkShrine_ForgeRoom": 0x92, //Room 2
    "DarkShrine_Room3": 0x98,
    "DarkShrine_EntranceHall": 0x8f, //Room 4
    "DarkShrine_Room5": 0x90,
    "DarkShrine_Room6": 0x99,
    "DarkShrine_Room8": 0x94,
    "DarkShrine_Sundial": 0x95,
    "DarkShrine_Room11": 0x93,
    "DarkShrine_Room12": 0x96,
    "DarkShrine_Room13": 0x97,
    
    //Lake
    "Lake_LightShrineEntrance": 0x09,
    
    //Uschtenheim
    "Uschtenheim_AirShrineEntrance": 0x40,
    
    //Swamp
    "EarlySwamp_TimeStreamingChamberEntranceHall": 0x54,
    "EarlySwamp_TimeStreamingChamberEntrance": 0x55,
    
    //Stronghold
    "DarkStronghold_TimeStreamingChamber": 0x1c,
    "DarkStronghold_TimeStreamingChamberEntrance": 0x1d
}

function darkChronicleUnlocked(chronicle){
    return
        screenId == ScreenIds["InGame"] &&
        levelId == levels[chronicle] &&
        DarkChronicles[chronicle] > prev(DarkChronicles[chronicle])
}

function darkArrival(){
    return
    screenId == ScreenIds["InGame"] &&
    prior(levelId) == levels["DarkStronghold_TimeStreamingChamber"] && levelId == levels["DarkStronghold_TimeStreamingChamberEntrance"] &&
    prev(cameraState) > cameraState
}

function historicArrival(){
    return
    screenId == ScreenIds["InGame"] &&
    prior(levelId) == levels["EarlySwamp_TimeStreamingChamberEntranceHall"] && levelId == levels["EarlySwamp_TimeStreamingChamberEntrance"] &&
    prev(cameraState) > cameraState
}

function guardianTrigger(){
    return
    screenId == ScreenIds["InGame"] &&
    levelId == FireShrineLevels["ForgeRoom"] && prior(levelId) == FireShrineLevels["Room2"] &&
    DarkChronicles["TheTenthGuardian"] > prior(DarkChronicles["TheTenthGuardian"]) &&
    cameraState < prev(cameraState)
}

function acquireDarkReaver(){
    return
        screenId == ScreenIds["InGame"] &&
        levelId == levels["DarkShrine_ForgeRoom"] &&
        DarkReaverAcquired > prior(DarkReaverAcquired) &&
        cameraState < prev(cameraState)
}

function acquireLightReaver(){
    return
        screenId == ScreenIds["InGame"] &&
        levelId == levels["LightForgeRoom"] &&
        LightReaverAcquired > prior(LightReaverAcquired) &&
        cameraState < prev(cameraState)
}

function acquireAirReaver(){
    return
        screenId == ScreenIds["InGame"] &&
        levelId == levels["AirForgeRoom"] &&
        AirReaverAcquired > prior(AirReaverAcquired) &&
        cameraState < prev(cameraState)
}

function acquireFireReaver(){
    return
        screenId == ScreenIds["InGame"] &&
        levelId == levels["FireForgeRoom"] &&
        FireReaverAcquired > prior(FireReaverAcquired) &&
        cameraState < prev(cameraState)
}

function cleave20Enemies(){
    return 
        measured(tally(20, 
            heldItemType == HeldItemTypes["AirForgeAxe"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Cleave_AFA_GreaterThrall"] &&
            animationIndex == Animations["Cleave_AFA_GreaterThrall"],
            heldItemType == HeldItemTypes["AirForgeAxe"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Cleave_AFA_SwordThrall"] &&
            animationIndex == Animations["Cleave_AFA_SwordThrall"],
            heldItemType == HeldItemTypes["AirForgeAxe"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Cleave_AFA_SorcererThrall"] &&
            animationIndex == Animations["Cleave_AFA_SorcererThrall"],
            heldItemType == HeldItemTypes["Sword"] && //Any Sword
            executionAction == 1 &&
            prev(animationIndex) != Animations["Cleave_Sword_All"] &&
            animationIndex == Animations["Cleave_Sword_All"]
        )) &&
        never(planeState == PlaneStates["Spectral"]) &&
        never(screenId != ScreenIds["InGame"])
}

function impale20Enemies(){
    return
        measured(tally(20, 
            heldItemType == HeldItemTypes["Spear"] && //Also includes Halberts and some Axes
            executionAction == 1 &&
            prev(animationIndex) != Animations["Impale_Spear_All"] &&
            animationIndex == Animations["Impale_Spear_All"],
            heldItemType == HeldItemTypes["Spear"] && //Also includes Halberts and some Axes
            executionAction == 1 &&
            prev(animationIndex) != Animations["Impale_Spear_RedDemon"] &&
            animationIndex == Animations["Impale_Spear_RedDemon"]
        )) &&
        never(planeState == PlaneStates["Spectral"]) &&
        never(screenId != ScreenIds["InGame"])
}

function rend20Enemies(){
    return 
        measured(tally(20, 
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_SarafanPriestess"] &&
            animationIndex == Animations["Rend_Claw_SarafanPriestess"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_SwordHunter"] &&
            animationIndex == Animations["Rend_Claw_SwordHunter"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_SwordSarafan"] &&
            animationIndex == Animations["Rend_Claw_SwordSarafan"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_SpearHunter"] &&
            animationIndex == Animations["Rend_Claw_SpearHunter"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_CannonHunter"] &&
            animationIndex == Animations["Rend_Claw_CannonHunter"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_GreaterThrall"] &&
            animationIndex == Animations["Rend_Claw_GreaterThrall"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_SwordThrall"] &&
            animationIndex == Animations["Rend_Claw_SwordThrall"],
            heldItemType == HeldItemTypes["Claws"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Rend_Claw_SorcererThrall"] &&
            animationIndex == Animations["Rend_Claw_SorcererThrall"]
        )) &&
        never(planeState == PlaneStates["Spectral"]) &&
        never(screenId != ScreenIds["InGame"])
}

function immolate5Enemies(){
    return  
        measured(tally(5, 
            heldItemType == HeldItemTypes["Torch"] &&
            executionAction == 1 &&
            prev(animationIndex) != Animations["Immolate_Torch_All"] &&
            animationIndex == Animations["Immolate_Torch_All"]
        )) &&
        never(planeState == PlaneStates["Spectral"]) &&
        never(screenId != ScreenIds["InGame"])
}

function eradicateEnemies(){
    return
        measured(tally(20,
            heldItemType == HeldItemTypes["Reaver"] &&
            reaverKillEffect > prev(reaverKillEffect)
        )) &&
        never(planeState == PlaneStates["Spectral"]) &&
        never(screenId != ScreenIds["InGame"]) &&
        never(reaverHunger == 0.0)
}

DarkShrineEvents = {
    "ForgePuzzleSolved": word(0x007681d6),
    "MuralCutscene": word(0x007681e0),
    "ForgeRoomMirror": word(0x007681f4),
    "ForgeActivated": word(0x007681f8),
    "CrystalCutscene": word(0x007681fa),
    "WestPuzzleMirror1": word(0x00768206),
    "WestPuzzleDoor": word(0x0076820c),
    "WestPuzzleMirror2": word(0x0076820e),
    "WestPuzzleShadowBridge": word(0x00768210),
    "WestPuzzleLight": word(0x00768214),
    "Sundial": word(0x00768226),
    "ForgeRoomPedestal": word(0x0076822c),
    "EastPuzzleDoor": word(0x00768254),
    "EastPuzzleMirror": word(0x00768256),
    "EastPuzzleLight": word(0x0076825c),
    "MirrorKey": word(0x0076826e)
}

function darkShrineChallenge(){
    return 
        screenId == ScreenIds["InGame"] &&
        once
        (
            prev(levelId) == levels["DarkShrine_Entrance"] && levelId == levels["DarkShrine_EntranceHall"] &&
            all_of(DarkShrineEvents, event => DarkShrineEvents[event] == 0)
        ) &&
        trigger_when(prev(DarkShrineEvents["ForgeActivated"]) == 0 && DarkShrineEvents["ForgeActivated"] == 1) &&
        never(tally(5, planeState == PlaneStates["Spectral"] && prev(planeState) == PlaneStates["Material"])) &&
        never
        ( 
            levelId != levels["DarkShrine_Room1"] &&
            levelId != levels["DarkShrine_ForgeRoom"] &&
            levelId != levels["DarkShrine_Room3"] &&
            levelId != levels["DarkShrine_EntranceHall"] &&
            levelId != levels["DarkShrine_Room5"] &&
            levelId != levels["DarkShrine_Room6"] &&
            levelId != levels["DarkShrine_Room8"] &&
            levelId != levels["DarkShrine_Sundial"] &&
            levelId != levels["DarkShrine_Room11"] &&
            levelId != levels["DarkShrine_Room12"] &&
            levelId != levels["DarkShrine_Room13"]
        )
}

LightShrineEvents = {
    "ForgeActivated": word(0x00767984),
    "MuralCutscene": word(0x0076798a),
    "EntranceDarkBridge": word(0x00767990),
    "EntranceLightDoor": word(0x007679a0),
    "LightGate": word(0x007679aa),
    "EastPuzzle": word(0x007679ac),
    "EastPuzzleDarkDoor": word(0x007679b6),
    "EastPuzzleMirrorPedestal": word(0x007679b8),
    "EastPuzzleMirrorDirection": word(0x007679ba),
    "EastPuzzlePillar": word(0x007679bc),
    "WestPuzzleDarkDoor": word(0x007679be),
    "WestPuzzleMirrorPedestal": word(0x007679c2),
    "WestPuzzle": word(0x007679d4),
    "WestPuzzleMirrorDoor": word(0x007679f0),
    "EastPuzzleDarkBridge": word(0x007679f8),
    "StarKey": word(0x00767a1c),
    "EastPuzzleDarkDoor2": word(0x00767a4c),
    "EastPuzzleDarkGate": word(0x00767a62)
}

LightShrineLevels = {
    "EntranceHall": 0x0a,
    "ForgeRoom": 0x0d,
    "Room3": 0x14,
    "Room6": 0x10,
    "Room7": 0x0e,
    "Room9": 0x12,
    "Room14": 0x0f,
    "Room16": 0x11,
    "Room17": 0x13,
    "Room18": 0x15,
    "EntranceHall2": 0x0b, //Room20
    "Room21": 0x0c
}

function lightShrineChallenge(){
    return
    screenId == ScreenIds["InGame"] &&
    once 
    ( 
        prev(levelId) == levels["Lake_LightShrineEntrance"] && levelId == LightShrineLevels["EntranceHall"] &&
        all_of(LightShrineEvents, event => LightShrineEvents[event] == 0)
    ) &&
    trigger_when(prev(LightShrineEvents["ForgeActivated"]) == 0 && LightShrineEvents["ForgeActivated"] == 1) &&
    never(tally(4, planeState == PlaneStates["Spectral"] && prev(planeState) == PlaneStates["Material"])) &&
    never
    ( 
        all_of(LightShrineLevels, level => levelId != LightShrineLevels[level])
    )
}

AirShrineEvents = {
    "EntranceLightDoor": word(0x00767cda),
    "MuralCutscene": word(0x00767cdc),
    "ForgeRoomIntro": word(0x00767d04),
    "ForgeRoomLightSwitch": word(0x00767d06),
    "ForgeRoomDarkSwitch": word(0x00767d08),
    "ForgeActivated": word(0x00767d0e),
    "ReaverPuzzleReaverDoor": word(0x00767d2a),
    "LightPuzzleLightDoor": word(0x00767d2e),
    "DarkPuzzleDarkDoor": word(0x00767d32),
    "GreenHeartPedestal": word(0x00767d44),
    "RedHeartPedestal": word(0x00767d58),
    "BlueHeartPedestal": word(0x00767d68),
    "DarkPuzzle": word(0x00767d7e),
    "DarkPuzzleDarkBridge": word(0x00767d84),
    "RedHeart": word(0x00767d88),
    "DarkPuzzleDarkDoor2": word(0x00767d8c),
    "ReaverPuzzleDarkBridge": word(0x00767da6),
    "ReaverPuzzleWindStatues": word(0x00767da8),
    "ReaverPuzzle": word(0x00767db0),
    "BlueHeart": word(0x00767db4),
    "LightPuzzleDarkBridge": word(0x00767dd6),
    "LightPuzzle": word(0x00767dda),
    "GreenHeart": word(0x00767dde)
}

AirShrineLevels = {
    "EntranceHall": 0x41,
    "Room2": 0x42,
    "Room4": 0x4a,
    "Room6": 0x4f,
    "Room8": 0x4b,
    "Room11": 0x4d,
    "Room13": 0x44,
    "Room14": 0x45,
    "Room15": 0x46,
    "Room16": 0x47,
    "Room17": 0x48,
    "Room18": 0x49,
    "ForgeRoom": 0x43,
    "Room21": 0x4c,
    "Room22": 0x4e
}

function airShrineChallenge(){
    return
    screenId == ScreenIds["InGame"] &&
    once 
    ( 
        prev(levelId) == levels["Uschtenheim_AirShrineEntrance"] && levelId == AirShrineLevels["EntranceHall"] &&
        all_of(AirShrineEvents, event => AirShrineEvents[event] == 0)
    ) &&
    trigger_when(prev(AirShrineEvents["ForgeActivated"]) == 0 && AirShrineEvents["ForgeActivated"] == 1) &&
    never(tally(4, planeState == PlaneStates["Spectral"] && prev(planeState) == PlaneStates["Material"])) &&
    never(all_of(AirShrineLevels, level => levelId != AirShrineLevels[level])) 
}

FireShrineEvents = {
    "PuzzleSteps": word(0x00767fb0),
    "Part2WindPillars": word(0x00767fb6),
    "Part3WindPillar1": word(0x00767fc0),
    "Part3WindPillar2": word(0x00767fc2),
    "Part3WindPillar3": word(0x00767fc4),
    "Part3WindPillar4": word(0x00767fc6),
    "Part3WindPillar5": word(0x00767fc8),
    "Part3WindPillar6": word(0x00767fca),
    "Part3WindPillar7": word(0x00767fcc),
    "BloodLevel": word(0x00767fd0),
    "CrystalState": word(0x00767fd2),
    "Crystal": word(0x00767fd6),
    "ForgeActivated": word(0x00767fdc),
    "Part3": word(0x00767fe6)
}

FireShrineLevels = {
    "ForgeRoom": 0x6a,
    "Room2": 0x69,
    "Room3": 0x68
}

LitTorches = word(0x0029c4fc)

//Update to check for end of Brazer 2 being lit for the final "never" condition
function fireShrineChallenge(){
    return
    screenId == ScreenIds["InGame"] &&
    once 
    ( 
        levelId == FireShrineLevels["ForgeRoom"] &&
        all_of(FireShrineEvents, event => FireShrineEvents[event] == 0)
    ) &&
    trigger_when
    (
        prior(FireShrineEvents["ForgeActivated"]) < FireShrineEvents["ForgeActivated"] &&
        cameraState < prev(cameraState)
    ) &&
    never(all_of(FireShrineLevels, level => levelId != FireShrineLevels[level])) &&
    never(FireShrineEvents["PuzzleSteps"] == 1 && prev(LitTorches) > LitTorches) &&
    never(FireShrineEvents["PuzzleSteps"] == 4 && prev(LitTorches) > LitTorches) &&
    never(FireShrineEvents["PuzzleSteps"] == 6 && cameraState == 0 && prev(LitTorches) > LitTorches)
}

reaverElement = dword(0x1fd37c4)

JanosRetreatLevels = {
    "FrozenLake": 0x5f,
    "UnderwaterPass": 0x67,
    "Part1Entrance": 0x64,
    "SnowPass": 0x65,
    "SnowPass2": 0x66,
    "Part2Hallway": 0x63,
    "Part2": 0x62,
    "Part2FinalFloorDoor": 0x61
}

JanosRetreatEvents = {
    "Part1CrackedWall": word(0x00767ee2),
    "FinalFloorDoor": word(0x00767f08),
    "Floor3LightBridge2": word(0x00767f0e),
    "Floor1LightBridge1": word(0x00767f12),
    "Floor2LightBridge1": word(0x00767f16),
    "Floor3LightBridge1": word(0x00767f1a),
    "Foor3AirEmblem": word(0x00767f1e),
    "Floor2CrackedWall1": word(0x00767f20),
    "Floor2CrackedWall2": word(0x00767f22),
    "Floor3Door2": word(0x00767f2a),
    "Floor3Door1": word(0x00767f2c),
    "Floor2Door1": word(0x00767f2e),
    "Floor1Door1": word(0x00767f30),
    "Floor3Chalice2": word(0x00767f68),
    "Floor3Chalice1": word(0x00767f6a),
    "Floor2Chalice2": word(0x00767f6c),
    "Floor2Chalice1": word(0x00767f6e),
    "Floor1Chalice1": word(0x00767f70),
    "Part1BloodChalice": word(0x00767f8e)
}

function janosRetreatChallenge(){
    return
    screenId == ScreenIds["InGame"] &&
    once 
    ( 
        levelId == JanosRetreatLevels["FrozenLake"] &&
        all_of(JanosRetreatEvents, event => JanosRetreatEvents[event] == 0)
    ) &&
    trigger_when(prev(JanosRetreatEvents["FinalFloorDoor"]) < JanosRetreatEvents["FinalFloorDoor"]) &&
    never(all_of(JanosRetreatLevels, level => levelId != JanosRetreatLevels[level])) &&
    never(tally(8, planeState == PlaneStates["Material"] && reaverElement != 2 && reaverElement != prev(reaverElement)))
}

//ACHIEVEMENTS

achievement(
    title = "Trial of Shadows", points = 10,
    description = "From the beginning of the Dark Shrine and with no prior progress, activate the Dark Forge while only shifting to the Spectral Plane 4 times or less",
    trigger = darkShrineChallenge(),
    id = 395795
)
achievement(
    title = "Trial of Radiance", points = 10,
    description = "From the beginning of the Light Shrine and with no prior progress, activate the Light Forge while only shifting to the Spectral Plane 3 times or less",
    trigger = lightShrineChallenge(),
    id = 395796
)
achievement(
    title = "Trial of Gusts", points = 10,
    description = "From the beginning of the Air Shrine and with no prior progress, activate the Air Forge while only shifting to the Spectral Plane 3 times or less",
    trigger = airShrineChallenge(),
    id = 395797
)
achievement(
    title = "Trial of Inferno", points = 10,
    description = "With no prior progress, activate the Fire Forge without dropping or extinguishing any torches",
    trigger = fireShrineChallenge(),
    id = 395798
)
achievement(
    title = "Trial of Beginnings", points = 10,
    description = "From the Frozen Lake and with no prior progress, reach the top of Janos's Retreat while only switching the Wraith Blade's element 7 times or less",
    trigger = janosRetreatChallenge(),
    id = 397194
)
achievement(
    title = "[VOID] A Past Arrival", points = 0,
    description = "Fueled by blind rage and a thirst for blood, arrive in Nostgoth's Distant Past",
    trigger = darkChronicleUnlocked("Arrival"),
    id = 394545
)
achievement(
    title = "Convergence", points = 5,
    description = "Escape Moebius's influence and acquire the Enhanced Wraith Blade",
    trigger = darkChronicleUnlocked("TheReaverConvergence"),
    id = 394546
)
achievement(
    title = "Corruption", points = 5,
    description = "Encounter Kain as he admires the corrosion of the Pillars and learn of his part in Nosgoth's dark history",
    trigger = darkChronicleUnlocked("TheCorruptionOfThePillars"),
    id = 394547
)
achievement(
    title = "[VOID] Benefactor", points = 0,
    description = "Meet the Elder God in the Subterranean Chamber",
    trigger = darkChronicleUnlocked("TheElderGod"),
    id = 394548
)
achievement(
    title = "[VOID] Delusions", points = 0,
    description = "Meet the ancient vampire Varodor and learn of your origins",
    trigger = darkChronicleUnlocked("TheVampireVorador"),
    id = 394549
)
achievement(
    title = "Destiny", points = 5,
    description = "Encounter Kain at the Sarafan Stronghold as he laments the irredemable course of history and learn of your part in his schemes to circumvent destiny",
    trigger = darkChronicleUnlocked("HistoryAndDestinyCollide"),
    id = 394550
)
achievement(
    title = "Dark Arrival", points = 5,
    description = "Arrive in Nosgoth's Dark Future",
    trigger = darkArrival(),
    id = 394551
)
achievement(
    title = "[VOID] Martyrdom", points = 0,
    description = "Meet Moebius's Spirit in the Sarafan Stronghold and learn of his deceipt",
    trigger = darkChronicleUnlocked("MoebiussMartyredSpirit"),
    id = 394552
)
achievement(
    title = "Lament", points = 5,
    description = "Encounter Ariel at the toppled Pillars and learn of her part in Kain and Nosgoth's downfall",
    trigger = darkChronicleUnlocked("ArielsLament"),
    id = 394553
)
achievement(
    title = "[VOID] Defied Wishes", points = 0,
    description = "Defy the wishes of The Elder God in the Subterranean Chamber",
    trigger = darkChronicleUnlocked("RazielDefiesTheElder"),
    id = 394554
)
achievement(
    title = "Ruined", points = 5,
    description = "Encounter Kain at the Ruined Retreat and learn of the key to your destiny",
    trigger = darkChronicleUnlocked("TheRuinedAerie"),
    id = 394555
)
achievement(
    title = "Historic Arrival", points = 5,
    description = "Arrive in Nosgoth's Early History",
    trigger = historicArrival(),
    id = 397013
)
achievement(
    title = "Guardian", points = 5,
    description = "Reach the top of Janos Audron's Retreat and reveal the origins of the Soul Reaver",
    trigger = guardianTrigger(),
    id = 394558
)
achievement(
    title = "[VOID] Departure", points = 0,
    description = "Witness Janos Audron's death and history repeating itself",
    trigger = darkChronicleUnlocked("TheDeathOfJanosAudron"),
    id = 394556
)
achievement(
    title = "Reaver of Souls", points = 5,
    description = "Acquire the Wraith Blade's physical twin, the Soul Reaver",
    trigger = darkChronicleUnlocked("CorneredInTheStronghold"),
    id = 394559
)
achievement(
    title = "Full Circle", points = 25,
    description = "Renounce your former self and witness your history come full circle",
    trigger = darkChronicleUnlocked("FullCircle"),
    id = 394557
)
achievement(
    title = "In Twain", points = 10,
    description = "In a single session, perform the Cleave final blow on 20 enemies using Swords or Axes without shifting to the Spectral Plane",
    trigger = cleave20Enemies(),
    id = 394540
)
achievement(
    title = "Skewered", points = 10,
    description = "In a single session, perform the Impale final blow on 20 enemies using Spears, Halberts, or Axes without shifting to the Spectral Plane",
    trigger = impale20Enemies(),
    id = 394542
)
achievement(
    title = "Rip and Tear", points = 10,
    description = "In a single session, perform the Rend final blow on 20 enemies using your Claws without shifting to the Spectral Plane",
    trigger = rend20Enemies(),
    id = 394543
)
achievement(
    title = "Cleansing Fire", points = 10,
    description = "In a single session, perform the Immolate final blow on 5 enemies using Torches without shifting to the Spectral Plane",
    trigger = immolate5Enemies(),
    id = 394544
)

achievement(
    title = "Voracious Hunger", points = 10,
    description = "In a single session, maintain the Wraith Blade's hunger by feeding it the souls of 20 enemies without shifing to the Spectral Plane",
    trigger = eradicateEnemies(),
    id = 394541
)

achievement(
    title = "Reaver of Dark", points = 5,
    description = "Activate the Dark Forge and acquire the Dark Reaver",
    trigger = acquireDarkReaver(),
    id = 394560
)

achievement(
    title = "Reaver of Light", points = 5,
    description = "Activate the Light Forge and acquire the Light Reaver",
    trigger = acquireLightReaver(),
    id = 394561
)
achievement(
    title = "Reaver of Air", points = 5,
    description = "Activate the Air Forge and acquire the Air Reaver",
    trigger = acquireAirReaver(),
    id = 394562
)
achievement(
    title = "Reaver of Fire", points = 5,
    description = "Activate the Fire Forge and acquire the Fire Reaver",
    trigger = acquireFireReaver(),
    id = 394563
)