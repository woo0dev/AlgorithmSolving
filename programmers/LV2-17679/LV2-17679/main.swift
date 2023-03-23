//
//  main.swift
//  LV2-17679
//
//  Created by woo0 on 2023/03/23.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
	var answer = 0
	var new_board = board.map { $0.map { String($0) } }
	var removeBlock = Set<[Int]>()
	var hasRemove = true
	var hasFill = false
	
	while true {
		hasRemove = true
		for i in new_board.indices {
			for j in new_board[i].indices {
				if i < new_board.count-1 && j < new_board[i].count-1 {
					if new_board[i][j] == new_board[i+1][j] && new_board[i][j] == new_board[i][j+1] && new_board[i][j] == new_board[i+1][j+1] && new_board[i][j] != "" {
						removeBlock.insert([i, j])
						removeBlock.insert([i+1, j])
						removeBlock.insert([i, j+1])
						removeBlock.insert([i+1, j+1])
					}
				}
			}
		}
		removeBlock.forEach {
			new_board[$0[0]][$0[1]] = ""
			hasRemove = false
			answer += 1
		}
		removeBlock = []
		for i in stride(from: new_board.count-1, through: 0, by: -1) {
			for j in stride(from: new_board[i].count-1, through: 0, by: -1) {
				if new_board[i][j] == "" {
					for k in stride(from: i-1, through: 0, by: -1) {
						if new_board[k][j] != "" {
							new_board[i][j] = new_board[k][j]
							new_board[k][j] = ""
							hasFill = true
							break
						}
					}
				}
			}
			if hasFill {
				hasFill = false
			}
		}
		if hasRemove {
			break
		}
	}
	return answer
}

print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
