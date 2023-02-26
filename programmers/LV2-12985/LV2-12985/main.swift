//
//  main.swift
//  LV2-12985
//
//  Created by woo0 on 2023/02/26.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
	var answer = 1
	var userA = a
	var userB = b
	let firstUser = [a, b].min()! == a ? "A" : "B"
	
	if [a, b].max()! - [a, b].min()! == 1 && [a, b].min()! % 2 == 1 {
		return answer
	}

	while true {
		answer += 1
		userA = userA % 2 == 0 ? userA / 2 : userA / 2 + 1
		userB = userB % 2 == 0 ? userB / 2 : userB / 2 + 1
		if firstUser == "A" {
			if userB - userA == 1 && userA % 2 == 1 {
				return answer
			}
		} else {
			if userA - userB == 1 && userB % 2 == 1 {
				return answer
			}
		}
	}
	
	return answer
}

print(solution(16, 8, 9))
