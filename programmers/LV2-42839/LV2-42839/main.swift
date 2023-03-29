//
//  main.swift
//  LV2-42839
//
//  Created by woo0 on 2023/03/29.
//

import Foundation

func solution(_ numbers:String) -> Int {
	let new_numbers = numbers.map { Int(String($0))! }
	var result = 0
	var permutation = Set<Int>()
	var hasDicimal = true
	
	func countPermutation(_ array: [Int], _ count: Int, _ permutation: inout Set<Int>, _ index: Int = 0) {
		if index == count {
			permutation.insert(Int(Array(array[0..<count]).map { String($0) }.joined())!)
			return
		}
		
		var arr = array
		
		for i in index..<arr.count {
			arr.swapAt(index, i)
			countPermutation(arr, count, &permutation, index + 1)
			arr.swapAt(index, i)
		}
	}
	
	for i in 1...numbers.count {
		countPermutation(new_numbers, i, &permutation)
	}
	
	for num in permutation {
		if num > 3 {
			if num % 2 > 0 {
				for i in 2..<Int(sqrt(Double(num)))+1 {
					if num % i == 0 {
						hasDicimal = false
						break
					}
				}
				if hasDicimal {
					result += 1
				} else {
					hasDicimal = true
				}
			}
		} else if num >= 2 {
			result += 1
		}
	}
	
	return result
}

print(solution("17"))
