//
//  main.swift
//  Practice-TheSameLetter
//
//  Created by woo0 on 2023/01/27.
//

import Foundation

func solution(_ s:String) -> [Int] {
	var word = s.map { $0 }
	var result: [Int] = Array(repeating: -1, count: word.count)
	
	for i in 0..<word.count {
		for j in stride(from: i-1, through: 0, by: -1) {
			if word[i] == word[j] {
				result[i] = i-j
				break
			}
		}
	}
	
	return result
}

print(solution("banana"))
