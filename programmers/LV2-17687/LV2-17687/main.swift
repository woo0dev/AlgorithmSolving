//
//  main.swift
//  LV2-17687
//
//  Created by woo0 on 2023/03/17.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
	var result = ""
	var arr = [String]()
	var total = [[String]]()
	var temp = [String]()
	
	for i in 0...t*m {
		let binary = String(i, radix: n).uppercased().map { return String($0) }
		for char in binary {
			arr.append(char)
		}
	}
	
	for i in arr.indices {
		temp.append(arr[i])
		if temp.count % m == 0 {
			total.append(temp)
			temp = []
		}
	}

	for i in total.indices where i < t {
		result += total[i][p-1]
	}
	
	return result
}

print(solution(2, 4, 2, 1))
