// Alien Crush Returns
// #ID = 34728
// Author: BacklogOddy

class Utilities {
    function GetRegionalAddress(base, offset, accessor = dword_be) {
        return accessor(base + offset)
    }

    function MaskPointer(value) {
        return value & 0x1fffffff
    }
}
utilities = Utilities()

class Region {
    Code = 0x3183

    // US = "E" = 01000101
    // EU = "P" = 01010000
    // JP = "J" = 01001010
    USBit = bit2(Code)
    EUBit = bit4(Code)
    JPBit = bit3(Code)

    US = "E"
    EU = "P"
    JP = "J"

    function IsRegion(code) {
        if (code == "E")
            return this.USBit == 1 && this.EUBit == 0 && this.JPBit == 0
        if (code == "P")
            return this.USBit == 0 && this.EUBit == 1 && this.JPBit == 0
        if (code == "J")
            return this.USBit == 0 && this.EUBit == 0 && this.JPBit == 1
    }

    function GetRegionalOffset(euOffset, jpOffset) {
        return (this.EUBit * euOffset) + (this.JPBit * jpOffset)
    }

    function GetStageStateOffset() {
        euOffset = 0x790
        jpOffset = -0x500
        return this.GetRegionalOffset(euOffset, jpOffset)
    }

    function GetSettingsOffset() {
        euOffset = 0x790
        jpOffset = -0x500
        return this.GetRegionalOffset(euOffset, jpOffset)
    }

    function GetEnemyListPointerOffset(){
        euOffset = 0x7a0
        jpOffset = -0x520
        return this.GetRegionalOffset(euOffset, jpOffset)
    }

    function GetRegionalEnemyListPointer(code) {
        usAddress = 0x33d124
        euAddress = usAddress + 0x7a0
        jpAddress = usAddress - 0x520
        
        address = usAddress
        if (code == "P")
            address = euAddress
        if (code == "J")
            address = jpAddress
        
        return dword_be(address)
    }

    function GetPlayerObjectPointerOffset() {
        euOffset = 0x7a0
        jpOffset = -0x520
        return this.GetRegionalOffset(euOffset, jpOffset)
    }

    function GetRegionalPlayerObjectPointer(code) {
        usAddress = 0x353128
        euAddress = usAddress + 0x7a0
        jpAddress = usAddress - 0x520
        
        address = usAddress
        if (code == "P")
            address = euAddress
        if (code == "J")
            address = jpAddress
        
        return dword_be(address)
    }

    function GetStageEventsOffset() {
        euOffset = 0x7a0
        jpOffset = -0x5b0
        return this.GetRegionalOffset(euOffset, jpOffset)
    }

    function GetGameStateOffset() {
        euOffset = 0x780
        jpOffset = -0x580
        return this.GetRegionalOffset(euOffset, jpOffset)
    }

    function GetValue() {
        return this.USBit + (this.EUBit * 10) + (this.JPBit * 100)
    }

    Lookup = {
        1: "👽",
        10: "🛸",
        100: "👾"
    }
}
region = Region()

class Messages {
    BallLost = 0x00
    MultiBall = 0x01
    ExtraBall = 0x02
    Action = 0x03
    Tilt = 0x04
    Danger = 0x05
    Chance = 0x06
    Warning = 0x07
    UpPost = 0x08
    RateUp = 0x09
    WipedOut = 0x0a
}

class StageState {
    RegionalOffset = region.GetStageStateOffset()

    StageTextIndex = utilities.GetRegionalAddress(0x2f2e10, RegionalOffset, dword_be)
    EventTextFlag = utilities.GetRegionalAddress(0x2f2e20, RegionalOffset, dword_be)
    EventTextTimer = utilities.GetRegionalAddress(0x2f2e28, RegionalOffset, float_be)
    EventTextIndex = utilities.GetRegionalAddress(0x2f2e2c, RegionalOffset, dword_be)
    GameOverTextIndex = utilities.GetRegionalAddress(0x2f2e40, RegionalOffset, dword_be)
    StageClearFlag = utilities.GetRegionalAddress(0x2f2e48, RegionalOffset, dword_be)

    Messages = Messages()
}
stageState = StageState()

class Modes {
    Story = 0x00
    Arcade = 0x01
    Versus = 0x02
}

class Stages {
    One = 0x00
    Two = 0x01
    BossOne = 0x02
    Three = 0x03
    BossTwo = 0x04
}

class Difficulties {
    Easy = 0x00
    Normal = 0x01
    Hard = 0x02
}

class Settings {
    RegionalOffset = region.GetSettingsOffset()

    Mode = utilities.GetRegionalAddress(0x2f2e54, RegionalOffset, dword_be)
    Modes = Modes()

    ModeLookup = {
        0x00: "Story Mode",
        0x01: "Arcade Mode",
        0x02: "Versus Mode"
    }

    StoryModeStage = utilities.GetRegionalAddress(0x2f2e5c, RegionalOffset, dword_be)
    ArcadeModeStage = utilities.GetRegionalAddress(0x2f2e60, RegionalOffset, dword_be)
    Stages = Stages()

