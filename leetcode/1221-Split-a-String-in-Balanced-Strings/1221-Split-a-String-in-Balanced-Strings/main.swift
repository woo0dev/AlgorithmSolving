func balancedStringSplit(_ s: String) -> Int {
    var result = 0
    var countR = 0
    var countL = 0
    
    for c in s {
        if c == "R" {
            countR += 1
        } else {
            countL += 1
        }
        if countR == countL {
            result += 1
            countR = 0
            countL = 0
        }
    }
    
    return result
}

print(balancedStringSplit("RLRRLLRLRL"))
