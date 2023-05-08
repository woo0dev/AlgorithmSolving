//
//  main.swift
//  LV2-12949
//
//  Created by woo0 on 2023/05/08.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
	var result = [[Int]](repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count)
	
	for i in arr1.indices {
		for j in arr1[i].indices {
			for k in arr2[0].indices {
				result[i][k] += arr1[i][j] * arr2[j][k]
			}
		}
	}
	
	return result
}

print(solution([[1, 4], [3, 2], [4, 1]], [[3, 3], [3, 3]]))