    StageLookup = {
        0x00: "Stage 1",
        0x01: "Stage 2",
        0x02: "Boss Stage 1",
        0x03: "Stage 3",
        0x04: "Boss Stage 2"
    }

    Difficulty = utilities.GetRegionalAddress(0x2f719c, RegionalOffset, dword_be)
    Difficulties = Difficulties()

    SoundSetting = utilities.GetRegionalAddress(0x2f71a0, RegionalOffset, dword_be)
    BGMVolume = utilities.GetRegionalAddress(0x2f71a4, RegionalOffset, dword_be)
    SEVolume = utilities.GetRegionalAddress(0x2f71a8, RegionalOffset, dword_be)
    Rumble = utilities.GetRegionalAddress(0x2f71ac, RegionalOffset, dword_be)
    Handedness = utilities.GetRegionalAddress(0x2f71b0, RegionalOffset, dword_be)
}
settings = Settings()

class EnemyOffsets {
    Health = 0x2a8
    AltHealth = 0x2ac
}

class Enemy  {
    Health = 0
    AltHealth = 0
    Points = 0
    UseAlt = false
}

class EnemyTypes  {
    Bonus1Boss = Enemy(Points = 2000000)
}

class EnemyList {
    RegionalOffset = region.GetEnemyListPointerOffset()
    Pointer = utilities.GetRegionalAddress(0x33d124, RegionalOffset, dword_be)
    Base = utilities.MaskPointer(Pointer)

    NodeSize = 0x610
    NodeCount = 31
    Offsets = EnemyOffsets()
    Types = EnemyTypes()

    RegionalPointer = 0
    RegionalBase = 0

    function GetRegionalData(code, index) {
        enemy = Enemy()

        this.RegionalPointer = region.GetRegionalEnemyListPointer(code)
        this.RegionalBase = utilities.MaskPointer(this.RegionalPointer)

        enemyBase = this.RegionalBase + (index * this.NodeSize)
        healthAddress = enemyBase + this.Offsets.Health
        altHealthAddress = enemyBase + this.Offsets.AltHealth

        enemy.Health = dword_be(healthAddress)
        enemy.AltHealth = dword_be(altHealthAddress)

        return enemy
    }

    function GetEnemyData(index) {
        enemy = Enemy()

        enemyBase = this.Base + (index * this.NodeSize)
        healthAddress = enemyBase + this.Offsets.Health
        altHealthAddress = enemyBase + this.Offsets.AltHealth

        enemy.Health = dword_be(healthAddress)
        enemy.AltHealth = dword_be(altHealthAddress)

        return enemy
    }
}
enemyList = EnemyList()

class PlayerOffsets {
    Name = 0x16c
    HighScore = 0x18c
    Score = 0x190
    ActionBall = 0x194
    SpeedBallUnlock = 0x198
    ReverseBallUnlock = 0x19c
    SplitBallUnlock = 0x1a0
    TractorBallUnlock = 0x1a4
    BombBallUnlock = 0x1a8
    ParalyzeBallUnlock = 0x1ac
    TrapBallUnlock = 0x1b0
    TractorBallDLC = 0x1c0
    BombBallDLC = 0x1c4
    ParalyzeBallDLC = 0x1c8
    TrapBallDLC = 0x1cc
    ActionBallCooldown = 0x1d0
    Balls = 0x1ec
    ScoreMultiplier = 0x46c
}

class PlayerUnlocks {
    SpeedBall = 0
    ReverseBall = 0
    SplitBall = 0
    TractorBall = 0
    BombBall = 0
    ParalyzeBall = 0
    TrapBall = 0
}

class BallDLC {
    TractorBall = 0
    BombBall = 0
    ParalyzeBall = 0
    TrapBall = 0
}

class PlayerData {
    Name = 0
    HighScore = 0
    Score = 0
    ActionBall = 0
    Unlocks = PlayerUnlocks()
    DLC = BallDLC()
    ActionBallTimer = 0
    Balls = 0
    ScoreMultiplier = 0
}

class ActionBalls {
    Speed = 0x00
    Reverse = 0x01
    Split = 0x02
    Tractor = 0x03
    Bomb = 0x04
    Paralyze = 0x05
    Trap = 0x06
}

class PlayerObject {
    RegionalOffset = region.GetPlayerObjectPointerOffset()
    Pointer = utilities.GetRegionalAddress(0x353128, RegionalOffset, dword_be)
    Base = utilities.MaskPointer(Pointer)

    RegionalPointer = 0
    RegionalBase = 0

    Offsets = PlayerOffsets()

