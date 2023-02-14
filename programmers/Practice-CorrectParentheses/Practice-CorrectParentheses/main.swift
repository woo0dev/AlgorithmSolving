//
//  main.swift
//  Practice-CorrectParentheses
//
//  Created by woo0 on 2023/02/14.
//

import Foundation

func solution(_ s:String) -> Bool {
	let str = s.map { return $0 }
	var result = false
	var parentheses = 0
	
	if str[0] == ")" || str[str.count-1] == "(" {
		return false
	}
	
	for i in 0..<str.count {
		if str[i] == "(" {
			parentheses += 1
		} else {
			parentheses -= 1
		}
		if parentheses < 0 {
			return false
		}
	}
	
	if parentheses == 0 {
		result = true
	}

	return result
}

print(solution("())(()"))
