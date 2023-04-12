//
//  main.swift
//  LV2-72411
//
//  Created by woo0 on 2023/04/12.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
	var result = [String]()
	var new_orders = orders.map { $0.map { String($0) } }
	var arr = [[String]]()
	var ordersDic = [String: Int]()
	var resultDic = [Int: [String]]()
	
	func cycle(_ array: [String], _ count: Int, _ now: [String], _ index: Int = 0) {
		if now.count == count {
			arr.append(now)
			return
		}
		
		for i in index..<array.count {
			cycle(array, count, now + [array[i]], i + 1)
		}
	}
	
	for new_order in new_orders {
		for i in 2...new_order.count {
			cycle(new_order, i, [])
		}
		arr.filter({ course.contains($0.count) }).map { $0.sorted(by: <) }.forEach {
			if let _ = ordersDic[$0.joined()] {
				ordersDic[$0.joined()]! += 1
			} else {
				ordersDic[$0.joined()] = 1
			}
		}
		arr = []
	}

	ordersDic = ordersDic.filter({ $0.value > 1 })
	
	for (key, value) in ordersDic {
		if let _ = resultDic[key.count] {
			if ordersDic[resultDic[key.count]![0]]! < value {
				resultDic[key.count]! = [key]
			} else if ordersDic[resultDic[key.count]![0]]! == value {
				resultDic[key.count]!.append(key)
			}
		} else {
			resultDic[key.count] = [key]
		}
	}
	
	for values in resultDic.values {
		for value in values {
			result.append(value)
		}
	}
	
	return result.sorted(by: <)
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))
