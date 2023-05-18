//
//  main.swift
//  LV3-43162
//
//  Created by woo0 on 2023/05/18.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
	var result = Set<[Int: Bool]>()
	var visitedQueue = [Int: Bool]()
	var needVisitedQueue = [Int]()
	
	func dfs(_ number: Int) {
		visitedQueue[number] = true
		
		for i in computers[number].indices {
			if number == i {
				continue
			} else if computers[number][i] == 1 {
				needVisitedQueue.append(i)
			}
		}
		
		while !needVisitedQueue.isEmpty {
			let first = needVisitedQueue.removeLast()
			if let _ = visitedQueue[first] {
				continue
			}
			dfs(first)
		}
	}
	
	for i in computers.indices {
		dfs(i)
		result.insert(visitedQueue)
		visitedQueue = [:]
		needVisitedQueue = []
	}
	
	return result.count
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]	))
