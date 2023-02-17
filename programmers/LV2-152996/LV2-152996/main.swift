//
//  main.swift
//  LV2-152996
//
//  Created by woo0 on 2023/02/17.
//

import Foundation

func solution(_ weights:[Int]) -> Int64 {
	var result = 0
	var new_weights = weights.sorted(by: <).map { return Double($0) }
	var dic_weights = [Double: Double]()
	
	for weight in new_weights {
		if dic_weights[weight] == nil {
			dic_weights[weight] = 1
		} else {
			dic_weights[weight]! += 1
		}
	}
	
	for i in 0..<new_weights.count {
		if binarySearch(Array(new_weights[i+1..<new_weights.count]), new_weights[i]) {
			result += Int(dic_weights[new_weights[i]]!) - 1
			dic_weights[new_weights[i]]! -= 1
		}
		if binarySearch(Array(new_weights[i+1..<new_weights.count]), new_weights[i] * 2) {
			result += Int(dic_weights[new_weights[i] * 2]!)
		}
		if binarySearch(Array(new_weights[i+1..<new_weights.count]), (new_weights[i] / 2) * 3) {
			result += Int(dic_weights[(new_weights[i] / 2) * 3]!)
		}
		if binarySearch(Array(new_weights[i+1..<new_weights.count]), (new_weights[i] / 3) * 4) {
			result += Int(dic_weights[(new_weights[i] / 3) * 4]!)
		}
	}
	
	return Int64(result)
}

func binarySearch(_ arr: [Double], _ num: Double) -> Bool {
	var start = 0
	var end = arr.count-1
	while start <= end {
		let mid = (start + end) / 2
		if arr[mid] == num {
			return true
		}
		if arr[mid] > num {
			end = mid - 1
		} else {
			start = mid + 1
		}
	}
	return false
}

print(solution([100,180,360,100,270]))
//print(solution([100,100,100,200,200,200]))
