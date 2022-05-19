func sortSentence(_ s: String) -> String {
    let splitStr = s.split(separator: " ")
    var resultArr = [String](repeating: "", count: splitStr.count)
    
    for i in 0..<splitStr.count {
        var temp = splitStr[i]
        var lastIdx = temp[temp.index(temp.endIndex, offsetBy: -1)]
        var res = temp.dropLast()
        resultArr[Int(String(lastIdx))!-1] = String(res)
    }
    
    return resultArr.joined(separator: " ")
}

print(sortSentence("is2 sentence4 This1 a3"))
