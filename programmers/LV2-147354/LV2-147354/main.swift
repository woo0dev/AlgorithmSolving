//
//  main.swift
//  LV2-147354
//
//  Created by woo0 on 2023/05/05.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
	var result = 0
	let new_data = data.sorted { (first, second) -> Bool in
		if first[col-1] > second[col-1] {
			return false
		} else if first[col-1] < second[col-1] {
			return true
		} else {
			if first[0] > second[0] {
				return true
			} else {
				return false
			}
		}
	}
	
	for i in row_begin...row_end {
		var sum = 0
		for data in new_data[i-1] {
			sum += data % i
		}
		if result == 0 {
			result = sum
		} else {
			result = result ^ sum
		}
	}
	
	return result
}

print(solution([[2,2,6],[1,5,10],[4,2,9],[3,8,3]], 2, 2, 3))
