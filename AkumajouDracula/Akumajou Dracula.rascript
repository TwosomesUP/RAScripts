// Akumajou Dracula
// #ID = 36892

// Accessor Classes

class ScreenId {
    Start = 0
    End = 0
}

class ScreenIds {
    // Ranges
    Title = ScreenId(0x00, 0x03)
    InGame = ScreenId(0x05, 0x0c)

    // Individual Values
    StartScreenIntro = 0x00
    StartScreenPressStart = 0x01
    StartScreenTransition = 0x03
    Intro = 0x04
    Playing = 0x05
    DeathWithLives = 0x6
    DeathWithoutLives = 0x07
    StageEnd = 0xc
    GameOver = 0xd
    Loading = 0x10
    SaveSelect = 0x11
}
screenIds = ScreenIds()

class Screen {
    Id = byte(0x18)
    SubId = byte(0x19)
    Timer = byte(0x1a)
}

class Stage {
    Id = byte(0x28)
    Timer = low4(0x42) + high4(0x42) * 10 + low4(0x43) * 100 + high4(0x43) * 1000
    
    function GetCandles() {
        objects = []
        base = 0x15d
        count = 24
        for index in range(0, count - 1) {
            array_push(low4(base + index))
            array_push(high4(base + index))
        }
    }
}

class SubWeapon {
    Id = byte(0x15b)
    Multiplier = byte(0x64)
    TypeLookup = {
        0x08: " | Dagger ",
        0x09: " | Cross ",
        0x0b: " | Holy Water ",
        0x0d: " | Axe ",
        0x0f: " | Stopwatch "
    }
    MultiplierLookup = {
        0x00: " |",
        0x01: "x 2 |",
        0x02: "x 3 |"
    }
}

class Player {
    Lives = byte(0x2a) - 1
    Health = byte(0x45)
    Continues = byte(0x7d9)
    WhipLevel = byte(0x70)
    Hearts = byte(0x71)
    SubWeaponKills = byte(0x79)
    SubWeapon = SubWeapon()
    RosaryTimer = byte(0x15d)
    Score = low4(0x7fc) + high4(0x7fc) * 10 + low4(0x7fd) * 100 + high4(0x7fd) * 1000 +
        low4(0x7fe) * 10000 + high4(0x7fe) * 100000 + low4(0x7ff) * 100 + high4(0x7ff) * 1000000

    WhipLookup = {
        0x00: "Leather Whip",
        0x01: "Chain Whip",
        0x02: "Morning Star"
    }
}

class Boss {
    Health = 0x1a9
}

class StageObjectIds {
    MoneyBag = 0x49
    PotRoast = 0x4b
}
stageObjectIds = StageObjectIds()

class StageObjects {
    SecretTimer = byte(0x547)

    BreakablesStart = 0x191
    IdsStart = 0x320
    TimersStart = 0x56c

    Size = 24

    function GetBreakables() {
        breakables = []
        for index in range(0, this.Size -1) {
            array_push(breakables, low4(this.BreakablesStart + index))
            array_push(breakables, high4(this.BreakablesStart + index))
        }
        return breakables
    }

    function GetIds() {
        ids = []
        for index in range(0, this.Size -1) {
            array_push(ids, byte(this.IdsStart + index))
        }
        return ids
    }

    function GetTimers() {
        timers = []
        for index in range(0, this.Size -1) {
            array_push(timers, byte(this.TimersStart + index))
        }
        return timers
    }
}
stageObjects = StageObjects()

class Game {
    Screen = Screen()
    Stage = Stage()
    Player = Player()
    Boss = Boss()
}
game = Game()

class Achievement {
    Type = 0 // 0 = None, 1 = Progression, 2 = Win Condition, 3 = Missable
    Points = 0
    Title = ""
    Description = ""
    Trigger = always_false()
    Id = 0
}

class AchievementHelpers {
    function IsInGame() {
        return game.Screen.Id >= screenIds.InGame.Start &&
            game.Screen.Id <= screenIds.InGame.End
    }

    function IsGameOver() {
        return game.Screen.Id == screenIds.GameOver
    }

