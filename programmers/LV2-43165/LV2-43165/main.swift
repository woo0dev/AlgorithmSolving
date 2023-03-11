//
//  main.swift
//  LV2-43165
//
//  Created by woo0 on 2023/03/11.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
	var result = 0

	func dfs(res: Int, target: Int, numbers: [Int], index: Int) -> Int {
		if index >= numbers.count {
			if res == target {
				return 1
			}
			return 0
		}

		let plus = res + numbers[index]
		let minus = res - numbers[index]

		var ans = 0
		ans += dfs(res: plus, target: target, numbers: numbers, index: index + 1)
		ans += dfs(res: minus, target: target, numbers: numbers, index: index + 1)

		return ans
	}

	result += dfs(res: numbers[0], target: target, numbers: numbers, index: 1)
	result += dfs(res: -numbers[0], target: target, numbers: numbers, index: 1)

	return result
}

print(solution([1, 1, 1, 1, 1], 3))
