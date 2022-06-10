func countKDifference(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    
    for i in 0..<nums.count {
        if i < nums.count {
            for j in i+1..<nums.count {
                if abs(nums[i] - nums[j]) == k {
                    result += 1
                }
            }
        }
    }
    
    return result
}

print(countKDifference([1,2,2,1], 1))
