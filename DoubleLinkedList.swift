//
//  LinkedList.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/28.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

public class DoubleLinkedListNode<T> {
    var value: T
    var next: DoubleLinkedListNode?
    weak var previous: DoubleLinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public class DoubleLinkedList<T> {
    public typealias Node = DoubleLinkedListNode<T>
    fileprivate var head: Node?
    fileprivate var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }

    public var last: Node? {
      return tail
    }
    
    public func append(value: T) {
      let newNode = Node(value: value)
      if let tailNode = tail {
        newNode.previous = tailNode
        tailNode.next = newNode
      }
      else {
        self.head = newNode
      }
        self.tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node? {
        if index >= 0 {
          var node = head
          var i = index
          while node != nil {
            if i == 0 { return node }
            i -= 1
            node = node!.next
          }
        }
        return nil
    }
    
    public func removeAll() {
      head = nil
      tail = nil
    }
    
    public func remove(node: Node) -> T {
      let prev = node.previous
      let next = node.next

      if let prev = prev {
        prev.next = next
      } else {
        head = next
      }
      next?.previous = prev

      if next == nil {
        tail = prev
      }
        
      node.previous = nil
      node.next = nil

      return node.value
    }
}

extension DoubleLinkedList: CustomStringConvertible {
  public var description: String {
    var text = "["
    var node = head
    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil { text += ", " }
    }
    return text + "]"
  }
}

