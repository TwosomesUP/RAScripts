// ~Homebrew~ FX Unit Yuki: The Henshin Engine
// #ID = 28624

US = "US"
EU = 1
Dict = {
    "US": [],
    "EU": []
}

function TestPush(){
    for i in range(0, 9){
        array_push(Dict[US], 1)
    }
    
    return all_of(Dict, key => Dict[key] == 1)
}

achievement(title = "Test", description = "Test", points = 25, trigger = TestPush())