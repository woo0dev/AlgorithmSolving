//
//  main.swift
//  Practice-InnerProduct
//
//  Created by woo0 on 2023/02/06.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
	var result = 0
	
	for i in 0..<a.count {
		result += (a[i] * b[i])
	}
	
	return result
}

print(solution([1,2,3,4], [-3,-1,0,2]))
