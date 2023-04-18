//
//  main.swift
//  LV2-178870
//
//  Created by woo0 on 2023/04/19.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
	var result = [0, sequence.count]
	var indices = [0, 0]
	var sum = sequence.first!
	
	while indices[1] < sequence.count {
		if sum == k {
			result = max(result, indices)
			sum -= sequence[indices[0]]
			indices[0] += 1
			indices[1] += 1
			if indices[1] < sequence.count {
				sum += sequence[indices[1]]
			}
		} else if sum > k {
			sum -= sequence[indices[0]]
			indices[0] += 1
		} else {
			indices[1] += 1
			if indices[1] < sequence.count {
				sum += sequence[indices[1]]
			}
		}
	}
	
	return result
}

func max(_ res: [Int], _ arr: [Int]) -> [Int] {
	if res[1] - res[0] > arr[1] - arr[0] {
		return arr
	} else if res[1] - res[0] == arr[1] - arr[0] {
		if res[0] > arr[0] {
			return arr
		}
	}
	return res
}

print(solution([1, 2, 3, 4, 5], 7))
