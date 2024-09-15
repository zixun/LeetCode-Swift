//
//  1_TwoSum.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/16.
//

class Solution_TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count >= 2 else {
            return []
        }
        var map = [Int:Int]()
        for (i,item) in nums.enumerated(){
            let key = target - item
            if map[key] != nil {
                return [map[key]!, i]
            }else {
                map[item] = i
            }
        }
        return []
    }
}
