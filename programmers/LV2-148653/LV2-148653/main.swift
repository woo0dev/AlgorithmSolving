//
//  main.swift
//  LV2-148653
//
//  Created by woo0 on 2023/04/29.
//

import Foundation

func solution(_ storey:Int) -> Int {
	var result = 0
	var new_storey = "\(storey)".reversed().map { Int(String($0))! }
	
	for i in new_storey.indices {
		while new_storey[i] > 0 {
			if new_storey[i] == 10 {
				if i + 1 < new_storey.count { new_storey[i+1] += 1 }
				else { result += 1 }
				new_storey[i] = 0
				break
			}
			if 10 - new_storey[i] == new_storey[i] {
				if i + 1 < new_storey.count {
					if 10 - (new_storey[i+1] + 1) >= (new_storey[i+1] + 1) {
						new_storey[i] -= 1
						result += 1
					} else {
						new_storey[i] += 1
						result += 1
					}
				} else {
					new_storey[i] -= 1
					result += 1
				}
			} else if 10 - new_storey[i] > new_storey[i] {
				new_storey[i] -= 1
				result += 1
			} else {
				new_storey[i] += 1
				result += 1
			}
			if new_storey[i] == 10 {
				if i+1 < new_storey.count { new_storey[i+1] += 1 }
				else { result += 1 }
				new_storey[i] = 0
			}
		}
	}
	
	return result
}

print(solution(16))
