//
//  main.swift
//  Practice-KnightsWeapon
//
//  Created by woo0 on 2023/01/30.
//

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
	var result = 0
	var nums = [Int](repeating: 0, count: number)
	
	for num in 1..<number+1 {
		var temp = 1
		while true {
			if num*temp <= nums.count {
				nums[num*temp-1] += 1
				temp += 1
			} else {
				break
			}
		}
		temp = 1
		if nums[num-1] > limit {
			result += power
		} else {
			result += nums[num-1]
		}
	}
	
	return result
}

print(solution(5, 3, 2))
