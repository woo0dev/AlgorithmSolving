//
//  main.swift
//  Practice-TheThreeMusketeers
//
//  Created by woo0 on 2023/01/16.
//

import Foundation

func solution(_ number:[Int]) -> Int {
	var temp = 0
	var result = 0
	for (idx, num) in number.enumerated() {
		temp += num
		for i in idx+1..<number.count {
			temp += number[i]
			for j in i+1..<number.count {
				temp += number[j]
				if temp == 0 {
					result += 1
				}
				temp -= number[j]
			}
			temp -= number[i]
		}
		temp -= num
	}
	
	return result
}


print(solution([-1, 1, -1, 1]))
