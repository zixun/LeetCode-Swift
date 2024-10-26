//
//  232_ImplementQueueUsingStacks.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/27.
//

class Solution_232_ImplementQueueUsingStacks {
    var s1 = [Int]()
    var s2 = [Int]()
    private var front: Int?

    init() {
        
    }
    
    func push(_ x: Int) {
        while !s2.isEmpty {
            let e = s2.removeLast()
            s1.append(e)
        }
        s1.append(x)
    }
    
    func pop() -> Int {
        while !s1.isEmpty {
            let e = s1.removeLast()
            s2.append(e)
        }
        let res = s2.removeLast()
        return res
    }
    
    func peek() -> Int {
        while !s1.isEmpty {
            let e = s1.removeLast()
            s2.append(e)
        }
        return s2.last!
    }
    
    func empty() -> Bool {
        return s1.isEmpty && s2.isEmpty
    }
}
