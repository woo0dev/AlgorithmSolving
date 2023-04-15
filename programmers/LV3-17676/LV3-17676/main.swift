//
//  main.swift
//  LV3-17676
//
//  Created by woo0 on 2023/04/15.
//

import Foundation

func solution(_ lines:[String]) -> Int {
	var count = Set<Int>()
	let new_lines = lines.map { str -> [Int] in
		let strs = str.components(separatedBy: " ")
		var time = strs[1].components(separatedBy: [":", "."]).map { Int($0)! }
		time[1] += time[0] * 60
		time[2] += time[1] * 60
		time[3] += time[2] * 1000
		return [time[3]-Int(Double("\(strs[2].dropLast())")!*1000), time[3]]
	}
	let sortedLines = Array(new_lines.joined()).sorted(by: <)
	
	for line in sortedLines {
		var res = 0
		for new_line in new_lines {
			if line <= new_line[0] && line + 999 > new_line[0] {
				res += 1
			} else if line <= new_line[1] && line + 999 > new_line[1] {
				res += 1
			} else if line >= new_line[0] && line + 999 <= new_line[1] {
				res += 1
			}
		}
		count.insert(res)
	}
	
	return count.max()!
}
