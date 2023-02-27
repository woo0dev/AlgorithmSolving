//
//  main.swift
//  LV2-12953
//
//  Created by woo0 on 2023/02/26.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
	var result = arr.max()!
	var max = arr.max()!
	var common = true

	while true {
		for i in arr {
			if result % i == 0 {
				continue
			} else {
				common = false
			}
		}
		if common {
			return result
		} else {
			result += max
			common = true
		}
	}

	return result
}

print(solution([2,6,8,14]))
