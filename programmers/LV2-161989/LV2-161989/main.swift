//
//  main.swift
//  LV2-161989
//
//  Created by woo0 on 2023/03/25.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
	var result = 0
	var new_section = [Int: Int]()
	
	section.enumerated().forEach {
		new_section[$1] = $0
	}
	
	for s in new_section.sorted(by: { $0.key < $1.key }) {
		if let _ = new_section[s.key] {
			for i in 0..<m {
				new_section.removeValue(forKey: s.key+i)
			}
			result += 1
		}
	}
	
	return result
}

print(solution(8, 4, [2, 3, 6]))
