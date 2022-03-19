func mostWordsFound(_ sentences: [String]) -> Int {
    var result = 0
    for sentence in sentences {
        var temp = sentence.split(separator: " ").count
        if result < temp {
            result = temp
        }
    }
    return result
}

print(mostWordsFound(["alice and bob love leetcode", "i think so too", "this is great thanks very much"]))
