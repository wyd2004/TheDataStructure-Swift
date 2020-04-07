//
//  BFS.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/26.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

class Graph {
    static let graph = [
    "a" : ["b", "c"],
    "b" : ["a", "c", "d"],
    "c" : ["a","b", "d","e"],
    "d" : ["b" , "c", "e", "f"],
    "e" : ["c", "d"],
    "f" : ["d"]
    ]
    
    func BFS(_ graph: [String: [String]], _ start: String) -> [String] {
        var queue = Array<String>.init()
        var seen = Array<String>.init()
        
        queue.append(start)
        seen.append(start)
        while queue.count != 0 {
            let vertex = queue.first!
            queue.removeFirst()
            let nodes = Graph.graph[vertex]!
            for node in nodes {
                if !seen.contains(node) {
                    queue.append(node)
                    seen.append(node)
                }
            }
        }
        
        return seen
    }
    
    func DFS(_ grahp: [String: [String]], _ start: String) -> [String] {
        var queue = Array<String>.init()
        var seen = Array<String>.init()
        queue.append(start)
        seen.append(start)
        while queue.count != 0 {
            let vertex = queue.last!
            queue.removeLast()
            let nodes = Graph.graph[vertex]!
            for node in nodes {
                if !seen.contains(node) {
                    queue.append(node)
                    seen.append(node)
                }
            }
        }
        
        return seen
    }
}
