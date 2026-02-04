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
        1: "US",
        10: "EU",
        100: "JP"
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

    StoryModeStage = utilities.GetRegionalAddress(0x2f2e5c, RegionalOffset, dword_be)
    ArcadeModeStage = utilities.GetRegionalAddress(0x2f2e60, RegionalOffset, dword_be)
    Stages = Stages()

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

    function StageWasCleared(stage) {
        return settings.Mode == settings.Modes.Story &&
            settings.StoryModeStage == stage &&
            prev(stageState.StageClearFlag) == 0 &&
            stageState.StageClearFlag == 1
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

    function IsInGameAnyRegion() {
        return (this.IsInGameByRegion(region.US) || this.IsInGameByRegion(region.EU) || this.IsInGameByRegion(region.JP))
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
            helpers.StageWasCleared(stage)
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
            disable_when(settings.StoryModeStage == stage && helpers.RegionalPlayerLostBall(region.US)) &&
            disable_when(settings.StoryModeStage == stage && helpers.RegionalPlayerLostBall(region.EU)) &&
            disable_when(settings.StoryModeStage == stage && helpers.RegionalPlayerLostBall(region.JP))
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
            never(gameState.ScreenID == gameState.ScreenIDs.GameOver.Start)
    }
}
triggers = AchievementTriggers()

// Stage 1 Progression

achievement("Clear Stage 1 - Easy", "While playing Story Mode, clear Stage 1 on Easy difficulty or higher", points = 1, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.One, settings.Difficulties.Easy)
)
achievement("Clear Stage 1 - Normal", "While playing Story Mode, clear Stage 1 on Normal difficulty or higher", type = "progression", points = 3, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.One, settings.Difficulties.Normal)
)
achievement("Clear Stage 1 - Hard", "While playing Story Mode, clear Stage 1 on Hard difficulty", points = 5, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.One, settings.Difficulties.Hard)
)

// Stage 1 Challenges

achievement("Clear Stage 1 - Ball Challenge", "While playing Story Mode, clear Stage 1 on Normal difficulty or higher withour losing a ball", points = 5, 
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.One)
)
achievement("Stage 1 - Multi Ball!", "While playing Stage 1 on any mode, activate a Multi Ball on Normal difficulty or higher", points = 3, 
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.One)
)
achievement("Stage 1 - Rate UP!", "While playing Stage 1 on any mode, activate a Rate UP bonus on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageRateUP(settings.Stages.One)
)
achievement("Defeated Bonus 1 Boss", "while playing Stage 1 on any mode, defeat the sub-boss on Bonus Stage 1", points = 10, 
    trigger = triggers.DefeatedBonusBoss(settings.Stages.One)
)

// Stage 2 Progression

achievement("Clear Stage 2 - Easy", "While playing Story Mode, clear Stage 2 on Easy difficulty or higher", points = 1, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Two, settings.Difficulties.Easy)
)
achievement("Clear Stage 2 - Normal", "While playing Story Mode, clear Stage 2 on Normal difficulty or higher", type = "progression", points = 3, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Two, settings.Difficulties.Normal)
)
achievement("Clear Stage 2 - Hard", "While playing Story Mode, clear Stage 2 on Hard difficulty", points = 5, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Two, settings.Difficulties.Hard)
)

// Stage 2 Challenges

achievement("Clear Stage 2 - Ball Challenge", "While playing Story Mode, clear Stage 2 on Normal difficulty or higher withour losing a ball", points = 5, 
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.Two)
)
achievement("Stage 2 - Multi Ball!", "While playing Stage 2 on any mode, activate a Multi Ball on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.Two)
)
achievement("Stage 2 - Rate Up!", "While playing Stage 2 on any mode, activate a Rate Up bonus on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageRateUP(settings.Stages.Two)
)
achievement("Stage 2 - Wiped Out!", "While playing Stage 2 on any mode, activate a Wiped Out bonus on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageWipedOut(settings.Stages.Two)
)

// Boss Stage 1 Progression

achievement("Clear Boss 1 - Easy", "While playing Story Mode, clear Boss Stage 1 on Easy difficulty or higher", points = 1, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossOne, settings.Difficulties.Easy)
)
achievement("Clear Boss 1 - Normal", "While playing Story Mode, clear Boss Stage 1 on Normal difficulty or higher", type = "progression", points = 3, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossOne, settings.Difficulties.Normal)
)
achievement("Clear Boss 1 - Hard", "While playing Story Mode, clear Boss Stage 1 on Hard difficulty", points = 5, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossOne, settings.Difficulties.Hard)
)

