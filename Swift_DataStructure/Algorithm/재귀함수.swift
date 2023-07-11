//
//  재귀함수.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/11.
//

import Foundation

/*
 재귀함수 Recursive Call
 
 내 함수 안에서 내 함수를 호출하는 형태
 보통 재귀 함수는 내가 원하는 결과값을 얻기까지 재귀를 반복함.
 
 재귀 함수를 잘못 사용하면 무한 재귀에 빠질 수 있음
 무한 재귀에 빠지지 않도록 탈출 조건을 명시 해야함
 
 재귀함수는 보통 아래와 같은 형태를 가짐
 
 func recursiveCall(입력) -> 출력 {
    if 입력 <= 일정값 {
        return 일정값 또는 입력값 또는 특정값
    }
    return recursiveCall(입력보다 작은 값)
 }
 */

// num! 을 구하는 함수 구현 방법 2가지

// 재귀를 사용하지 않은 일반적인 반복문으로 구하는 방법
func factorial(_ num: Int) -> Int {
    var result = 1
    for i in 2...num {
        result *= i
    }
    return result
}

// 재귀 함수를 이용한 방법
func factorialWithRecursive(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    
    return num * factorialWithRecursive(num-1)
}
