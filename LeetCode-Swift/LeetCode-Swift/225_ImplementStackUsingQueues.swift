//
//  225_ImplementStackUsingQueues.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/27.
//

class Solution_225_ImplementStackUsingQueues {
    
    var q1 = [Int]()
    var q2 = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        if !q1.isEmpty {
            q1.append(x)
        }else {
            q2.append(x)
        }
    }
    
    func pop() -> Int {
       
        if !q1.isEmpty {
            
            while q1.count > 1 {
                let e = q1.removeFirst()
                q2.append(e)
            }
            let res = q1.removeFirst()
            return res
            
        }else {
            
            while q2.count > 1 {
                let e = q2.removeFirst()
                q1.append(e)
            }
            let res = q2.removeFirst()
            return res
        }
    }
    
    func top() -> Int {
        
        if !q1.isEmpty {
            
            
            while q1.count > 1 {
                let e = q1.removeFirst()
                q2.append(e)
            }
            let res = q1.removeFirst()
            q2.append(res)
            return res
            
        }else {
            
            
            while q2.count > 1 {
                let e = q2.removeFirst()
                q1.append(e)
            }
            let res = q2.removeFirst()
            q1.append(res)
            return res
        }
    }
    
    func empty() -> Bool {
        return q1.isEmpty && q2.isEmpty
    }
}
