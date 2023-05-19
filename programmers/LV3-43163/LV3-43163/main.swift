//
//  main.swift
//  LV3-43163
//
//  Created by woo0 on 2023/05/19.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
	if !words.contains(target) {
		return 0
	}
	var visitedQueue = [[String]: Bool]()
	var needVisitedQueue = [[String]]()
	var counts = [[String]: Int]()
	var beginString = begin.map { String($0) }
	
	func bfs(_ word: [String]) {
		visitedQueue[word] = true
		
		for i in words.indices {
			let str = words[i].map { String($0) }
			var count = 0
			for j in str.indices {
				if word[j] != str[j] {
					count += 1
				}
			}
			if count == 1 {
				needVisitedQueue.append(str)
				if counts[str] == nil {
					counts[str] = counts[word]! + 1
				}
			}
		}
		
		while !needVisitedQueue.isEmpty {
			let first = needVisitedQueue.removeFirst()
			if first.joined() == target {
				break
			}
			if let _ = visitedQueue[first] {
				continue
			}
			bfs(first)
		}
	}
	
	counts[beginString] = 0
	bfs(beginString)
	
	return counts[target.map { String($0) }]!
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
