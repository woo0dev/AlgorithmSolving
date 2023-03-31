//
//  main.swift
//  LV2-42883
//
//  Created by woo0 on 2023/03/31.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
	var result = [Character]()
	var new_k = k
	let n = number.count - k
	
	for num in number {
		while result.count > 0 && new_k > 0 && num > result.last! {
			print("@")
			new_k -= 1
			result.removeLast()
		}
		if result.count < n {
			result.append(num)
		}
	}

	return String(result)
}

print(solution("4177252841", 4))
