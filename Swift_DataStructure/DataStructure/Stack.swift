//
//  Stack.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/05.
//

import Foundation

// 어차피 배열에 popLast() 메서드가 있어서 굳이 스택을 구현 안해도
// 배열을 스택처럼 사용할 수 있음
struct Stack<T: Comparable> {
    private var stack: [T] = []
    
    var count: Int {
        return stack.count
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
}
