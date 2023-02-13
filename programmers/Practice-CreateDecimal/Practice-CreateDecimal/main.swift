//
//  main.swift
//  Practice-CreateDecimal
//
//  Created by woo0 on 2023/02/13.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
	var answer = 0
	var idx = 0
	var prime = true
	
	while idx < nums.count {
		for i in idx+1..<nums.count {
			for j in i+1..<nums.count {
				let num = nums[idx] + nums[i] + nums[j]
				for k in 2..<num {
					if num % k == 0 {
						prime = false
						break
					}
				}
				if prime {
					answer += 1
				} else {
					prime = true
				}
			}
		}
		idx += 1
	}

	return answer
}

print(solution([1,2,3,4]))