    function IsIntro() {
        return game.Screen.Id == screenIds.Intro
    }

    function IsLoading() {
        return game.Screen.Id == screenIds.Loading
    }

    function IsOnTitle() {
        return 
        (
            (game.Screen.Id >= screenIds.Title.Start && game.Screen.Id <= screenIds.Title.End) ||
            game.Screen.Id == screenIds.SaveSelect
        )
    }

    function BrokeAllCandlesInStage(stage, count) {
        checks = []
        for item in stageObjects.GetBreakables() {
            array_push
            (
                checks,
                game.Screen.Id == screenIds.Playing && 
                game.Stage.Id == stage &&
                prev(item) != 0xf && item == 0xf && 
                never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithLives) &&
                never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithoutLives)
            )
        }

        return tally(count, checks)
    }

    function BrokeAllCandlesInStageRange(start, end, count) {
        checks = []
        for stage in range(start, end) {
            for item in stageObjects.GetBreakables() {
                array_push
                (
                    checks,
                    game.Screen.Id == screenIds.Playing && 
                    game.Stage.Id == stage &&
                    prev(item) != 0xf && item == 0xf && 
                    never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithLives) &&
                    never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithoutLives)
                )
            }
        }
        

        return tally(count, checks)
    }

    function ResetStageChallenge() {
        return             
        (
            always_false() ||
            (
                never(game.Screen.Id < screenIds.Playing) &&
                never(game.Screen.Id > screenIds.StageEnd)
            )
        )
    }

    function CollectedTimedItem(index, id) {
        ids = stageObjects.GetIds()
        timers = stageObjects.GetTimers()
        return prev(ids[index]) == id &&
            ids[index] != id &&
            timers[index] > 0
    }

    function CollectedTimedSecretItem(index, id) {
        ids = stageObjects.GetIds()
        timer = stageObjects.SecretTimer
        return prev(ids[index]) == id &&
            ids[index] != id &&
            timer > 0
    }

    function CollectedMoneyBag(index, pointId) {
        ids = stageObjects.GetIds()
        return prev(ids[index]) ==  stageObjectIds.MoneyBag &&
            ids[index] == pointId
    }
}
helpers = AchievementHelpers()

class AchievementTriggers {
    function AmethystAbundance() {
        return always_false()
    }

    function BlazeATrail() {
        return
        (
            measured((helpers.BrokeAllCandlesInStageRange(0, 1, 29))) &&
            helpers.ResetStageChallenge() &&
            never(game.Stage.Id > 1)
        )
    }

    function RubyReserve() {
        return always_false()
    }

    function FireWithFire() {
        return always_false()
    }

    function ByTheNumbers() {
        return always_false()
    }

    function PlayingWithFire() {
        return always_false()
    }

    function RightOffTheBat() {
        return always_false()
    }

    function LikeABatOutOfHell() {
        return always_false()
    }

    function Beeline() {
        return always_false()
    }

    function CitrineCache() {
        return always_false()
    }

    function FireDrill() {
        return always_false()
    }

    function SapphireStash() {
        return always_false()
    }

    function HangFire() {
        return always_false()
    }

    function TopazTrove() {
        return always_false()
    }

    function FiredUp() {
        return always_false()
    }

    function SnakeInTheGrass() {
        return always_false()
    }

    function SnakeEyes() {
        return always_false()
    }

    function OnThinIce() {
        return always_false()
    }

    function OpalOpulence() {
        return always_false()
    }

    function TrialByFire() {
        return always_false()
    }

    function LapisLoot() {
        return always_false()
    }

    function LikeAHouseOnFire() {
        return always_false()
    }

    function TurquoiseTreasure() {
        return always_false()
    }

    function SmokeAndFire() {
        return always_false()
    }

    function MumsTheWord() {
        return always_false()
    }

    function MummysBoy() {
        return always_false()
    }

    function DiceWithDeath() {
        return always_false()
    }

    function BurnedOut() {
        return always_false()
    }

    function WorldOnFire() {
        return always_false()
    }

