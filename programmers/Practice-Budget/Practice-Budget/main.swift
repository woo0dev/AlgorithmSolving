//
//  main.swift
//  Practice-Budget
//
//  Created by woo0 on 2023/02/12.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
	var result = 0
	var parts = d.sorted(by: <)
	var money = 0
	
	for i in parts {
		if money + i <= budget {
			money += i
			result += 1
		} else {
			break
		}
	}
	
	return result
}

print(solution([1,3,2,5,4], 9))
