func decompressRLElist(_ nums: [Int]) -> [Int] {
    var result: [Int] = Array()
    for i in 0..<nums.count-1 {
        if i % 2 == 0 {
            for j in 0..<nums[i] {
                result.append(nums[i+1])
            }
        }
    }
    return result
}

print(decompressRLElist([1,2,3,4]))
