func numIdenticalPairs(_ nums: [Int]) -> Int {
    var result = 0
    var i = 0
    for idx in 0..<nums.count {
        i = idx + 1
        for _ in idx+1..<nums.count {
            if nums[idx] == nums[i] {
                result += 1
            }
            i += 1
        }
    }
    return result
}

print(numIdenticalPairs([1,2,3,1,1,3]))

