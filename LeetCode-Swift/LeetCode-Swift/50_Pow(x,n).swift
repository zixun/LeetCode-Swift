//
//  50_Pow(x,n).swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/13.
//

class Solution_50_Pow_x_n {
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        guard n != 0 else {
            return 1
        }
        
        guard n != 1 else {
            return x
        }
        
        guard n > 0 else {
            return  1 / myPow(x, -n)
        }
        
        // don't be myPow(x, n / 2) * myPow(x, n / 2)
        var res = myPow(x, n / 2)
        res = res * res
        
        if n % 2 != 0 {
            return res * x
        }else {
            return res
        }
            
    }
}
