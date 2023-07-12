//
//  너비 우선 탐색.swift
//  Swift_DataStructure
//
//  Created by 이은재 on 2023/07/12.
//

/*
 너비 우선 탐색(BFS) Breadth-First Search
 인접한 노드들을 우선 탐색하는 방식
 그래프에서 같은 레벨에 있는 노드를 먼저 탐색하고 다음 레벨 노드를 탐색하는 것
 
 시간 복잡도: O(V+E)
 V = 노드 수
 E = 간선 수
 */

import Foundation


func BFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [start]
    
    while !needVisitQueue.isEmpty {
        let node: String = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    
    return visitedQueue
}
