//
//  main.swift
//  LV2-169199
//
//  Created by woo0 on 2023/05/14.
//

import Foundation

func solution(_ board:[String]) -> Int {
	var new_board = board.map { $0.map { String($0) } }
	var visitedQueue = [[Int]: Bool]()
	var needVisitedQueue = [[Int]]()
	var distance = [[Int]: Int]()
	var start = [Int]()
	var end = [Int]()
	let dx = [-1, 1, 0, 0]
	let dy = [0, 0, -1, 1]
	
	for i in new_board.indices {
		for j in new_board[i].indices {
			if new_board[i][j] == "R" { start = [i, j] }
			if new_board[i][j] == "G" { end = [i, j] }
		}
	}
	
	func bfs(_ s: [Int]) {
		visitedQueue[s] = true
		
		for i in dx.indices {
			var nx = s[0]
			var ny = s[1]
			
			while nx < new_board.count && nx >= 0 && ny < new_board[0].count && ny >= 0 && new_board[nx][ny] != "D" {
				nx += dx[i]
				ny += dy[i]
			}
			
			if s != [nx-dx[i], ny-dy[i]] {
				if let _ = visitedQueue[[nx-dx[i], ny-dy[i]]] {
					continue
				}
				needVisitedQueue.append([nx-dx[i], ny-dy[i]])
				if let _ = distance[[nx-dx[i], ny-dy[i]]] {
					continue
				}
				distance[[nx-dx[i], ny-dy[i]]] = distance[s]! + 1
			}
		}
		
		while !needVisitedQueue.isEmpty {
			let first = needVisitedQueue.removeFirst()
			if first == end {
				break
			}
			if let _ = visitedQueue[first] {
				continue
			}
			bfs(first)
		}
	}
	
	distance[start] = 0
	bfs(start)
	
	if let d = distance[end] {
		return d
	} else {
		return -1
	}
}

print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))
