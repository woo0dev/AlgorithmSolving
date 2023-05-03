//
//  main.swift
//  LV2-42890
//
//  Created by woo0 on 2023/05/03.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
	var result = [[Int]]()
	var indices = [Int]()
	var array = [[Int]]()
	
	func combi(_ arr: [Int], _ count: Int, _ array: inout [[Int]], _ res: [Int], _ index: Int = 0) -> [[Int]] {
		if count == index {
			array.append(res)
			return []
		}
		
		for i in index..<arr.count {
			var temp = res
			temp.append(arr[i])
			combi(arr, count, &array, temp, index + 1)
		}
		
		return array
	}
	
	for col in relation.first!.indices {
		indices.append(col)
	}
	
	for i in relation[0].indices {
		combi(indices, i+1, &array, [])
	}
	
	for i in array {
		var s = Set<[String]>()
		var check = false
		for r in relation {
			var str = [String]()
			for j in i {
				str.append(r[j])
			}
			s.insert(str)
		}
		if s.count == relation.count {
			for j in result {
				check = false
				for k in j {
					if !i.contains(k) {
						check = true
					}
				}
				if !check {
					break
				}
			}
			if check || result.count == 0 {
				result.append(i)
			}
		}
	}
	
	return result.count
}

print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
