//
//  main.swift
//  LV2-42583
//
//  Created by woo0 on 2023/03/27.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
	var result = 0
	var progress = [[Int]]()
	var waiting = truck_weights
	
	while true {
		progress = progress.map { [$0[0], $0[1] + 1] }.filter { $0[1] < bridge_length }
		if waiting.count > 0 {
			if progress.reduce(0, { (res: Int, ele: [Int]) -> Int in res + ele[0] }) + waiting[0] <= weight && progress.count < bridge_length {
				progress.append([waiting[0], 0])
				waiting.removeFirst()
			}
		}
		result += 1
		if progress.count == 0 {
			break
		}
	}
	return result
}

print(solution(2, 10, [7,4,5,6]))
