func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var result: [Bool] = Array()
    let max = candies.max()
    var temp = true
    for i in 0..<candies.count {
        if candies[i] + extraCandies < max! {
            temp = false
        } else {
            temp = true
        }
        result.append(temp)
    }
    return result
}

print(kidsWithCandies([2,3,5,1,3], 3))