    function GetRegionalData(code) {
        object = PlayerData()

        this.RegionalPointer = region.GetRegionalPlayerObjectPointer(code)
        this.RegionalBase = utilities.MaskPointer(this.RegionalPointer)

        highScoreAddress = this.RegionalBase + this.Offsets.HighScore
        scoreAddress = this.RegionalBase + this.Offsets.Score
        actionBallAddress = this.RegionalBase + this.Offsets.ActionBall
        speedBallUnlockAddress = this.RegionalBase + this.Offsets.SpeedBallUnlock
        reverseBallUnlockAddress = this.RegionalBase + this.Offsets.ReverseBallUnlock
        splitBallUnlockAddress = this.RegionalBase + this.Offsets.SplitBallUnlock
        tractorBallUnlockAddress = this.RegionalBase + this.Offsets.TractorBallUnlock
        bombBallUnlockAddress = this.RegionalBase + this.Offsets.BombBallUnlock
        paralyzeBallUnlockAddress = this.RegionalBase + this.Offsets.ParalyzeBallUnlock
        trapBallUnlockAddress = this.RegionalBase + this.Offsets.TrapBallUnlock
        tractorBallDLCAddress = this.RegionalBase + this.Offsets.TractorBallDLC
        bombBallDLCAddress = this.RegionalBase + this.Offsets.BombBallDLC
        paralyzeBallDLCAddress = this.RegionalBase + this.Offsets.ParalyzeBallDLC
        trapBallDLCAddress = this.RegionalBase + this.Offsets.TrapBallDLC
        actionBallCooldownTimerAddress = this.RegionalBase + this.Offsets.ActionBallCooldown
        ballsAddress = this.RegionalBase + this.Offsets.Balls
        scoreMultiplierAddress = this.RegionalBase + this.Offsets.ScoreMultiplier

        object.HighScore = dword_be(highScoreAddress)
        object.Score = dword_be(scoreAddress)
        object.ActionBall = dword_be(actionBallAddress)
        object.Unlocks.SpeedBall = dword_be(speedBallUnlockAddress)
        object.Unlocks.ReverseBall = dword_be(reverseBallUnlockAddress)
        object.Unlocks.SplitBall = dword_be(splitBallUnlockAddress)
        object.Unlocks.TractorBall = dword_be(tractorBallUnlockAddress)
        object.Unlocks.BombBall = dword_be(bombBallUnlockAddress)
        object.Unlocks.ParalyzeBall = dword_be(paralyzeBallUnlockAddress)
        object.Unlocks.TrapBall = dword_be(trapBallUnlockAddress)
        object.DLC.TractorBall = dword_be(tractorBallDLCAddress)
        object.DLC.BombBall = dword_be(bombBallDLCAddress)
        object.DLC.ParalyzeBall = dword_be(paralyzeBallDLCAddress)
        object.DLC.TrapBall = dword_be(tractorBallDLCAddress)
        object.ActionBallTimer = float_be(actionBallCooldownTimerAddress)
        object.Balls = dword_be(ballsAddress)
        object.ScoreMultiplier = float_be(scoreMultiplierAddress)

        return object
    }

    function GetData() {
        object = PlayerData()

        highScoreAddress = this.Base + this.Offsets.HighScore
        scoreAddress = this.Base + this.Offsets.Score
        actionBallAddress = this.Base + this.Offsets.ActionBall
        speedBallUnlockAddress = this.Base + this.Offsets.SpeedBallUnlock
        reverseBallUnlockAddress = this.Base + this.Offsets.ReverseBallUnlock
        splitBallUnlockAddress = this.Base + this.Offsets.SplitBallUnlock
        tractorBallUnlockAddress = this.Base + this.Offsets.TractorBallUnlock
        bombBallUnlockAddress = this.Base + this.Offsets.BombBallUnlock
        paralyzeBallUnlockAddress = this.Base + this.Offsets.ParalyzeBallUnlock
        trapBallUnlockAddress = this.Base + this.Offsets.TrapBallUnlock
        tractorBallDLCAddress = this.Base + this.Offsets.TractorBallDLC
        bombBallDLCAddress = this.Base + this.Offsets.BombBallDLC
        paralyzeBallDLCAddress = this.Base + this.Offsets.ParalyzeBallDLC
        trapBallDLCAddress = this.Base + this.Offsets.TrapBallDLC
        actionBallCooldownTimerAddress = this.Base + this.Offsets.ActionBallCooldown
        ballsAddress = this.Base + this.Offsets.Balls
        scoreMultiplierAddress = this.Base + this.Offsets.ScoreMultiplier

        object.HighScore = dword_be(highScoreAddress)
        object.Score = dword_be(scoreAddress)
        object.ActionBall = dword_be(actionBallAddress)
        object.Unlocks.SpeedBall = dword_be(speedBallUnlockAddress)
        object.Unlocks.ReverseBall = dword_be(reverseBallUnlockAddress)
        object.Unlocks.SplitBall = dword_be(splitBallUnlockAddress)
        object.Unlocks.TractorBall = dword_be(tractorBallUnlockAddress)
        object.Unlocks.BombBall = dword_be(bombBallUnlockAddress)
        object.Unlocks.ParalyzeBall = dword_be(paralyzeBallUnlockAddress)
        object.Unlocks.TrapBall = dword_be(trapBallUnlockAddress)
        object.DLC.TractorBall = dword_be(tractorBallDLCAddress)
        object.DLC.BombBall = dword_be(bombBallDLCAddress)
        object.DLC.ParalyzeBall = dword_be(paralyzeBallDLCAddress)
        object.DLC.TrapBall = dword_be(tractorBallDLCAddress)
        object.ActionBallTimer = float_be(actionBallCooldownTimerAddress)
        object.Balls = dword_be(ballsAddress)
        object.ScoreMultiplier = float_be(scoreMultiplierAddress)

        return object
    }
}
playerObject = PlayerObject()

