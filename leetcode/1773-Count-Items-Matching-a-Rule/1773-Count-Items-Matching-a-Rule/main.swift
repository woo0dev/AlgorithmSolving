func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
    var result = 0
    let idx = ruleKey == "type" ? 0 : ruleKey == "color" ? 1 : 2
    
    for item in items {
        if item[idx] == ruleValue {
            result += 1
        }
    }
    
    return result
}

print(countMatches([["phone","blue","pixel"],["computer","silver","lenovo"],["phone","gold","iphone"]], "color", "silver"))
