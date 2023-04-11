//
//  main.swift
//  LV2-132265
//
//  Created by woo0 on 2023/04/11.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
	var result = 0
	var first = [Int: Int]()
	var second = [Int: Int]()
	
	topping.forEach {
		if let _ = first[$0] {
			first[$0]! += 1
		} else {
			first[$0] = 1
		}
	}
	
	for i in 0..<topping.count {
		first[topping[i]]! -= 1
		if first[topping[i]]! == 0 {
			first.removeValue(forKey: topping[i])
		}
		if let _ = second[topping[i]] {
			second[topping[i]]! += 1
		} else {
			second[topping[i]] = 1
		}
		if first.count == second.count {
			result += 1
		}
	}
	
	return result
}

print(solution([1, 2, 1, 3, 1, 4, 1, 2]))
