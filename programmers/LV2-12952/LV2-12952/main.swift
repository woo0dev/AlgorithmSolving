//
//  main.swift
//  LV2-12952
//
//  Created by woo0 on 2023/05/11.
//

import Foundation

func solution(_ n:Int) -> Int {
	var result = 0
	var chess = [Int](repeating: 0, count: n)
	
	func backTracking(_ depth: Int = 0) {
		if depth == n {
			result += 1
			return
		}
		
		for i in 0..<n {
			chess[depth] = i
			if valid(depth) {
				backTracking(depth+1)
			}
		}
	}
	
	func valid(_ i: Int) -> Bool {
		for j in 0..<i {
			if chess[i] == chess[j] { return false }
			if abs(i-j) == abs(chess[i]-chess[j]) { return false }
		}
		return true
	}
	
	backTracking()
	
	return result
}

print(solution(4))
