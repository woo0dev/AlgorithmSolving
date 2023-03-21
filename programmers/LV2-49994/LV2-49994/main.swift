//
//  main.swift
//  LV2-49994
//
//  Created by woo0 on 2023/03/21.
//

import Foundation

func solution(_ dirs:String) -> Int {
	var road = Set<String>()
	var location = [0, 0]
	
	for dir in dirs {
		switch String(dir) {
		case "U":
			if location[1] < 5 {
				road.insert("\(location)\([location[0], location[1]+1])")
				road.insert("\([location[0], location[1]+1])\(location)")
				location[1] += 1
			}
		case "D":
			if location[1] > -5 {
				road.insert("\(location)\([location[0], location[1]-1])")
				road.insert("\([location[0], location[1]-1])\(location)")
				location[1] -= 1
			}
		case "L":
			if location[0] > -5 {
				road.insert("\(location)\([location[0]-1, location[1]])")
				road.insert("\([location[0]-1, location[1]])\(location)")
				location[0] -= 1
			}
		default:
			if location[0] < 5 {
				road.insert("\(location)\([location[0]+1, location[1]])")
				road.insert("\([location[0]+1, location[1]])\(location)")
				location[0] += 1
			}
		}
	}
	
	return road.count / 2
}

print(solution("ULURRDLLU"))
