//
//  141_LinkedListCycle.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/1.
//

class Solution_141_LinkedListCycle {
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next // this little trick works well

        while (slow != nil && fast != nil) {
            if slow === fast { // as the little trick, we needn't consider about the initial situation
                return true
            }

            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}
