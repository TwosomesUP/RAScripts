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
    InGame = ScreenId(0x05, 0x0e)

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
    StageTen = 0xe
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
    Floor = byte(0x46)
    ScrollX = word(0x2e)
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

class AttackStatuses {
    SuccessHolyWater = 0x00
    SuccessDagger = 0x06
    SuccessOther = 0x08

    AllStatuses = {
        subWeapons.Dagger: SuccessDagger,
        subWeapons.Cross: SuccessOther,
        subWeapons.HolyWater: SuccessHolyWater,
        subWeapons.Axe: SuccessOther
    }
}
attackStatuses = AttackStatuses()

class AttackTypes {
    Dagger = 0x00
    Cross = 0x01
    HolyWater = 0x03
    Axe = 0x05

    AllTypes = {
        subWeapons.Dagger: Dagger,
        subWeapons.Cross: Cross,
        subWeapons.HolyWater: HolyWater,
        subWeapons.Axe: Axe
    }
}
attackTypes = AttackTypes()

class Player {
    Lives = byte(0x2a) - 1
    Health = byte(0x45)
    Continues = byte(0x7d9)
    AttackStatus = byte(0xd)
    AttackType = byte(0xe)
    Whip = byte(0x70)
    Hearts = byte(0x71)
    SubWeaponKills = byte(0x79)
    SubWeapon = SubWeapon()
    RosaryTimer = byte(0x15d)
    Score = low4(0x7fc) + high4(0x7fc) * 10 + low4(0x7fd) * 100 + high4(0x7fd) * 1000 +
        low4(0x7fe) * 10000 + high4(0x7fe) * 100000 + low4(0x7ff) * 100 + high4(0x7ff) * 1000000
    PositionY = byte(0x3f)
    PositionX = word(0x40)

    WhipLookup = {
        0x00: "Leather Whip",
        0x01: "Chain Whip",
        0x02: "Morning Star"
    }
}

class BossStates {
    NotSpawned = 0x01
    Pattern1 = 0x02
    Pattern2 = 0x03
    OrbLanded = 0x04
    Pattern3 = 0x05
    Inactive1 = 0x80
    Inactive2 = 0x81
    SpawningOrb = 0x82
}
bossStates = BossStates()

class Boss {
    Health = byte(0x1a9)
    State = byte(0x473)
}

class EnemyIds {
    Bandage = 0x03
    Fireball = 0x08
    Axe = 0x16
    Snake = 0x1d
    Destroyed = 0x26
    Bone = 0x4f
}
enemyIds = EnemyIds()

class Enemies {
    Base = 0x4c4
    function GetSpriteIndexes() {
        enemyList = []
        for index in range(0, 9) {
            array_push(enemyList, byte(this.Base + index))
        }
        return enemyList
    }
}
enemies = Enemies()

class StageObjects {
    BreakablesStart = 0x191
    IdsStart = 0x320
    TimersStart = 0x56c
    SecretTimersStart = 0x534

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

