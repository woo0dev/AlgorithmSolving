//
//  main.swift
//  Practice-Babbling2
//
//  Created by woo0 on 2022/11/13.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
	var result = 0
	let word = ["aya", "ye", "woo", "ma"]
	var isCount = false
	
	for w in babbling {
		var temp = w.map { String($0) }
		var temp2 = ""
		var temp3 = ""
		temp.forEach {
			temp2 += $0
			word.forEach {
				if $0 == temp2 && temp2 != temp3 {
					temp.removeFirst(temp2.count)
					temp3 = temp2
					temp2 = ""
					isCount = true
				} else if temp2 == temp3 {
					isCount = false
				}
			}
		}
		if isCount && temp == [] {
			result += 1
		}
		isCount = false
	}
	
	return result
}

print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
