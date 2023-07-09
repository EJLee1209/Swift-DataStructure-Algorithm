//
//  Doubly LinkedList.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/06.
//

import Foundation

/*
 양방향 연결 리스트
 
 단방향 연결 리스트의 경우 원하는 데이터를 search 하기 위해서
 head부터 데이터를 찾을 때까지 순회 해야 하기 때문에
 만약 내가 찾고자 하는 데이터가 맨 뒤에 있다면, 모든 노드들을
 head부터 끝까지 순회해야 하는 단점이 있음.
 
 이러한 단점을 보완하기 위한 것이 양방향 연결 리스트
 양방향 연결리스트는 첫번째 노드를 가리키는 head와 마지막 노드를 가리키는 tail을 두고,
 하나의 노드는 그 이전 노드와 그 다음 노드를 모두 연결하여 양방향으로 탐색이 가능하게 하는 것이
 양방향 연결 리스트임.
 */

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
