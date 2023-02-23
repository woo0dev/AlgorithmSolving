//
//  main.swift
//  LV2-12981
//
//  Created by woo0 on 2023/02/23.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
	var result = [Int]()
	var before = [String]()
	
	for i in 0..<words.count {
		if i == 0 {
			before.append(words[i])
		} else if !before.contains(words[i]) && (before.last ?? "").last == words[i].first {
			before.append(words[i])
		} else {
			result.append((i+1)%n == 0 ? n : (i+1)%n)
			result.append(i/n+1)
			break
		}
	}
	
	return result.count == 0 ? [0,0] : result
}

print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))
