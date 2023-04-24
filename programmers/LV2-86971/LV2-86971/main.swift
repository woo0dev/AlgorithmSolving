//
//  main.swift
//  LV2-86971
//
//  Created by woo0 on 2023/04/24.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
	var result = Int.max
	
	for index in wires.indices {
		var temp_wires = wires
		var wire = wires[index]
		var first = Set<Int>()
		var second = Set<Int>()
		var i = 0
		
		while temp_wires.count > 0 {
			let hasCheck = [first.contains(temp_wires[i][0]), first.contains(temp_wires[i][1]), second.contains(temp_wires[i][0]), second.contains(temp_wires[i][1])]
			if temp_wires[i] == wire {
				if first.isEmpty && second.isEmpty {
					first.insert(temp_wires[i][0])
					second.insert(temp_wires[i][1])
				} else if hasCheck[0] {
					second.insert(temp_wires[i][1])
				} else if hasCheck[1] {
					second.insert(temp_wires[i][0])
				} else if hasCheck[2] {
					first.insert(temp_wires[i][1])
				} else if hasCheck[3] {
					first.insert(temp_wires[i][0])
				} else {
					i += 1
					continue
				}
			} else if hasCheck[0] {
				first.insert(temp_wires[i][1])
			} else if hasCheck[1] {
				first.insert(temp_wires[i][0])
			} else if hasCheck[2] {
				second.insert(temp_wires[i][1])
			} else if hasCheck[3] {
				second.insert(temp_wires[i][0])
			} else {
				i += 1
				continue
			}
			temp_wires.remove(at: i)
			i = 0
		}
		if abs(result) > abs(first.count - second.count) {
			result = abs(first.count - second.count)
		}
	}

	return result
}

print(solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]))
