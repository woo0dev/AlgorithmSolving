//
//  main.swift
//  LV2-87390
//
//  Created by woo0 on 2023/03/07.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
	let new_left = Int(left)
	let new_right = Int(right)
	var result = [Int]()
	var row = new_left / n
	var col = new_left % n
	var num = 1
	
	while result.count <= (new_right - new_left) {
		if col >= n {
			num = 1
			row += 1
			col = 0
		}
		if row >= col {
			num = row + 1
		} else {
			num = col + 1
		}
		if (new_right / n) >= row {
			result.append(num)
		}
		col += 1
	}
	
	return result
}

print(solution(3, 2, 5))
