//
//  167_TwoSumII_InputArrayIsSorted.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/16.
//

class Solution_TwoSumII_InputArrayIsSorted {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var begin = 0
        var end = numbers.count - 1
        
        while begin < end {
            let sum = numbers[begin] + numbers[end]
            if sum > target {
                end -= 1
            }else if sum < target {
                begin += 1
            }else {
                return [begin+1,end+1]
            }
        }
        return []
    }
}
