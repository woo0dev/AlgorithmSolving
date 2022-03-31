import Foundation
func subtractProductAndSum(_ n: Int) -> Int {
    let arr = String(n).map { Int(String($0))! }
    let mul = arr.reduce(1) {
        $0*$1
    }
    let sum = arr.reduce(0) {
        $0+$1
    }
    return mul-sum
}

print(subtractProductAndSum(234))
