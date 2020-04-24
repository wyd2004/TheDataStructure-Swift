//
//  MergeSort.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/1.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
func merge(left:[Int],right:[Int]) -> [Int] {
    var mergedList = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }
 
    return mergedList + left + right
}
 
func mergeSort(list:[Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }
    
    let leftList = Array(list[0..<list.count/2])
    let rightList = Array(list[list.count/2..<list.count])
    
    return merge(left: mergeSort(list:leftList), right: mergeSort(list:rightList))
}
*///效率不高

func mergeSort(_ nums: [Int]) -> [Int] {
       if nums.count <= 1 {
           return nums
       }
       let mid: Int = Int(nums.count/2)
       
       let left = mergeSort(Array(nums[0..<mid]))
       let right = mergeSort(Array(nums[mid..<nums.count]))
       return merge(left, right)
   }

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var temp = Array<Int>()
    var i = 0
    var j = 0
    while i < left.count || j < right.count {
        if j == right.count || i < left.count && left[i] > right[j] {
            temp.append(left[i])
            i = i + 1
        } else {
            temp.append(right[j])
            j = j + 1
        }
    }
    return temp
}

