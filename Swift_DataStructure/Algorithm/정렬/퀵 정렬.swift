//
//  퀵 정렬.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/11.
//

import Foundation

/*
 퀵 정렬 Quick Sort
 
 퀵 정렬은 분할 정복 이라는 알고리즘 기법에 속한다.
 
 분할 정복이란?
 문제를 나눌 수 없을 때까지 나누어서 풀고,
 나누어서 푼 문제를 다시 합병하여 답을 얻는 알고리즘
 하향식 접근법으로 일반적으로 재귀 함수로 구현한다
 
 퀵 정렬, 합병 정렬이 모두 분할 정복에 속한다
 
 퀵 정렬 알고리즘
 1. 기준점(pivot)을 정해서 기준점보다 작은 데이터는 왼쪽, 큰 데이터는 오른쪽으로 모음
 2. 위에서 모은 왼쪽, 오른쪽의 개수가 1개 이하가 될 때까지 위 작업을 재귀 호출함
 3. 재귀 함수는 왼쪽 + 기준점 + 오른쪽을 리턴함
 
 시간 복잡도 : O(n log n)
 버블, 선택, 삽입보다 훨씬 빠른 정렬 알고리즘
 */

func quickSort(_ arr: [Int]) -> [Int] {
    guard let pivot = arr.first else { return arr }
    // 고차 함수인 filter를 사용하는 방법
    let left = arr[1...].filter { $0 < pivot } // 기준보다 작은 놈은 왼쪽으로
    let right = arr[1...].filter{ $0 >= pivot } // 기준보다 큰 놈은 오른쪽으로
    
    // 일반적인 for문을 사용하는 방법
//    for i in 1..<arr.count {
//        if arr[i] >= pivot {
//            right.append(arr[i])
//        } else {
//            left.append(arr[i])
//        }
//    }
    
    return quickSort(left) + [pivot] + quickSort(right)
}
