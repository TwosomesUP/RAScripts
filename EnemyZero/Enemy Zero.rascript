// Doctor Hauzer
// #ID = 14556

class Achievement {
    Type = 0 // 0 = None, 1 = Progression, 2 = Win Condition, 3 = Missable
    Points = 0
    Title = ""
    Description = ""
    Trigger = always_false()
    Id = 0
}

class AchievementHelpers {
    
}
helpers = AchievementHelpers()

class AchievementTriggers {
}
triggers = AchievementTriggers()

class Achievements {
    StartingID = 0
    Data = [
        Achievement(0, 5, "Training", "Complete all three training missions on Disc 0", always_false()),
        Achievement(0, 5, "Butterflies", "Notice something delicate drifting through the silence...", always_false()),
        Achievement(0, 5, "Parker Static", "Press Parker for answers... and hear the signal die", always_false()),
        Achievement(0, 5, "Stair Room", "Override the emergency lockdown and descend into the Winter Tower Basement", always_false()),
        Achievement(0, 5, "Parker's Body", "Discover why Parker stopped answering", always_false()),
        Achievement(0, 5, "Marcus's Body", "Witness a gruesome scene in Marcus's Room", always_false()),
        Achievement(0, 5, "First Gun", "Find something to defend yourself with", always_false()),
        Achievement(0, 5, "Space View", "Pause beneath the endless stars", always_false()),
        Achievement(0, 5, "First Kill", "Strike down the unseen hunter below the Winter Tower", always_false()),
        Achievement(0, 5, "Winter Power", "Restore light to the silent Winter Tower", always_false()),
        Achievement(0, 5, "Air Ducts", "Escape an invisible stalker and slip away into the station's veins", always_false()),
        Achievement(0, 5, "George's Computer", "Tamper with George's terminal and face his displeasure", always_false()),
        Achievement(0, 5, "Archive Ladder", "Open a quiet path back into the air ducts", always_false()),
        Achievement(0, 5, "Tool Room Recharge", "Break George's safeguards and revive your weapon", always_false()),
        Achievement(0, 5, "Air Duct Enemy", "Silence the watcher in the vents and reach Kimberly", always_false()),
        Achievement(0, 5, "Call Everyone", "Search for answers while there's still someone left to give them", always_false()),
        Achievement(0, 5, "Winter Items", "Gather every trace left by the Winter Tower crew", always_false()),
        Achievement(0, 5, "Winter Clear", "Leave the frozen tower behind", always_false()),
        Achievement(0, 5, "Summer Lift", "Understand the strange logic of the Summer Tower lift", always_false()),
        Achievement(0, 5, "Ronny's Lock", "Break Ronny's cryptic lock", always_false()),
        Achievement(0, 5, "Ronny's Computer", "Follow Ronny's emotional trail and uncover the truth", always_false()),
        Achievement(0, 5, "David", "Reunite with David and remember quieter days", always_false()),
        Achievement(0, 5, "David Death", "Watch hope vanish in an instant", always_false()),
        Achievement(0, 5, "David Disk", "Expose the secret hidden on David's disk—and live through the consequences", always_false()),
        Achievement(0, 5, "Medical Scan", "Learn what the creature left inside you", always_false()),
        Achievement(0, 5, "George Death", "Survive a desperate assault… and a stranger rescue", always_false()),
        Achievement(0, 5, "Summer Power", "Bring life back to the Summer Tower", always_false()),
        Achievement(0, 5, "Summer Items", "Gather every trace left by the Summer Tower crew", always_false()),
        Achievement(0, 5, "Summer Clear", "Descend toward the final tower", always_false()),
        Achievement(0, 5, "Fall Safe Room", "Find a rare sanctuary within the Fall Tower and discover a parting gift from David", always_false()),
        Achievement(0, 5, "Heart Kill", "Put an end to the infectious horror in depths of the Fall Tower", always_false()),
        Achievement(0, 5, "Fall Clear", "Flee the autumn labyrinth and return to the frozen tower", always_false()),
        Achievement(0, 5, "Kimberly Body", "Find Kimberly forever united with Parker", always_false()),
        Achievement(0, 5, "Final Document", "Uncover the truth Parker tried to hide", always_false()),
        Achievement(0, 5, "Beginner Clear", "Escape the station on Beginner difficulty or higher", always_false()),
        Achievement(0, 5, "Easy Clear", "Escape the station on Easy difficulty or higher", always_false()),
        Achievement(0, 5, "Normal Clear", "Escape the station on Normal difficulty", always_false()),
        Achievement(0, 5, "Hard Clear", "Escape the station on Hard difficulty", always_false()),
        Achievement(0, 5, "No VPS", "Beat the game on Normal difficulty or higher without collecting the VPS scanner", always_false()),
        Achievement(0, 5, "Speed Run", "Escape the station in 1.5 hours or less on Normal difficulty or higher", always_false()),
        Achievement(0, 5, "Half Battery", "Escape the station with at least 50% save battery remaining on Normal difficulty or higher", always_false()),
        Achievement(0, 5, "Full Battery", "Escape the station with 100% save battery remaining on Normal difficulty or higher", always_false()),
        Achievement(0, 5, "Pacifist", "Escape the station having killed 3 enemies or less on Normal difficulty or higher", always_false()),
    ]

    function Generate() {   
        count = 0
        for achievement in this.Data {
            achievementType = ""

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
achievements.Generate()

class Leaderboards {
    function Start() {
        return always_false()
    }

    function Cancel() {
        return always_false()
    }

    function Submit() {
        return always_false()
    }

    function Value() {
        return 0
    }
}
leaderboards = Leaderboards()

leaderboard("Swift Escape", "Starting from a New Game, escape the Mansion as quickly as possible in a single session",
    start = leaderboards.Start(),
    cancel = leaderboards.Cancel(),
    submit = leaderboards.Submit(),
    value = leaderboards.Value(),
    format = "FRAMES",
    lower_is_better = true
)

rich_presence_conditional_display(always_false(), 
    "Test"
)

rich_presence_conditional_display(always_false(), 
    "Test"
)

rich_presence_display("Playing Enemy Zero!")