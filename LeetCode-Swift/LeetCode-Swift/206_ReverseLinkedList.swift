//
//  206_ReverseLinkedList.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/14.
//

class Solution_206_ReverseLinkedList {
    // recursion
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        guard let current = head else {
//            return nil
//        }
//        
//        guard let next = current.next else {
//            return current
//        }
//        
//        let new_head = reverseList(current.next)
//        next.next = current
//        current.next = nil
//        return new_head
//    }
    
    //non-recursion
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        
        var pre: ListNode? = nil
        
        while head != nil {
            var next = head?.next
            
            head?.next = pre
            
            pre = head
            head = next
        }
        
        return pre
        
    }
}
