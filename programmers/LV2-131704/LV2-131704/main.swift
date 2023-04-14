//
//  main.swift
//  LV2-131704
//
//  Created by woo0 on 2023/04/14.
//

import Foundation

func solution(_ order:[Int]) -> Int {
	var result = 0
	var new_order = order.reversed().map { $0 }
	var old_container = new_order.sorted(by: <).reversed().map { $0 }
	var new_container = [Int]()
	
	for _ in 0..<old_container.count * 2 {
		for box in new_container.reversed() {
			if new_order.count > 0 {
				if box == new_order.last! {
					result += 1
					new_order.removeLast()
					new_container.removeLast()
				} else {
					break
				}
			}
		}
		if new_order.count > 0 {
			if old_container.last ?? 0 == new_order.last! {
				result += 1
				old_container.removeLast()
				new_order.removeLast()
			} else {
				if let value = old_container.last {
					old_container.removeLast()
					new_container.append(value)
				}
			}
		}
		if new_order.isEmpty {
			break
		}
	}
	
	return result
}

print(solution([4, 3, 1, 2, 5]))
