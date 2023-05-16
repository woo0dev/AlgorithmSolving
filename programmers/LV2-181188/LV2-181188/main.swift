//
//  main.swift
//  LV2-181188
//
//  Created by woo0 on 2023/05/16.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
	var result = 0
	var new_targets = targets.sorted(by: { $0[1] > $1[1] })
	var index = new_targets.count - 1
	
	while new_targets.count > 0 {
		let target = new_targets[index]
		var i = index
		while target[1] > new_targets[i][0] {
			new_targets.removeLast()
			i -= 1
			if i < 0 {
				break
			}
		}
		result += 1
		index = new_targets.count - 1
	}
	
	return result
}

print(solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]))
