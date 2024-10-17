//
//  2_AddTwoNumbers.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/17.
//

class Solution_2_AddTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        var val = l1.val + l2.val
        
        if val >= 10 {
            val = val % 10
            if let l1next = l1.next {
                l1next.val += 1
            }else if let l2next = l2.next {
                l2next.val += 1
            }else {
                l1.next = ListNode(1)
            }
        }
        var node = ListNode(val)
        node.next = addTwoNumbers(l1.next, l2.next)
        return node
    }
    
    
}
