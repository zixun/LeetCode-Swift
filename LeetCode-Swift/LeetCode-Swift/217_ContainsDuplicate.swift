//
//  217_ContainsDuplicate.swift
//  LeetCode-Swift:https://leetcode.com/problems/contains-duplicate/description/
//
//  Created by zixun on 2024/9/16.
//


class Solution_ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var temp = [Int:Bool]()
        
        for i in 0..<nums.count {
            let ele = nums[i]
            if temp[ele] == true {
                return true
            }else {
                temp[ele] = true
            }
        }
        return false
    }
}
