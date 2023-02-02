//
//  main.swift
//  Practice-ReceiveReportResults
//
//  Created by woo0 on 2023/02/01.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
	var result = [Int](repeating: 0, count: id_list.count)
	var reportUser = [[String]]()
	var reportUserIndex = [Int: [Int]]()
	var reportDic = [String: Int]()
	let reports = Set(report)

	for i in 0..<id_list.count {
		reportDic[id_list[i]] = i
		reportUserIndex[i] = []
	}
	
	for i in reports {
		var users = i.components(separatedBy: " ")
		reportUserIndex[reportDic[users[1]]!]!.append(reportDic[users[0]]!)
		reportUser.append(users)
	}
	
	for i in reportUserIndex {
		if i.value.count >= k {
			for idx in i.value {
				result[idx] += 1
			}
		}
	}
	
	return result
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","apeach frodo","apeach frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
