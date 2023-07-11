//
//  완전 탐색.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/11.
//

import Foundation

/*
 완전 탐색 Brute Force
 
 데이터가 담긴 배열을 0번 인덱스부터 마지막 인덱스까지
 순차적으로 비교해서 원하는 데이터를 찾는 방법
 
 시간 복잡도 : O(n)
 */

func sequencial(_ arr: [Int], num: Int) -> Bool {
    for element in arr {
        if num == element {
            return true
        }
    }
    return false
}
