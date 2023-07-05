//
//  LinkedList.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/05.
//

import Foundation

/*
 큐를 배열로 구현할 때 설명 했듯이 배열의 경우 마지막 인덱스가 아닌 요소를
 삭제하거나 삽입할 경우 나머지 요소들을 재배치 해야하는 작업 때문에
 오버헤드(어떤 처리를 하기 위해 들어가는 시간/메모리)가 발생하는 단점이 있음
 
 이러한 단점을 보완한 자료구조가 연결 리스트임
 연결 리스트는 연속되지 않은 메모리에 저장된 데이터(노드)들을 연결시켜 놓은 자료구조임
 서로 다른 노드간 연결을 위해 다음 노드의 주소값을 가지고 있어야 함.
 따라서 노드는 데이터와 다음 노드의 주소값을 가지고 있음
 
 배열처럼 순차적으로 데이터를 보관하는 것이 아닌 각각 떨어진 공간에 존재하는 데이터를 연결시켜 놓은 구조이기 때문에
 중간에 요소를 삽입/삭제 시 재배치로 인한 오버헤드가 발생하지 않음.
 단, 인덱스 접근이 불가하기 때문에 1000번째 데이터에 접근하려면 맨 앞에서 순차적으로 접근해야함.
 그렇기 때문에 접근 속도가 느림.
 */


/*
 Node를 Class로 구현한 이유
 Class는 Reference type이기 때문에 만약 next에 nil이 할당되면(인스턴스 참조 해제)
 ARC에 의해 자동으로 메모리에서 해제가 됨.
 
 만약 Struct로 구현한다면 next에 값을 할당할 경우 동일한 인스턴스를 참조하는 것이 아니라
 값을 복사해서 가지게 됨. 그럼 next에 nil을 할당한다 하더라도 원래의 node값은 next와는 독립적인 존재이기 때문에
 메모리에 남게됨.
 */
class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    func insert(data: T, at index: Int) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        if index == 0 {
            let node = head
            head = Node(data: data)
            head?.next = node
            return 
        }
        
        var node = head
        for _ in 0..<(index-1) {
            if node?.next == nil { break }
            node = node?.next
        }
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
    }
    
    func removeLast() {
        if head == nil { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = nil
    }
    
    func remove(at index: Int) {
        if head == nil { return }
        
        // head를 삭제하는 경우
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var node = head
        for _ in 0..<(index-1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        node?.next = node?.next?.next
        
    }
    
    func searchNode(from data: T?) -> Node<T>? {
        if head == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { break }
            node = node?.next
        }
        return node
    }
}
