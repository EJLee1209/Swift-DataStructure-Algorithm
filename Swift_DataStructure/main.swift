//
//  main.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/05.
//

import Foundation

//MARK: - 자료구조

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
//var DLink = DoublyLinkedList<Int>()
//for i in 1...10 {
//    DLink.append(data: i)
//}
//
//if let data = DLink.searchNodeFromTail(from: 1)?.data {
//    print(data)
//} else {
//    print("no exist")
//}

//MARK: - Binary Search Tree
//let bst = BST<Int>()
//bst.insert(35)
//bst.insert(10)
//bst.insert(40)
//bst.insert(1)
//bst.insert(30)
//bst.insert(8)
//bst.insert(32)
//bst.insert(6)
//bst.insert(9)
//bst.insert(34)
//bst.insert(21)
//bst.insert(27)
//
//bst.drawDiagram()

// Leaf Node를 삭제하는 경우
//print(bst.remove(for: 9))

// 자식 노드가 1개인 노드를 삭제하는 경우
//print(bst.remove(for: 32))
//print(bst.remove(for: 30))

// 자식 노드가 2개인 노드를 삭제하는 경우
//print(bst.remove(from: 10))

//bst.drawDiagram()

//MARK: - 알고리즘

//var arr = [7,10,9,1,3]
//MARK: - 버블 정렬
//bubbleSort(&arr)

//MARK: - 선택 정렬
//SelectionSort(&arr)

//MARK: - 삽입 정렬
//insertionSort(&arr)
//
//print(arr)

//MARK: - 재귀함수
//print(factorialWithRecursive(4)) // 4!

//MARK: - DP
//print(fiboWithDP(4))

//MARK: - 퀵 정렬
print(quickSort([7, 10, 3, 9, 1]))
