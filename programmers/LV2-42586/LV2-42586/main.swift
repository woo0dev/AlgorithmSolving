//
//  main.swift
//  LV2-42586
//
//  Created by woo0 on 2023/03/08.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
	var completes = [Int]()
	var times = [Int]()
	var date = 0
	
	for i in 0..<progresses.count {
		times.append(Int(ceil((100.0 - Double(progresses[i])) / Double(speeds[i]))))
	}
	
	for time in times {
		if date >= time {
			completes[completes.count-1] += 1
		} else {
			date = time
			completes.append(1)
		}
		if date == 0 {
			date = time
			completes.append(1)
		}
	}
	
	return completes
}

print(solution([93, 30, 55], [1, 30, 5]))
