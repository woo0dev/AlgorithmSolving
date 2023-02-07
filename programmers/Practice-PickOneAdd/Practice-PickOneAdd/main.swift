//
//  main.swift
//  Practice-PickOneAdd
//
//  Created by woo0 on 2023/02/07.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
	var result = [Int]()
	var idx = 0
	
	while true {
		for i in idx+1..<numbers.count {
			if !result.contains(numbers[idx] + numbers[i]) {
				result.append(numbers[idx] + numbers[i])
			}
		}
		idx += 1
		if idx >= numbers.count {
			break
		}
	}
	
	return result.sorted(by: <)
}

print(solution([2,1,3,4,1]))
