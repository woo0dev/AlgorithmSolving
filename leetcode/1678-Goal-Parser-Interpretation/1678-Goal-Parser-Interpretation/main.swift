import Foundation
func interpret(_ command: String) -> String {
    let str = Array(command)
    var result = ""
    var idx = 0
    while idx < str.count {
        if str[idx] == "G" {
            result += "G"
            idx += 1
        } else if str[idx] == "(" && str[idx+1] == ")" {
            result += "o"
            idx += 2
        } else {
            result += "al"
            idx += 4
        }
    }
    print(str)
    return result
}



print(interpret("(al)G(al)()()G"))
