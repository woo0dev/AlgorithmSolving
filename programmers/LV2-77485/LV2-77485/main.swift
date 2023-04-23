//
//  main.swift
//  LV2-77485
//
//  Created by woo0 on 2023/04/23.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
	var result = [Int]()
	var matrix = [[Int]]()
 
	for i in 1...rows*columns {
		if i == 1 || (i-1) % columns == 0 {
			matrix.append([i])
		} else {
			matrix[matrix.count-1].append(i)
		}
	}
	
	for query in queries {
		var num = matrix[query[0]-1][query[1]-1]
		var min = num
		for i in query[1]..<query[3] {
			let temp = matrix[query[0]-1][i]
			matrix[query[0]-1][i] = num
			num = temp
			if min > num { min = num }
		}
		for i in query[0]..<query[2] {
			let temp = matrix[i][query[3]-1]
			matrix[i][query[3]-1] = num
			num = temp
			if min > num { min = num }
		}
		for i in stride(from: query[3]-2, through: query[1]-1, by: -1) {
			let temp = matrix[query[2]-1][i]
			matrix[query[2]-1][i] = num
			num = temp
			if min > num { min = num }
		}
		for i in stride(from: query[2]-2, through: query[0]-1, by: -1) {
			let temp = matrix[i][query[1]-1]
			matrix[i][query[1]-1] = num
			num = temp
			if min > num { min = num }
		}
		
		result.append(min)
	}
	
	return result
}

print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
