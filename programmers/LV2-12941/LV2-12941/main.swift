//
//  main.swift
//  LV2-12941
//
//  Created by woo0 on 2023/02/19.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
	var result = 0
	var new_A = A.sorted(by: <)
	var new_B = B.sorted(by: >)
	
	for i in 0..<A.count {
		result += new_A[i] * new_B[i]
	}
	
	return result
}

print(solution([1, 4, 2], [5, 4, 4]))
