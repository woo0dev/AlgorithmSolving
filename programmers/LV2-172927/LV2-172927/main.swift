//
//  main.swift
//  LV2-172927
//
//  Created by woo0 on 2023/05/07.
//

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
	var result = 0
	var new_picks = picks
	var new_minerals = [minaral]()
	var count = picks.reduce(0, { $0 + $1 })
	
	for index in minerals.indices {
		if (index+1) % 5 == 0 {
			var temp = [String]()
			var sum = 0
			for i in index-4...index {
				temp.append(minerals[i])
				if minerals[i] == "diamond" {
					sum += 25
				} else if minerals[i] == "iron" {
					sum += 5
				} else {
					sum += 1
				}
			}
			new_minerals.append(minaral(index: new_minerals.count, array: temp, price: sum))
			if new_minerals.count == count { break }
			if index+5 >= minerals.count {
				temp = []
				sum = 0
				for i in index+1..<minerals.count {
					temp.append(minerals[i])
					if minerals[i] == "diamond" {
						sum += 25
					} else if minerals[i] == "iron" {
						sum += 5
					} else {
						sum += 1
					}
				}
				new_minerals.append(minaral(index: new_minerals.count, array: temp, price: sum))
				break
			}
		}
	}
	
	new_minerals = new_minerals.sorted(by: { $0.price > $1.price })
	
	for minerals in new_minerals {
		let pick = new_picks[0] > 0 ? 0 : new_picks[1] > 0 ? 1 : 2
		for mineral in minerals.array {
			if mineral == "diamond" {
				if pick == 0 { result += 1 }
				else if pick == 1 { result += 5 }
				else { result += 25 }
			} else if mineral == "iron" {
				if pick == 2 { result += 5 }
				else { result += 1 }
			} else {
				result += 1
			}
		}
		new_picks[pick] -= 1
	}
	
	return result
}

struct minaral {
	var index: Int
	var array: [String]
	var price: Int
}

print(solution([1,3,2], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]))
