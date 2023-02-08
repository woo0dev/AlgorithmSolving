//
//  main.swift
//  Practice-Clothes
//
//  Created by woo0 on 2023/02/08.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
	var borrow = lost.filter {
		return !reserve.contains($0)
	}
	var new_reserve = lost.filter {
		return reserve.contains($0)
	}
	
	var result = n
	var lent = [Int]()
	
	borrow = borrow.sorted(by: <)
	
	new_reserve = reserve.filter {
		return !new_reserve.contains($0)
	}.sorted(by: <)
	
	for i in borrow {
		if new_reserve.contains(i-1) && !lent.contains(i-1) {
			lent.append(i-1)
		} else if new_reserve.contains(i+1) && !lent.contains(i+1) {
			lent.append(i+1)
		} else {
			result -= 1
		}
	}
	
	return result
}

print(solution(5, [4,2], [3,5]))
