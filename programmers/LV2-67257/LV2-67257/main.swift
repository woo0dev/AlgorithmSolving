//
//  main.swift
//  LV2-67257
//
//  Created by woo0 on 2023/04/22.
//

import Foundation

func solution(_ expression:String) -> Int64 {
	var result: Int64 = 0
	var nums = expression.components(separatedBy: ["-", "+", "*"]).map { String($0) }
	var array = expression.filter { $0 == "-" || $0 == "+" || $0 == "*" }.reversed().map { $0 }
	var index = 1
	var opers = Set(array).map { String($0) }
	var permutaionArray: [[String]] = []
	var dic = [String: Int]()

	func permutaionWithRecursion(_ array: [String], _ count: Int, _ permutationArray: inout [[String]], _ index: Int = 0) {
		if index == count {
			permutationArray.append(Array(array[0..<index]))
			return
		}
		
		var arr = array
		
		for i in index..<arr.count {
			arr.swapAt(index, i)
			permutaionWithRecursion(arr, count, &permutationArray, index + 1)
			arr.swapAt(index, i)
		}
	}
	
	permutaionWithRecursion(opers, opers.count, &permutaionArray)
	
	while array.count > 0 {
		if let _ = dic[String(array.last!)] {
			dic[String(array.last!)]! += 1
		} else {
			dic[String(array.last!)] = 1
		}
		nums.insert(String(array.last!), at: index)
		array.removeLast()
		index += 2
	}
	
	index = -1
	
	for i in permutaionArray.indices {
		var temp_res: Int64 = 0
		var temp_nums = nums
		for j in 0..<3 {
			while index < temp_nums.count {
				index += 1
				if index + 2 < temp_nums.count {
					if temp_nums[index+1] == permutaionArray[i][j] {
						var res = calculate(temp_nums[index], temp_nums[index+2], temp_nums[index+1])
						for _ in 0..<3 { temp_nums.remove(at: index) }
						temp_nums.insert("\(res)", at: index)
						index = -1
					}
				}
			}
			index = -1
		}
		temp_res = abs(Int64(temp_nums.first!)!)
		if result < temp_res {
			result = temp_res
		}
		temp_res = 0
	}
	
	return result
}

func calculate(_ first: String, _ second: String, _ oper: String) -> Int64 {
	if oper == "+" {
		return Int64(first)! + Int64(second)!
	} else if oper == "-" {
		return Int64(first)! - Int64(second)!
	} else {
		return Int64(first)! * Int64(second)!
	}
}

print(solution("100-200*300-500+20"))
