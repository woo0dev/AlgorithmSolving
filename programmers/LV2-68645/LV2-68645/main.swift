//
//  main.swift
//  LV2-68645
//
//  Created by woo0 on 2023/04/10.
//

import Foundation

func solution(_ n:Int) -> [Int] {
	var triangle = [[Int]]()
	var row = 0
	var col = 0
	var num = 1
	
	for i in 0..<n {
		triangle.append([Int](repeating: 0, count: i + 1))
	}
	
	while true {
		triangle[row][col] = num
		if row - 1 >= 0 && col - 1 >= 0 {
			if triangle[row].count - 1 > col {
				if triangle[row-1][col-1] == 0 && triangle[row][col+1] > 0 {
					row -= 1
					col -= 1
					num += 1
					continue
				}
			} else if triangle[row].count - 1 == col {
				if triangle[row-1][col-1] == 0 {
					row -= 1
					col -= 1
					num += 1
					continue
				}
			}
		}
		if triangle.count > row + 1 {
			if triangle[row+1][col] == 0 {
				row += 1
				num += 1
				continue
			}
		}
		if triangle[row].count > col + 1 {
			if triangle[row][col+1] == 0 {
				col += 1
				num += 1
				continue
			}
		}
		break
	}
	
	return Array(triangle.joined())
}

print(solution(6))

