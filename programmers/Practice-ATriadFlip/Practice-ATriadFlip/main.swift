//
//  main.swift
//  Practice-ATriadFlip
//
//  Created by woo0 on 2023/02/06.
//

import Foundation

func solution(_ n:Int) -> Int {
	var str = ""
	for i in String(n, radix: 3).reversed() {
		str.append(i)
	}
	
	return Int(str, radix: 3)!
}

print(solution(45))
