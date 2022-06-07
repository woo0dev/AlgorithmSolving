func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
    var result = 0
    var seatArr = seats
    var studentArr = students
    seatArr.sort()
    studentArr.sort()
    
    for i in 0..<seatArr.count {
        if seatArr[i] > studentArr[i] {
            for _ in 0..<seatArr[i]-studentArr[i] {
                result += 1
            }
        } else {
            for _ in 0..<studentArr[i]-seatArr[i] {
                result += 1
            }
        }
    }
    
    return result
}

print(minMovesToSeat([2,2,6,6], [1,3,2,6]))
