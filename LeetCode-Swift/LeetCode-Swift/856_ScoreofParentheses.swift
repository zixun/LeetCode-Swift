//
//  856_ScoreofParentheses.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/30.
//

//    Given a balanced parentheses string s, return the score of the string.
//
//    The score of a balanced parentheses string is based on the following rule:
//
//    "()" has score 1.
//    AB has score A + B, where A and B are balanced parentheses strings.
//    (A) has score 2 * A, where A is a balanced parentheses string.

class Solution_856_ScoreofParentheses {
    
    func scoreOfParentheses(_ s: String) -> Int {
        let arr = Array(s)
        var left_shift = 0
        var res = 0
        for i in 0 ..< arr.count {
            if arr[i] == "(" {
                left_shift += 1
            }else {
                left_shift -= 1
                if arr[i-1] == "(" {
                    res += 1 << left_shift
                }
            }
        }
        return res
    }
}
