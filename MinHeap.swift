//
//  Heap.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/2.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

class MinHeap {
    var items: [Int] = []
    //Get Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // Return Item From Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    
    public func peek() -> Int? {
      if items.count != 0 {
          return items[0]
      } else {
//          fatalError()
        return nil
      }
    }
    
    public func poll() -> Int? {
      if items.count != 0 {
          let item = items[0]
          items[0] = items[items.count - 1]
          heapifyDown()
          items.removeLast()
          return item
      } else {
          return nil
      }
    }
    
    public func add(_ item: Int) {
      items.append(item)
      heapifyUp()
    }
    
    private func swap(indexOne: Int, indexTwo: Int) {
      let placeholder = items[indexOne]
      items[indexOne] = items[indexTwo]
      items[indexTwo] = placeholder
    }
    
    private func heapifyUp() {
      var index = items.count - 1
      while hasParent(index) && parent(index) > items[index] {
          swap(indexOne: getParentIndex(index), indexTwo: index)
          index = getParentIndex(index)
      }
    }
    
    private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }
            if items[index] < items[smallerChildIndex] {
                break
                
            } else {
                swap(indexOne: index, indexTwo: smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }
}
