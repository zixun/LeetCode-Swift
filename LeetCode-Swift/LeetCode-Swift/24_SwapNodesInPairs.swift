//
//  24_SwapNodesInPairs.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/14.
//

class Solution_24_SwapNodesInPairs {

    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        let dumm = ListNode()
        dumm.next = head
        
        self.swapSinglePairs(dumm)
        return dumm.next
    }
    
    private func swapSinglePairs(_ head: ListNode?) {
        guard let dumm = head else {
            return
        }
        
        
        guard let curr = dumm.next, let seco = curr.next else {
            return
        }
        
        let next = seco.next
        
        dumm.next = seco
        seco.next = curr
        curr.next = next
        
        // dumm -> curr -> seco -> next
        // dumm -> seco -> curr -> next
        swapSinglePairs(curr)
    }
}
