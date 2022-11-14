//
//  main.swift
//  Practice-Cola
//
//  Created by woo0 on 2022/11/14.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
	var result = 0
	var bottle = n
	var remainder = 0
	
	while bottle >= a {
		remainder = bottle % a
		bottle = Int(floor(Double(bottle) / Double(a))) * b
		result += bottle
		bottle += remainder
	}
	
	return result
}

print(solution(2, 1, 20))