class Stage1Events {
    // Bonus Portal
    BonusPortalItem1 = 0
    BonusPortalItem2 = 0
    BonusPortalItem3 = 0
    BonusPortalItem4 = 0
    BonusPortalItem5 = 0
    BonusPortalItem6 = 0
    BonusPortalItem7 = 0
    BonusPortalItem8 = 0
    BonusVisited = 0
    BonusBossTriggered = 0

    // Bonus Rate
    RateUpTrigger1 = 0
    RateUpTrigger2 = 0
    RateUpTrigger3 = 0
    RateUpGate1 = 0
    RateUpGate2 = 0
    RateUpGate3 = 0
    RateUpTriggered = 0
    RateUpAchieved = 0

    // Multi Ball
    MultiBallTrigger1 = 0
    MultiBallTrigger2 = 0
    MultiBallTrigger3 = 0
    MultiBallGate1 = 0
    MultiBallGate2 = 0
    MultiBallGate3 = 0

    // Point Worms
    Worm1 = 0
    Worm2 = 0
    Worm3 = 0
    WormGate1 = 0
    WormGate2 = 0
    WormGate3 = 0
}

class StageEvents {
    RegionalOffset = region.GetStageEventsOffset()
    
    function GetStage1Events() {
        events = Stage1Events()

        events.BonusPortalItem1 = utilities.GetRegionalAddress(0x3640c0, RegionalOffset, bit0)
        events.BonusPortalItem2 = utilities.GetRegionalAddress(0x3640c0, RegionalOffset, bit1)
        events.BonusPortalItem3 = utilities.GetRegionalAddress(0x3640c0, RegionalOffset, bit2)
        events.BonusPortalItem4 = utilities.GetRegionalAddress(0x3640c1, RegionalOffset, bit3)
        events.BonusPortalItem4 = utilities.GetRegionalAddress(0x3640c1, RegionalOffset, bit4)
        events.BonusPortalItem4 = utilities.GetRegionalAddress(0x3640c1, RegionalOffset, bit5)
        events.BonusPortalItem4 = utilities.GetRegionalAddress(0x3640c1, RegionalOffset, bit6)
        events.BonusPortalItem4 = utilities.GetRegionalAddress(0x3640c1, RegionalOffset, bit7)
        events.BonusVisited = utilities.GetRegionalAddress(0x3640c7, RegionalOffset, bit1)
        events.BonusBossTriggered = utilities.GetRegionalAddress(0x364243, RegionalOffset, bit1)

        events.RateUpTrigger1 = utilities.GetRegionalAddress(0x3640c2, RegionalOffset, bit0)
        events.RateUpTrigger2 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit6)
        events.RateUpTrigger3 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit7)
        events.RateUpGate1 = utilities.GetRegionalAddress(0x3640c6, RegionalOffset, bit1)
        events.RateUpGate2 = utilities.GetRegionalAddress(0x3640c6, RegionalOffset, bit2)
        events.RateUpGate3 = utilities.GetRegionalAddress(0x3640c6, RegionalOffset, bit3)
        events.RateUpTriggered = utilities.GetRegionalAddress(0x3640c6, RegionalOffset, bit6)
        events.RateUpAchieved = utilities.GetRegionalAddress(0x3640c6, RegionalOffset, bit5)

        events.MultiBallTrigger1 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit3)
        events.MultiBallTrigger2 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit4)
        events.MultiBallTrigger3 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit5)
        events.MultiBallGate1 = utilities.GetRegionalAddress(0x3640c7, RegionalOffset, bit6)
        events.MultiBallGate2 = utilities.GetRegionalAddress(0x3640c7, RegionalOffset, bit7)
        events.MultiBallGate3 = utilities.GetRegionalAddress(0x3640c6, RegionalOffset, bit0)

        events.Worm1 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit0)
        events.Worm2 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit1)
        events.Worm3 = utilities.GetRegionalAddress(0x3640c3, RegionalOffset, bit2)
        events.WormGate1 = utilities.GetRegionalAddress(0x3640c7, RegionalOffset, bit3)
        events.WormGate2 = utilities.GetRegionalAddress(0x3640c7, RegionalOffset, bit4)
        events.WormGate3 = utilities.GetRegionalAddress(0x3640c7, RegionalOffset, bit5)
    }
}
stageEvents = StageEvents()

class GameStates {
    NewGame = 0x0000
    Retried = 0x0002
    NextStage = 0x0003
    Bonus = 0x0004
    BonusComplete = 0x0005
}

class ScreenIDRange {
    Start = 0
    End = 0
}

class ScreenIDs {
    Loading = ScreenIDRange(0, 2)
    Tutorial = ScreenIDRange(3, 4)
    Start = ScreenIDRange(4, 5)
    Playing = ScreenIDRange(6, 6)
    BallSunk = ScreenIDRange(7, 7)
    GameOver = ScreenIDRange(8, 8)
    End = ScreenIDRange(9, 13)
    Quit = ScreenIDRange(14, 15)
    Save = ScreenIDRange(16, 18)
    Title = ScreenIDRange(19, 19)
}

