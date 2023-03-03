//
//  main.swift
//  LV2-76502
//
//  Created by woo0 on 2023/03/02.
//

import Foundation

func solution(_ s:String) -> Int {
	var result = 0
	var chars = s.map { return String($0) }
	var bracket = ["[": "]", "{": "}", "(": ")"]

	for i in 0..<chars.count {
		var stack = [String]()
		var turn = ""
		var str = ""
		chars.enumerated().forEach { (idx, ele) in
			if idx < i {
				turn += ele
			} else {
				str += ele
			}
		}
		str += turn
		for char in str {
			if stack.count == 0 {
				stack.append(String(char))
			} else if ["[", "{", "("].contains(String(char)) {
				stack.append(String(char))
			} else if bracket[stack.last ?? ""] == String(char) {
				stack.removeLast()
			} else {
				break
			}
		}
		if stack.count == 0 {
			result += 1
		}
		stack = []
	}

	return result
}

print(solution("[](){}"))
