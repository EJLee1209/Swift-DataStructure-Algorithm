//
//  Queue.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/05.
//

import Foundation

/*
 - dequeue를 구현할 때 생각해야할 것 -
 배열에서 마지막을 제외한 모든 위치의 요소에 삽입/삭제하는 경우 시간 복잡도는 O(n)임
 나머지 요소를 재배치해야하기 때문
 
 따라서 맨 앞 요소를 가리키는 포인터 변수를 두고,
 dequeue를 하면 포인터가 가리키는 요소를 nil로 설정 후 그 다음 요소를 가리키도록 head를 설정
 이렇게 하면 앞으로 당기는 작업을 할 필요가 없으므로 시간 복잡도는 O(1)임
 */
struct Queue<T: Comparable> {
    private var queue: [T?] = [] // 큐
    var head: Int = 0 // 큐의 맨 앞 요소를 가리키는 포인터
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var count: Int {
        return queue.count
    }
    
    var peek: T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        return element
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head+=1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}
