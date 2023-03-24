//
//  main.swift
//  LV2-84512
//
//  Created by woo0 on 2023/03/24.
//

import Foundation

func solution(_ word:String) -> Int {
	let words = ["A", "E", "I", "O", "U"]
	var result = 0
	var res_words = Set<String>()
	var temp_words = ""
	var count = 1
	
	
	
	for i in count...5 {
		addWord(words, i, &res_words, &temp_words)
	}
	
	let new_res_words = res_words.sorted(by: <)
	
	for i in new_res_words.indices {
		if new_res_words[i] == word {
			result = i + 1
			break
		}
	}
	
	return result
}

func addWord(_ words: [String], _ count: Int, _ res_words: inout Set<String>, _ temp_words: inout String) {
	if temp_words.count == count {
		res_words.insert(temp_words)
		return
	}
	
	for i in words.indices {
		temp_words += words[i]
		addWord(words, count, &res_words, &temp_words)
		temp_words.removeLast()
	}
}

print(solution("AAAAE"))
