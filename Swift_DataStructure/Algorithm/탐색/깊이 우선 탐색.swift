//
//  깊이 우선 탐색.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/12.
//

/*
 깊이 우선 탐색 DFS (Depth-First Search)
 탐색하려는 노드의 자식 노드부터 우선 탐색하는 방식
 탐색 노드의 인접 노드의 자식 노드들을 모두 탐색하고,
 다시 돌아가서 탐색 노드의 다른 인접 노드 자식들을 모두 탐색하는 방법
 
 시간 복잡도: O(V+E)
 */

import Foundation

func DFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    while !needVisitStack.isEmpty {
        let node = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}