    function DiamonDough() {
        return always_false()
    }

    function FiveAlarmFire() {
        return always_false()
    }

    function GreenEyedMonster() {
        return always_false()
    }

    function MonsterMash() {
        return always_false()
    }

    function GoForBroke() {
        return always_false()
    }

    function EmeraldEndowment() {
        return always_false()
    }

    function FuelTheFire() {
        return always_false()
    }

    function AquamarineAssets() {
        return always_false()
    }

    function FireInTheHole() {
        return always_false()
    }

    function MoonstoneMint() {
        return always_false()
    }

    function SnuffedOut() {
        return always_false()
    }

    function AtDeathsDoor() {
        return always_false()
    }

    function DeadRinger() {
        return always_false()
    }

    function UpTheAnte() {
        return always_false()
    }

    function DrawFire() {
        return always_false()
    }

    function PearlPortfolio() {
        return always_false()
    }

    function CeaseFire() {
        return always_false()
    }

    function BetweenTwoFires() {
        return always_false()
    }

    function BeyondTheGrave() {
        return always_false()
    }

    function FinalNailInTheCoffin() {
        return always_false()
    }

    function OutOnALimb() {
        return always_false()
    }

    function RiseToTheOccasion() {
        return always_false()
    }

    function GetThatBag() {
        return always_false()
    }

    function LeftHoldingTheBag() {
        return always_false()
    }

    function SliceOfLife() {
        return always_false()
    }

    function AllMeatNoPotatoes() {
        return always_false()
    }

    function CarvedInStone() {
        return always_false()
    }

    function GetALife() {
        return always_false()
    }

    function ARollingStone() {
        return always_false()
    }

    function CallTheShots() {
        return always_false()
    }

    function NoStoneUnturned() {
        return always_false()
    }

    function ShotToHell() {
        return always_false()
    }

    function OneMoreTime() {
        return always_false()
    }

    function TrueMoxie() {
        return always_false()
    }

    function Heartfelt() {
        return always_false()
    }

    function FiveFingerDiscount() {
        return always_false()
    }

    function NowYouSeeMe() {
        return always_false()
    }

    function BigShot() {
        return always_false()
    }

    function PowerShot() {
        return always_false()
    }

    function WhipItRealGood() {
        return always_false()
    }

    function GiveMeFive() {
        return always_false()
    }

    function AxeToGrind() {
        return always_false()
    }

    function TurnTheKnife() {
        return always_false()
    }

    function CrossToCarry() {
        return always_false()
    }

    function MakeASplash() {
        return always_false()
    }

    function OneStopShop() {
        return always_false()
    }

    function Bloodbath() {
        return always_false()
    }
}
triggers = AchievementTriggers()

