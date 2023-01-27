//
//  main.swift
//  Practice-SplitString
//
//  Created by woo0 on 2023/01/28.
//

import Foundation

func solution(_ s:String) -> Int {
	var result = 0
	var char = s.map { String($0) }
	var same = 0
	var other = 0
	var temp = ""
	var idx = 0
	
	while idx < char.count-1 {
		if temp == "" {
			temp = char[idx]
			same += 1
		}
		
		if temp == char[idx+1] {
			same += 1
		} else {
			other += 1
		}
		
		if same == other {
			result += 1
			idx += 2
			same = 0
			other = 0
			temp = ""
		} else {
			idx += 1
		}
		
		if char.count - idx == 1 {
			result += 1
		}
	}
	
	return char.count == 1 ? 1 : result
}


print(solution("aaabbaccccabba"))
