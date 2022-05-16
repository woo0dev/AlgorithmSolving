func cellsInRange(_ s: String) -> [String] {
    var results: [String] = []
    let startCol = s[s.startIndex].asciiValue!
    let endCol = s[s.index(s.startIndex, offsetBy: 3)].asciiValue!
    let startRow = s[s.index(s.startIndex, offsetBy: 1)].asciiValue!
    let endRow = s[s.index(before: s.endIndex)].asciiValue!
    var idxCol = startCol
    var idxRow = Int(startRow)
    
    while idxCol <= endCol {
        while idxRow <= endRow {
            results.append(String(UnicodeScalar(idxCol))+String(UnicodeScalar(UInt8(idxRow))))
            idxRow += 1
        }
        idxRow = Int(startRow)
        idxCol += 1
    }
    
        
    return results
}

print(cellsInRange("K1:L2"))
