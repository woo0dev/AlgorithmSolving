//
//  main.swift
//  1684-Count-the-Number-of-Consistent-Strings
//
//  Created by woo0 on 2022/07/16.
//

import Foundation

func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
	var result = 0
	var isEquals = false
	let charArr = allowed.map { return $0 }
	
	for word in words {
		var temp = word
		for char in charArr {
			temp = temp.filter { $0 != char }
			if temp == "" {
				isEquals = true
			} else {
				isEquals = false
			}
		}
		if isEquals {
			result += 1
		}
	}
	
	return result
}

print(countConsistentStrings("ab", ["ad", "bd", "aaab", "baa", "badab"]))
