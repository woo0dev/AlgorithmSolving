//
//  main.swift
//  LV2-154538
//
//  Created by woo0 on 2023/04/04.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
	var results = [Int: Int]()
	
	if x == y { return 0 }
	
	results[x] = 0
	
	for i in x+1...y {
		var counts = [Int]()
		if let value = results[i - n] {
			counts.append(value + 1)
		}
		if i / 2 > 0 && i % 2 == 0 {
			if let value = results[i / 2] {
				counts.append(value + 1)
			}
		}
		if i / 3 > 0 && i % 3 == 0 {
			if let value = results[i / 3] {
				counts.append(value + 1)
			}
		}
		if counts.count > 0 {
			results[i] = counts.min()!
		}
	}
	
	return results[y] ?? -1
}

print(solution(10, 40, 5))
