//
//  main.swift
//  LV2-62048
//
//  Created by woo0 on 2023/04/27.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
	var answer: Int64 = Int64(w * h)
	var max = 0
	
	for i in 1...min(w, h) {
		if w % i == 0 && h % i == 0 {
			max = i
		}
	}
	
	answer -= Int64(w + h - max)

	return answer
}

print(solution(8, 12))
