//
//  main.swift
//  LV2-92341
//
//  Created by woo0 on 2023/03/17.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
	var result = [[String]]()
	var new_records = records.map { return $0.components(separatedBy: " ") }
	var parking = [String: [String]]()
	
	for new_record in new_records {
		if let _ = parking[new_record[1]] {
			if new_record[2] == "IN" {
				parking[new_record[1]] = [parking[new_record[1]]![0], new_record[0]]
			} else {
				parking[new_record[1]] = countTime(parking[new_record[1]]![0], parking[new_record[1]]![1], new_record[0])
			}
		} else {
			parking[new_record[1]] = ["0", new_record[0]]
		}
	}
	
	for car in parking {
		if car.value[1] != "" {
			parking[car.key] = countTime(car.value[0], car.value[1], "23:59")
		}
	}
	
	for car in parking {
		if Int(car.value[0])! <= fees[0] {
			result.append([car.key, "\(fees[1])"])
		} else {
			result.append([car.key, "\(Int(Int(ceil((Double(car.value[0])! - Double(fees[0])) / Double(fees[2]))) * fees[3]) + fees[1])"])
		}
	}
	
	result = result.sorted { Int($0[0])! < Int($1[0])! }
	
	return result.map { Int($0[1])! }
}

func countTime(_ total: String, _ first: String, _ last: String) -> [String] {
	let inTime = first.components(separatedBy: ":").map { return Int($0)! }
	var outTime = last.components(separatedBy: ":").map { return Int($0)! }
	var minute = 0
	if outTime[1] < inTime[1] {
		outTime[1] += 60
		outTime[0] -= 1
	}
	minute = outTime[1] - inTime[1]
	let hour = outTime[0] - inTime[0]
	let time = (hour * 60) + minute
	let total = Int(total)! + time
	return ["\(total)", ""]
}

print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
