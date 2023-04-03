//
//  main.swift
//  LV2-154540
//
//  Created by woo0 on 2023/04/03.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
	let new_maps = maps.map { return $0.map { return Int(String($0)) ?? 0 } }
	let row = new_maps.count
	let col = new_maps[0].count
	let dx = [0, 0, 1, -1]
	let dy = [1, -1, 0, 0]
	var result = [Int]()
	var total = [Int]()
	var visit = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
	
	func dfs(_ x: Int, _ y: Int, _ maps: [[Int]]) -> Int {
		if maps[x][y] == 0 { return 0 }
		var sum = maps[x][y]
		visit[x][y] = true
		
		for i in dx.indices {
			let nx = x + dx[i]
			let ny = y + dy[i]
			if nx >= row || nx < 0 || ny >= col || ny < 0 { continue }
			if visit[nx][ny] { continue }
			visit[nx][ny] = true
			sum += dfs(nx, ny, maps)
		}
		
		return sum
	}
	
	for x in new_maps.indices {
		for y in new_maps[x].indices {
			if visit[x][y] { continue }
			total.append(dfs(x, y, new_maps))
		}
	}
	
	result = total.filter { $0 > 0 }.sorted(by: <)
	
	return result.count == 0 ? [-1] : result
}

print(solution(["X1X11111X", "X111XXXXX", "XXXXX1X11"]))


