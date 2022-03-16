func maximumWealth(_ accounts: [[Int]]) -> Int {
    var result = 0
    var temp = 0
    for i in accounts {
        for j in i {
            temp += j
        }
        if result < temp {
            result = temp
        }
        temp = 0
    }
    return result
}

print(maximumWealth([[2,8,7],[7,1,3],[1,9,5]]))
