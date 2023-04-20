//
//  main.swift
//  LV2-17683
//
//  Created by woo0 on 2023/04/21.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
	var result = [String: Int]()
	var check = false
	var new_musicinfos = [[[String]]]()
	new_musicinfos = musicinfos.map {
		let info = $0.components(separatedBy: ",")
		let start = info[0].components(separatedBy: ":").map { Int($0)! }
		let end = info[1].components(separatedBy: ":").map { Int($0)! }
		let time = (end[0] * 60 + end[1]) - (start[0] * 60 + start[1])
		var s = info[3].map { String($0) }
		var sheet = convertShap(s)
		var temp = [String]()
		var index = 0
		var count = 0
		while count < time {
			temp.append(sheet[index])
			index += 1
			count += 1
			if index >= sheet.count { index -= sheet.count }
		}
		sheet = temp
		return [[info[2]], sheet]
	}
	var new_m = m.map { String($0) }
	var my = convertShap(new_m)
	
	for musicinfo in new_musicinfos {
		var info = musicinfo[1]
		for i in info.indices {
			if my.first! == info[i] && i + my.count - 1 < info.count {
				if my == Array(info[i..<i+my.count]) {
					check = true
				}
			}
		}
		if check {
			if result.isEmpty {
				result[musicinfo[0][0]] = info.count
			} else {
				if result.first!.value < info.count {
					result = [:]
					result[musicinfo[0][0]] = info.count
				}
			}
			check = false
		}
	}
	
	return result.isEmpty ? "(None)" : result.first!.key
}

func convertShap(_ arr: [String]) -> [String] {
	var res = [String]()
	for i in arr.indices {
		if i < arr.count-1 {
			if arr[i+1] == "#" {
				res.append(arr[i] + arr[i+1])
				continue
			}
		}
		if arr[i] != "#" { res.append(arr[i]) }
	}
	return res
}

print(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))
