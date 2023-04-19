//
//  main.swift
//  LV2-60058
//
//  Created by woo0 on 2023/04/20.
//

import Foundation

func solution(_ p:String) -> String {
	let new_p = p.map { String($0) }
	
	func recursion(_ array: [String]) -> String {
		if array == [] {
			return ""
		}
		
		var u = ""
		var v = [String]()
		
		for i in array.indices {
			u += array[i]
			if u.filter({ $0 == "(" }).count == u.filter({ $0 == ")" }).count {
				v = Array(array[i+1..<array.count])
				break
			}
		}
		
		let stack = u.map { String($0) }
		var count = 0
		var check = false
		
		for i in stack.indices {
			if stack[i] == "(" {
				count += 1
			} else if count > 0 {
				count -= 1
			} else {
				check = true
			}
		}
		
		if check {
			var str = "("
			str += recursion(v)
			str += ")"
			u.removeFirst()
			u.removeLast()
			var temp = [String]()
			temp = u.map {
				if $0 == "(" {
					return ")"
				} else {
					return "("
				}
			}
			u = str + temp.joined()
		} else {
			u += recursion(v)
		}
		
		return u
	}
	
	return recursion(new_p)
}

print(solution("()))((()"))
