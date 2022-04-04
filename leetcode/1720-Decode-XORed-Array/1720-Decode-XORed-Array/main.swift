func decode(_ encoded: [Int], _ first: Int) -> [Int] {
    var result: [Int] = Array()
    var temp = first
    for i in 0..<encoded.count {
        if i == 0 {
            result.append(temp)
            if encoded[i] > temp {
                result.append(encoded[i]-temp)
            } else {
                result.append(temp-encoded[i])
            }
        } else {
            if encoded[i] > result.last! {
                result.append(encoded[i]-result.last!)
            } else {
                result.append(result.last!-encoded[i])
            }
            temp = encoded[i]
        }
    }
    return result
}

print(decode([6], 1))
