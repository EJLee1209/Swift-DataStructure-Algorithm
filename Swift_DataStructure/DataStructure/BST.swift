//
//  BST.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/09.
//

/*
 Binary Search Tree (BST: 이진 탐색 트리)
 : Node와 Branch를 이용해서, 사이클을 이루지 않도록 구성한 데이터 구조
 
 이진 트리는 자식 노드가 최대 2개인 트리
 이진 탐색 트리는 부모 노드의 데이터보다 작은 값을 자식 노드의 왼쪽에,
 부모 노드의 값보다 큰 값을 자식 노드의 오른쪽에 두는 이진 트리를 말한다
 
 노드의 데이터 값은 유일.
 노드의 데이터 값은 항상 존재
 
 */

import Foundation

class BSTNode<T: Comparable> {
    var data: T
    var left: BSTNode?
    var right: BSTNode?
    
    init(data: T) {
        self.data = data
    }
    
    var isLeafNode: Bool {
        return left == nil && right == nil
    }
}

class BST<T: Comparable> {
    var root: BSTNode<T>?

    // 데이터 추가
    func insert(_ data: T) {
        guard let root = self.root else {
            root = BSTNode(data: data)
            return
        }

        var currentNode = root
        while true {
            if currentNode.data > data {
                guard let left = currentNode.left else {
                    return currentNode.left = BSTNode(data: data)
                }
                currentNode = left
            } else if currentNode.data < data {
                guard let right = currentNode.right else {
                    return currentNode.right = BSTNode(data: data)
                }
                currentNode = right
            } else {
                return
            }
        }
    }

    func search(_ data: T) -> Bool {
        if root == nil { return false }

        var currentNode = root
        while let node = currentNode {
            if node.data == data { return true }

            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return false
    }

    func remove(from data: T) -> Bool {
        guard let root = self.root, root.data != data else { return false }

        // 삭제하려면 탐색을 해야되는데, 삭제하려는 노드와 그 노드의 부모 노드도 알고 있어야 함
        var targetNode: BSTNode? = root
        var targetParentNode = root

        while let node = targetNode {
            if node.data == data { break }
            else if node.data > data {
                targetNode = node.left
            } else {
                targetNode = node.right
            }

            targetParentNode = node
        }
        // 값을 찾지 못함
        guard let targetNode = targetNode else { return false }

        // 1. 리프 노드를 삭제하는 경우
        // -> 삭제하려는 노드의 부모 노드가 해당 노드를 가리키지 않도록 함
        if targetNode.isLeafNode {
            if targetParentNode.data > data {
                targetParentNode.left = nil
            } else {
                targetParentNode.right = nil
            }

            return true
        }
        // 2. 자식 노드가 1개인 노드를 삭제하는 경우
        // -> 삭제하려는 노드의 부모 노드가 해당 노드의 자식 노드를 가리키도록 함
        if targetNode.left != nil && targetNode.right == nil { // 왼쪽 노드가 있음
            if targetParentNode.data > data {
                targetParentNode.left = targetNode.left
            } else {
                targetParentNode.right = targetNode.left
            }
            return true
        }

        if targetNode.left == nil && targetNode.right != nil { // 오른쪽 노드가 있음
            if targetParentNode.data > data {
                targetParentNode.left = targetNode.right
            } else {
                targetParentNode.right = targetNode.right
            }
            return true
        }

        // 3. 자식 노드가 2개인 노드를 삭제하는 경우
        /*
                2가지 방법이 있음
                1. 삭제하려는 노드의 오른쪽 자식 노드에서 가장 작은 노드를 찾아서 삭제하려는 노드의 위치로 이동
                2. 삭제하려는 노드의 왼쪽 자식 노드 중에서 가장 큰 노드를 찾아서 삭제하려는 노드의 위치로 이동

                이 때, 삭제하려는 노드의 자식 노드가 존재하는 경우 따로 처리해줘야 할 로직이 있음.

                1번의 경우를 생각했을 때 왼쪽 노드는 존재할 수 없고(현재 노드가 가장 작은 노드이기 때문)
                오른쪽 노드가 존재할 수 있음.
            */

        guard let rightNode = targetNode.right else { return false }
        
        // 오른쪽 노드가 이미 최소 노드인 경우 (왼쪽 자식이 하나도 없음)
        // 그냥 오른쪽 노드를 삭제하려는 위치로 올리면 됨.
        if rightNode.left == nil {
            if targetParentNode.data > data {
                targetParentNode.left = rightNode
            } else {
                targetParentNode.right = rightNode
            }
            rightNode.left = targetNode.left
            
            return true
        }

        var minNode = rightNode // 삭제하려는 노드의 오른쪽 노드 중 최소 노드
        var minParentNode = rightNode // 최소 노드의 부모 노드

        // 최소 노드 탐색
        while let nextNode = minNode.left {
            minParentNode = minNode
            minNode = nextNode
        }

        if let minChildNode = minNode.right {
            // 최소 노드의 오른쪽 자식 노드가 존재 하는 경우
            minParentNode.left = minChildNode
        } else {
            // 최소 노드는 자식 노드를 가지고 있지 않은 Leaf Node임
            minParentNode.left = nil
        }

        if targetParentNode.data > data {
            targetParentNode.left = minNode
        } else {
            targetParentNode.right = minNode
        }

        minNode.left = targetNode.left
        minNode.right = targetNode.right

        return true
    }
}


//MARK: - Helpers
extension BST {
    func drawDiagram() {
        print(diagram(for: self.root))
    }

    private func diagram(
        for node: BSTNode<T>?,
        _ top: String = "",
        _ root: String = "",
        _ bottom: String = ""
    ) -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
