//
//  main.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/05.
//

import Foundation

//MARK: - Queue
//var queue = Queue<Int>()
//
//for i in 1...100 {
//    queue.enqueue(i)
//}
//
//for _ in 1...100 {
//    print(queue.dequeue())
//}


//MARK: - Stack
//var stack = Stack<Int>()
//
//for i in 1...10 {
//    stack.push(i)
//}
//
//print(stack)
//
//for _ in 1...10 {
//    print(stack.pop())
//}

//MARK: - Linked List
//var linkedList = LinkedList<Int>()
//
//for i in 1...10 {
//    linkedList.append(data: i)
//}

//MARK: - Doubly LinkedList
var DLink = DoublyLinkedList<Int>()
for i in 1...10 {
    DLink.append(data: i)
}

if let data = DLink.searchNodeFromTail(from: 1)?.data {
    print(data)
} else {
    print("no exist")
}
