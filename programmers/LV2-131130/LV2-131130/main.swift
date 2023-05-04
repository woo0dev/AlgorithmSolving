//
//  main.swift
//  LV2-131130
//
//  Created by woo0 on 2023/05/04.
//

import Foundation

func solution(_ cards:[Int]) -> Int {
	var result = 0
	var firstCheck = [Bool](repeating: true, count: cards.count)
	var secondCheck = firstCheck
	
	func firstCycle(_ c: [Int], _ i: Int) -> [Int] {
		if !firstCheck[i] { return [] }
		firstCheck[i] = false
		return [c[i]] + firstCycle(c, c[i]-1)
	}
	
	func secondCycle(_ c: [Int], _ i: Int) -> [Int] {
		if !firstCheck[i] || !secondCheck[i] { return [] }
		secondCheck[i] = false
		return [c[i]] + secondCycle(c, c[i]-1)
	}
	
	for i in 1...cards.count {
		let first = firstCycle(cards, i-1).count
		secondCheck = firstCheck
		if i+1 <= cards.count {
			for j in i+1...cards.count {
				let second = secondCycle(cards, j-1).count
				if result < first * second {
					result = first * second
				}
			}
		}
	}
	
	return result
}

print(solution([8,6,3,7,2,5,1,4]))
