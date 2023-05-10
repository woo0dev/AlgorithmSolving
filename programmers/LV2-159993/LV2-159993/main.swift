//
//  main.swift
//  LV2-159993
//
//  Created by woo0 on 2023/05/10.
//

import Foundation

func solution(_ maps:[String]) -> Int {
	var result = 0
	let new_maps = maps.map { $0.map { String($0) } }
	var visitedQueue = [[Int]: Bool]()
	var needVisitedQueue = [[Int]]()
	var distance = [[Int]: Int]()
	var start = [Int]()
	var end = [Int]()
	var lever = [Int]()
	let dx = [-1, 1, 0, 0]
	let dy = [0, 0, -1, 1]
	
	for i in new_maps.indices {
		for j in new_maps[0].indices {
			if new_maps[i][j] == "S" { start = [i, j] }
			if new_maps[i][j] == "E" { end = [i, j] }
			if new_maps[i][j] == "L" { lever = [i, j] }
		}
	}
	
	distance[start] = 0
	
	func bfs(_ s: [Int], _ e: [Int]) {
		visitedQueue[s] = true
		
		for i in dx.indices {
			var nx = s[0]
			var ny = s[1]
			
			if nx + dx[i] < new_maps.count && nx + dx[i] >= 0 && ny + dy[i] < new_maps[0].count && ny + dy[i] >= 0 && new_maps[nx + dx[i]][ny + dy[i]] != "X" {
				nx += dx[i]
				ny += dy[i]
				if let _ = visitedQueue[[nx, ny]] {
					continue
				}
				needVisitedQueue.append([nx, ny])
				if let _ = distance[[nx, ny]] {
					continue
				}
				distance[[nx, ny]] = distance[s]! + 1
			}
		}
		
		while !needVisitedQueue.isEmpty {
			let first = needVisitedQueue.removeFirst()
			if first == e {
				break
			}
			if let _ = visitedQueue[first] {
				continue
			}
			bfs(first, e)
		}
	}
	
	bfs(start, lever)
	if let d = distance[lever] {
		result += d
		visitedQueue = [:]
		needVisitedQueue = []
		distance = [:]
		distance[lever] = 0
		bfs(lever, end)
	} else {
		return -1
	}
	if let d = distance[end] {
		return d + result
	} else {
		return -1
	}
}

print(solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]))
