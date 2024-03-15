// ~Homebrew~ FX Unit Yuki: The Henshin Engine
// #ID = 28624

Offset = 0x234
BasePointer = dword(0x000) & 0x7fffffff

function Test(){
    health = dword(BasePointer + Offset)
    return prev(health) > 0 && health == 0
}

achievement(title = "Test", description = "Test", points = 25, trigger = Test())