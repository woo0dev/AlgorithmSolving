//
//  main.swift
//  Practice-DivisorCountAndAddition
//
//  Created by woo0 on 2023/02/02.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
	var result = 0
	var results = [Int: Int]()
	
	for i in left..<right+1 {
		var temp = 1
		var count = 0
		results[i] = 0
		while true {
			if i >= temp {
				if i % temp == 0 {
					count += 1
				}
			} else {
				break
			}
			temp += 1
		}
		results[i] = count
	}
	
	for i in results {
		if i.value % 2 == 0 {
			result += i.key
		} else {
			result -= i.key
		}
	}
	
	return result
}

print(solution(13, 17))
