// Fray: Shugyou Hen
// #ID = 17328

class GameData {
    GameState = byte(0x1a5)
    ContinueState = byte(0x1aa)
    Stage = byte(0x1534)
    CurrentEnemyHits = word(0x1936)
    TargetEnemyHits = word(0x1938)
    AwardedMedals = byte(0x1a60)
}
game = GameData()

class PlayerData {
    ActiveSpell = byte(0x1535)
    MagicPoints = byte(0x1536)
    HealthPoints = byte(0x1537)
    UsedOneUps = byte(0x1538)
    EquippedRod = byte(0x1931)
    EquippedBoots = byte(0x1934)
    CurrentMedals = byte(0x1935)
    HaveDualRod = byte(0x193b)
    HaveFireRod = byte(0x193c)
    HaveHyperBoots = byte(0x193d)
    HaveHyperShield = byte(0x193e)
    OneUpStock = byte(0x193f)
    RemainingContinues = byte(0x1940)
    HaveDonationBonus = byte(0x1942)
    HaveFireSpell = bit0(0x1944)
    HaveLightningSpell = bit1(0x1944)
    HaveTsunamiSpell = bit2(0x1944)
    HavePhoenixSpell = bit3(0x1944)
    HaveQuakeSpell = bit4(0x1944)
    HyperShieldHitsRemaining = byte(0x1947)
}
player = PlayerData()

class BossData {
    Id = byte(0x1564)
    Defeated = byte(0x173b)
    HealthPoints = byte(0x18b1)
}
boss = BossData()

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
        return game.GameState == 3
    }

    function IsNotInGame() {
        return game.GameState < 3
    }

    function ClearedStage(stage) {
        return prev(game.Stage) == stage &&
            game.State == stage + 1
    }

    function AchievementMedalCount(amount) {
        return player.CurrentMedals == prev(player.CurrentMedals) + amount
    }

    function DefeatedBoss(isChallenge = false) {
        trigger = prev(boss.HealthPoints) > 0 &&
            boss.HealthPoints == 0

        if (isChallenge) {
            trigger = boss.Id != 0 &&
                trigger_when(trigger)
        }

        return trigger
    }

    // Need to figure out a value to detect the boss screen
    function DefeatedBossNoDamage(stage) {
        return this.IsInGame() && 
            game.Stage == stage &&
            this.DefeatedBoss(true) &&
            disable_when(this.IsInGame() && game.Stage == stage && boss.HealthPoints > 0 && prev(player.HealthPoints) > player.HealthPoints) &&
            (
                always_false() ||
                (
                    never(game.Stage != stage) &&
                    never(prev(player.RemainingContinues) > player.RemainingContinues) &&
                    never(this.IsNotInGame())
                )
            )
    }
}
helpers = AchievementHelpers()

class AchievementTriggers {
    function Period1() {
        return always_false()
    }

    function Period1Medals() {
        return always_false()
    }

    function Period1Boss() {
        return helpers.DefeatedBossNoDamage(0)
    }

    function Period2() {
        return always_false()
    }

    function Period2Medals() {
        return always_false()
    }

    function Period2Boss() {
        return always_false()
    }

    function Period3() {
        return always_false()
    }

    function Period3Medals() {
        return always_false()
    }

    function Period3Boss() {
        return always_false()
    }

    function Period4() {
        return always_false()
    }

    function Period4Medals() {
        return always_false()
    }

    function Period4Boss() {
        return always_false()
    }

    function Period5() {
        return always_false()
    }

    function Period5Medals() {
        return always_false()
    }

    function Period5Boss() {
        return always_false()
    }

    function Period6() {
        return always_false()
    }

    function Period6Medals() {
        return always_false()
    }

    function Period6Boss() {
        return always_false()
    }

    function Period7() {
        return always_false()
    }

    function Period7Medals() {
        return always_false()
    }

    function Period7Boss() {
        return always_false()
    }

    function NoContinues() {
        return always_false()
    }

    function NoShop() {
        return always_false()
    }

    function PerfectGrade() {
        return always_false()
    }

    function MagicPoints() {
        return always_false()
    }

    function DualRod() {
        return always_false()
    }

    function FireRod() {
        return always_false()
    }

    function HyperBoots() {
        return always_false()
    }

    function HyperShield() {
        return always_false()
    }

    function OneUpMagic() {
        return always_false()
    }

    function HyperShieldChallenge() {
        return always_false()
    }

    function Donation() {
        return always_false()
    }

    function ShopBonus() {
        return always_false()
    }

    function MaxMedals() {
        return always_false()
    }
}
triggers = AchievementTriggers()

