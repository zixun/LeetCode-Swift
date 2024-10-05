//
//  933_NumberofRecentCalls.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/5.
//

class Solution_933_NumberofRecentCalls {
    var queue = [Int]()
    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        queue.append(t)
        while (queue.first! < (t - 3000)) {
            queue.removeFirst()
        }
        return queue.count
    }
}