class Achievements {
    StartingID = 0
    Data = [
        Achievement(0, 3, "Amethyst Abundance", "Reveal and collect all loop 1 hidden treasures in Stage 1", triggers.AmethystAbundance()),
        Achievement(0, 3, "Blaze a Trail", "Destroy all candles and braziers in Stage 1", triggers.BlazeATrail()),
        Achievement(0, 2, "Ruby Reserve", "Reveal and collect all loop 1 hidden treasures in Stage 2", triggers.RubyReserve()),
        Achievement(0, 3, "Fire with Fire", "Destroy all candles and braziers in Stage 2", triggers.FireWithFire()),
        Achievement(0, 3, "By the Numbers", "Reveal and collect the loop 1 hidden Shot Multiplier in Stage 3", triggers.ByTheNumbers()),
        Achievement(0, 3, "Playing with Fire", "Destroy all candles and braziers in Stage 3", triggers.PlayingWithFire()),
        Achievement(1, 5, "Right Off the Bat", "Defeat the Phantom Bat in Stage 3", triggers.RightOffTheBat()),
        Achievement(0, 10, "Like a Bat Out of Hell", "Defeat the Phantom Bat in Stage 3 without using a sub-weapon", triggers.LikeABatOutOfHell()),
        Achievement(0, 10, "Beeline", "In a single session, clear stages 1 through 3 without losing a life", triggers.Beeline()),
        Achievement(0, 3, "Citrine Cache", "Reveal and collect all loop 1 hidden treasures in Stage 4", triggers.CitrineCache()),
        Achievement(0, 3, "Fire Drill", "Destroy all candles and braziers in Stage 4", triggers.FireDrill()),
        Achievement(0, 3, "Sapphire Stash", "Reveal and collect all loop 1 hidden treasures in Stage 5", triggers.SapphireStash()),
        Achievement(0, 3, "Hang Fire", "Destroy all candles and braziers in Stage 5", triggers.HangFire()),
        Achievement(0, 3, "Topaz Trove", "Reveal and collect all loop 1 hidden treasures in Stage 6", triggers.TopazTrove()),
        Achievement(0, 3, "Fired Up", "Destroy all candles and braziers in Stage 6", triggers.FiredUp()),
        Achievement(1, 5, "Snake in the Grass", "Defeat the Queen Medusa in Stage 6", triggers.SnakeInTheGrass()),
        Achievement(0, 10, "Snake Eyes", "Defeat the Queen Medusa in Stage 6 without using a sub-weapon", triggers.SnakeEyes()),
        Achievement(0, 10, "On Thin Ice", "In a single session, clear Stages 4 through 6 without losing a life", triggers.OnThinIce()),
        Achievement(0, 3, "Opal Opulence", "Reveal and collect all loop 1 hidden treasures in Stage 7", triggers.OpalOpulence()),
        Achievement(0, 3, "Trial by Fire", "Destroy all candles and braziers in Stage 7", triggers.TrialByFire()),
        Achievement(0, 3, "Lapis Loot", "Reveal and collect the loop 1 hidden Flashing Money Bag in Stage 8", triggers.LapisLoot()),
        Achievement(0, 3, "Like a House On Fire", "Destroy all candles and braziers in Stage 8", triggers.LikeAHouseOnFire()),
        Achievement(0, 3, "Turquoise Treasure", "Reveal and collect the loop 1 hidden treasures in Stage 9", triggers.TurquoiseTreasure()),
        Achievement(0, 3, "Smoke and Fire", "Destroy all candles and braziers in Stage 9", triggers.SmokeAndFire()),
        Achievement(1, 5, "Mum's the Word", "Defeat the Mummy Men and clear Stage 9", triggers.MumsTheWord()),
        Achievement(0, 10, "Mummy's Boy", "Defeat the Mummy Men in Stage 9 without using a sub-weapon", triggers.MummysBoy()),
        Achievement(0, 10, "Dice with Death", "In a single session, clear stages 7 through 9 without losing a life", triggers.DiceWithDeath()),
        Achievement(0, 3, "Burned Out", "Destroy all candles and braziers in Stage 10", triggers.BurnedOut()),
        Achievement(0, 3, "World on Fire", "Destroy all candles and braziers in Stage 11", triggers.WorldOnFire()),
        Achievement(0, 3, "Diamond Dough", "Reveal and collect the loop 1 hidden treasures in Stage 12", triggers.DiamonDough()),
        Achievement(0, 3, "Five Alarm Fire", "Destroy all candles and braziers in Stage 12", triggers.FiveAlarmFire()),
        Achievement(1, 5, "Green Eyed Monster", "Defeat Frankenstein's Monster & Igor and clear Stage 12", triggers.GreenEyedMonster()),
        Achievement(0, 10, "Monster Mash", "Defeat Frankenstein's Monster & Igor in Stage 12 without using a sub-weapon", triggers.MonsterMash()),
        Achievement(0, 10, "Go for Broke", "In a single session, clear stages 10 through 12 without losing a life", triggers.GoForBroke()),
        Achievement(0, 3, "Emerald Endowment", "Reveal and collect the loop 1 hidden treasures in Stage 13", triggers.EmeraldEndowment()),
        Achievement(0, 3, "Fuel the Fire", "Destroy all candles and braziers in Stage 13", triggers.FuelTheFire()),
        Achievement(0, 3, "Aquamarine Assets", "Reveal and collect all loop 1 hidden treasures in Stage 14", triggers.AquamarineAssets()),
        Achievement(0, 3, "Fire in the Hole", "Destroy all candles and braziers in Stage 14", triggers.FireInTheHole()),
        Achievement(0, 3, "Moonstone Mint", "Reveal and collect the loop 1 hidden Pot Roast in Stage 15", triggers.MoonstoneMint()),
        Achievement(0, 3, "Snuffed Out", "Destroy all candles and braziers in Stage 15", triggers.SnuffedOut()),
        Achievement(1, 5, "At Death's Door", "Defeat Death and clear Stage 15", triggers.AtDeathsDoor()),
        Achievement(0, 10, "Dead Ringer", "Defeat Death in Stage 15 without using a sub-weapon", triggers.DeadRinger()),
        Achievement(0, 10, "Up the Ante", "In a single session, clear stages 13 through 15 without losing a life", triggers.UpTheAnte()),
        Achievement(0, 3, "Draw Fire", "Destroy all candles and braziers in Stage 16", triggers.DrawFire()),
        Achievement(0, 3, "Pearl Portfolio", "Reveal and collect all loop 1 hidden treasures in Stage 17", triggers.PearlPortfolio()),
        Achievement(0, 3, "Cease Fire", "Destroy all candles and braziers in Stage 17", triggers.CeaseFire()),
        Achievement(0, 3, "Between Two Fires", "Destroy all candles and braziers in Stage 18", triggers.BetweenTwoFires()),
        Achievement(2, 5, "Beyond the Grave", "Defeat Dracula and clear the game", triggers.BeyondTheGrave()),
        Achievement(0, 10, "Final Nail in the Coffin", "Defeat Dracula in Stage 18 without using a sub-weapon", triggers.FinalNailInTheCoffin()),
        Achievement(0, 10, "Out on a Limb", "In a single session, clear stages 16 through 18 without losing a life", triggers.OutOnALimb()),
        Achievement(0, 25, "Rise to the Occasion", "Clear the first loop without using a continue", triggers.RiseToTheOccasion()),
        Achievement(0, 5, "Get that Bag", "Reveal and collect the loop 2 hidden Flashing Money Bag in Stage 19", triggers.GetThatBag()),
        Achievement(0, 5, "Left Holding the Bag", "Reveal and collect the loop 2 hidden Flashing Money Bag in Stage 20", triggers.LeftHoldingTheBag()),
        Achievement(0, 5, "Slice of Life", "Reveal and collect the loop 2 hidden 1UP in Stage 21", triggers.SliceOfLife()),
        Achievement(0, 5, "All Meat no Potatoes", "Reveal and collect the loop 2 hidden Pot Roast in Stage 23", triggers.AllMeatNoPotatoes()),
        Achievement(0, 5, "Carved in Stone", "Reveal and collect the loop 2 hidden Moai figure in Stage 24", triggers.CarvedInStone()),
        Achievement(0, 5, "Get a Life", "Reveal and collect the loop 2 hidden 1UP in Stage 25", triggers.GetALife()),
        Achievement(0, 5, "A Rolling Stone", "Reveal and collect the loop 2 hidden Moai figure in Stage 26", triggers.ARollingStone()),
        Achievement(0, 5, "Call the Shots", "Reveal and collect the loop 2 hidden Shot Multiplier in Stage 26", triggers.CallTheShots()),
        Achievement(0, 5, "No Stone Unturned", "Reveal and collect the loop 2 hidden Moai figure in Stage 27", triggers.NoStoneUnturned()),
        Achievement(0, 5, "Shot to Hell", "Reveal and collect the loop 2 hidden Shot Multiplier in Stage 34", triggers.ShotToHell()),
        Achievement(0, 25, "One More Time", "Clear the second loop", triggers.OneMoreTime()),
        Achievement(0, 50, "True Moxie", "Clear the first and second loop using 3 continues or less", triggers.TrueMoxie()),
        Achievement(0, 5, "Heartfelt", "Collect 99 hearts", triggers.Heartfelt()),
        Achievement(0, 5, "Five Finger Discount", "Collect a Rosary and kill 5 enemies at once", triggers.FiveFingerDiscount()),
        Achievement(0, 5, "Now You See Me", "Collect an Invisibility Potion and kill 5 enemies before it runs out", triggers.NowYouSeeMe()),
        Achievement(0, 2, "Big Shot", "Collect a Shot Multiplier and power up your sub-weapon to level 2", triggers.BigShot()),
        Achievement(0, 4, "Power Shot", "Collect a Shot Multiplier and power up your sub-weapon to level 3", triggers.PowerShot()),
        Achievement(0, 4, "Whip it Real Good", "Power up the whip to level 3", triggers.WhipItRealGood()),
        Achievement(0, 10, "Give Me Five!", "Collect all 5 sub-weapons in a single session", triggers.GiveMeFive()),
        Achievement(0, 4, "Axe to Grind", "Kill 10 enemies with the Axe and reveal a Shot Multiplier", triggers.AxeToGrind()),
        Achievement(0, 4, "Turn the Knife", "Kill 10 enemies with the Dagger and reveal a Shot Multiplier", triggers.TurnTheKnife()),
        Achievement(0, 4, "Cross to Carry", "Kill 10 enemies with the Cross and reveal a Shot Multiplier", triggers.CrossToCarry()),
        Achievement(0, 4, "Make a Splash", "Kill 10 enemies with the Holy Water and reveal a Shot Multiplier", triggers.MakeASplash()),
        Achievement(0, 4, "One Stop Shop", "Collect a Shot Multiplier while holding a Stopwatch and recieve a point bonus", triggers.OneStopShop()),
        Achievement(0, 5, "Bloodbath", "Gain a special bonus by defeating 4 or more enemies with a single sub-weapon attack", triggers.Bloodbath())
    ]

