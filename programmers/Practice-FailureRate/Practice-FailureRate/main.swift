//
//  main.swift
//  Practice-FailureRate
//
//  Created by woo0 on 2023/02/07.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
	var result = [Int]()
	var res = [[Double]]()
	var stageArr = [Int](repeating: 0, count: N)
	var idx = 0
	var removeCount = 0
	let stageCount = stages.count
	
	for stage in stages {
		if stage <= N {
			stageArr[stage-1] += 1
		}
	}
	
	while idx < N {
		res.append([Double(idx), Double(stageArr[idx])/Double(stageCount-removeCount)])
		removeCount += stageArr[idx]
		idx += 1
	}

	res.sort(by: { $0[1] > $1[1] } )

	for r in res {
		result.append(Int(r[0])+1)
	}
	
	return result
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
