//
//  버블 정렬.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/10.
//

import Foundation

/*
 버블 정렬
 1. 두 인접한 데이터를 비교한다.
 2. 앞에 있는 데이터가 뒤에 있는 데이터보다 크면, 둘의 자리를 바꿔준다
 
 시간복잡도 : O(n²)
 */
func bubbleSort(_ arr: inout [Int]) {
    for i in 1..<arr.count {
        for j in 1...arr.count-i {
            if arr[j-1] > arr[j] {
                arr.swapAt(j-1, j)
            }
        }
    }
}
