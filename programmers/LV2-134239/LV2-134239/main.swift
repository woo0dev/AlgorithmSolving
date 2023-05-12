//
//  main.swift
//  LV2-134239
//
//  Created by woo0 on 2023/05/12.
//

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
	var result = [Double]()
	var area = [Double]()
	var new_k = k
	var last = [0, new_k]
	var index = 1
	
	while new_k > 1 {
		if new_k % 2 == 0 {
			new_k /= 2
		} else {
			new_k *= 3
			new_k += 1
		}
		area.append(Double(((last[1] + new_k)))/2)
		last = [index, new_k]
		index += 1
	}
	
	for i in ranges {
		var sum = 0.0
		if i[0] > area.count+i[1] {
			sum = -1
		} else if area.count+i[1] < area.count {
			for j in i[0]..<area.count+i[1] {
				sum += area[j]
			}
		} else if i[0] <= area.count {
			for j in i[0]..<area.count {
				sum += area[j]
			}
		}
		result.append(sum)
	}
	
	return result
}

print(solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]))
