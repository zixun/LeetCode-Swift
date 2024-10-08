//
//  14_LongestCommonPrefix.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/8.
//

class Solution_14_LongestCommonPrefix {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        guard strs.count > 1 else {
            return strs.first!
        }
        // 1. this will be a common prefix string, althought it is from the first element.
        // we'll take it to be compared with the other strings, and remove elements from the end continually
        // to find the common prefix eventually.
        var common = strs.first!

        // 3. After we get the common prefix between two strings at the step 2.
        // we get the thrid string,and do the same thing of step 2.
        // and the fourth, the fifth. Eventually, we can get the common string of the whole array.
        for str in strs {
            // 2. how to understand this logic.
            // for example: the common is flower, and the str is flow.
            // obviously, "flow" dosen't have the common prefix of "flower", so we need update the common prefix by delete the element at the end
            // then, the common prefix will be "flowe", but "flow" also doesn't have the common prefix of "flowe". do it again, and the common prefix
            // will be "flow", we get the common prefix between two strings.
            while !str.hasPrefix(common) {
                _ = common.popLast()
            }
        }
        return common
    }
}
