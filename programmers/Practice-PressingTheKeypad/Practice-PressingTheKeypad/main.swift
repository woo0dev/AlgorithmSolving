//
//  main.swift
//  Practice-PressingTheKeypad
//
//  Created by woo0 on 2023/02/07.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
	var result = ""
	let keypad = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2], [3,0], [3,1], [3,2]]
	var left = 10
	var right = 12
	
	for number in numbers {
		let num = number == 0 ? keypad[10] : keypad[number-1]
		var leftPos = left == 0 ? keypad[10] : keypad[left-1]
		var rightPos = right == 0 ? keypad[10] : keypad[right-1]
		var leftCount = 0
		var rightCount = 0
		
		if number == 1 || number == 4 || number == 7 {
			result += "L"
			left = number
			continue
		} else if number == 3 || number == 6 || number == 9 {
			result += "R"
			right = number
			continue
		}
		
		while true {
			if num[0] == leftPos[0] && num[1] == leftPos[1] && num[0] == rightPos[0] && num[1] == rightPos[1] {
				if leftCount < rightCount {
					result += "L"
					left = number
					break
				} else if leftCount > rightCount {
					result += "R"
					right = number
					break
				} else if hand == "left" {
					result += "L"
					left = number
					break
				} else {
					result += "R"
					right = number
					break
				}
			}
			
			if num[0] > leftPos[0] {
				leftPos[0] += 1
				leftCount += 1
			} else if num[0] < leftPos[0] {
				leftPos[0] -= 1
				leftCount += 1
			} else if num[1] > leftPos[1] {
				leftPos[1] += 1
				leftCount += 1
			} else if num[1] < leftPos[1] {
				leftPos[1] -= 1
				leftCount += 1
			}
			
			if num[0] > rightPos[0] {
				rightPos[0] += 1
				rightCount += 1
			} else if num[0] < rightPos[0] {
				rightPos[0] -= 1
				rightCount += 1
			} else if num[1] > rightPos[1] {
				rightPos[1] += 1
				rightCount += 1
			} else if num[1] < rightPos[1] {
				rightPos[1] -= 1
				rightCount += 1
			}
		}
	}
	
	return result
}

print(solution(	[1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right"))
