//
//  이진 탐색.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/11.
//

import Foundation

/*
 이진 탐색 binary search
 탐색할 자료를 둘로 나누어 해당 데이터가 있을 곳을 탐색함
 탐색할 자료가 정렬되어 있을 때만 사용 가능
 
 예를 들어 [1,3,9,13,20,23,29,35] 와 같이 정렬된 배열에서 35를 찾으려고 할 때
 중간 값인 20을 기준으로 값을 비교함. 20 < 35임
 그럼 찾으려는 값은 [23,29,35] 중에 있을 것임
 중간 값인 29를 기준으로 값을 비교함. 29 < 35임
 그럼 찾으려는 값은 [35]중에 있을 것임
 35 = 35임. 찾았음
 
 시간 복잡도 : O(log n)
 */

// 반복문으로 구현
func binarySearch(_ arr: [Int], num: Int) -> Bool {
    var start = 0
    var end = arr.count - 1
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] == num {
            return true
        }
        if arr[mid] > num {
            end = mid - 1
        } else{
            start = mid + 1
        }
    }
    return false
}

// 재귀함수로 구현
func binarySearchWithRecursive(_ arr: [Int], num: Int) -> Bool {
    if arr.count <= 1 { return arr[0] == num }
    
    let mid = (arr.count-1) / 2
    
    if num == arr[mid] { return true }
    let nextArray = num > arr[mid] ? arr[(mid+1)...] : arr[..<mid]
    return binarySearchWithRecursive(Array(nextArray), num: num)
}
