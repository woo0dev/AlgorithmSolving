//
//  main.swift
//  LV2-12945
//
//  Created by woo0 on 2023/02/19.
//

import Foundation

func solution(_ n:Int) -> Int {
	var fibo = [Int](repeating: 0, count: n+1)
	
	fibo[1] = 1
	
	for i in 2...n {
		fibo[i] = (fibo[i-2] + fibo[i-1]) % 1234567
	}
	
	return fibo.last ?? 0
}

print(solution(5))