class GameState {
    RegionalOffset = region.GetGameStateOffset()
    ScreenID = utilities.GetRegionalAddress(0x4d8de0, RegionalOffset, byte)
    ID = utilities.GetRegionalAddress(0x4d8dec, RegionalOffset, dword_be)
    StageTime = utilities.GetRegionalAddress(0x4d8df8, RegionalOffset, dword_be)

    States = GameStates()
    ScreenIDs = ScreenIDs()
}
gameState = GameState()

class AchievementHelpers {
    function AchievedScore(points) {
        playerData = playerObject.GetData()
        return prev(playerData.Score) < points &&
            playerData.Score >= points
    }

    function AchievedRegionalScore(code, points) {
        playerData = playerObject.GetRegionalData(code)
        return 
        (
            region.IsRegion(code) &&
            prev(playerData.Score) < points && 
            playerData.Score >= points
        )
    }

    function ReachedRegionalScore(code, score) {
        playerData = playerObject.GetRegionalData(code)
        return (region.IsRegion(code) &&
            playerData.Score >= score)
    }

    function GainedPointAmount(value) {
        playerData = playerObject.GetData()
        return playerData.Score == prev(playerData.Score) + value
    }

    function GainedRegionalPointAmount(code, value) {
        playerData = playerObject.GetRegionalData(code)
        return (region.IsRegion(code) &&
            playerData.Score == (prev(playerData.Score) + value))
    }

    function EnemyIsActive(index) {
        enemy = enemyList.GetEnemyData(index)
        return enemy.Type != 0xffffffff
    }

    function EnemyWasDefeated(index, useAlt) {
        enemy = enemyList.GetEnemyData(index)

        health = enemy.Health
        if (useAlt)
            health = enemy.AltHealth

        return prev(health) > 0 && health <= 0
    }

    function MessageWasDisplayed(messageIndex) {
        return stageState.EventTextFlag != 0xffffffff &&
            stageState.EventTextIndex == messageIndex &&
            prev(stageState.EventTextTimer) > 0 &&
            prev(stageState.EventTextTimer) < stageState.EventTextTimer
    }

    function GetCurrentStage(mode) {
        stage = settings.StoryModeStage
        if (mode == 1)
            stage = settings.ArcadeModeStage
        return stage
    }

    function IsPlayingStageByMode(mode, stage) {
        currentStage = this.GetCurrentStage(mode)
        return currentStage == stage
    }

    function IsPlayingStageAnyMode(stage) {
        return 
        (
            (settings.Mode == settings.Modes.Story && settings.StoryModeStage == stage) || 
            (settings.Mode == settings.Modes.Arcade && settings.ArcadeModeStage == stage)
        )
    }

    function StageWasCleared(stage, challenge = false) {
        trigger = prev(stageState.StageClearFlag) == 0 &&
            stageState.StageClearFlag == 1

        if (challenge)
            trigger = trigger_when(trigger)

        return settings.Mode == settings.Modes.Story &&
            settings.StoryModeStage == stage &&
            trigger
    }

    function RegionalPlayerLostBall(code) {
        playerData = playerObject.GetRegionalData(code)
        return gameState.ScreenID == gameState.ScreenIDs.Playing.Start &&
            region.IsRegion(code) &&
            playerData.Balls < prev(playerData.Balls)
    }

    function IsInGame() {
        enemyListPointer = enemyList.Pointer
        return enemyListPointer != 0 
    }

    function IsInGameByRegion(code) {
        enemyListPointer = region.GetRegionalEnemyListPointer(code)
        return region.IsRegion(code) &&
            enemyListPointer != 0
    }

    function NotInGameByRegion(code) {
        enemyListPointer = region.GetRegionalEnemyListPointer(code)
        return region.IsRegion(code) &&
            enemyListPointer == 0
    }

    function IsInGameAnyRegion() {
        return (this.IsInGameByRegion(region.US) || this.IsInGameByRegion(region.EU) || this.IsInGameByRegion(region.JP))
    }

    function NotInGameAnyRegion() {
        return (this.NotInGameByRegion(region.US) || this.NotInGameByRegion(region.EU) || this.NotInGameByRegion(region.JP))
    }

    function IsInBonus() {
        return gameState.ID == gameState.States.Bonus
    }
}
helpers = AchievementHelpers()

class AchievementTriggers {
    function TriggeredStageMultiBall(stage) {
        return helpers.IsInGameAnyRegion() &&
            helpers.IsPlayingStageAnyMode(stage) &&
            helpers.MessageWasDisplayed(stageState.Messages.MultiBall)
    }

    function TriggeredStageRateUP(stage) {
        return helpers.IsInGameAnyRegion() &&
            helpers.IsPlayingStageAnyMode(stage) &&
            helpers.MessageWasDisplayed(stageState.Messages.RateUp)
    }

    function TriggeredStageWipedOut(stage) {
        return helpers.IsInGameAnyRegion() &&
            helpers.IsPlayingStageAnyMode(stage) &&
            helpers.MessageWasDisplayed(stageState.Messages.WipedOut)
    }

