//
//  LinkedList.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/28.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {

    public typealias Node = LinkedListNode<T>
    var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
            
        } else {
            head = newNode
        }
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
    
    public func insert(value : T, at position : Int) {
        let newNode = Node(value: value)
        
        if (position == 0) {
            newNode.next = head
            head = newNode
        }
        else {
            var previous = head
            var current = head
            for _ in 0..<position {
                previous = current
                current = current?.next
            }
            
            newNode.next = previous?.next
            previous?.next = newNode
        }
    }
    
    public func remove(index: Int) {
        if self.head != nil {
            if let node = self.nodeAt(index: index) {
                let preNode = self.nodeAt(index: (index - 1))
                let nextNode = node.next
                preNode?.next = nextNode
            }
        }
    }
}

extension LinkedList: CustomStringConvertible {
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

extension LinkedList {
    public func reverseListInteratively(_ head: Node?) -> Node? {
        if head == nil {
            return nil
        }
        
        var pre : Node?
        var next : Node?
        var cur : Node? = head

        while (cur != nil) {
            next = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = next;
        }
        
        return pre;
    }
}


public func testLinkedList() {
    let dogBreeds = LinkedList<String>()
    dogBreeds.append(value: "Labrador")
    dogBreeds.append(value: "Bulldog")
    dogBreeds.append(value: "Beagle")
    dogBreeds.append(value: "Husky")
    print(dogBreeds)
    let newHead = dogBreeds.reverseListInteratively(dogBreeds.head)
    print(newHead?.next?.value ?? "")
}
