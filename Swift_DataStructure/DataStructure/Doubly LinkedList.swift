//
//  Doubly LinkedList.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/06.
//

import Foundation

class DNode<T> {
    var prev: DNode?
    var data: T?
    var next: DNode?
    
    init(prev: DNode? = nil, data: T? = nil, next: DNode? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

class DoublyLinkedList<T: Equatable> {
    private var head: DNode<T>?
    private var tail: DNode<T>?
    
    func append(data: T?) {
        if head == nil || tail == nil {
            head = DNode(data: data)
            tail = head
            return
        }
        
        let newNode = DNode(prev: tail,data: data)
        tail?.next = newNode
        tail = newNode
    }
    
    func removeLast() {
        if head == nil || tail == nil { return }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = nil
        tail = tail?.prev
    }
    
    // head에서부터 찾을 때 (찾고자 하는 노드가 head와 가까운 경우에 사용)
    func searchNode(from data: T) -> DNode<T>? {
        if head == nil || tail == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { return node }
            node = node?.next
        }
        return nil
    }
    
    // tail에서부터 찾을 때(찾고자 하는 노드가 tail과 가까운 경우에 사용)
    func searchNodeFromTail(from data: T) -> DNode<T>? {
        if head == nil || tail == nil { return nil }
        
        var node = tail
        while node?.prev != nil {
            if node?.data == data { return node }
            node = node?.prev
        }
        return nil
    }
}