    function GetSecretTimers() {
        timers = []
        for index in range(0, this.Size -1) {
            array_push(timers, byte(this.SecretTimersStart + index))
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
    Crown = Item(0xdf)
    TreasureChest = Item(0xe0)
    Moai = Item(0xe1) //actually -- 0xe1 - 0xe4
    OneUp = Item(0xe5)

    ShotMultiplier = Item(0x51, 0x52, IsShotMultiplier = true)
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
    Item = 0

    // If needed we can hone in on the specific location in a stage
    Floor = -99
    ScrollX = -99
    PositionX = -99
    PositionY = -99
    Unreachable = false
}

class Secrets {
    Flags = byte(0x144)

    Stage0MoneyBag = Secret(0, items.FlashingMoneyBag, Floor = 0, ScrollX = 0x1fa)
    Stage2MoneyBag = Secret(2, items.FlashingMoneyBag, Floor = 0, ScrollX = 0xe0)

    Block1 = [
        Stage0MoneyBag, Stage2MoneyBag
    ]

    Stage4Crown = Secret(4, items.Crown, Floor = 0)
    Stage5TreasureBox = Secret(5, items.TreasureChest, Floor = 0)
    Stage6MoneyBag = Secret(6, items.FlashingMoneyBag, Floor = 1)

    Block2 = [
        Stage4Crown, Stage5TreasureBox, Stage6MoneyBag
    ]

    Stage7MoneyBag = Secret(7, items.FlashingMoneyBag, Floor = 1)
    Stage8MoneyBag = Secret(8, items.FlashingMoneyBag, Floor = 1)
    Stage9MoneyBag = Secret(9, items.FlashingMoneyBag, Floor = 0, Unreachable = true)

    Block3 = [
        Stage7MoneyBag, Stage8MoneyBag, Stage9MoneyBag
    ]

    Stage13OneUp = Secret(13, items.OneUp, Floor = 1)
    Stage14MoneyBag1 = Secret(14, items.FlashingMoneyBag, Floor = 1)
    Stage14MoneyBag2 = Secret(14, items.FlashingMoneyBag, Floor = 1)
    Stage14MoneyBag3 = Secret(14, items.FlashingMoneyBag, Floor = 1)

    Block5 = [
        Stage13OneUp, Stage14MoneyBag1, Stage14MoneyBag2, Stage14MoneyBag3
    ]
}
secrets = Secrets()

class BreakableWalls {
    Flags = byte(0x146)

    Stage1PurpleMoneyBag = Secret(1, items.PurpleMoneyBag, Floor = 0, ScrollX = 0x379)
    Stage2PotRoast = Secret(2, items.PotRoast, Floor = 1, ScrollX = 0x88)
    Stage3ShotMultiplier = Secret(3, items.ShotMultiplier, Floor = 0, PositionX = 0x2b7)

    Block1 = [
        Stage1PurpleMoneyBag, Stage2PotRoast, Stage3ShotMultiplier
    ]

    Stage4ShotMultiplier = Secret(4, items.ShotMultiplier, Floor = 1)
    Stage5PotRoast = Secret(5, items.PotRoast, Floor = 1)
    Stage6PotRoast = Secret(6, items.PotRoast, Floor = 0)
    Stage6ShotMultiplier = Secret(6, items.ShotMultiplier, Floor = 0)

    Block2 = [
        Stage4ShotMultiplier, Stage5PotRoast, Stage6PotRoast, Stage6ShotMultiplier
    ]

    Stage7PotRoast = Secret(7, items.PotRoast, Floor = 0)
    Stage9PotRoast = Secret(9, items.PotRoast, Floor = 0)

    Block3 = [
        Stage7PotRoast, Stage9PotRoast
    ]

    Stage12PotRoast = Secret(12, items.PotRoast, Floor = 0)

    Block4 = [
        Stage12PotRoast
    ]

    Stage13PotRoast = Secret(13, items.PotRoast, Floor = 1)
    Stage13ShotMultiplier = Secret(13, items.ShotMultiplier, Floor = 1)
    Stage14ShotMultiplier = Secret(14, items.ShotMultiplier, Floor = 1)
    Stage15PotRoast = Secret(15, items.PotRoast, Floor = 0)

    Block5 = [
        Stage13PotRoast, Stage13ShotMultiplier, Stage14ShotMultiplier, Stage15PotRoast
    ]
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
        return __ornext
        (
            game.Screen.Id == screenIds.Intro ||
            game.Screen.Id == screenIds.Playing ||
            game.Screen.Id == screenIds.DeathWithLives ||
            game.Screen.Id == screenIds.DeathWithoutLives ||
            game.Screen.Id == screenIds.StageTen ||
            (
                game.Screen.Id == screenIds.StageEnd &&
                game.Screen.SubId != 4 &&
                game.Screen.SubId != 5 &&
                game.Screen.SubId != 6 &&
                game.Screen.SubId != 7 &&
                game.Screen.SubId != 8
            )
        )
    }

    function IsPlaying() {
        return game.Screen.Id == screenIds.Playing
    }

    function IsOnMapTransition() {
        return game.Screen.Id == screenIds.StageEnd &&
            game.Screen.SubId >= 4 && game.Screen.SubId <= 8
    }

    function IsNotPlaying() {
        return __ornext(game.Screen.Id < screenIds.Playing || game.Screen.Id > screenIds.StageEnd)
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

    function IsNotOnMapTransition() {
        return (game.Screen.Id == screenIds.StageEnd &&
            game.Screen.SubId != 4 && 
            game.Screen.SubId != 5 &&
            game.Screen.SubId != 6 &&
            game.Screen.SubId != 7 &&
            game.Screen.SubId != 8)
    }

    function IsOnTitle() {
        return 
        (
            (game.Screen.Id >= screenIds.Title.Start && game.Screen.Id <= screenIds.Title.End) ||
            game.Screen.Id == screenIds.SaveSelect
        )
    }

    function KilledEnemiesWithSubWeapon(weapon, count) {
        checks = []
        for enemy in enemies.GetSpriteIndexes() {
            array_push
            (
                checks,
                game.Screen.Id == screenIds.Playing &&
                game.Player.SubWeapon.Id == weapon &&
                game.Player.AttackStatus == attackStatuses.AllStatuses[weapon] &&
                game.Player.AttackType == attackTypes.AllTypes[weapon] &&
                prev(enemy) != enemyIds.Fireball &&
                prev(enemy) != enemyIds.Bandage &&
                prev(enemy) != enemyIds.Bone &&
                prev(enemy) != enemyIds.Snake &&
                prev(enemy) != enemyIds.Destroyed &&
                enemy == enemyIds.Destroyed
            )
        }
        return measured(tally(count, checks)) &&
            never(helpers.IsNotPlaying()) &&
            never(game.Screen.Id == screenIds.DeathWithLives) &&
            never(game.Screen.Id == screenIds.DeathWithoutLives) &&
            never(game.Player.SubWeapon.Id != weapon)
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
        return (always_false() || never(helpers.IsNotPlaying()))
    }

    function GetMaxSecretStage(secrets) {
        max = 0
        for secret in secrets {
            if (secret.Stage > max)
                max = secret.Stage
        }
        return max
    }

    function CollectedSecretItem(secret, index) {
        ids = stageObjects.GetIds()
        timer = stageObjects.GetSecretTimers()
        item = secret.Item

        idCheck = ids[index] != item.Id

        if (item.IsMoneyBag) {
            idCheck = ids[index] == item.Points.Id
        }

        stageCheck = game.Stage.Id == secret.Stage

        if (secret.Floor >= 0)
            stageCheck = stageCheck && 
                game.Stage.Floor == secret.Floor

        if (secret.ScrollX >= 0)
            stageCheck = stageCheck &&
                game.Stage.ScrollX >= secret.ScrollX - 0x10 &&
                game.Stage.ScrollX <= secret.ScrollX + 0x10

        if (secret.PositionX >= 0)
            stageCheck = stageCheck &&
                game.Player.PositionX >= secret.PositionX - 0x10 &&
                game.Player.PositionX <= secret.PositionX + 0x10
        
        if (secret.PositionY >= 0)
            stageCheck = stageCheck &&
                game.Player.PositionY >= secret.PositionY - 0x10 &&
                game.Player.PositionY <= secret.PositionY + 0x10

        collectedCheck = secrets.Flags > 0 && 
            prev(ids[index]) == item.Id && 
            idCheck && 
            timer[index] > 0

        if (secret.Unreachable) 
            collectedCheck = prev(secrets.Flags) < secrets.Flags

        return stageCheck &&
            collectedCheck
    }

    function CollectedWallItem(secret, index) {
        ids = stageObjects.GetIds()
        timers = stageObjects.GetTimers()
        item = secret.Item

        idCheck = prev(ids[index]) == item.Id &&
            ids[index] != item.Id

        if (item.IsShotMultiplier) {
            idCheck =
            (
                __ornext(prev(ids[index]) == item.Id || prev(ids[index]) == item.AltId) &&
                ids[index] != items.ShotMultiplier.Id &&
                ids[index] != items.ShotMultiplier.AltId
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

        if (secret.ScrollX >= 0)
            stageCheck = stageCheck &&
                game.Stage.ScrollX >= secret.ScrollX - 0x10 &&
                game.Stage.ScrollX <= secret.ScrollX + 0x10

        if (secret.PositionX >= 0)
            stageCheck = stageCheck &&
                game.Player.PositionX >= secret.PositionX - 0x10 &&
                game.Player.PositionX <= secret.PositionX + 0x10
        
        if (secret.PositionY >= 0)
            stageCheck = stageCheck &&
                game.Player.PositionY >= secret.PositionY - 0x10 &&
                game.Player.PositionY <= secret.PositionY + 0x10

        return breakableWalls.Flags > 0 &&
            stageCheck &&
            idCheck &&
            timers[index] > 0  
    }

    function CollectedAllWallItems(secrets) {
        conditions = []
        count = length(secrets)

        max = this.GetMaxSecretStage(secrets)

        for secret in secrets {
            for index in range(0, 23) {
                array_push
                (
                    conditions,
                    once(this.CollectedWallItem(secret, index)) &&
                    never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithLives) &&
                    never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithoutLives)
                ) 
            }

            if (secret.Item == items.ShotMultiplier) {
                stageCheck = game.Stage.Id == secret.Stage

                if (secret.Floor >= 0)
                    stageCheck = stageCheck &&
                        game.Stage.Floor == secret.Floor

                array_push
                (
                    conditions,
                    once
                    (
                        game.Player.SubWeapon.Multiplier == 2 &&
                        stageCheck &&
                        prev(breakableWalls.Flags) < breakableWalls.Flags
                    ) &&
                    never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithLives) &&
                    never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithoutLives)
                )
            } 
        }

        return measured(tally(count, conditions)) &&
            never(game.Stage.Id > max)
    }

