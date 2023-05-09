//
//  main.swift
//  LV2-142085
//
//  Created by woo0 on 2023/05/09.
//

import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
	var result = 0
	var new_n = n
	var array = [Int](repeating: 0, count: 1000001)
	var minX = 0
	
	if k >= enemy.count { return enemy.count }
	
	for i in 0..<k {
		array[enemy[i]] += 1
		if minX == 0 {
			minX = enemy[i]
		} else if minX > enemy[i] {
			minX = enemy[i]
		}
	}
	
	result = k
	
	for i in k..<enemy.count {
		if minX < enemy[i] {
			array[enemy[i]] += 1
			array[minX] -= 1
			new_n -= minX
			if array[minX] == 0 {
				for j in minX+1..<array.count {
					if array[j] > 0 {
						minX = j
						break
					}
				}
			}
		} else {
			new_n -= enemy[i]
		}
		
		if new_n < 0 { break }
		
		result += 1
	}
	
	return result
}

print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
