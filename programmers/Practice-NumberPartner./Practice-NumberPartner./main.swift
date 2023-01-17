//
//  main.swift
//  Practice-NumberPartner.
//
//  Created by woo0 on 2023/01/16.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
	var x_arr = Array(repeating: 0, count: 10)
	var y_arr = Array(repeating: 0, count: 10)
	var result = ""
	var idx = 9
	
	for i in X {
		x_arr[Int(String(i))!] += 1
	}
	
	for i in Y {
		y_arr[Int(String(i))!] += 1
	}
	
	while idx >= 0 {
		if x_arr[idx] > 0 && y_arr[idx] > 0 {
			let min = [x_arr[idx], y_arr[idx]].min()!
			for _ in 0..<min {
				if idx == 0 && result == "0" {
					result = "0"
					break
				}
				result += "\(idx)"
				x_arr[idx] -= 1
				y_arr[idx] -= 1
			}
		}
		idx -= 1
	}
	
	return result == "" ? "-1" : result
}

print(solution("100", "203045"))
