// Thexder
// #ID = 13709
// Retro Achievements - Leaderboard Script
// Author: TwosomesUP

//================================================================
// Accessors
//================================================================

Game = {
    "GameOver": byte(0x9c50),
    "Loaded": byte(0x9c51),
    "State": byte(0xf7f0),
    "Level": low4(0xfb04) + low4(0xfb05) * 10
}

Player = {
    "ShieldActive": byte(0xb484),
    "LaserActive": byte(0xfafd),
    "Transformed": byte(0xfaeb),
    "Energy": low4(0xb58c) + low4(0xb58b) * 10 + low4(0xb58a) * 100,
    "MaxEnergy": low4(0xfb06) + low4(0xfb07) * 10 + low4(0xfb08) * 100,
    "Position": word(0xfad8),
    "Score": low4(0xfb37) * 10 + low4(0xfb38) * 100 +
        low4(0xfb39) * 1000 + low4(0xfb3a) * 10000 + low4(0xfb3b) * 100000 +
        low4(0xfb3c) * 1000000 + low4(0xfb3d) * 10000000 + low4(0xfb3e) * 100000000
}

//================================================================
// Helper Functions
//================================================================

function GameIsLoaded() => Game["Loaded"] == 0xf3
function GameStarted() => Game["State"] != 0x80

function IsInGame() => GameIsLoaded() && GameStarted()
function IsGameOver() => Game["GameOver"] == 0xc9
function GotGameOver() => prev(Game["GameOver"]) == 0 && Game["GameOver"] == 0xc9

function PlayerGotGameOver(){
    return IsInGame() &&
        GotGameOver()
}

//================================================================
// Leaderboard Definition
//================================================================

leaderboard("Score Attack", "Fight the creatures of the Forbidden World and achieve the highest score possible before getting a game over",
    start = PlayerGotGameOver() && Player["Score"] > 10000,
    cancel = always_false(),
    submit = always_true(),
    value = Player["Score"]
)

leaderboard("Level Challenge", "Explore the Forbidden World and reach the highest level possible before getting a game over",
    start = PlayerGotGameOver() && Game["Level"] > 1,
    cancel = always_false(),
    submit = always_true(),
    value = Game["Level"]
)
