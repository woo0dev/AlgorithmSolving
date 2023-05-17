//
//  main.swift
//  LV3-42628
//
//  Created by woo0 on 2023/05/17.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
	var result = [Int]()
	var new_operations = [Int]()
	
	for operation in operations {
		let value = operation.components(separatedBy: " ")
		if value[0] == "I" {
			new_operations.append(Int(value[1])!)
		} else {
			if Int(value[1])! == 1 && !new_operations.isEmpty {
				new_operations.remove(at: maxIndex(new_operations))
			} else if !new_operations.isEmpty {
				new_operations.remove(at: minIndex(new_operations))
			}
		}
	}
	
	result = new_operations.sorted(by: >)
	
	return result.isEmpty ? [0, 0] : [result.first!, result.last!]
}

func maxIndex(_ operations: [Int]) -> Int {
	var max = 0
	var index = 0
	for i in operations.indices {
		if max < operations[i] {
			max = operations[i]
			index = i
		}
	}
	return index
}

func minIndex(_ operations: [Int]) -> Int {
	var min = Int.max
	var index = 0
	for i in operations.indices {
		if min > operations[i] {
			min = operations[i]
			index = i
		}
	}
	return index
}

print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
