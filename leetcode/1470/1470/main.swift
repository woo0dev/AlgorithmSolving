import Foundation

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    var temp = nums
    var i = n
    var j = 1
    for idx in 0..<n {
        temp.insert(temp[i], at: j)
        i += 2
        j += 2
    }
    for idx in 0..<n {
        temp.removeLast()
    }
    return temp
}

print(shuffle([2,5,1,3,4,7], 3))
