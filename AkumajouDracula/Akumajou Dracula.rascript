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
    Screen = byte(0x2f)
    Floor = byte(0x46)
    Scroll = byte(0x2e)
    Timer = low4(0x42) + high4(0x42) * 10 + low4(0x43) * 100 + high4(0x43) * 1000
    Loop = byte(0x2b)
    
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

class SubWeapons {
    Nothing = 0x00
    Dagger = 0x08
    Cross = 0x09
    HolyWater = 0x0b
    Axe = 0x0d
    StopWatch = 0x0f
}
subWeapons = SubWeapons()

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
    Whip = byte(0x70)
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

class Item {
    Id = 0
    AltId = 0
    Points = 0
    IsMoneyBag = false
    IsShotMultiplier = false
}

class Items {
    EnemyDeath = Item(0x2e)

    OneHundredPoints = Item(0x5f)
    TwoHundredPoints = Item(0x60)
    FourHundredPoints = Item(0x61)
    SevenHundredPoints = Item(0x62)
    OneThousandPoints = Item(0x63)
    TwoThousandPoints = Item(0xad)
    FourThousandPoints = Item(0xae)

    RedMoneyBag = Item(0x49, Points = OneHundredPoints, IsMoneyBag = true)
    WhiteMoneyBag = Item(0x49, Points = SevenHundredPoints, IsMoneyBag = true)
    PurpleMoneyBag = Item(0x49, Points = FourHundredPoints, IsMoneyBag = true)
    FlashingMoneyBag = Item(0x49, Points = OneThousandPoints, IsMoneyBag = true)

    ShotMultiplier = Item(0x51, 0x52, IsShotMultiplier = true)
    OneUp = Item(0x2a)
    LargeHeart = Item(0x26)
    Cross = Item(0x27)
    HolyWater = Item(0x2b)
    InvisiblePotion = Item(0x2c)
    StopWatch = Item(0x2d)
    SmallHeart = Item(0x4a)
    PotRoast = Item(0x4b)
    Axe = Item(0x4c)
    Dagger = Item(0x50)
    Whip = Item(0x6f)
    Rosary = Item(0x72)
    PhantomOrb = Item(0xa2)
}
items = Items()

class Secret {
    Stage = 0
    Index = 0
    Flag = 0
    Item = 0

    // If needed we can hone in on the specific location in a stage
    Screen = -99
    Floor = -99
    Scroll = -99
}

class Secrets {
    Timer = byte(0x547)

    Stage0MoneyBag = Secret(0, 19, 0, items.FlashingMoneyBag)
    Stage2MoneyBag = Secret(2, 19, 0, items.FlashingMoneyBag)

    Block1 = [
        Stage0MoneyBag, Stage2MoneyBag
    ]

    function GetFlag(index) {
        return bit(index, 0x144)
    }
}
secrets = Secrets()

class BreakableWalls {
    Stage1PurpleMoneyBag = Secret(1, 0, 0, items.PurpleMoneyBag)
    Stage2PotRoast = Secret(2, 0, 0, items.PotRoast, Floor = 1)
    Stage3ShotMultiplier = Secret(3, 0, 0, items.ShotMultiplier)

    Block1 = [
        Stage1PurpleMoneyBag, Stage2PotRoast, Stage3ShotMultiplier
    ]

