//
//  main.swift
//  Practice-PersonalityTest
//
//  Created by woo0 on 2023/01/31.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
	var scores = [Int](repeating: 0, count: 8)
	var index = 0
	var result = ""
	
	for idx in 0..<survey.count {
		var type = String(survey[idx][survey[idx].startIndex])
		let score = abs(4 - choices[idx])
		if choices[idx] < 4 {
			switch type {
			case "R":
				scores[0] += score
			case "T":
				scores[1] += score
			case "C":
				scores[2] += score
			case "F":
				scores[3] += score
			case "J":
				scores[4] += score
			case "M":
				scores[5] += score
			case "A":
				scores[6] += score
			default:
				scores[7] += score
			}
		} else {
			type = String(survey[idx][survey[idx].index(survey[idx].startIndex, offsetBy: 1)])
			switch type {
			case "R":
				scores[0] += score
			case "T":
				scores[1] += score
			case "C":
				scores[2] += score
			case "F":
				scores[3] += score
			case "J":
				scores[4] += score
			case "M":
				scores[5] += score
			case "A":
				scores[6] += score
			default:
				scores[7] += score
			}
		}
	}
	
	while index < scores.count {
		switch index {
		case 0:
			if scores[index] > scores[index+1] {
				result += "R"
			} else if scores[index] < scores[index+1] {
				result += "T"
			} else {
				var res = ["R", "T"].sorted(by: <)
				result += String(res[res.startIndex])
			}
		case 2:
			if scores[index] > scores[index+1] {
				result += "C"
			} else if scores[index] < scores[index+1] {
				result += "F"
			} else {
				var res = ["C", "F"].sorted(by: <)
				result += String(res[res.startIndex])
			}
		case 4:
			if scores[index] > scores[index+1] {
				result += "J"
			} else if scores[index] < scores[index+1] {
				result += "M"
			} else {
				var res = ["J", "M"].sorted(by: <)
				result += String(res[res.startIndex])
			}
		default:
			if scores[index] > scores[index+1] {
				result += "A"
			} else if scores[index] < scores[index+1] {
				result += "N"
			} else {
				var res = ["A", "N"].sorted(by: <)
				result += String(res[res.startIndex])
			}
		}
		index += 2
	}
	
	return result
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
