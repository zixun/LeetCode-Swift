//
//  19_RemoveNthNodeFromEndofList.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/24.
//

class Solution_19_RemoveNthNodeFromEndofList {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slow = head
        var quick = head

        for i in 0..<n {
            quick = quick?.next
        }

        while quick?.next != nil {
            quick = quick?.next
            slow = slow?.next
        }

        if quick == nil {
            slow = slow?.next
            return slow
        }else {
            slow?.next = slow?.next?.next
            return head
        }
    }
}
