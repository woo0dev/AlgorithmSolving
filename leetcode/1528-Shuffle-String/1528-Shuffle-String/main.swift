import Foundation
func restoreString(_ s: String, _ indices: [Int]) -> String {
    var arr = Array(s)
    var resultArr = [String](repeating: "", count: indices.count)
    for i in 0..<indices.count {
        resultArr[indices[i]] = String(arr[i])
    }
    return resultArr.joined()
}

print(restoreString("vttqexwqgdc", [9,5,8,0,4,3,6,10,1,2,7]))
