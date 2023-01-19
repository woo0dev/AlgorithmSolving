//
//  main.swift
//  Practice-AddMissingNumbers
//
//  Created by woo0 on 2023/01/19.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
	return 45 - numbers.reduce(0) { $0 + $1 }
}

print(solution([1,2,3,4,6,7,8,0]))
