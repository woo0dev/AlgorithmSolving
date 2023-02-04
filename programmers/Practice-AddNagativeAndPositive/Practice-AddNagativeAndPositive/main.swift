//
//  main.swift
//  Practice-AddNagativeAndPositive
//
//  Created by woo0 on 2023/02/04.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
	var result = 0
	
	for i in 0..<absolutes.count {
		if signs[i] {
			result += absolutes[i]
		} else {
			result -= absolutes[i]
		}
	}
	
	return result
}

print(solution([1,2,3], [false,false,true]))
