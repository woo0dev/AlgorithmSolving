//
//  main.swift
//  LV2-68936
//
//  Created by woo0 on 2023/05/02.
//

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
	var result = [0,0]
	var new_arr = arr
	
	while new_arr.count > 0 {
		var tempArr = [[Int]]()
		for i in new_arr.indices {
			if (i + 1) % 2 == 0 { tempArr.append([]) }
			for j in new_arr[i].indices {
				if (i + 1) % 2 == 0 && (j + 1) % 2 == 0 {
					if new_arr[i-1][j-1] == new_arr[i-1][j] && new_arr[i-1][j] == new_arr[i][j-1] && new_arr[i][j-1] == new_arr[i][j] && (new_arr[i][j] == 0 || new_arr[i][j] == 1) {
						if new_arr[i][j] == 0 { tempArr[tempArr.count-1].append(0) }
						else { tempArr[tempArr.count-1].append(1) }
					} else {
						result[0] += [new_arr[i-1][j-1], new_arr[i-1][j], new_arr[i][j-1], new_arr[i][j]].filter { $0 == 0 }.count
						result[1] += [new_arr[i-1][j-1], new_arr[i-1][j], new_arr[i][j-1], new_arr[i][j]].filter { $0 == 1 }.count
						tempArr[tempArr.count-1].append(2)
					}
				}
			}
		}
		new_arr = tempArr
		if new_arr.count == 1 {
			if new_arr[0].first! == 0 { return [1, 0] }
			else if new_arr[0].first! == 1 { return [0, 1] }
		}
	}
	
	return result
}

print(solution([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]]))
