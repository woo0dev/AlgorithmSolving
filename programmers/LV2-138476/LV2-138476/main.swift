//
//  main.swift
//  LV2-138476
//
//  Created by woo0 on 2023/03/06.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
	var result = 0
	var total = 0
	var new_tangerine = [Int: Int]()
	
	tangerine.forEach {
		if new_tangerine[$0] == nil {
			new_tangerine[$0] = 1
		} else {
			new_tangerine[$0]! += 1
		}
	}
	
	let sortedTangerine = new_tangerine.sorted { $0.1 > $1.1 }
	
	for tangerine in sortedTangerine {
		if total + tangerine.value < k {
			total += tangerine.value
			result += 1
		} else if total + tangerine.value == k {
			result += 1
			break
		} else {
			total += tangerine.value
			result += 1
			break
		}
	}
	
	return result
}

print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
