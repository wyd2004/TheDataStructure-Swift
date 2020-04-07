//
//  Stack.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/28.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    mutating func push(_ element: Element) {
      array.append(element)
    }
    
    mutating func pop() -> Element? {
      return array.popLast()
    }
    
    func peek() -> Element? {
      return array.last
    }
    
    var isEmpty: Bool {
      return array.isEmpty
    }

    var count: Int {
      return array.count
    }
}

extension Stack: CustomStringConvertible {
  var description: String {
    let topDivider = "---Stack---\n"
    let bottomDivider = "\n-----------\n"
    let stackElements = array.map {"\($0)"}.reversed().joined(separator: "\n")
    return topDivider + stackElements + bottomDivider
  }
}
