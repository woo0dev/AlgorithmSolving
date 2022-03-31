func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    var resultArr: [Int] = Array()
    var count = 0
    for idx in 0..<nums.count {
        for idx2 in 0..<nums.count {
            if nums[idx] > nums[idx2] {
                count += 1
            }
        }
        resultArr.append(count)
        count = 0
    }
    return resultArr
}

print(smallerNumbersThanCurrent([8,1,2,2,3]))
