//
//  main.swift
//  LV2-131701
//
//  Created by woo0 on 2023/03/08.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
	var new_elements = elements
	var totals = Set(new_elements).map { return $0 }
	var index = 0
	var count = 1
	
	for _ in 0..<new_elements.count-1 {
		for j in 0..<new_elements.count {
			index = j + count >= new_elements.count ? (j + count) % new_elements.count : j + count
			new_elements[j] += elements[index]
		}
		new_elements.forEach {
			totals.append($0)
		}
		count += 1
	}
	
	return Set(totals).count
}

print(solution([7,9,1,1,4]))
