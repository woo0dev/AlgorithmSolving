//
//  main.swift
//  LV2-155651
//
//  Created by woo0 on 2023/03/30.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
	var result = 0
	var times = book_time.sorted {
		return $0[0] < $1[0]
	}
	var rooms = [[Int]]()
	
	for time in times {
		var start = time[0].components(separatedBy: ":").map { return Int($0)! }
		var end = time[1].components(separatedBy: ":").map { return Int($0)! }
		if end[1] > 50 {
			end[0] += 1
			end[1] = (end[1] + 10) - 60
		} else {
			end[1] += 10
		}
		if rooms.count == 0 {
			rooms.append(end)
			result += 1
		} else {
			var roomIndex = 0
			var checkIn = false
			for i in 0..<rooms.count {
				if rooms[i][0] < start[0] {
					roomIndex = i
					checkIn = true
					break
				} else if rooms[i][0] == start[0] && rooms[i][1] <= start[1] {
					roomIndex = i
					checkIn = true
					break
				}
			}
			if checkIn {
				rooms[roomIndex] = end
			} else {
				rooms.append(end)
				result += 1
			}
		}
	}
	
	return result
}

print(solution([["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]]))
