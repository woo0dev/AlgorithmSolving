//
//  main.swift
//  Practice-FruitVendor
//
//  Created by woo0 on 2022/11/12.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
	var count = score.sorted { (a, b) -> Bool in
		return a > b
	}
	var availableCount = [Int]()
	var result = 0
	let removeCount = count.count % m
	
	for _ in 0..<removeCount {
		count.removeLast()
	}
	
	count.enumerated().forEach { index, value in
		availableCount.append(value)
		if (index+1) % m == 0 {
			result += (availableCount.min() ?? 0) * m
			availableCount.removeAll()
		}
	}
	
	return result
}

print(solution(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))
