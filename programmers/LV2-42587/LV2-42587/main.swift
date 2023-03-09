//
//  main.swift
//  LV2-42587
//
//  Created by woo0 on 2023/03/09.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
	var new_priorities = priorities
	var new_location = location
	var count = 0
	
	while new_priorities.count > 0 {
		if new_priorities[0] < new_priorities.max()! {
			new_priorities.append(new_priorities[0])
			new_priorities.removeFirst()
			new_location = new_location == 0 ? new_priorities.count-1 : new_location-1
		} else {
			if new_location == 0 {
				count += 1
				break
			}
			new_priorities.removeFirst()
			new_location = new_location == 0 ? new_priorities.count-1 : new_location-1
			count += 1
		}
	}
	
	return count
}

print(solution([1, 1, 9, 1, 1, 1], 0))
