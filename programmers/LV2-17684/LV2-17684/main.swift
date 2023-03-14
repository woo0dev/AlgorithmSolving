//
//  main.swift
//  LV2-17684
//
//  Created by woo0 on 2023/03/14.
//

import Foundation

func solution(_ msg:String) -> [Int] {
	let new_msg = msg.map { return String($0) }
	var answer = [Int]()
	var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	var max = 1
	var index = 0
	var count = 0
	var check = true
	
	while index < new_msg.count {
		while check {
			if index + (max - count) < new_msg.count {
				let word = new_msg[index...index+(max-count)].joined()
				for i in stride(from: alphabet.count-1, through: 0, by: -1) {
					if word == alphabet[i] {
						answer.append(i+1)
						check = false
						break
					}
				}
				count += 1
			} else {
				let word = new_msg[index...new_msg.count-1].joined()
				for i in stride(from: alphabet.count-1, through: 0, by: -1) {
					if word == alphabet[i] {
						answer.append(i+1)
						check = false
						break
					}
				}
				count += 1
			}
		}
		if index + 1 + (max - (count-1)) < new_msg.count {
			alphabet.append("\(new_msg[index...index + 1 + (max - (count-1))].joined())")
		}
		index += 1 + (max - (count-1))
		count = 0
		check = true
		alphabet.forEach { if max < $0.count { max = $0.count } }
	}
	
	return answer
}

print(solution("KAKAO"))
