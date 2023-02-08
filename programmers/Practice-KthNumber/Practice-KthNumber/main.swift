//
//  main.swift
//  Practice-KthNumber
//
//  Created by woo0 on 2023/02/08.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
	var result = [Int]()

	for command in commands {
		let nums = array.enumerated().map { (idx, value) in
			if command[0]-1 <= idx && command[1]-1 >= idx {
				return value
			} else {
				return 0
			}
		}.filter {
			return $0 != 0
		}.sorted(by: <)
		result.append(nums[command[2]-1])
	}

	return result
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
