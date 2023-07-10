//
//  선택정렬.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/10.
//

import Foundation

/*
 선택 정렬
 1. 데이터 중 가장 작은 값을 찾는다
 2. 찾은 값을 데이터 맨 앞 값과 교체한다
 3. 맨 앞 데이터를 제외하고 위 과정을 반복한다.
 
 시간복잡도 : O(n²)
 */
func SelectionSort(_ arr: inout [Int]) {
    for i in 0..<arr.count-1 {
        var minIdx = i
        for j in (i+1)..<arr.count {
            if arr[minIdx] > arr[j] {
                minIdx = j
            }
        }
        arr.swapAt(i, minIdx)
    }
}
