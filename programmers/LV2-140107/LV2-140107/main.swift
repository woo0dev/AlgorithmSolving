//
//  main.swift
//  LV2-140107
//
//  Created by woo0 on 2023/04/16.
//

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
	var result: Int64 = 0
	
	for i in stride(from: 0, through: d, by: k) {
		let num = Int(sqrt(Double((d*d) - (i*i)))) / k
		result += Int64(num) + 1
	}
	
	return result
}

print(solution(2, 4))
