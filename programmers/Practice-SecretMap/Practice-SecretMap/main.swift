//
//  main.swift
//  Practice-SecretMap
//
//  Created by woo0 on 2023/02/11.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
	var answer: [String] = []
	
	for i in 0..<arr1.count {
		var rowSum = ""
		var row1 = String(arr1[i], radix: 2).map { return $0 }
		var row2 = String(arr2[i], radix: 2).map { return $0 }
		if row1.count < n {
			for _ in 0..<(n-row1.count) {
				row1.insert("0", at: 0)
			}
		}
		if row2.count < n {
			for _ in 0..<(n-row2.count) {
				row2.insert("0", at: 0)
			}
		}
		
		for j in 0..<row1.count {
			if row1[j] == "1" || row2[j] == "1" {
				rowSum.append("#")
			} else {
				rowSum.append(" ")
			}
		}
		answer.append(rowSum)
	}
	
	return answer
}

print(solution(5,[9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
