// Alien Crush Returns
// #ID = 34728
// Author: BacklogOddy

// #region Classes

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

    function GetPlayerObjectPointerOffset() {
        euOffset = 0x7a0
        jpOffset = -0x520
        return this.GetRegionalOffset(euOffset, jpOffset)
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

class StageState {
    RegionalOffset = region.GetStageStateOffset()

    StageTextIndex = utilities.GetRegionalAddress(0x2f2e10, RegionalOffset, dword_be)
    EventTextFlag = utilities.GetRegionalAddress(0x2f2e20, RegionalOffset, dword_be)
    EventTextTimer = utilities.GetRegionalAddress(0x2f2e28, RegionalOffset, float_be)
    EventTextIndex = utilities.GetRegionalAddress(0x2f2e2c, RegionalOffset, dword_be)
    GameOverTextIndex = utilities.GetRegionalAddress(0x2f2e40, RegionalOffset, dword_be)
    StageClearFlag = utilities.GetRegionalAddress(0x2f2e48, RegionalOffset, dword_be)
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

    function GetCurrentStage(mode) {
        stage = this.StoryModeStage
        if (mode == 1)
            stage = this.ArcadeModeStage
        return stage
    }
}
settings = Settings()

class MessageValues {
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

class Message {
    Values = MessageValues()

    function Displayed(value) {
        return stateState.EventTextFlag != 0xffffffff &&
            stageState.EventTextIndex == value &&
            prev(stageState.EventTextTimer) > 0 &&
            prev(stageState.EventTextTimer) < this.Timer
    }
}
message = Message()

class EnemyOffsets {
    Health = 0x2a8
    AltHealth = 0x2ac
}

class EnemyTypes  {
    Bonus1Boss = Enemy(Points = 2000000)
}

class Enemy  {
    Health = 0
    AltHealth = 0
    Points = 0
    UseAlt = false
}

class EnemyList {
    RegionalOffset = utilities.GetEnemyListPointerOffset()
    Pointer = utilities.GetRegionalAddress(0x33d124, RegionalOffset, dword_be)
    Base = utilities.MaskPointer(Pointer)

    NodeSize = 0x610
    NodeCount = 31
    Offsets = EnemyOffsets()
    Types = EnemyTypes()

    function GetEnemyData(index) {
        enemy = Enemy()

        enemyBase = this.Base + (index * this.NodeSize)
        healthAddress = enemyBase + this.Offsets.Health
        altHealthAddress = enemyBase + this.Offsets.AltHealth

        enemy.Health = dword_be(healthAddress)
        enemy.AltHealth = dword_be(altHealthAddress)

        return enemy
    }

    function EnemyIsActive(index) {
        enemy = this.GetEnemyData(index)
        return enemy.Type != 0xffffffff
    }

    function EnemyWasDefeated(index, useAlt) {
        enemy = this.GetEnemyData(index)

        health = enemy.Health
        if (useAlt)
            health = enemy.AltHealth

        return prev(health) > 0 && health <= 0
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

class PlayerObject {
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

class Player {
    RegionalOffset = utilities.GetPlayerObjectPointerOffset()
    Pointer = utilities.GetRegionalAddress(0x353128, RegionalOffset, dword_be)
    Base = utilities.MaskPointer(Pointer)

    Offsets = PlayerOffsets()

    function GetData() {
        object = PlayerObject()

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
        object.Unlocks.Reverse = dword_be(reverseBallUnlockAddress)
        object.Unlocks.Split = dword_be(splitBallUnlockAddress)
        object.Unlocks.Tractor = dword_be(tractorBallUnlockAddress)
        object.Unlocks.Bomb = dword_be(bombBallUnlockAddress)
        object.Unlocks.Paralyze = dword_be(paralyzeBallUnlockAddress)
        object.Unlocks.Trap = dword_be(trapBallUnlockAddress)
        object.DLC.Tractor = dword_be(tractorBallDLCAddress)
        object.DLC.Bomb = dword_be(bombBallDLCAddress)
        object.DLC.Paralyze = dword_be(paralyzeBallDLCAddress)
        object.DLC.Trap = dword_be(tractorBallDLCAddress)
        object.ActionBallCooldown = float_be(actionBallCooldownTimerAddress)
        object.Balls = dword_be(ballsAddress)
        object.scoreMultiplierAddress = float_be(scoreMultiplierAddress)

        return object
    }
} 

class GameStates {
    NewGame = 0x0000
    Retried = 0x0002
    NextStage = 0x0003
    Bonus = 0x0004
    BonusComplete = 0x0005
}
gameStates = GameStates() 

class Game {
    Mode = dword_be(0x2f2e54)
    Difficulty = dword_be(0x2f719c)
    State = dword_be(0x4d8dec)
    Score = dword_be(0x34ab30)

    function AchievedScore(points) {
        return prev(this.Score) < points && this.Score >= points
    }

    function GainedPoints(amount) {
        return this.Score == prev(this.Score) + amount
    }
}
game = Game()

class StageManager {
    clearFlag = dword_be(0x2f2e40)
    storyStage = dword_be(0x2f2e5c)
    arcadeStage = dword_be(0x2f2e60)

    function Cleared(in_mode, in_stage, in_difficulty) {
        stage = this.storyStage

        if (in_mode == 1)
            stage = this.arcadeStage
        
        return game.Difficulty <= in_difficulty &&
            game.Mode == in_mode &&
            stage == in_stage &&
            prev(this.clearFlag) == 0 &&
            this.clearFlag == 1
    }

    function IsInStage(in_mode, in_stage) {
        stage = this.storyStage

        if (in_mode == 1)
            stage = this.arcadeStage

        return stage == in_stage
    }
}
stageManager = StageManager()

//achievement("Multi Ball!", "While playing any mode, gain a Multi Ball", points = 5, trigger = message.Displayed(messageValues.MultiBall))
//achievement("Clear Stage 1 - Easy", "Cleared Stage 1 on Easy or higher", points = 5, trigger = stageManager.Cleared(modes.Story, stages.One, difficulties.Easy))
//achievement("Clear Stage 1 - Normal", "Cleared Stage 1 on Normal or higher", points = 5, trigger = stageManager.Cleared(modes.Story, stages.One, difficulties.Normal))
//achievement("Clear Stage 1 - Hard", "Cleared Stage 1 on Hard", points = 5, trigger = stageManager.Cleared(modes.Story, stages.One, difficulties.Hard))
//achievement("Defeated Bonus 1 Boss", "Defeated Bonus 1 Boss", points = 5, trigger = enemyManager.EnemyDefeated(modes.Story, stages.One, true, enemyManager.Types.Bonus1Boss))

rich_presence_display("Region: {0} | Event Text Index: {1}",
    rich_presence_lookup("Region", region.GetValue(), region.Lookup),
    rich_presence_value("StateClear", stageState.EventTextIndex)
)

// #endregion