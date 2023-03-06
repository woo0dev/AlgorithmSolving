//
//  main.swift
//  LV2-64065
//
//  Created by woo0 on 2023/03/06.
//

import Foundation

func solution(_ s:String) -> [Int] {
	var result = [Int]()
	var words = s.components(separatedBy: "{")
	var new_words = words.map { return $0.components(separatedBy: "}") }.filter {
		return $0 != [""]
	}
	words = []
	for new_word in new_words {
		for str in new_word {
			if str != "," && str != "" && str != ", " {
				words.append(str)
			}
		}
	}
	new_words = words.map { return $0.components(separatedBy: ",").sorted(by: <) }
	new_words = new_words.sorted { $0.count < $1.count }
	
	new_words.forEach {
		$0.forEach {
			if !result.contains(Int($0)!) {
				result.append(Int($0)!)
			}
		}
	}
	
	return result
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