    function Generate() {   
        count = 0
        currentId = this.StartingID
        for achievement in this.Data {
            achievementType = ""

            if (this.StartingID != 0)
                achievement.Id = this.StartingID + count

            if (achievement.Type == 1)
                achievementType = "progression"
            else if (achievement.Type == 2)
                achievementType = "win_condition"

            achievement(achievement.Title, achievement.Description, achievement.Points, achievement.Trigger, achievement.Id, type=achievementType)

            count = count + 1
        }
    }
}
achievements = Achievements()

// Rich Presence
rich_presence_conditional_display(helpers.IsInGame(), 
    "Simon is hunting vampires in Stage {0}{1} | P-{2}{3} | ❤️-{5}{6} | {4}{7}{8} Score-{9} | Continues-{10}{11} ",
    rich_presence_value("Stage", game.Stage.Id / 10),
    rich_presence_value("Stage", game.Stage.Id % 10),
    rich_presence_value("Lives", game.Player.Lives / 10),
    rich_presence_value("Lives", game.Player.Lives % 10),
    rich_presence_lookup("Whip", game.Player.WhipLevel, game.Player.WhipLookup, "Leather Whip"),
    rich_presence_value("Hearts", game.Player.Hearts / 10),
    rich_presence_value("Hearts", game.Player.Hearts % 10),
    rich_presence_lookup("SubWeapon", game.Player.SubWeapon.Id, game.Player.SubWeapon.TypeLookup, ""),
    rich_presence_lookup("Multiplier", game.Player.SubWeapon.Multiplier, game.Player.SubWeapon.MultiplierLookup, ""),
    rich_presence_value("Score", game.Player.Score, "SCORE"),
    rich_presence_value("Continues", game.Player.Continues / 10),
    rich_presence_value("Continues", game.Player.Continues % 10)
)

rich_presence_conditional_display(helpers.IsOnTitle() || helpers.IsLoading(), "Simon is preparing for his journey to Dracula's Castle")

rich_presence_conditional_display(helpers.IsIntro(), "Simon has arrived at Dracula's Castle")

rich_presence_conditional_display(helpers.IsGameOver(), "Simon has been bested by Dracula's Castle")

rich_presence_display("🏰 Playing Akumajou Dracula 🧛")

achievements.Generate()