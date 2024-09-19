//
//  234_PalindromeLinkedList.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/18.
//


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution_234_PalindromeLinkedList {
    
        var frontPointer: ListNode?

        func isPalindrome(_ head: ListNode?) -> Bool {
            guard head != nil else {
                return false
            }

            frontPointer = head
            
            return checkRecursion(head)
        }

        func checkRecursion(_ node: ListNode?) -> Bool {
            guard node != nil else {
                return true
            }

            guard checkRecursion(node?.next) == true else {
                return false
            }

            guard frontPointer?.val == node?.val else {
                return false
            }

            frontPointer = frontPointer?.next

            return true
        }
    
//    func isPalindrome(_ head: ListNode?) -> Bool {
//        var slow = head
//        var fast = head
//        
//        while fast != nil && fast?.next != nil {
//            fast = fast?.next?.next
//            slow = slow?.next
//        }
//        slow = reversed(slow)
//        fast = head
//        while slow != nil {
//            if slow?.val != fast?.val {
//                return false
//            }
//            slow = slow?.next
//            fast = fast?.next
//        }
//        return true
//    }
//    
//    private func reversed(_ node: ListNode?) -> ListNode? {
//        var cur = node
//        var pre:ListNode? = nil
//        while cur != nil {
//            let next = cur?.next
//            cur?.next = pre
//            pre = cur
//            cur = next
//        }
//        return pre
//        
//    }
}
