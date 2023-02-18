//
//  main.swift
//  LV2-12939
//
//  Created by woo0 on 2023/02/18.
//

import Foundation

func solution(_ s:String) -> String {
	let arr = s.components(separatedBy: " ").map { return Int($0) ?? 0 }
	return "\(String(arr.min() ?? 0)) \(String(arr.max() ?? 0))"
}

print(solution("1 2 3 4"))
