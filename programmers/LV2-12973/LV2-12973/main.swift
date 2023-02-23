//
//  main.swift
//  LV2-12973
//
//  Created by woo0 on 2023/02/23.
//

import Foundation

func solution(_ s:String) -> Int {
	var strs = s.map { return String($0) }
	var stack = [String]()
	
	for i in 0..<strs.count {
		if stack.last ?? "" == strs[i] {
			stack.removeLast()
		} else {
			stack.append(strs[i])
		}
	}
	
	return stack.count == 0 ? 1 : 0
}

print(solution("baabaa"))
