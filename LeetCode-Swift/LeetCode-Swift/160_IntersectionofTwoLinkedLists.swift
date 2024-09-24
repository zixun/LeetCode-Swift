//
//  160_IntersectionofTwoLinkedLists.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/25.
//

class Solution_160_IntersectionofTwoLinkedLists {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB

        while a !== b {
            a = a?.next
            b = b?.next

            if a == nil && b == nil {
                break
            }

            if a == nil {
                a = headB
            }

            if b == nil {
                b = headA
            }
        }

        return a
    }
}