class Achievements {
    StartingID = 0
    Data = [
        Achievement(1, 2, "Period 1", "Clear Period 1", triggers.Period1()),
        Achievement(0, 5, "Period 1 Medals", "Clear Period 1 with a high grade and collect 9 medals", triggers.Period1Medals()),
        Achievement(0, 5, "Period 1 Boss", "Defeat the Period 1 boss without taking damage", triggers.Period1Boss()),
        Achievement(1, 2, "Period 2", "Clear Period 2", triggers.Period2()),
        Achievement(0, 5, "Period 2 Medals", "Clear Period 2 with a high grade and collect 9 medals", triggers.Period2Medals()),
        Achievement(0, 5, "Period 2 Boss", "Defeat the Period 2 boss without taking damage", triggers.Period2Boss()),
        Achievement(1, 2, "Period 3", "Clear Period 3", triggers.Period3()),
        Achievement(0, 5, "Period 3 Medals", "Clear Period 3 with a high grade and collect 9 medals", triggers.Period3Medals()),
        Achievement(0, 5, "Period 3 Boss", "Defeat the Period 3 boss without taking damage", triggers.Period3Boss()),
        Achievement(1, 3, "Period 4", "Clear Period 4", triggers.Period4()),
        Achievement(0, 5, "Period 4 Medals", "Clear Period 4 with a high grade and collect 9 medals", triggers.Period4Medals()),
        Achievement(0, 5, "Period 4 Boss", "Defeat the Period 4 boss without taking damage", triggers.Period4Boss()),
        Achievement(1, 3, "Period 5", "Clear Period 5", triggers.Period5()),
        Achievement(0, 5, "Period 5 Medals", "Clear Period 5 with a high grade and collect 9 medals", triggers.Period5Medals()),
        Achievement(0, 5, "Period 5 Boss", "Defeat the Period 5 boss without taking damage", triggers.Period5Boss()),
        Achievement(1, 3, "Period 6", "Clear Period 6", triggers.Period6()),
        Achievement(0, 5, "Period 6 Medals", "Clear Period 6 with a high grade and collect 9 medals", triggers.Period6Medals()),
        Achievement(0, 5, "Period 6 Boss", "Defeat the Period 6 boss without taking damage", triggers.Period6Boss()),
        Achievement(2, 5, "Period 7", "Clear Period 7", triggers.Period7()),
        Achievement(0, 5, "Period 7 Medals", "Clear Period 7 with a high grade and collect 9 medals", triggers.Period7Medals()),
        Achievement(0, 5, "Period 7 Boss", "Defeat the Period 7 boss without taking damage", triggers.Period7Boss()),
        Achievement(0, 25, "No Continues", "In a single session, clear all 7 Periods without using a continue", triggers.NoContinues()),
        Achievement(0, 10, "No Shop", "In a single session, clear all 7 periods wihtout purchasing an item from the shop", triggers.NoShop()),
        Achievement(0, 10, "Perfect Grade", "Get a perfect grade of 100 on any stage and collect 15 medals", triggers.PerfectGrade()),
        Achievement(0, 5, "Magic Points", "Have a stock of 30 Magic Points", triggers.MagicPoints()),
        Achievement(0, 2, "Dual Rod", "Purchase the Dual Rod from the Shop", triggers.DualRod()),
        Achievement(0, 2, "Fire Rod", "Purchase the Fire Rod from the Shop", triggers.FireRod()),
        Achievement(0, 2, "Hyper Boots", "Purchase the Hyper Boots from the Shop", triggers.HyperBoots()),
        Achievement(0, 2, "Hyper Shield", "Purchase the Hyper Shield from the Shop", triggers.HyperShield()),
        Achievement(0, 2, "1UP Magic", "Purchase some 1UP Magic from the Shop", triggers.OneUpMagic()),
        Achievement(0, 10, "Hyper Shield Challenge", "After purchasing a Hyper Shield, clear any stage without losing it", triggers.HyperShieldChallenge()),
        Achievement(0, 5, "Donation", "Make a donation to the shop and be rewarded for your generosity", triggers.Donation()),
        Achievement(0, 5, "Shop Bonus", "Stick to your guns and recieve a gift for your determination", triggers.ShopBonus()),
        Achievement(0, 10, "Max Medals", "Have a stock of 99 Medals", triggers.MaxMedals())
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

class LeaderboardFormats {
    Value = "VALUE"
    Seconds = "SECS"
    Frames = "FRAMES"
    Points = "POINTS"
    Milliseconds = "MILLISECS"
    Minutes = "MINUTES"
    SecondsAsMinutes = "SECS_AS_MINS"
    Float1 = "FLOAT1"
    Float2 = "FLOAT2"
    Float3 = "FLOAT3"
    Float4 = "FLOAT4"
    Float5 = "FLOAT5"
    Float6 = "FLOAT6"
    Fixed1 = "FIXED1"
    Fixed2 = "FIXED2"
    Fixed3 = "FIXED3"
    Tens = "TENS"
    Hundreds = "HUNDREDS"
    Thousands = "THOUSANDS"
}
leaderboardFormats = LeaderboardFormats()

class Leaderboard {
    Id = 0
    Title = ""
    Description = ""
    Start = always_false()
    Cancel = always_false()
    Submit = always_false()
    Value = 0
    Format = leaderboardFormats.Value
    LowerIsBetter = false
    Set = 0
}

class LeaderboardHelpers {
    function Start() {
        return always_false()
    }

    function Value() {
        return 0
    }
}
leaderboardHelpers = LeaderboardHelpers()

class Leaderboards {
    Data = [
        Leaderboard
        (
            0,
            "Test", 
            "Test", 
            leaderboardHelpers.Start(), 
            always_false(), 
            always_true(), 
            leaderboardHelpers.Value(),
            leaderboardFormats.Value,
            false
        )
    ]

    function Generate() {   
        count = 0
        for leaderboardDef in this.Data {
            leaderboard
            (
                leaderboardDef.Title, 
                leaderboardDef.Description, 
                leaderboardDef.Start, 
                leaderboardDef.Cancel,
                leaderboardDef.Submit,
                leaderboardDef.Value,
                leaderboardDef.Format,
                leaderboardDef.LowerIsBetter,
                leaderboardDef.Id,
                leaderboardDef.Set
            )
            count = count + 1
        }
    }
}
leaderboards = Leaderboards()

leaderboards.Generate()
achievements.Generate()