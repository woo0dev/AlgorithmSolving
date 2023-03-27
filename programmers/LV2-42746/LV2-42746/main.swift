//
//  main.swift
//  LV2-42746
//
//  Created by woo0 on 2023/03/28.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
	var result = ""
	var max = 0
	
	numbers
		.map { return String($0).map { String($0) } }
		.sorted(by: { Int(($0.joined()) + $1.joined())! > Int($1.joined() + $0.joined())! })
		.forEach {
			max = max < Int($0.joined())! ? Int($0.joined())! : max
			result += $0.joined()
		}
	
	return max == 0 ? "0" : result
}

print(solution([6, 10, 2]))
