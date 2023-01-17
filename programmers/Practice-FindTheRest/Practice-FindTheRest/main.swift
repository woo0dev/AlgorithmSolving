//
//  main.swift
//  Practice-FindTheRest
//
//  Created by woo0 on 2023/01/17.
//

import Foundation

func solution(_ n:Int) -> Int {
	
	for i in 1..<n {
		if n % i == 1 {
			return i
		}
	}
	
	return 0
}

print(solution(10))
