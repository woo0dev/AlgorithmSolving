//
//  main.swift
//  LV2-154539
//
//  Created by woo0 on 2023/02/16.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
	var result = [Int](repeating: -1, count: numbers.count)
	var stacks = [[Int]]()
	
	for i in 0..<numbers.count {
		if stacks.count > 0 {
			while true {
				if let stack = stacks.last {
					if stack[0] < numbers[i] {
						result[stack[1]] = numbers[i]
						stacks.removeLast()
					} else {
						break
					}
				} else {
					break
				}
			}
		}
		stacks.append([numbers[i], i, -1])
	}
	
	return result
}

print(solution([2, 3, 3, 5]))
