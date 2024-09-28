//
//  7_ReverseInteger.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/28.
//

class Solution_7_ReverseIntegeer {
    
    func reverse(_ x: Int) -> Int {
        var res = 0
        var x = x
        
        while x != 0 {
            // Special note: if x is a nagative number, such as -321，get the remainder of -321 devide by 10, the value is -1
            res = res * 10 + x % 10
            // Attention: we use Int32, not Int
            if res > Int32.max || res < Int32.min {
                return 0
            }

            x = x / 10
        }
        return res
    }
}