    function TriggeredStageUpPost(stage) {
        return helpers.IsInGameAnyRegion() &&
            helpers.IsPlayingStageAnyMode(stage) &&
            helpers.MessageWasDisplayed(stageState.Messages.UpPost)
    }

    function TriggeredExtraBall() {
        return helpers.IsInGameAnyRegion() &&
            helpers.MessageWasDisplayed(stageState.Messages.ExtraBall)
    }

    function StoryStageClearedOnDifficulty(stage, difficulty, challenge = false) {
        regionCheck = helpers.IsInGameAnyRegion()
        if (challenge)
            regionCheck = (regionCheck || (this.ResetStageChallenge(stage)))
        return regionCheck &&
            settings.Difficulty >= difficulty &&
            helpers.StageWasCleared(stage, challenge)
    }

    function DefeatedBonusBoss(stage) {
        points = enemyList.Types.Bonus1Boss.Points
        return helpers.IsInGameAnyRegion() &&
            helpers.IsInBonus() &&
            settings.Difficulty >= settings.Difficulties.Normal &&
            helpers.IsPlayingStageAnyMode(stage) &&
            (
                helpers.GainedRegionalPointAmount(region.US, points) || 
                helpers.GainedRegionalPointAmount(region.EU, points) || 
                helpers.GainedRegionalPointAmount(region.JP, points)
            )
    }

    function StoryStageClearedWithoutLosingBall(stage) {
        return this.StoryStageClearedOnDifficulty(stage, settings.Difficulties.Normal, true) &&
            disable_when(settings.Mode == settings.Modes.Story && settings.StoryModeStage == stage && helpers.MessageWasDisplayed(stageState.Messages.BallLost))
    }

    function ClearedGameWithHighscore(score) {
        return this.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Normal) &&
            (
                helpers.ReachedRegionalScore(region.US, score) ||
                helpers.ReachedRegionalScore(region.EU, score) ||
                helpers.ReachedRegionalScore(region.JP, score)
            )
    }

    function AchievedArcadeScoreOnStage(stage, score) {
        return helpers.IsInGameAnyRegion() &&
            settings.Mode == settings.Modes.Arcade &&
            settings.ArcadeModeStage == stage &&
            (
                helpers.AchievedRegionalScore(region.US, score) ||
                helpers.AchievedRegionalScore(region.EU, score) ||
                helpers.AchievedRegionalScore(region.JP, score)
            )
    }

    function ResetStageChallenge(stage) {
        return never(settings.StoryModeStage != stage) && 
            never(gameState.ScreenID == gameState.ScreenIDs.GameOver.Start) &&
            never(helpers.NotInGameByRegion(region.US)) &&
            never(helpers.NotInGameByRegion(region.EU)) &&
            never(helpers.NotInGameByRegion(region.JP))
    }
}
triggers = AchievementTriggers()

// Stage 1 Progression

achievement("Not Rocket Science", "While playing Story Mode, clear Stage 1 on Easy difficulty or higher", points = 1, id = 580766,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.One, settings.Difficulties.Easy)
)
achievement("The Sky's The Limit", "While playing Story Mode, clear Stage 1 on Normal difficulty or higher", type = "progression", points = 3, id = 580767,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.One, settings.Difficulties.Normal)
)
achievement("Over the Moon", "While playing Story Mode, clear Stage 1 on Hard difficulty", points = 5, id = 580768,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.One, settings.Difficulties.Hard)
)

// Stage 1 Challenges

achievement("A Rising Star", "While playing Story Mode, clear Stage 1 without losing a ball on Normal difficulty or higher", points = 5, id = 580769,
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.One)
)
achievement("Space Balls", "While Story or Arcade Mode, activate a Multi Ball on Stage 1", points = 4, id = 580770,
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.One)
)
achievement("To Infinity", "While Story or Arcade Mode, activate a Rate UP bonus on Stage 1", points = 4,  id = 580771,
    trigger = triggers.TriggeredStageRateUP(settings.Stages.One)
)
achievement("Bugging Out", "While Story or Arcade Mode, enter the Bonus Room on Stage 1 and defeat the Scorpion Alien", points = 10, id = 580772,
    trigger = triggers.DefeatedBonusBoss(settings.Stages.One)
)

// Stage 2 Progression

achievement("Down To Earth", "While playing Story Mode, clear Stage 2 on Easy difficulty or higher", points = 1, id = 580773,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Two, settings.Difficulties.Easy)
)
achievement("Well Oiled Machine", "While playing Story Mode, clear Stage 2 on Normal difficulty or higher", type = "progression", points = 3, id = 580774,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Two, settings.Difficulties.Normal)
)
achievement("Light Years Ahead", "While playing Story Mode, clear Stage 2 on Hard difficulty", points = 5, id = 580775,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Two, settings.Difficulties.Hard)
)

// Stage 2 Challenges

