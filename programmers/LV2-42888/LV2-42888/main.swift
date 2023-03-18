//
//  main.swift
//  LV2-42888
//
//  Created by woo0 on 2023/03/18.
//

import Foundation

func solution(_ record:[String]) -> [String] {
	let new_records = record.map { return $0.components(separatedBy: " ") }
	var result = [String]()
	var users = [String: String]()
	
	for new_record in new_records {
		if let _ = users[new_record[1]] {
			if new_record.count > 2 {
				users[new_record[1]] = new_record[2]
			}
		} else {
			if new_record.count > 2 {
				users[new_record[1]] = new_record[2]
			}
		}
	}
	
	for new_record in new_records {
		if new_record[0] == "Enter" {
			result.append("\(users[new_record[1]]!)님이 들어왔습니다.")
		} else if new_record[0] == "Leave" {
			result.append("\(users[new_record[1]]!)님이 나갔습니다.")
		}
	}
	
	return result
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
