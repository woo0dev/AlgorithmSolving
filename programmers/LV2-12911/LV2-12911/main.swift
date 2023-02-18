//
//  main.swift
//  LV2-12911
//
//  Created by woo0 on 2023/02/18.
//

import Foundation

func solution(_ n:Int) -> Int {
	var result = n+1
	var binaryCount = String(n, radix: 2).filter { return $0 == "1" }.count
	
	while true {
		let biggerBinaryCount = String(result, radix: 2).filter { return $0 == "1" }.count
		if binaryCount == biggerBinaryCount {
			return result
		} else {
			result += 1
		}
	}
	
	return result
}

print(78)
