//
//  21_MergeTwoSortedLists.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/10.
//

class Solution_21_MergeTwoSortedLists {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }

        if list2 == nil {
            return list1
        }
        
        if list1?.val ?? 0 <= list2?.val ?? 0 {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        }else {
            list2?.next = mergeTwoLists(list1, list2?.next)
            return list2
        }
    }
    
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        if list1 == nil {
//            return list2
//        }
//        
//        if list2 == nil {
//            return list1
//        }
//        
//        var p1 = list1
//        
//        var p2 = list2
//        
//        let head = ListNode()
//        var curr = head
//        
//        while p1 != nil && p2 != nil {
//            
//            if p1!.val <= p2!.val {
//                curr.next = p1
//                
//                p1 = p1!.next
//                curr = curr.next!
//            }else {
//                curr.next = p2
//                
//                p2 = p2?.next
//                curr = curr.next!
//            }
//        }
//        
//        if p1 != nil {
//            curr.next = p1
//        }else if p2 != nil {
//            curr.next = p2
//        }
//        
//        return head.next
//    }
}