    function CollectedAllSecretItems(secrets) {
        conditions = []
        count = length(secrets)

        max = this.GetMaxSecretStage(secrets)

        for secret in secrets {
            if (secret.Unreachable) {
                array_push
                (
                    conditions,
                    once(this.CollectedSecretItem(secret, 0)) &&
                    never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithLives) &&
                    never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithoutLives)
                )
            } else {
                for index in range(0, 23) {
                    array_push
                    (
                        conditions,
                        once(this.CollectedSecretItem(secret, index)) &&
                        never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithLives) &&
                        never(game.Stage.Id == secret.Stage && game.Screen.Id == screenIds.DeathWithoutLives)
                    )
                }
            }
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

    function BossIsActive(disableWhen = false) {
        activeCheck = game.Boss.State > bossStates.NotSpawned
        if (disableWhen) 
            activeCheck = activeCheck &&
                game.Boss.State < bossStates.Inactive1
        return activeCheck  
    }

    function ClearedStage(stage, challenge = false) {
        clearCheck = game.Stage.Id == stage &&
            game.Boss.Health == 0 &&
            game.Screen.Id == screenIds.StageEnd

        if (challenge)
            clearCheck = trigger_when(clearCheck)

        return prev(game.Screen.Id) == screenIds.Playing && clearCheck
    }

    function DefeatedStageBoss(stage, scrollX, floor, challenge = false) {
        defeatCheck = game.Boss.Health == 0 &&
            prev(game.Screen.Id) == screenIds.Playing &&
            game.Screen.Id == screenIds.StageEnd

        if (challenge)
            defeatCheck = trigger_when(defeatCheck)

        return this.BossIsActive() &&
            game.Stage.Id == stage &&
            game.Stage.ScrollX == scrollX &&
            game.Stage.Floor == floor &&
            defeatCheck
    }

    function NoSubWeaponBoss(stage, scrollX, floor) {
        return this.DefeatedStageBoss(stage, scrollX, floor, true) &&
            disable_when
            (
                this.IsPlaying() && 
                this.BossIsActive(true) && 
                game.Boss.Health > 0 && 
                game.Stage.Id == stage &&
                game.Stage.ScrollX == scrollX &&
                game.Stage.Floor == floor &&
                game.Player.Hearts < prev(game.Player.Hearts)
            ) &&
            (
                always_false() || 
                (
                    never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithLives) &&
                    never(game.Stage.Id == stage && game.Screen.Id == screenIds.DeathWithoutLives) &&
                    never(game.Stage.Id != stage) &&
                    never(helpers.IsNotPlaying())
                )
            )
    }

    function NoDeathStageChallenge(start, end) {
        return this.ClearedStage(end, true) &&
            disable_when
            (
                game.Stage.Id >= start &&
                game.Stage.Id <= end &&
                prev(game.Screen.Id) == screenIds.Playing &&
                game.Screen.Id == screenIds.DeathWithLives

            ) &&
            (
                always_false() ||
                (
                    never(game.Stage.Id >= start && game.Stage.Id <= end && game.Screen.Id == screenIds.DeathWithoutLives) &&
                    never(game.Stage.Id < start) &&
                    never(game.Stage.Id > end) &&
                    never(helpers.IsNotPlaying())
                )
            )
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
        return helpers.DefeatedStageBoss(3, 0x200, 0)
    }

    function LikeABatOutOfHell() {
        return helpers.NoSubWeaponBoss(3, 0x200, 0)
    }

    function Beeline() {
        return helpers.NoDeathStageChallenge(0, 3)
    }

    // Stages 4 - 6
    function CitrineCache() {
        return helpers.CollectedAllWallItems(breakableWalls.Block2) &&
            helpers.ResetStageChallenge()
    }

    function SapphireStash() {
        return helpers.CollectedAllSecretItems(secrets.Block2) &&
            helpers.ResetStageChallenge()
    }  

    function HangFire() {
        return helpers.BrokeAllCandlesInStageRange(4, 6, 51) &&
            helpers.ResetStageChallenge()
    }

    function SnakeInTheGrass() {
        return helpers.DefeatedStageBoss(6, 0, 1)
    }

    function SnakeEyes() {
        return helpers.NoSubWeaponBoss(6, 0, 1)
    }

    function OnThinIce() {
        return helpers.NoDeathStageChallenge(4, 6)
    }

    // Stages 7 - 9
    function OpalOpulence() {
        return helpers.CollectedAllWallItems(breakableWalls.Block3) &&
            helpers.ResetStageChallenge()
    }

    function LapisLoot() {
        return helpers.CollectedAllSecretItems(secrets.Block3) &&
            helpers.ResetStageChallenge()
    }

    function TrialByFire() {
        return helpers.BrokeAllCandlesInStageRange(7, 9, 37) &&
            helpers.ResetStageChallenge()
    }

    function MumsTheWord() {
        return helpers.DefeatedStageBoss(9, 5, 0)
    }

    function MummysBoy() {
        return helpers.NoSubWeaponBoss(9, 5, 0)
    }

    function DiceWithDeath() {
        return helpers.NoDeathStageChallenge(7, 9)
    }

    // Stages 10 - 12
    function DiamonDough() {
        return helpers.CollectedAllWallItems(breakableWalls.Block4) &&
            helpers.ResetStageChallenge()
    }

    function WorldOnFire() {
        return helpers.BrokeAllCandlesInStageRange(10, 12, 34) &&
            helpers.ResetStageChallenge()
    }

    function GreenEyedMonster() {
        return helpers.DefeatedStageBoss(12, 3, 0)
    }

    function MonsterMash() {
        return helpers.NoSubWeaponBoss(12, 3, 0)
    }

    function GoForBroke() {
        return helpers.NoDeathStageChallenge(10, 12)
    }

    // Stages 13 - 15
    function EmeraldEndowment() {
        return helpers.CollectedAllWallItems(breakableWalls.Block5) &&
            helpers.ResetStageChallenge()
    }

    function AquamarineAssets() {
        return helpers.CollectedAllSecretItems(secrets.Block5) &&
            helpers.ResetStageChallenge()
    }

    function SnuffedOut() {
        return helpers.BrokeAllCandlesInStageRange(13, 15, 74) &&
            helpers.ResetStageChallenge()
    }

    function AtDeathsDoor() {
        return helpers.DefeatedStageBoss(15, 3, 0)
    }

    function DeadRinger() {
        return helpers.NoSubWeaponBoss(15, 3, 0)
    }

    function UpTheAnte() {
        return helpers.NoDeathStageChallenge(13, 15)
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
        return helpers.IsPlaying() &&
            helpers.AcquiredHearts(99)
    }

    function FiveFingerDiscount() {
        return always_false()
    }

    function NowYouSeeMe() {
        return always_false()
    }

    function BigShot() {
        return helpers.IsPlaying() &&
            helpers.UpgradedShotMultiplier(1)
    }

    function PowerShot() {
        return helpers.IsPlaying() &&
            helpers.UpgradedShotMultiplier(2)
    }

    function WhipItRealGood() {
        return helpers.IsPlaying() &&
            helpers.UpgradedWhip(2)
    }

    function GiveMeFive() {
        return always_false()
    }

    // Other Challenges
    function AxeToGrind() {
        return helpers.KilledEnemiesWithSubWeapon(subWeapons.Axe, 20)
    }

    function TurnTheKnife() {
        return helpers.KilledEnemiesWithSubWeapon(subWeapons.Dagger, 20)
    }

    function CrossToCarry() {
        return helpers.KilledEnemiesWithSubWeapon(subWeapons.Cross, 20)
    }

    function MakeASplash() {
        return helpers.KilledEnemiesWithSubWeapon(subWeapons.HolyWater, 20)
    }

    function OneStopShop() {
        return helpers.IsPlaying() &&
            helpers.GotStopwatchBonus()
    }

    function Bloodbath() {
        return helpers.IsPlaying() &&
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
        Achievement(0, 4, "Axe to Grind", "Kill 20 enemies with the Axe without losing a life or changing sub-weapons", triggers.AxeToGrind()),
        Achievement(0, 4, "Turn the Knife", "Kill 20 enemies with the Dagger without losing a life or changing sub-weapons", triggers.TurnTheKnife()),
        Achievement(0, 4, "Cross to Carry", "Kill 20 enemies with the Cross without losing a life or changing sub-weapons", triggers.CrossToCarry()),
        Achievement(0, 4, "Make a Splash", "Kill 20 enemies with the Holy Water without losing a life or changing sub-weapons", triggers.MakeASplash()),
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
rich_presence_conditional_display(
    helpers.IsInGame(), 
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

rich_presence_conditional_display(helpers.IsOnMapTransition(), "Simon is traveling to the next section of Dracula's Castle")

rich_presence_conditional_display(helpers.IsOnTitle() || helpers.IsLoading(), "Simon is preparing for his journey to Dracula's Castle")

rich_presence_conditional_display(helpers.IsIntro(), "Simon has arrived at Dracula's Castle")

rich_presence_conditional_display(helpers.IsGameOver(), "Simon has been bested by Dracula's Castle")

rich_presence_display("🏰 Playing Akumajou Dracula 🧛")

achievements.Generate()