achievement("No Soldier Left Behind", "While playing Story Mode, clear Stage 2 without losing a ball on Normal difficulty or higher", points = 5, id = 580776,
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.Two)
)
achievement("A Whole New Ball Game", "While Story or Arcade Mode, activate a Multi Ball on Stage 2", points = 4, id = 580777,
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.Two)
)
achievement("Stacks on Stacks", "While Story or Arcade Mode, activate a Rate UP bonus on Stage 2", points = 4, id = 580778,
    trigger = triggers.TriggeredStageRateUP(settings.Stages.Two)
)
achievement("Clean Plate Club", "While Story or Arcade Mode, activate a Wiped Out bonus on Stage 2", points = 4, id = 580779,
    trigger = triggers.TriggeredStageWipedOut(settings.Stages.Two)
)
achievement("Fire Bug", "While Story or Arcade Mode, enter the Bonus Room on Stage 2 and defeat the Scorpion Alien", points = 10, id = 580780,
    trigger = triggers.DefeatedBonusBoss(settings.Stages.Two)
)

// Boss Stage 1 Progression

achievement("Cosmic Sweep", "While playing Story Mode, clear Boss Stage 1 on Easy difficulty or higher", points = 1, id = 580781,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossOne, settings.Difficulties.Easy)
)
achievement("Interstellar Upset", "While playing Story Mode, clear Boss Stage 1 on Normal difficulty or higher", type = "progression", points = 3, id = 580782,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossOne, settings.Difficulties.Normal)
)
achievement("Deep Space Defeat", "While playing Story Mode, clear Boss Stage 1 on Hard difficulty", points = 5, id = 580783,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossOne, settings.Difficulties.Hard)
)

// Boss Stage 1 Challenges

achievement("Luminary Laurels", "While playing Story Mode, clear Boss Stage 1 without losing a ball on Normal difficulty or higher", points = 5, id = 580784,
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.BossOne)
)

// Stage 3 Progression

achievement("Safe Space", "While playing Story Mode, clear Stage 3 on Easy difficulty or higher", points = 1, id = 580785,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Three, settings.Difficulties.Easy)
)
achievement("Written in the Stars", "While playing Story Mode, clear Stage 3 on Normal difficulty or higher", type = "progression", points = 3, id = 580786,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Three, settings.Difficulties.Normal)
)
achievement("Blood Moon", "While playing Story Mode, clear Stage 3 on Hard difficulty", points = 5, id = 580787,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Three, settings.Difficulties.Hard)
)

// Stage 3 Challenges

achievement("Supernova Success", "While playing Story Mode, clear Stage 3 without losing a ball on Normal difficulty or higher", points = 5, id = 580788,
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.Three)
)
achievement("Belle of the Balls", "While Story or Arcade Mode, activate a Multi Ball on Stage 3", points = 4, id = 580789,
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.Three)
)
achievement("On Tilt", "While Story or Arcade Mode, activate a Rate UP bonus on Stage 3", points = 4, id = 580790,
    trigger = triggers.TriggeredStageRateUP(settings.Stages.Three)
)
achievement("Flipping Hell", "While Story or Arcade Mode, activate an Up Post bonus on Stage 3", points = 4, id = 580791,
    trigger = triggers.TriggeredStageUpPost(settings.Stages.Three)
)
achievement("Catch the Bug", "While Story or Arcade Mode, enter the Bonus Room on Stage 3 and defeat the Scorpion Alien", points = 10, id = 580792,
    trigger = triggers.DefeatedBonusBoss(settings.Stages.Three)
)

// Boss Stage 2 Progression

achievement("Celestial Supremacy", "While playing Story Mode, clear Boss Stage 2 on Easy difficulty or higher", points = 1, id = 580793,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Easy)
)
achievement("Infinite Upper Hand", "While playing Story Mode, clear Boss Stage 2 on Normal difficulty or higher", type = "win_condition", points = 3, id = 580794,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Normal)
)
achievement("Galactic Domination", "While playing Story Mode, clear Boss Stage 2 on Hard difficulty", points = 5, id = 580795,
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Hard)
)

// Boss Stage 2 Challenges

achievement("Starlet Spoils", "While playing Story Mode, clear Boss Stage 2 without losing a ball on Normal difficulty or higher", points = 10, id = 580796,
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.BossTwo)
)
achievement("Ball Breaker", "While playing Story Mode, activate a Multi Ball on Boss Stage 2", points = 4, id = 580797,
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.BossTwo)
)

// Story Mode Challenges

achievement("Would You Like to Know More?", "While playing Story Mode, clear all stages with 30 million points or more on Normal difficulty or higher", points = 10, id = 580798,
    trigger = triggers.ClearedGameWithHighscore(30000000)
)

// Arcade Mode Challenges

achievement("The Heavens", "While playing Arcade Mode, score 10 million points or more on Stage 1", points = 10, id = 580799,
    trigger = triggers.AchievedArcadeScoreOnStage(settings.Stages.One, 10000000)
)
achievement("The Universe", "While playing Arcade Mode, score 10 million points or more on Stage 2", points = 10, id = 580800,
    trigger = triggers.AchievedArcadeScoreOnStage(settings.Stages.Two, 10000000)
)
achievement("The Void", "While playing Arcade Mode, score 10 million points or more on Stage 3", points = 10, id = 580801,
    trigger = triggers.AchievedArcadeScoreOnStage(settings.Stages.Three, 10000000)
)

// General Challenges

achievement("Once in a Blue Moon", "While playing Story or Arcade Mode, gain an Extra Ball", points = 4, id = 580802,
    trigger = triggers.TriggeredExtraBall()
)

