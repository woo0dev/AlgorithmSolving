//
//  main.swift
//  Practice-HallOfFame(1)
//
//  Created by woo0 on 2023/01/29.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
	var rank = [Int]()
	var result = [Int]()
	
	for i in score {
		rank.append(i)
		rank = rank.sorted(by: <)
		
		if rank.count < k {
			result.append(rank[0])
		} else {
			result.append(rank[rank.count-k])
		}
	}
	return result
}

print(solution(3, [10, 100, 20, 150, 1, 100, 200]))
