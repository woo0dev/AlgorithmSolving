func xorOperation(_ n: Int, _ start: Int) -> Int {
    var result = 0
    var arr: [Int] = []
    
    for i in start..<n {
        arr.append(2*i)
    }
    result = arr[0]^arr[1]
    for i in 1..<arr.count-1 {
        result = result^arr[i+1]
    }
    
    return result
}

print(xorOperation(4, 3))
