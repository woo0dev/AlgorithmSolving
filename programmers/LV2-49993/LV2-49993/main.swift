//
//  main.swift
//  LV2-49993
//
//  Created by woo0 on 2023/03/19.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
	var result = 0
	var new_skill = skill.map { String($0) }
	var new_skill_trees = skill_trees.map { String($0).map { String($0) } }
	var complete = [String: [Int]]()
	var possible = true
	
	for i in new_skill.indices {
		complete[new_skill[i]] = [i, 0]
	}
	
	for new_skill_tree in new_skill_trees {
		for i in new_skill_tree.indices {
			if let s = complete[new_skill_tree[i]] {
				if complete.filter({ $0.value[0] < s[0] && $0.value[1] == 0 }).count == 0 {
					complete[new_skill_tree[i]] = [s[0], 1]
				} else {
					possible = false
				}
			}
		}
		if possible {
			result += 1
		} else {
			possible = true
		}
		for i in new_skill.indices {
			complete[new_skill[i]] = [i, 0]
		}
	}
	
	return result
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
