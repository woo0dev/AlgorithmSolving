//
//  main.swift
//  LV2-118667
//
//  Created by woo0 on 2023/04/13.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
	var result = 0
	var new_queue1 = queue1
	var new_queue2 = queue2
	var head1 = 0
	var head2 = 0
	var sum1 = new_queue1.reduce(0) { $0 + $1 }
	var sum2 = new_queue2.reduce(0) { $0 + $1 }
	
	for _ in 0..<queue1.count*2+2 {
		if sum1 == sum2 {
			break
		}
		if sum1 > sum2 {
			var num = new_queue1[head1]
			sum1 -= num
			sum2 += num
			head1 += 1
			new_queue2.append(num)
			result += 1
		} else if sum1 < sum2 {
			var num = new_queue2[head2]
			sum1 += num
			sum2 -= num
			new_queue1.append(num)
			head2 += 1
			result += 1
		}
	}
	
	if sum1 != sum2 {
		result = -1
	}
	
	return result
}

print(solution([3, 2, 7, 2], [4, 6, 5, 1]))
