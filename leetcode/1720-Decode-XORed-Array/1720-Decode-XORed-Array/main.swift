func decode(_ encoded: [Int], _ first: Int) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: encoded.count+1)
    var num = first
    result[0] = num
    for i in 0..<encoded.count {
        result[i+1] = encoded[i]^result[i]
        
    }
    return result
}
print(decode([1,2,3], 1))
