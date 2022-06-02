func numberOfMatches(_ n: Int) -> Int {
    var team = n
    var result = 0
    var unearnedWin = 0
    
    while team > 1 {
        unearnedWin = team % 2 == 0 ? 0 : 1
        team = team % 2 == 0 ? team / 2 : (team - 1) / 2
        result += team
        if unearnedWin == 1 {
            team += 1
            unearnedWin = 0
        }
    }
    
    return result
}

print(numberOfMatches(14))
