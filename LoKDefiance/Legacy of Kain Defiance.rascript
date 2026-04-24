// Legacy of Kain: Defiance
// #ID = 8656

class Utilities {
    BuildLookup(kvpArray) {
        lookup = {}
        for kvp in kvpArray {
            lookup[kvp.Key] = kvp.Value
        }
        return lookup
    }
}
utilities = Utilities()

class Position {
    X = 0
    Y = 0
    Z = 0
}

class Enemy {
    CurrentHealth = 0
    MaxHealth = 0
    CurrentBlood = 0
    MaxBlood = 0 
}

class KeyValuePair {
    Key = 0
    Value = 0
}

class Weapons {
    SpectralReaver = KeyValuePair(0x01, "Spectral Reaver")
    MaterialReaver = KeyValuePair(0x02, "Material Reaver")
    DarkReaver = KeyValuePair(0x03, "Dark Reaver")
    LightReaver = KeyValuePair(0x04, "Light Reaver")
    AirReaver = KeyValuePair(0x05, "Air Reaver")
    FireReaver = KeyValuePair(0x06, "Fire Reaver")
    WaterReaver = KeyValuePair(0x07, "Water Reaver")
    EarthReaver = KeyValuePair(0x08, "Earth Reaver")
    SpiritReaver = KeyValuePair(0x09, "Spirit Reaver")
    DimensionPillar = KeyValuePair(0x0a, "Dimension Pillar")
    ConflictPillar = KeyValuePair(0x0b, "Conflict Pillar")
    TimePillar = KeyValuePair(0x0c, "Time Pillar")
    EnergyPillar = KeyValuePair(0x0d, "Energy Pillar")
    BloodReaver = KeyValuePair(0x0e, "Blood Reaver")
    SpiritKain = KeyValuePair(0x0f, "Spirit Kain")

    All = [
        SpectralReaver,
        MaterialReaver,
        DarkReaver,
        LightReaver,
        AirReaver,
        FireReaver,
        WaterReaver,
        EarthReaver,
        SpiritReaver,
        DimensionPillar,
        ConflictPillar,
        TimePillar,
        EnergyPillar,
        BloodReaver,
        SpiritKain
    ]

    function Lookup() {
        return utilities.BuildLookup(this.All)
    }
}
weapons = Weapons()

class CharacterType {
    Kain = KeyValuePair(0x00, "Kain")
    Raziel = KeyValuePair(0x01, "Raziel")

    All = [
        Kain,
        Raziel
    ]

    function Lookup() {
        return utilities.BuildLookup(this.All)
    }
}
characterType = CharacterType()

class Character {
    Base = dword(0x28f2b4)
    AnimationIndex = dword(Base + 0x08)
    Position = Position(dword(Base + 0xf0), dword(Base + 0xf4), dword(Base + 0xf8))
    CurrentTarget = dword(dword(Base + 0x170))
    CurrentFocus = dword(dword(Base + 0x180))
    LastTargetHit = dword(dword(Base + 0x1b0))
    HealthTalismans = dword(dword(Base + 0x3a4))
    HealthTalismanParts = dword(dword(Base + 0x3a6))
    Health = float(dword(Base + 0x3a8))
    TelekinesisRuins = dword(dword(Base + 0x3ba))
    EquippedWeapon = dword(dword(Base + 0x3cc))
    TelekinesisEnergy = float(dword(Base + 0x5d8))
    CurrentCharacter = dword(dword(Base + 0xa16))
    Experience = dword(dword(Base + 0xa24))

    function GetTargetedEnemy(targetBase) {
        enemyBase = dword(targetBase + 0x2e4)
        return Enemy(
            dword(enemyBase + 0x460),
            dword(enemyBase + 0x464),
            dword(enemyBase + 0x468),
            dword(enemyBase + 0x46c)
        )
    }
}
character = Character()