//
//  main.swift
//  LV2-42747
//
//  Created by woo0 on 2023/03/01.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
	var result = 0
	var arr = [Int]()

	for citation in citations {
		if citation >= citations.filter({ return $0 >= citation }).count {
			arr.append(citation)
		}
	}

	for i in arr {
		if i >= arr.count {
			result = arr.count
		}
	}

	return result
}

print(solution([3, 0, 6, 1, 5]))
