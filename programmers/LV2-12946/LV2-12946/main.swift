//
//  main.swift
//  LV2-12946
//
//  Created by woo0 on 2023/05/01.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
	var result = [[Int]]()
	
	func recursive(_ n: Int, _ start: Int, _ end: Int, _ result: inout [[Int]]) {
		if n == 0 { return }
		
		recursive(n-1, start, 6-(start+end), &result)
		result.append([start, end])
		recursive(n-1, 6-(start+end), end, &result)
	}
	
	recursive(n, 1, 3, &result)
	
	return result
}

print(solution(2))
