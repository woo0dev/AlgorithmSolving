//
//  main.swift
//  LV2-12914
//
//  Created by woo0 on 2023/02/28.
//

import Foundation

func solution(_ n:Int) -> Int {
	if n == 1 {
		return 1
	} else if n == 2 {
		return 2
	} else {
		var arr = [Int](repeating: 0, count: n+1)
		arr[0] = 1
		arr[1] = 1

		for i in 2...n {
			arr[i] = (arr[i-2] + arr[i-1]) % 1234567
		}

		return arr.last ?? 0
	}
}

print(solution(7))
