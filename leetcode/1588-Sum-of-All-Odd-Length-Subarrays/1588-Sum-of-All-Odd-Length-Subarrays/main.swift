func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
    var result = 0
    var temp = 2
    for i in 0..<arr.count {
        result += arr[i]
        while i+temp < arr.count {
            for j in i..<i+temp+1 {
                result += arr[j]
            }
            temp += 2
        }
        temp = 2
    }
    
    return result
}

print(sumOddLengthSubarrays([1,4,2,5,3]))
