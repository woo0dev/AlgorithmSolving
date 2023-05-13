//
//  main.swift
//  LV2-42860
//
//  Created by woo0 on 2023/05/13.
//

import Foundation

func solution(_ name:String) -> Int {
	var result = Int.max
	var new_name = name.map { String($0) }
	var targetIndices = [Int]()
	
	for i in new_name.indices {
		if new_name[i] != "A" { targetIndices.append(i) }
	}
	
	func dfs(_ new_name: [String], _ targets: [Int], _ res: Int, _ index: Int) {
		if targets.isEmpty {
			if result > res { result = res }
			return
		}
		
		var first = res + counting(new_name[targets.first!])
		if index > targets.first! {
			first += new_name.count + targets.first! - index
		} else {
			first += targets.first! - index
		}
		var firstTargets = targets
		firstTargets.removeFirst()
		
		var second = res + counting(new_name[targets.last!])
		if index > targets.last! {
			second += index - targets.last!
		} else {
			second += new_name.count + index - targets.last!
		}
		var secondTargets = targets
		secondTargets.removeLast()
		
		dfs(new_name, firstTargets, first, targets.first!)
		dfs(new_name, secondTargets, second, targets.last!)
	}
	
	dfs(new_name, targetIndices, 0, 0)
	
	return result
}

func counting(_ str: String) -> Int {
	let num = Int(UnicodeScalar(str)!.value)
	if num <= 77 {
		return num - 65
	} else {
		return abs(num - 91)
	}
}

print(solution("JEROEN"))
