//
//  main.swift
//  LV2-42842
//
//  Created by woo0 on 2023/02/25.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
	let total = brown + yellow
	
	for i in 0..<brown {
		for j in 0..<brown {
			if i * j == total && (i-2) * j - ((i-2) * 2) == yellow {
				return [j,i]
			} else if i * j > total {
				break
			}
		}
	}
	
	return []
}

print(solution(10, 2))
