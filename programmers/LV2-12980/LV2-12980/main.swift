//
//  main.swift
//  LV2-12980
//
//  Created by woo0 on 2023/02/27.
//

import Foundation

func solution(_ n:Int) -> Int {
	var result = 0
	var num = n
	
	while num > 0 {
		if num % 2 == 0 {
			num /= 2
		} else {
			num -= 1
			result += 1
		}
	}

	return result
}

print(solution(5000))
