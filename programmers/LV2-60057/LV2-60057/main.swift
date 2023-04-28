//
//  main.swift
//  LV2-60057
//
//  Created by woo0 on 2023/04/28.
//

import Foundation

func solution(_ s:String) -> Int {
	var result = Int.max
	var new_s = s.map { String($0) }
	var slice = [[String]]()
	var temp = [String]()
	
	if new_s.count == 1 {
		return 1
	}
	
	for i in 1...new_s.count/2 {
		var res = ""
		for j in stride(from: 0, to: new_s.count, by: i) {
			if j+i >= new_s.count {
				slice.append(Array(new_s[j..<new_s.count]))
			} else {
				slice.append(Array(new_s[j..<j+i]))
			}
			
		}
		for i in 0..<slice.count {
			if i < slice.count - 1{
				if temp == [] {
					temp = ["1", slice[i].joined()]
					if temp[1] != slice[i+1].joined() {
						if temp[0] == "1" {
							res += temp[1]
							temp = []
						} else {
							res += temp.joined()
							temp = []
						}
					}
				} else if slice[i].joined() == temp[1] {
					temp[0] = "\(Int(temp[0])! + 1)"
					if temp[1] != slice[i+1].joined() {
						res += temp.joined()
						temp = []
					}
				}
			} else {
				if slice[i-1].joined() == slice[i].joined() {
					temp[0] = "\(Int(temp[0])! + 1)"
					res += temp.joined()
				} else {
					res += slice[i].joined()
				}
			}
		}
		if result > res.count && res.count > 0 { result = res.count }
		slice = []
		temp = []
	}
	
	return result
}

print(solution("ababcdcdababcdcd"))
