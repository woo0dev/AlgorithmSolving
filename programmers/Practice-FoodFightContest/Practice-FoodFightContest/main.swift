//
//  main.swift
//  Practice-FoodFightContest
//
//  Created by woo0 on 2022/11/13.
//

import Foundation

func solution(_ food:[Int]) -> String {
	var result = ""
	var foodCount = food
	foodCount.removeFirst()
	foodCount = foodCount.map {
		return $0 % 2 == 0 ? $0 : $0 - 1
	}
	
	for (idx, f) in foodCount.enumerated() {
		for i in 0..<f/2 {
			result += "\(idx+1)"
		}
	}
	
	return "\(result)0\(String(result.reversed()))"
}

print(solution([1, 7, 1, 2]))
