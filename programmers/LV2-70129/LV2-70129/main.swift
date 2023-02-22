//
//  main.swift
//  LV2-70129
//
//  Created by woo0 on 2023/02/22.
//

import Foundation

func solution(_ s:String) -> [Int] {
	var result = [0, 0]
	var binary = s
	
	while binary != "1" {
		var count = 0
		binary = binary.filter {
			if $0 == "0" {
				count += 1
			}
			return $0 == "1"
		}
		binary = String(binary.count, radix: 2)
		result[0] += 1
		result[1] += count
	}
	
	return result
}

print(solution("110010101001"))
