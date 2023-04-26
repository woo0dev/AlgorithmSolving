//
//  main.swift
//  LV2-81302
//
//  Created by woo0 on 2023/04/26.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
	var result = [Int]()
	var new_places = [[[Int]]]()
	var rooms = [[[String]]]()
	var check = true
	
	for i in places.indices {
		rooms.append(places[i].map { $0.map { String($0) } })
		var array = [[Int]]()
		for j in rooms[i].indices {
			for k in rooms[i][j].indices {
				if rooms[i][j][k] == "P" {
					array.append([j, k])
				}
			}
		}
		new_places.append(array)
	}
	
	for i in new_places.indices {
		for j in new_places[i].indices {
			for k in j+1..<new_places[i].count {
				let first = new_places[i][j]
				let second = new_places[i][k]
				if first[0] == second[0] {
					if first[1]+1 < places.count {
						if rooms[i][first[0]][first[1]+1] == "X" {
							continue
						}
					} else if second[1]+1 < places.count {
						if rooms[i][second[0]][second[1]+1] == "X" {
							continue
						}
					} else if first[1]-1 > 0 {
						if rooms[i][first[0]][first[1]-1] == "X" {
							continue
						}
					} else if second[1]-1 > 0 {
						if rooms[i][second[0]][second[1]-1] == "X" {
							continue
						}
					}
				} else if first[1] == second[1] {
					if first[0]+1 < places.count {
						if rooms[i][first[0]+1][first[1]] == "X" {
							continue
						}
					} else if second[0]+1 < places.count {
						if rooms[i][second[0]+1][second[1]] == "X" {
							continue
						}
					} else if first[0]-1 > 0 {
						if rooms[i][first[0]-1][first[1]] == "X" {
							continue
						}
					} else if new_places[i][k][0]-1 > 0 {
						if rooms[i][second[0]-1][second[1]] == "X" {
							continue
						}
					}
				} else {
					var x = [Int]()
					var n = [Int]()
					for l in 0...1 {
						x.append(max(first[l], second[l]))
						n.append(min(first[l], second[l]))
					}
					if rooms[i][x[0]][x[1]] == "X" && rooms[i][n[0]][n[1]] == "X" {
						continue
					} else if rooms[i][x[0]][n[1]] == "X" && rooms[i][n[0]][x[1]] == "X" {
						continue
					}
				}
				if abs((first[0] - second[0])) + abs((first[1] - second[1])) <= 2 {
					check = false
					break
				}
			}
			if check == false {
				break
			}
		}
		if check {
			result.append(1)
		} else {
			result.append(0)
			check = true
		}
	}
	
	return result
}

print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
