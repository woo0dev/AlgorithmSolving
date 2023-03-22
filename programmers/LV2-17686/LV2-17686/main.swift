//
//  main.swift
//  LV2-17686
//
//  Created by woo0 on 2023/03/22.
//

import Foundation

func solution(_ files:[String]) -> [String] {
	var result = [String]()
	var temp = [[String]]()
	var isNumber = false
	
	for i in files.indices {
		var tempStr = [String]()
		var str = ""
		for j in files[i].indices {
			var s = String(files[i][j])
			if tempStr.count == 0 {
				if let _ = Int(s) {
					tempStr.append(str)
					isNumber = true
					str = s
				} else {
					str += s
				}
			} else if tempStr.count == 1 && isNumber {
				if str.count < 5 {
					if let _ = Int(s) {
						str += s
					} else {
						tempStr.append(str)
						str = s
					}
				} else {
					tempStr.append(str)
					str = s
					isNumber = false
				}
			} else {
				str += s
			}
		}
		if str != "" { tempStr.append(str) }
		temp.append(tempStr)
	}
	
	temp = temp.sorted { ($0[0].lowercased(), Int($0[1])!) < ($1[0].lowercased(), Int($1[1])!) }
	
	temp.forEach { result.append($0.joined()) }
	
	return result
}

print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
