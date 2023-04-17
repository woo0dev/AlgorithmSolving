//
//  main.swift
//  LV2-12978
//
//  Created by woo0 on 2023/04/17.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
	var allDistances = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
	
	for i in 1...N {
		allDistances[i][i] = 0
	}
	
	for r in road {
		if allDistances[r[0]][r[1]] > r[2] {
			allDistances[r[0]][r[1]] = r[2]
			allDistances[r[1]][r[0]] = r[2]
		}
	}
	
	for i in 1...N {
		for j in 1...N {
			for k in 1...N {
				if allDistances[j][i] == Int.max || allDistances[i][k] == Int.max { continue }
				allDistances[j][k] = min(allDistances[j][i] + allDistances[i][k], allDistances[j][k])
			}
		}
	}
	
	allDistances[1].removeFirst()
	
	return allDistances[1].filter { $0 <= k }.count
}

print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))
