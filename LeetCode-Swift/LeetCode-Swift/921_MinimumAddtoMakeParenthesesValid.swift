//
//  921_MinimumAddtoMakeParenthesesValid.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/27.
//

class Solution_921_MinimumAddtoMakeParenthesesValid {
    func minAddToMakeValid(_ s: String) -> Int {
        var sc = [Character]()

        for c in s {
            if c == Character("(") {
                sc.append(c)
            }else {
                if let last = sc.last, last == Character("(") {
                    sc.removeLast()
                }else {
                    sc.append(c)
                }
            }
        }
        return sc.count
    }
}