// Leaderboards

class LeaderboardTriggers {
    function StoryStart(difficulty) {
        return helpers.IsInGameAnyRegion() &&
            settings.Mode == settings.Modes.Story &&
            settings.Difficulty == difficulty &&
            (
                gameState.ScreenID == gameState.ScreenIDs.GameOver.Start ||
                (
                    prev(stageState.StageClearFlag) == 0 &&
                    stageState.StageClearFlag == 1 &&
                    settings.StoryModeStage == settings.Stages.BossTwo
                )
            )
    }

    function ArcadeStart(stage) {
        return helpers.IsInGameAnyRegion() &&
            settings.Mode == settings.Modes.Arcade &&
            settings.ArcadeModeStage == stage &&
            gameState.ScreenID == gameState.ScreenIDs.GameOver.Start
    }

    function GetScore() {
        usPlayerData = playerObject.GetRegionalData(region.US)
        euPlayerData = playerObject.GetRegionalData(region.EU)
        jpPlayerData = playerObject.GetRegionalData(region.JP)

        return max_of (
            measured(usPlayerData.Score, region.IsRegion(region.US)),
            measured(euPlayerData.Score, region.IsRegion(region.EU)),
            measured(jpPlayerData.Score, region.IsRegion(region.JP))
        )
    }
}
leaderboardTriggers = LeaderboardTriggers()

leaderboard("Story Mode - Easy Score Attack", "While playing Story Mode on Easy, get the highest score possible before getting a game over or beating the game",
    start = leaderboardTriggers.StoryStart(settings.Difficulties.Easy),
    cancel = always_false(),
    submit = always_true(),
    value = leaderboardTriggers.GetScore()
)

leaderboard("Story Mode - Normal Score Attack", "While playing Story Mode on Normal, get the highest score possible before getting a game over or beating the game",
    start = leaderboardTriggers.StoryStart(settings.Difficulties.Normal),
    cancel = always_false(),
    submit = always_true(),
    value = leaderboardTriggers.GetScore()
)

leaderboard("Story Mode - Hard Score Attack", "While playing Story Mode on Hard, get the highest score possible before getting a game over or beating the game",
    start = leaderboardTriggers.StoryStart(settings.Difficulties.Hard),
    cancel = always_false(),
    submit = always_true(),
    value = leaderboardTriggers.GetScore()
)

leaderboard("Arcade Mode - Stage 1 Score Attack", "While playing Stage 1 on Arcade Mode, get the highest score possible before getting a game over",
    start = leaderboardTriggers.ArcadeStart(settings.Stages.One),
    cancel = always_false(),
    submit = always_true(),
    value = leaderboardTriggers.GetScore()
)

leaderboard("Arcade Mode - Stage 2 Score Attack", "While playing Stage 2 on Arcade Mode, get the highest score possible before getting a game over",
    start = leaderboardTriggers.ArcadeStart(settings.Stages.Two),
    cancel = always_false(),
    submit = always_true(),
    value = leaderboardTriggers.GetScore()
)

leaderboard("Arcade Mode - Stage 3 Score Attack", "While playing Stage 3 on Arcade Mode, get the highest score possible before getting a game over",
    start = leaderboardTriggers.ArcadeStart(settings.Stages.Three),
    cancel = always_false(),
    submit = always_true(),
    value = leaderboardTriggers.GetScore()
)

// Rich Presence

class RichPresenceHelpers {
    function GetBalls() {
        usPlayerData = playerObject.GetRegionalData(region.US)
        euPlayerData = playerObject.GetRegionalData(region.EU)
        jpPlayerData = playerObject.GetRegionalData(region.JP)

        return max_of (
            measured(usPlayerData.Balls, region.IsRegion(region.US)),
            measured(euPlayerData.Balls, region.IsRegion(region.EU)),
            measured(jpPlayerData.Balls, region.IsRegion(region.JP))
        )
    }

    function GetStage() {
        return max_of(measured(settings.StoryModeStage, settings.Mode == settings.Modes.Story), measured(settings.ArcadeModeStage, settings.Mode == settings.Modes.Arcade))
    }
}
richPresenceHelpers = RichPresenceHelpers()

rich_presence_conditional_display(helpers.NotInGameAnyRegion(), "{0} Preparing for the Alien Invasion",
    rich_presence_lookup("Region", region.GetValue(), region.Lookup, "☄️")
)

rich_presence_conditional_display(helpers.IsInGameAnyRegion(), "{0} Fighting the Alien Invaders on {1} | {2} | ⚪ x {3} | 🔔 {4}",
    rich_presence_lookup("Region", region.GetValue(), region.Lookup, "☄️"),
    rich_presence_lookup("Mode", settings.Mode, settings.ModeLookup),
    rich_presence_lookup("Stage", richPresenceHelpers.GetStage(), settings.StageLookup),
    rich_presence_value("Balls", richPresenceHelpers.GetBalls()),
    rich_presence_value("Score", leaderboardTriggers.GetScore())
)

rich_presence_display("{0} Playing Alien Crush Returns",
    rich_presence_lookup("Region", region.GetValue(), region.Lookup, "☄️")
)