    function GetFlag(index) {
        return bit(index, 0x146)
    }
}
breakableWalls = BreakableWalls()

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
                    once(prev(item) != 0xf && item == 0xf) && 
                    never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithLives) &&
                    never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithoutLives)
                )
            }
        }
        
        return measured(tally(count, checks)) && 
            never(game.Stage.Id > end)
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

    function CollectedItem(item, index) {
        ids = stageObjects.GetIds()
        timers = stageObjects.GetTimers()
        idCheck = ids[index] != item.Id

        if (item.IsMoneyBag) {
            idCheck = ids[index] == item.Points.Id
        }

        return prev(ids[Index]) == item.Id &&
            idCheck && timers[index] > 0  
    }

    function GetMaxSecretStage(secrets) {
        max = 0
        for secret in secrets {
            if (secret.Stage > max)
                max = secret.Stage
        }
        return max
    }

    function CollectedSecretItem(secret) {
        ids = stageObjects.GetIds()
        timer = stageObjects.SecretTimer
        item = secret.Item
        index = secret.Index
        flag = secrets.GetFlag(secret.Flag)

        idCheck = ids[index] != item.Id

        if (item.IsMoneyBag) {
            idCheck = ids[index] == item.Points.Id
        }

        stageCheck = game.Stage.Id == secret.Stage

        if (secret.Floor >= 0)
            stageCheck = stageCheck && 
                game.Stage.Floor == secret.Floor

        return stageCheck &&
            flag == 1 && 
            prev(ids[index]) == item.Id && 
            idCheck && 
            timer > 0
    }

    function CollectedWallItem(secret) {
        ids = stageObjects.GetIds()
        timers = stageObjects.GetTimers()
        item = secret.Item
        index = secret.Index
        flag = breakableWalls.GetFlag(secret.Flag)

        idCheck = prev(ids[index]) == item.Id &&
            ids[index] != item.Id

        if (item.IsShotMultiplier) {
            idCheck = __ornext
            (
                __ornext(prev(ids[index]) == item.Id || prev(ids[index]) == item.AltId) &&
                ids[index] == 0
            )
        }

        if (item.IsMoneyBag) {
            idCheck = prev(ids[index]) == item.Id && 
                ids[index] == item.Points.Id
        }

        stageCheck = game.Stage.Id == secret.Stage

        if (secret.Floor >= 0)
            stageCheck = stageCheck && 
                game.Stage.Floor == secret.Floor

        return stageCheck &&
            flag == 1 && 
            idCheck &&
            timers[index] > 0  
    }

    function CollectedAllWallItems(secrets) {
        conditions = []
        count = length(secrets)

        max = this.GetMaxSecretStage(secrets)

        for secret in secrets {
            array_push
            (
                conditions,
                once(this.CollectedWallItem(secret)) &&
                never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithLives) &&
                never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithoutLives)
            )
        }

        return measured(tally(count, conditions)) &&
            never(game.Stage.Id > max)
    }

    function CollectedAllSecretItems(secrets) {
        conditions = []
        count = length(secrets)

        max = this.GetMaxSecretStage(secrets)

        for secret in secrets {
            array_push
            (
                conditions,
                once(this.CollectedSecretItem(secret)) &&
                never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithLives) &&
                never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithoutLives)
            )
        }

        return measured(tally(count, conditions)) &&
            never(game.Stage.Id > max)
    }

    function UpgradedWhip(level) {
        return prev(game.Player.Whip) < level &&
            game.Player.Whip >= level
    }

    function UpgradedShotMultiplier(level) {
        return prev(game.Player.SubWeapon.Multiplier) < level &&
            game.Player.SubWeapon.Multiplier >= level
    }

    function AcquiredHearts(amount) {
        return prev(game.Player.Hearts) < amount &&
            game.Player.Hearts >= amount
    }

    function GotSubWeaponKills(weapon, amount) {
        return game.Player.SubWeapon.Id == weapon &&
            prev(game.Player.SubWeaponKills) < amount &&
            game.Player.SubWeaponKills >= amount
    }

    function GotSubWeaponBonus() {
        ids = stageObjects.GetIds()
        deathChecks = []
        pointChecks = []

        for index in range(0, 23) {
            array_push
            (
                deathChecks, 
                ids[index] == items.EnemyDeath.Id
            )
        }

        for index in range(0, 23) {
            array_push
            (
                pointChecks, 
                prev(ids[index]) != items.FourThousandPoints.Id &&
                ids[index] == items.FourThousandPoints.Id
            )
        }

        return any_of(deathChecks, check => check) &&
            any_of(pointChecks, check => check)
    }

    function GotStopwatchBonus() {
        ids = stageObjects.GetIds()
        
        conditions = []

        for index in range(0, 23) {
            array_push
            (
                conditions, 
                __ornext(prev(ids[index]) == items.ShotMultiplier.Id || prev(ids[index]) == items.ShotMultiplier.AltId) &&
                ids[index] == items.SevenHundredPoints.Id
            )
        }

        return game.Player.SubWeapon.Id == subWeapons.StopWatch &&
            any_of(conditions, condition => condition)
    }
}
helpers = AchievementHelpers()

