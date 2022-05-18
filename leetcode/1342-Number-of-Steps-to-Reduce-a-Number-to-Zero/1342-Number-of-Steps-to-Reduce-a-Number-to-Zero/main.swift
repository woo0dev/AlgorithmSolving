func numberOfSteps(_ num: Int) -> Int {
    var result = 0
    var n = num
    while 0 < n {
        n = n%2==0 ? n/2 : n-1
        result += 1
        print(n)
    }
    return result
}

print(numberOfSteps(14))
