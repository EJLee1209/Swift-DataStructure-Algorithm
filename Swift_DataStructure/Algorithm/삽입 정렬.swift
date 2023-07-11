//
//  삽입 정렬.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/10.
//

import Foundation

/*
 삽입 정렬
 1. 정렬은 두 번째 요소부터 시작한다
 2. 기준이 되는 index와 인접한 index부터 비교하며 삽입한다
 3. 삽입이 끝나면, 기준 index의 다음 index를 기준으로 잡는다
 
 삽입 정렬을 이론으로 설명하면 위와 같고 솔직히 무슨 말인지 이해가 되지 않는다
 
 내 마음대로 말로 풀어서 설명하자면 이렇다
 1. 처음에 1번째 인덱스를 기준으로 잡아
 2. 기준 인덱스 이전에 있는 값이랑 비교해서 이전 값이 크면 swap하고, 기준 인덱스보다 작은 값을 만날 때까지 반복
 3. 기준 인덱스를 다음 인덱스로 증가시키고, 다시 2번부터 수행
 
 시간복잡도 : O(n²)
 */

func insertionSort(_ arr: inout [Int]) {
    for i in 1..<arr.count {
        for j in stride(from: i, to: 0, by: -1) {
            if arr[j-1] > arr[j] {
                arr.swapAt(j-1, j)
            }else {
                break
            }
        }
    }
}