class AchievementTriggers {

    // Stages 1 - 3
    function AmethystAbundance() {
        return helpers.CollectedAllWallItems(breakableWalls.Block1) &&
            helpers.ResetStageChallenge()
    }

    function RubyReserve() {
        return helpers.CollectedAllSecretItems(secrets.Block1) &&
            helpers.ResetStageChallenge()
    }

    function BlazeATrail() {
        return helpers.BrokeAllCandlesInStageRange(0, 3, 57) &&
            helpers.ResetStageChallenge()
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

    // Stages 4 - 6
    function CitrineCache() {
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

    // Stages 7 - 9
    function OpalOpulence() {
        return always_false()
    }

    function LapisLoot() {
        return always_false()
    }

    function TrialByFire() {
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

    // Stages 10 - 12
    function DiamonDough() {
        return always_false()
    }

    function WorldOnFire() {
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

    // Stages 13 - 15
    function EmeraldEndowment() {
        return always_false()
    }

    function AquamarineAssets() {
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

    // Stages 16 - 18
    function PearlPortfolio() {
        return always_false()
    }

    function EmeraldEndowment() {
        return always_false()
    }

    function CeaseFire() {
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

    // Loop 2
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

    // Item Challenges
    function Heartfelt() {
        return helpers.IsInGame() &&
            helpers.AcquiredHearts(99)
    }

    function FiveFingerDiscount() {
        return always_false()
    }

    function NowYouSeeMe() {
        return always_false()
    }

    function BigShot() {
        return helpers.IsInGame() &&
            helpers.UpgradedShotMultiplier(1)
    }

    function PowerShot() {
        return helpers.IsInGame() &&
            helpers.UpgradedShotMultiplier(2)
    }

    function WhipItRealGood() {
        return helpers.IsInGame() &&
            helpers.UpgradedWhip(2)
    }

    function GiveMeFive() {
        return always_false()
    }

    // Other Challenges
    function AxeToGrind() {
        return helpers.IsInGame() &&
            helpers.GotSubWeaponKills(subWeapons.Axe, 10)
    }

    function TurnTheKnife() {
        return helpers.IsInGame() &&
            helpers.GotSubWeaponKills(subWeapons.Dagger, 10)
    }

    function CrossToCarry() {
        return helpers.IsInGame() &&
            helpers.GotSubWeaponKills(subWeapons.Cross, 10)
    }

    function MakeASplash() {
        return helpers.IsInGame() &&
            helpers.GotSubWeaponKills(subWeapons.HolyWater, 10)
    }

    function OneStopShop() {
        return helpers.IsInGame() &&
            helpers.GotStopwatchBonus()
    }

    function Bloodbath() {
        return helpers.IsInGame() &&
            helpers.GotSubWeaponBonus()
    }
}
triggers = AchievementTriggers()

class Achievements {
    StartingID = 0
    Data = [
        // Stages 1 - 3
        Achievement(0, 5, "Amethyst Abundance", "In a single session, find and collect all hidden wall treasures in stages 1 through 3", triggers.AmethystAbundance()),
        Achievement(0, 10, "Ruby Reserve", "In a single session, reveal and collect all hidden bonus treasures in stages 1 through 3", triggers.RubyReserve()),
        Achievement(0, 5, "Blaze a Trail", "In a single session, destroy all candles and braziers in stages 1 through 3", triggers.BlazeATrail()),
        Achievement(1, 5, "Right Off the Bat", "Defeat the Phantom Bat in Stage 3", triggers.RightOffTheBat()),
        Achievement(0, 10, "Like a Bat Out of Hell", "Defeat the Phantom Bat in Stage 3 without using a sub-weapon", triggers.LikeABatOutOfHell()),
        Achievement(0, 10, "Beeline", "In a single session, clear stages 1 through 3 without losing a life", triggers.Beeline()),

        // Stages 4 - 6
        Achievement(0, 5, "Citrine Cache", "In a single session, find and collect all hidden wall treasures in stages 4 through 6", triggers.CitrineCache()),
        Achievement(0, 10, "Sapphire Stash", "In a single session, reveal and collect all hidden bonus treasures in stages 4 through 6", triggers.SapphireStash()),
        Achievement(0, 5, "Hang Fire", "In a single session, destroy all candles and braziers in stages 4 through 6", triggers.HangFire()),
        Achievement(1, 5, "Snake in the Grass", "Defeat the Queen Medusa in Stage 6", triggers.SnakeInTheGrass()),
        Achievement(0, 10, "Snake Eyes", "Defeat the Queen Medusa in Stage 6 without using a sub-weapon", triggers.SnakeEyes()),
        Achievement(0, 10, "On Thin Ice", "In a single session, clear Stages 4 through 6 without losing a life", triggers.OnThinIce()),

        // Stages 7 - 9
        Achievement(0, 5, "Opal Opulence", "In a single session, find and collect all hidden wall treasures in stages 7 through 9", triggers.OpalOpulence()),
        Achievement(0, 10, "Lapis Loot", "In a single session, reveal and collect all hidden bonus treasures in stages 7 through 9", triggers.LapisLoot()),
        Achievement(0, 5, "Trial by Fire", "In a single session, destroy all candles and braziers in stages 7 through 9", triggers.TrialByFire()),
        Achievement(1, 5, "Mum's the Word", "Defeat the Mummy Men and clear Stage 9", triggers.MumsTheWord()),
        Achievement(0, 10, "Mummy's Boy", "Defeat the Mummy Men in Stage 9 without using a sub-weapon", triggers.MummysBoy()),
        Achievement(0, 10, "Dice with Death", "In a single session, clear stages 7 through 9 without losing a life", triggers.DiceWithDeath()),

        // Stages 10 - 12
        Achievement(0, 5, "Diamond Dough", "In a single session, find and collect all hidden wall treasures in stages 10 through 12", triggers.DiamonDough()),
        Achievement(0, 5, "World on Fire", "In a single session, destroy all candles and braziers in stages 10 through 12", triggers.WorldOnFire()),
        Achievement(1, 5, "Green Eyed Monster", "Defeat Frankenstein's Monster & Igor and clear Stage 12", triggers.GreenEyedMonster()),
        Achievement(0, 10, "Monster Mash", "Defeat Frankenstein's Monster & Igor in Stage 12 without using a sub-weapon", triggers.MonsterMash()),
        Achievement(0, 10, "Go for Broke", "In a single session, clear stages 10 through 12 without losing a life", triggers.GoForBroke()),

        // Stages 13 - 15
        Achievement(0, 5, "Emerald Endowment", "In a single session, find and collect all hidden wall treasures in stages 13 through 15", triggers.EmeraldEndowment()),
        Achievement(0, 10, "Aquamarine Assets", "In a single session, reveal and collect all hidden bonus treasures in stages 13 through 15", triggers.AquamarineAssets()),
        Achievement(0, 5, "Snuffed Out", "In a single session, destroy all candles and braziers in stages 13 through 15", triggers.SnuffedOut()),
        Achievement(1, 5, "At Death's Door", "Defeat Death and clear Stage 15", triggers.AtDeathsDoor()),
        Achievement(0, 10, "Dead Ringer", "Defeat Death in Stage 15 without using a sub-weapon", triggers.DeadRinger()),
        Achievement(0, 10, "Up the Ante", "In a single session, clear stages 13 through 15 without losing a life", triggers.UpTheAnte()),

        // Stages 16 - 18
        Achievement(0, 5, "Pearl Portfolio", "In a single session, find and collect all hidden wall treasures in stages 16 through 18", triggers.PearlPortfolio()),
        Achievement(0, 10, "Emerald Endowment", "In a single session, reveal and collect all hidden bonus treasures in stages 16 through 18", triggers.EmeraldEndowment()),
        Achievement(0, 5, "Cease Fire", "In a single session, destroy all candles and braziers in stages 16 through 18", triggers.CeaseFire()),
        Achievement(2, 5, "Beyond the Grave", "Defeat Dracula and clear the game", triggers.BeyondTheGrave()),
        Achievement(0, 10, "Final Nail in the Coffin", "Defeat Dracula in Stage 18 without using a sub-weapon", triggers.FinalNailInTheCoffin()),
        Achievement(0, 10, "Out on a Limb", "In a single session, clear stages 16 through 18 without losing a life", triggers.OutOnALimb()),
        Achievement(0, 25, "Rise to the Occasion", "Clear the first loop without using a continue", triggers.RiseToTheOccasion()),

        // Loop 2
        Achievement(0, 5, "Get that Bag", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 19", triggers.GetThatBag()),
        Achievement(0, 5, "Left Holding the Bag", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 20", triggers.LeftHoldingTheBag()),
        Achievement(0, 5, "Slice of Life", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 21", triggers.SliceOfLife()),
        Achievement(0, 5, "All Meat no Potatoes", "Reveal and collect the loop 2 exclusive hidden wall treasure in Stage 23", triggers.AllMeatNoPotatoes()),
        Achievement(0, 5, "Carved in Stone", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 24", triggers.CarvedInStone()),
        Achievement(0, 5, "Get a Life", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 25", triggers.GetALife()),
        Achievement(0, 5, "A Rolling Stone", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 26", triggers.ARollingStone()),
        Achievement(0, 5, "Call the Shots", "Reveal and collect the loop 2 exclusive hidden wall treasure in Stage 26", triggers.CallTheShots()),
        Achievement(0, 5, "No Stone Unturned", "Reveal and collect the loop 2 exclusive hidden bonus treasure in Stage 27", triggers.NoStoneUnturned()),
        Achievement(0, 5, "Shot to Hell", "Reveal and collect the loop 2 exclusive hidden wall treasure in Stage 34", triggers.ShotToHell()),
        Achievement(0, 25, "One More Time", "Clear the second loop", triggers.OneMoreTime()),
        Achievement(0, 50, "True Moxie", "Clear the first and second loop using 3 continues or less", triggers.TrueMoxie()),

        // Item Challenges
        Achievement(0, 5, "Heartfelt", "Collect 99 hearts", triggers.Heartfelt()),
        Achievement(0, 5, "Five Finger Discount", "Collect a Rosary and kill 5 enemies at once", triggers.FiveFingerDiscount()),
        Achievement(0, 5, "Now You See Me", "Collect an Invisibility Potion and kill 5 enemies before it runs out", triggers.NowYouSeeMe()),
        Achievement(0, 2, "Big Shot", "Collect a Shot Multiplier and power up your sub-weapon to level 2", triggers.BigShot()),
        Achievement(0, 4, "Power Shot", "Collect a Shot Multiplier and power up your sub-weapon to level 3", triggers.PowerShot()),
        Achievement(0, 4, "Whip it Real Good", "Power up the whip to level 3", triggers.WhipItRealGood()),
        Achievement(0, 10, "Give Me Five!", "Collect all 5 sub-weapons in a single session", triggers.GiveMeFive()),

        // Other Challenges
        Achievement(0, 4, "Axe to Grind", "Kill 10 enemies with the Axe and reveal a Shot Multiplier", triggers.AxeToGrind()),
        Achievement(0, 4, "Turn the Knife", "Kill 10 enemies with the Dagger and reveal a Shot Multiplier", triggers.TurnTheKnife()),
        Achievement(0, 4, "Cross to Carry", "Kill 10 enemies with the Cross and reveal a Shot Multiplier", triggers.CrossToCarry()),
        Achievement(0, 4, "Make a Splash", "Kill 10 enemies with the Holy Water and reveal a Shot Multiplier", triggers.MakeASplash()),
        Achievement(0, 4, "One Stop Shop", "Collect a Shot Multiplier while holding a Stopwatch and recieve a point bonus", triggers.OneStopShop()),
        Achievement(0, 5, "Bloodbath", "Gain a special bonus by defeating 4 or more enemies with a single sub-weapon attack", triggers.Bloodbath()),
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
    rich_presence_value("Stage", (game.Stage.Id + (18 * game.Stage.Loop + game.Stage.Loop)) / 10),
    rich_presence_value("Stage", (game.Stage.Id + (18 * game.Stage.Loop + game.Stage.Loop)) % 10),
    rich_presence_value("Lives", game.Player.Lives / 10),
    rich_presence_value("Lives", game.Player.Lives % 10),
    rich_presence_lookup("Whip", game.Player.Whip, game.Player.WhipLookup, "Leather Whip"),
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