//
//  main.swift
//  LV2-87946
//
//  Created by woo0 on 2023/03/14.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
	var new_k = k
	var new_dungeons = [[[Int]]]()
	var counts = [Int]()
	
	func permutation(dungeons: [[Int]], new_dungeons: inout [[[Int]]], index: Int = 0) {
		if index == dungeons.count {
			new_dungeons.append(Array(dungeons[0..<index]))
			return
		}
		
		var arr = dungeons
		
		for i in index..<arr.count {
			arr.swapAt(index, i)
			permutation(dungeons: arr, new_dungeons: &new_dungeons, index: index + 1)
			arr.swapAt(index, i)
		}
	}
	
	permutation(dungeons: dungeons, new_dungeons: &new_dungeons)
	
	for dungeons in new_dungeons {
		var count = 0
		for dungeon in dungeons {
			if new_k >= dungeon[0] {
				new_k -= dungeon[1]
				count += 1
			}
		}
		counts.append(count)
		new_k = k
	}
	
	return counts.max()!
}

print(solution(80, [[80,20],[50,40],[30,10]]))
