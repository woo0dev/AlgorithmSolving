func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var target: [Int] = []
    
    for idx in 0..<nums.count {
        target.insert(nums[idx], at: index[idx])
    }
    
    return target
}

print(createTargetArray([0,1,2,3,4], [0,1,2,2,1]))
