//
//  main.swift
//  Practice-KakaoValidity
//
//  Created by woo0 on 2023/01/25.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
	var result: [Int] = Array()
	let to = today.split(separator: ".")
	var termArr: [[String]] = Array()
	var privacyArr: [[String]] = Array()
	for term in terms {
		termArr.append(term.components(separatedBy: " "))
	}
	
	for privacy in privacies {
		let temp = privacy.components(separatedBy: " ")
		privacyArr.append(temp)
	}
	
	for (idx, privacy) in privacyArr.enumerated() {
		for term in termArr {
			if term[0] == privacy[1] {
				let date = privacy[0].components(separatedBy: ".")
				let year = Int(to[0])! - Int(date[0])!
				var month = Int(to[1])! - Int(date[1])!
				let day = Int(to[2])! - Int(date[2])!
				if year > 0 {
					month += year * 12
				}
				if day >= 0 {
					month += 1
				}
				if Int(term[1])! < month {
					result.append(idx+1)
				}
			}
		}
	}
	
	return result
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
