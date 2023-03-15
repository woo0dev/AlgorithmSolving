//
//  main.swift
//  LV2-131127
//
//  Created by woo0 on 2023/03/15.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
	var result = 0
	var new_discount = discount
	var buy = [String: Int]()
	var isJoin = true
	
	for i in 0..<want.count {
		buy[want[i]] = number[i]
	}
	
	while new_discount.count >= 10 {
		var temp_buy = buy
		for i in 0..<10 {
			if let _ = temp_buy[new_discount[i]] {
				temp_buy[new_discount[i]]! -= 1
			}
		}
		for value in temp_buy.values {
			if value > 0 {
				isJoin = false
			}
		}
		if isJoin {
			result += 1
		} else {
			isJoin = true
		}
		new_discount.removeFirst()
	}
	
	return result
}

print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
