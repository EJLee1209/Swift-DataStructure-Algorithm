//
//  동적 계획법.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/11.
//

/*
 동적 계획법 Dynamic Programming(DP)
 
 상향식 접근법으로 가장 작은 부분의 해답을 구한 후
 이를 저장하여 저장한 값을 이용해 상위 문제를 풀어가는 방식
 
 동적 계획의 핵심은 Memoiziation 이라는 기법인데,
 동일한 계산을 반복해야할 때 이전에 계산한 값을 메모리에 저장하여
 반복 수행을 제거하고 프로그램 실행 속도를 빠르게 함
 */

import Foundation

/*
 피보나치 수열에서 n번째 값을 얻기 위한 함수를 재귀 함수로 작성하는 경우
 이렇게 간단하게 구현할 수 있지만, 하나의 결과값을 도출하는데
 중복되는 값(이미 계산했던 값)을 얻기 위해 실행되는 함수가 너무 많음
 이러한 반복적인 연산을 부분 반복 문제(Overlapping Subproblem)이라고 함
 
 fibo(5)
 fibo(4) + fibo(3)
 fibo(4) = fibo(3) + fibo(2)
 fibo(3) = fibo(2) + fibo(1) <-
 fibo(2) = fibo(1) + fibo(0)
 ...
 fibo(3) = fibo(2) + fibo(1) -> 어라 아까 이미 계산하지 않았나?? = Overlapping Subproblem
 ...
 */

// 피보나치 수열을 재귀 함수로 구현
// 위에서 말한 중복되는 반복적인 연산 문제가 발생함
func fibo(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fibo(n-1) + fibo(n-2)
}
 
// 동적 계획법, DP를 이용한 구현
// 메모이제이션, 즉 가장 작은 단위부터 계산하고 저장하고 이를 이용해 큰 단위 값을 도출
// 따라서 동적 계획법에선 작은 단위를 저장할 저장공간이 필요함

// 배열을 생성하고 계산한 값을 저장하고 저장된 값일 경우 배열의 값을 리턴하는 형식으로 코드를 구현했음
// 이렇게 하면 연산의 중복을 막을 수 있음
// 주로 저장을 해두는 메모리를 cache라고 부름
func fiboWithDP(_ n: Int) -> Int {
    var cache: [Int] = [0,1]
    
    for num in 2...n {
        cache.append(cache[num-1] + cache[num-2])
    }
    return cache[n]
}
