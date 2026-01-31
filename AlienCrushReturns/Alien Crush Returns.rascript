// Alien Crush Returns
// #ID = 34728
// Author: BacklogOddy

// #region Classes

class Region {
    Code = 0x3183

    US = "E"
    EU = "P"
    JP = "J"

    function GetValue() {
        v1 = bit0(this.Code)
        v2 = bit1(this.Code)
        value = v1 + (v2 * 10)
        return value
    }

    function IsRegion(value) {
        return ascii_string_equals(this.Code, value)
    }

    Lookup = {
        0: "EU",
        1: "US",
        10: "JP"
    }
}

region = Region()

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

messageValues = MessageValues()

class Message {
    Flag = dword_be(0x2f2e20)
    Timer = float_be(0x2f2e28)
    Index = dword_be(0x2f2e2c)

    function Displayed(value){
        return this.Flag != 0xffffffff &&
            this.Index == value &&
            prev(this.Timer) > 0 &&
            prev(this.Timer) < this.Timer
    }
}

message = Message()

class Modes {
    Story = 0x00
    Arcade = 0x01
    Versus = 0x02
}

modes = Modes()

class Stages {
    One = 0x00
    Two = 0x01
    BossOne = 0x02
    Three = 0x03
    BossTwo = 0x04
}

stages = Stages()

class Difficulties {
    Easy = 0x00
    Normal = 0x01
    Hard = 0x02
}

difficulties = Difficulties()

class Game {
    Mode = dword_be(0x2f2e54)
    Difficulty = dword_be(0x2f719c)
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
}

stageManager = StageManager()

achievement("Multi Ball!", "While playing any mode, gain a Multi Ball", points = 5, trigger = message.Displayed(messageValues.MultiBall))
achievement("Clear Stage 1 - Easy", "Cleared Stage 1 on Easy or higher", points = 5, trigger = stageManager.Cleared(modes.Story, stages.One, difficulties.Easy))
achievement("Clear Stage 1 - Normal", "Cleared Stage 1 on Normal or higher", points = 5, trigger = stageManager.Cleared(modes.Story, stages.One, difficulties.Normal))
achievement("Clear Stage 1 - Hard", "Cleared Stage 1 on Hard", points = 5, trigger = stageManager.Cleared(modes.Story, stages.One, difficulties.Hard))

rich_presence_display("Region: {0}",
    rich_presence_lookup("Region", region.GetValue(), region.Lookup)
)

// #endregion