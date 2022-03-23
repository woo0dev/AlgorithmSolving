import Foundation
func minimumSum(_ num: Int) -> Int {
    var result = 0
    var arr = String(num).map { Int(String($0))! }
    
    var min1 = arr.min()!
    arr = arr.filter { $0 != min1 }
    print(min1)
    return result
}

print(minimumSum(2932))
