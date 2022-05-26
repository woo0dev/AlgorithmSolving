func xorOperation(_ n: Int, _ start: Int) -> Int {
    var result = 0
    var arr: [Int] = []
    
    for i in start..<start+n {
        arr.append(start+2*arr.count)
    }
    if arr.count > 1 {
        result = arr[0]^arr[1]
        for i in 1..<arr.count-1 {
            result = result^arr[i+1]
        }
    } else {
        result = arr[0]
    }
    
    return result
}

print(xorOperation(4, 3))
