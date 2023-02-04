//
//  main.swift
//  Practice-RecommendANewID.
//
//  Created by woo0 on 2023/02/04.
//

import Foundation

func solution(_ new_id:String) -> String {
    var result = ""
	let pattern = "[a-z0-9._-]"
	var id = new_id.map { String($0).lowercased() }
	
	for i in 0..<id.count {
		if String(id[i]).range(of: pattern, options: .regularExpression) != nil {
			result += String(id[i])
		}
	}
	
	id = result.map { String($0) }
	result = ""
	
	for i in 0..<id.count {
		if i > 0 && String(id[i-1]) == "." && String(id[i]) == "." {
			continue
		} else {
			result += String(id[i])
		}
	}
	
	id = result.map { String($0) }
	result = ""
	
	for i in 0..<id.count {
		if (result == "" || i == id.count-1) && id[i] == "." {
		   continue
	   } else {
		   result += String(id[i])
	   }
	}
	
	if result == "" {
		result = "a"
	}
	
	if result.count > 15 {
		result.removeSubrange(result.index(result.startIndex, offsetBy: 15)..<result.endIndex)
	}
	
	if result[result.index(before: result.endIndex)] == "." {
		result.removeLast()
	}
	
	if result.count < 3 {
		let char = String(result[result.index(before: result.endIndex)])
		for _ in 0..<3-result.count {
			result += char
		}
	}
	
	return result
}

print(solution("=.="))
