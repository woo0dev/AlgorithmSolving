//
//  main.swift
//  Practice-MakingHamburgers
//
//  Created by woo0 on 2022/11/13.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
	var result = 0
	var ingredients = [Int]()
	
	ingredient.forEach {
		ingredients.append($0)
		if ingredients.count >= 4 {
			let temp = ingredients[(ingredients.count-4)...].map { String($0) }
			if temp.joined() == "1231" {
				result += 1
				ingredients.removeLast()
				ingredients.removeLast()
				ingredients.removeLast()
				ingredients.removeLast()
			}
		}
	}
	
	return result
}

print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))
