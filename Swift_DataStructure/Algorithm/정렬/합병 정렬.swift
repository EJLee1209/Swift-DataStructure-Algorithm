//
//  합병 정렬.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/11.
//

import Foundation

/*
 합병 정렬
 합병 정렬 또한 분할 정복 알고리즘 중 하나로
 퀵 정렬과 마찬가지로 재귀 함수를 이용함
 
 1. 배열을 절반으로 잘라 left, right로 나눔 (배열의 길이가 홀수인 경우 3개 & 4개)
 2. 배열의 갯수가 1개 이하일 때까지 위 작업을 재귀 호출
 3. 나눠진 두 배열을 합병 정렬을 이용해 정렬하고 리턴함
 
 ...? 합병 정렬을 이용해 정렬하고 리턴...?
 두 배열(left, right)을 0번 인덱스부터 비교해서
 작은 값부터 나열하는 것을 합병 정렬이라고 함
 
 시간 복잡도 : O(n log n)
 퀵 정렬과 동일, 버블,선택,삽입 정렬보다 좋다
 */

func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    let center = arr.count / 2
    var left = Array(arr[0..<center])
    var right = Array(arr[center...])
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result = [Int]()
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] > right[0] {
                result.append(right.removeFirst())
            } else {
                result.append(left.removeFirst())
            }
        }
        // 왼쪽 요소가 남아있을 때
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        // 오른쪽 요소가 남아있을 때
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        return result
    }
    
    return merge(mergeSort(left), mergeSort(right))
}
