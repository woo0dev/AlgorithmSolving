//
//  main.swift
//  LV2-17680
//
//  Created by woo0 on 2023/03/03.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
	var result = 0
	var caches = [String]()
	var new_cities = cities.map { return $0.lowercased() }
	var isCache = false
	var removeIndex = 0

	for city in new_cities {
		for i in 0..<caches.count {
			if caches[i] == city {
				isCache = true
				removeIndex = i
				break
			}
		}
		if isCache {
			result += 1
			caches.remove(at: removeIndex)
			caches.insert(city, at: 0)
			isCache = false
		} else {
			if caches.count < cacheSize {
				caches.insert(city, at: 0)
				result += 5
			} else {
				caches.insert(city, at: 0)
				caches.removeLast()
				result += 5
			}
		}
	}

	return result
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
