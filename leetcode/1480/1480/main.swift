func runningSum(_ nums: [Int]) -> [Int] {
    var results: [Int] = []
    for i in nums {
        results.isEmpty == true ? results.append(i) : results.append(results[results.count-1]+i)
    }
    return results
}

print(runningSum([1,2,3,4]))
