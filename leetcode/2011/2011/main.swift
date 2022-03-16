func finalValueAfterOperations(_ operations: [String]) -> Int {
    var result = 0
    for i in operations {
        switch i {
        case "++X":
            result += 1
        case "--X":
            result -= 1
        case "X++":
            result += 1
        case "X--":
            result -= 1
        default:
            result = 0
        }
    }
    return result
}

print(finalValueAfterOperations(["--X","X++","X++"]))
