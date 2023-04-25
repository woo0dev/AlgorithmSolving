//
//  main.swift
//  LV2-12905
//
//  Created by woo0 on 2023/04/25.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
	var result = 0
	var new_board = [[Int]](repeating: [Int](repeating: 0, count: board[0].count), count: board.count)
	
	for i in board.indices {
		for j in board[0].indices {
			if board[i][j] > 0 && i > 0 && j > 0 {
				new_board[i][j] = min(new_board[i-1][j], new_board[i][j-1], new_board[i-1][j-1]) + 1
				if result < new_board[i][j] * new_board[i][j] {
					result = new_board[i][j] * new_board[i][j]
				}
			} else {
				new_board[i][j] = board[i][j]
				if result < new_board[i][j] * new_board[i][j] {
					result = new_board[i][j] * new_board[i][j]
				}
			}
		}
	}
	
	return result
}

print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))
