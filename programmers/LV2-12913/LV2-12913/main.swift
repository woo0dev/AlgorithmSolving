//
//  main.swift
//  LV2-12913
//
//  Created by woo0 on 2023/03/20.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
	var new_land = land
	
	for i in 1..<land.count {
		for j in land[i].indices {
			for k in land[i].indices {
				if j == k { continue }
				new_land[i][j] = max(new_land[i][j], new_land[i-1][k] + land[i][j])
			}
		}
	}
	
	return new_land.last!.max()!
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
