//
//  main.swift
//  LV2-135807
//
//  Created by woo0 on 2023/04/30.
//

import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
	var result = 0
	var gcdA = 0
	var gcdB = 0
	var check = true
	
	func gcdm(_ arr: [Int]) -> Int {
		var res = 0
		if arr.count == 1 {
			res = arr[0]
		} else {
			res = gcd(arr[0], arr[1])
			
			if arr.count > 2 {
				for i in 2..<arr.count {
					res = gcd(res, arr[i])
				}
			}
		}
		return res
	}
	
	func gcd(_ a: Int, _ b: Int) -> Int {
		if b == 0 {
			return a
		} else {
			return gcd(b, a % b)
		}
	}
	
	gcdA = gcdm(arrayA)
	gcdB = gcdm(arrayB)
	
	for i in arrayA {
		if i % gcdB == 0 {
			check = false
			break
		}
	}
	
	if check {
		if gcdB > gcdA {
			return gcdB
		} else {
			result = gcdB
		}
	} else {
		check = true
	}
	
	for i in arrayB {
		if i % gcdA == 0 {
			check = false
			break
		}
	}
	
	if check {
		return gcdA
	}
	
	return result
}

print(solution([14, 35, 119], [18, 30, 102]))
