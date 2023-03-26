//
//  main.swift
//  LV2-77885
//
//  Created by woo0 on 2023/03/26.
//

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
	var result = [Int64]()
	
	for number in numbers {
		if number % 2 == 0 {
			result.append(number + 1)
		} else {
			var str = String(number, radix: 2).map { String($0) }
			var count = 0
			if !str.contains("0") {
				str.insert("0", at: 0)
			}
			for s in str.reversed() {
				if String(s) == "0" {
					break
				} else {
					count += 1
				}
			}
			str = str.enumerated().map { (idx, ele) -> String in
				var res = ""
				if idx == (str.count - (count + 1)) {
					if ele == "0" {
						res = "1"
					} else {
						res = "0"
					}
				} else if idx == (str.count - count) {
					if ele == "0" {
						res = "1"
					} else {
						res = "0"
					}
				} else {
					res = ele
				}
				return res
			}
			result.append(Int64(str.joined(), radix: 2)!)
		}
	}
	
	return result
}

print(solution([2, 7]))
