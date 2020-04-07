//
//  BinarySearchTree.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/4.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(data: T,
         leftNode: TreeNode? = nil,
         rightNode: TreeNode? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BST<T: Comparable & CustomStringConvertible> {
    private var root: TreeNode<T>?
    
    public func add(_ value: T) -> Void {
        let node = TreeNode(data: value)
        if let root = self.root {
            self.insert(root, node)
        } else {
            self.root = node
        }
    }
    
    private func insert(_ root: TreeNode<T>, _ node: TreeNode<T>) {
        if root.data > node.data {
            if let leftNode = root.leftNode {
                self.insert(leftNode, node)
            } else {
                root.leftNode = node
            }
        } else {
            if let rightNode = root.rightNode {
                self.insert(rightNode, node)
            } else {
                root.rightNode = node
            }
        }
    }
    
    public func printTree() {
        self.inorder(self.root)
    }
    
    func traverse() {
        print("\nPRE-ORDER TRAVERSE")
        self.preorder(self.root)
        print("\n\nIN-ORDER TRAVERSE")
        self.inorder(self.root)
        print("\n\nPOST-ORDER TRAVERSE")
        self.postorder(self.root)
        print("\n")
    }
    
    // LNR : LEFT NODE RIGHT 中序遍历(Inorder Traversal)
    private func inorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        self.inorder(node?.leftNode)
        print("\(node!.data)", terminator: " ")
        self.inorder(node?.rightNode)
    }
    
    // NLR : NODE LEFT RIGHT 前序遍历 Preorder Traversal
    private func preorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        print("\(node!.data)", terminator: " ")
        self.preorder(node?.leftNode)
        self.preorder(node?.rightNode)
    }
    
    // LRN :  LEFT RIGHT NODE 后序遍历(Postorder Traversal)
    private func postorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        self.postorder(node?.leftNode)
        self.postorder(node?.rightNode)
        print("\(node!.data)", terminator: " ")
    }
    //层次遍历
   private func levelOrder(_ root: TreeNode<T>?) {
        var levels = Array<Array<T>>()
        
        func helper( node: TreeNode<T>?, level: Int) {
            if (levels.count == level) {
                levels.append(Array<T>())
            }
            if let val = node?.data  {
                var temp = levels[level]
                temp.append(val)
                levels[level] = temp
            }
            
            if let left = node?.leftNode {
                helper(node: left, level: level + 1)
            }
            if let right = node?.rightNode {
                helper(node: right, level: level + 1)
            }
        }
        
        if root == nil {
            print("root is null")
            return
        }
        helper(node: root, level: 0)
        print(levels)
    }
}

extension BST {
   func search(element: T) {
       self.search(self.root, element)
   }
   
   private func search(_ rootNode: TreeNode<T>?, _ element: T) {
       guard let rootNode = rootNode else {
           print("INVALID NODE : \(element)")
           return
       }
       
       print("ROOT NODE \(rootNode.data)")
       if element > rootNode.data {
           self.search(rootNode.rightNode, element)
       } else if element < rootNode.data {
           self.search(rootNode.leftNode, element)
       } else {
          print("NODE FOUND : \(rootNode.data)")
       }
   }
}

/*
 如果要删除的节点比根 root 的值小，则从左子树中删除 key 节点；
 如果要删除的节点比根 root 的值大，则从右子树中删除 key 节点；
 当 key 和 root 的值相等的时候，则需要删除该节点，这其中又有三种不同的情况：

 当该节点 (root 节点) 的左子树为空时，断开该节点与右子树的连接 (注意保存右子树)，返回该节点的右子树
 当该节点的右子树为空时，断开连接，返回该节点的左子树
 该节点左右子树都不为空时，将该节点右子树中的最小节点替代该元素
 */
extension BST {
    func deleteKey(value: T) {
        root = deleteRec(root, value)
    }
    
    /* A recursive function to insert a new key in BST */
    private func deleteRec(_ root: TreeNode<T>?, _ key: T) -> TreeNode<T>? {
    /* Base Case: If the tree is empty */
        guard let root = root else {
            return nil
        }
        
        if key < root.data {
            root.leftNode = deleteRec(root.leftNode, key)
        } else if key > root.data {
             root.rightNode = deleteRec(root.rightNode, key)
        } else { //key == root.data
            if root.leftNode == nil {
                return root.rightNode
            } else if root.rightNode == nil {
                return root.leftNode
            }
            root.data = (minValue(root.rightNode))!
            root.rightNode = deleteRec(root.rightNode, root.data)
        }
        
        return root;
    }
    
    public func minValue(_ node: TreeNode<T>?) -> T? {
        var tempNode = node
        while let next = tempNode?.leftNode {
            tempNode = next
        }
        return tempNode?.data
    }
}
//高度差
extension BST {
    private func checkHeight(_ root: TreeNode<T>?) -> Int {
        if root == nil {
            return 0
        }
        let leftHeight = checkHeight(root)
        if leftHeight == -1 {
            return -1
        }
        let rightHeight = checkHeight(root)
        if rightHeight == -1 {
            return -1
        }
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight, rightHeight) + 1
    }
    public func isBalanced(root:TreeNode<T>?) -> Bool {
        return checkHeight(root) != -1
    }
}