// Boss Stage 1 Challenges

achievement("Clear Boss 1 - Ball Challenge", "While playing Story Mode, clear Boss Stage 1 on Normal difficulty or higher withour losing a ball", points = 5, 
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.BossOne)
)

// Stage 3 Progression

achievement("Clear Stage 3 - Easy", "While playing Story Mode, clear Stage 3 on Easy difficulty or higher", points = 1, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Three, settings.Difficulties.Easy)
)
achievement("Clear Stage 3 - Normal", "While playing Story Mode, clear Stage 3 on Normal difficulty or higher", type = "progression", points = 3, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Three, settings.Difficulties.Normal)
)
achievement("Clear Stage 3 - Hard", "While playing Story Mode, clear Stage 3 on Hard difficulty", points = 5, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.Three, settings.Difficulties.Hard)
)

// Stage 3 Challenges

achievement("Clear Stage 3 - Ball Challenge", "While playing Story Mode, clear Stage 3 on Normal difficulty or higher withour losing a ball", points = 5, 
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.Three)
)
achievement("Stage 3 - Multi Ball!", "While playing Stage 3 on any mode, activate a Multi Ball on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.Three)
)
achievement("Stage 3 - Rate Up!", "While playing Stage 3 on any mode, activate a Rate Up bonus on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageRateUP(settings.Stages.Three)
)
achievement("Stage 3 - Up Post!", "While playing Stage 3 on any mode, activate a Wiped Out bonus on Normal difficulty or higher", points = 4, 
    trigger = triggers.TriggeredStageUpPost(settings.Stages.Three)
)
achievement("Defeated Bonus 2 Boss", "While playing Stage 3 on any mode, defeat the sub-boss on Bonus Stage 2", points = 10, 
    trigger = triggers.DefeatedBonusBoss(settings.Stages.Three)
)

// Boss Stage 2 Progression

achievement("Clear Boss 2 - Easy", "While playing Story Mode, clear Boss Stage 2 on Easy difficulty or higher", points = 1, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Easy)
)
achievement("Clear Boss 2 - Normal", "While playing Story Mode, clear Boss Stage 2 on Normal difficulty or higher", type = "win_condition", points = 3, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Normal)
)
achievement("Clear Boss 2 - Hard", "While playing Story Mode, clear Boss Stage 2 on Hard difficulty", points = 5, 
    trigger = triggers.StoryStageClearedOnDifficulty(settings.Stages.BossTwo, settings.Difficulties.Hard)
)

// Boss Stage 2 Challenges

achievement("Clear Boss 2 - Ball Challenge", "While playing Story Mode, clear Boss Stage 2 on Normal difficulty or higher withour losing a ball", points = 5, 
    trigger = triggers.StoryStageClearedWithoutLosingBall(settings.Stages.BossTwo)
)
achievement("Boss 2 - Multi Ball!", "While playing Story Mode, activate a Multi Ball on Boss Stage 2", points = 4,
    trigger = triggers.TriggeredStageMultiBall(settings.Stages.BossTwo)
)

// Story Mode Challenges

achievement("Cleared Game - High Score", "While playing Story Mode, clear all stages with 30 million points or more on Normal difficulty or higher", points = 10, 
    trigger = triggers.ClearedGameWithHighscore(30000000)
)

// Arcade Mode Challenges

achievement("Arcade High Score - Stage 1", "While playing Arcade Mode, score 10 million points or more on Stage 1", points = 5, 
    trigger = triggers.AchievedArcadeScoreOnStage(settings.Stages.One, 10000000)
)
achievement("Arcade High Score - Stage 2", "While playing Arcade Mode, score 10 million points or more on Stage 2", points = 5, 
    trigger = triggers.AchievedArcadeScoreOnStage(settings.Stages.Two, 10000000)
)
achievement("Arcade High Score - Stage 3", "While playing Arcade Mode, score 10 million points or more on Stage 3", points = 5, 
    trigger = triggers.AchievedArcadeScoreOnStage(settings.Stages.Three, 10000000)
)

// General Challenges

achievement("Extra Ball!", "While playing any mode, gain an Extra Ball", points = 3, 
    trigger = triggers.TriggeredExtraBall()
)

// Rich Presence

rich_presence_display("Region: {0} | Event Text Index: {1}",
    rich_presence_lookup("Region", region.GetValue(), region.Lookup),
    rich_presence_value("StateClear", playerObject.Base)
)