//
//  main.swift
//  Practice-DartGame
//
//  Created by woo0 on 2023/02/10.
//

import Foundation

func solution(_ dartResult:String) -> Int {
	var result = 0
	var results = [Int]()
	var dart = dartResult.map { return $0 }
	var nums = ["0","1","2","3","4","5","6","7","8","9","10"]
	var multiples = ["S","D","T"]
	var options = ["*","#"]
	var score = ""
	var multiple = ""
	var option = ""
	var dartScore = [[String]]()
	
	for i in 0..<dart.count {
		if nums.contains(String(dart[i])) {
			if String(dart[i]) == "0" && i > 0 {
				if nums.contains(String(dart[i-1])) {
					score = "\(dart[i-1])\(dart[i])"
				} else {
					score = "\(dart[i])"
				}
			} else {
				score = "\(dart[i])"
			}
		} else if multiples.contains(String(dart[i])) {
			multiple = String(dart[i])
		} else if options.contains(String(dart[i])) {
			option = String(dart[i])
		}
		if i < dart.count-1 {
			if nums.contains(String(dart[i+1])) && String(dart[i+1]) != "0" {
				dartScore.append(["\(score)","\(multiple)","\(option)"])
				score = ""
				multiple = ""
				option = ""
			} else if !nums.contains(String(dart[i])) && String(dart[i+1]) == "0" {
				dartScore.append(["\(score)","\(multiple)","\(option)"])
				score = ""
				multiple = ""
				option = ""
			}
		} else if i == dart.count-1 {
			dartScore.append(["\(score)","\(multiple)","\(option)"])
		}
	}
	
	for i in 0..<dartScore.count {
		let mul = dartScore[i][1] == "S" ? 1.0 : dartScore[i][1] == "D" ? 2.0 : 3.0
		if dartScore[i][2] == "*" {
			if i == 0 {
				results.append(Int(pow(Double(dartScore[i][0])!, mul) * 2))
			} else {
				results[i-1] = results[i-1] * 2
				results.append(Int(pow(Double(dartScore[i][0])!, mul) * 2))
			}
		} else if dartScore[i][2] == "#" {
			results.append(Int(pow(Double(dartScore[i][0])!, mul) * (-1)))
		} else {
			results.append(Int(pow(Double(dartScore[i][0])!, mul)))
		}
	}
	
	result = results.reduce(0) { (res: Int, ele: Int) -> Int in
		return res + ele
	}
	
	return result
}

print(solution("1S2D*3T"))
