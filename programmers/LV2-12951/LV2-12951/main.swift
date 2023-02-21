//
//  main.swift
//  LV2-12951
//
//  Created by woo0 on 2023/02/21.
//

import Foundation

func solution(_ s:String) -> String {
	var result = ""
	var words = s.components(separatedBy: " ")
	
	for i in 0..<words.count {
		var change = words[i].lowercased()
		if let first = change.first {
			change.removeFirst()
			change = "\(first.uppercased())\(change)"
			result += i == words.count-1 ? "\(change)" : "\(change) "
		} else {
			result += i == words.count-1 ? "\(change)" : "\(change) "
		}
	}
	
	return result
}

print(solution("3people unFollowed me"))
