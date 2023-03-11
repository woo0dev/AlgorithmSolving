//
//  main.swift
//  LV2-17677
//
//  Created by woo0 on 2023/03/11.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
	let regex = "[a-z]"
	let new_str1 = str1.lowercased().map { return String($0) }
	let new_str2 = str2.lowercased().map { return String($0) }
	var pairs1 = [String]()
	var pairs2 = [String]()
	var union = [String]()
	var intersection = [String]()
	var pairDic = [String: Bool]()

	for i in 0..<new_str1.count-1 {
		if new_str1[i].range(of: regex, options: .regularExpression) != nil && new_str1[i+1].range(of: regex, options: .regularExpression) != nil {
			pairs1.append("\(new_str1[i])\(new_str1[i+1])")
		}
	}

	for i in 0..<new_str2.count-1 {
		if new_str2[i].range(of: regex, options: .regularExpression) != nil && new_str2[i+1].range(of: regex, options: .regularExpression) != nil {
			pairs2.append("\(new_str2[i])\(new_str2[i+1])")
		}
	}

	if pairs1 == [] && pairs2 == [] {
		return 65536
	}

	for value in pairs1 {
		if pairs2.contains(value) && pairDic[value] == nil {
			let count1 = pairs1.filter { return $0 == value }.count
			let count2 = pairs2.filter { return $0 == value }.count
			for _ in 0..<[count1, count2].max()! {
				union.append(value)
			}
			for _ in 0..<[count1, count2].min()! {
				if pairDic[value] == nil {
					pairDic[value] = false
				}
				intersection.append(value)
			}
		}
		guard let _ = pairDic[value] else {
			union.append(value)
			continue
		}
	}

	for value in pairs2 {
		guard let _ = pairDic[value] else {
			union.append(value)
			continue
		}
	}

	if pairs1 == [] && pairs2 == [] {
		return 65536
	}

	return Int(floor(Double(intersection.count) / Double(union.count) * 65536.0))
}

print(solution("A+C", "DEF"))
