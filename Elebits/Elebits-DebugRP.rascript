// Elebits
// #ID = 7936
// Author: BacklogOddy
// Rich Presence - Debug

// #region Object Classes

class ObjectFlags {
    baseAddress = 0
    size = 0

    function Count() {
        flags = []
        for index in range(0, this.size - 1) {
            array_push(flags, bitcount(this.baseAddress + index))
        }
        return sum_of(flags, flag => flag)
    }
}

class Objects {
    Discovered = ObjectFlags(0x521764, 176)
    Viewed = ObjectFlags(0x521814, 176)
}

objects = Objects()

// #endregion

// #region Rich Presence Definitions

rich_presence_display("Debug RP || Discovered Objects: {0}/1397 || Viewed Objects: {1}/1397",
    rich_presence_value("DiscoveredCount", objects.Discovered.Count()),
    rich_presence_value("ViewedCount", objects.Viewed.Count())
)

// #endregion