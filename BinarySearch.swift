//
//  BinarySearch.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/27.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    var lowerBound = range.lowerBound
    var upperBound = range.upperBound
    while lowerBound < upperBound {
//        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        let midIndex = (upperBound + lowerBound)/2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}


private func test_binarySearch() {
    let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
    let res = binarySearch(numbers, key: 19, range: 0 ..< numbers.count)
    print(res ?? 0)
}
