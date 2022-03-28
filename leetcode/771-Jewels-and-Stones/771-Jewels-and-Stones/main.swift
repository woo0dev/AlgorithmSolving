func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    let strJewels = Array(jewels)
    let strStones = Array(stones)
    var result = 0
    
    for j in 0..<strJewels.count {
        for s in 0..<strStones.count {
            if strStones[s] == strJewels[j] {
                result += 1
            }
        }
    }
    
    return result
}

print(numJewelsInStones("aA", "aAAbbbb"))
