//
//  main.swift
//  LV2-92335
//
//  Created by woo0 on 2023/03/12.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
	let arr1 = String(n, radix: k).components(separatedBy: "0").filter { return $0 != "" }.map { return Int($0)! }
	var result = 0
	var isDecimal = false
	
	for value in arr1 {
		if value > 2 {
			for j in 2..<Int(sqrt(Double(value)))+1 {
				if value % j == 0 {
					isDecimal = true
					break
				}
			}
			if isDecimal {
				isDecimal = false
			} else {
				result += 1
			}
		} else if value == 2 {
			result += 1
		}
	}
	
	return result
}

print(solution(437674, 3))
