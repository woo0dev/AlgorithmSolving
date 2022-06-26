func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
    var isResult = false
    
    if word1.joined(separator: "") == word2.joined(separator: "") {
        isResult = true
    }
    
    return isResult
}

print(arrayStringsAreEqual(["ab", "c"], ["a", "bc"]))
