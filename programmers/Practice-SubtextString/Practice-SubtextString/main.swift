//
//  main.swift
//  Practice-SubtextString
//
//  Created by woo0 on 2023/01/26.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
	var result = 0
	let numbers = t.map { $0 }
	let length = p.count
	
	for i in 0..<numbers.count-(length-1) {
		var temp = ""
		for j in 0..<length {
			temp.append(numbers[i+j])
		}
		if Int(temp)! <= Int(p)! {
			result += 1
		}
	}
	
	return result
}

print(solution("3141592", "271"))
