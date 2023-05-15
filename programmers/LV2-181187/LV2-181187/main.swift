//
//  main.swift
//  LV2-181187
//
//  Created by woo0 on 2023/05/15.
//

import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
	var result: Double = 0
	
	for i in 1...r2 {
		var min = ceil(sqrt(Double(1 * r1 * r1) - Double(1 * i * i)))
		var max = floor(sqrt(Double(1 * r2 * r2) - Double(1 * i * i)))
		if max.isNaN {
			max = 0
		}
		if min.isNaN {
			min = 0
		}
		result += max - min + 1
	}
	
	return Int64(result) * 4
}

print(solution(2, 3))
