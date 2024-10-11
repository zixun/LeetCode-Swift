//
//  23_MergeKSortedLists.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/9.
//


/*
 
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

  

 Example 1:

 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 Example 2:

 Input: lists = []
 Output: []
 Example 3:

 Input: lists = [[]]
 Output: []
 
 */

fileprivate extension Int {
    
    var parenet: Int {
        return (self - 1) / 2
    }
    
    var leftChild: Int {
        return self * 2 + 1
    }
    
    var rightChild: Int {
        return self * 2 + 2
    }
}

class Solution_23_MergeKSortedLists {
    
    class PriorityQueue {
        private var queue = Array<ListNode>()
        
        func count() -> Int {
            return self.queue.count
        }
        
        func peek() -> ListNode? {
            return self.queue.first
        }
        
        func add(_ item:ListNode) {
            self.queue.append(item)
            self.heapifyUp(from: self.queue.count - 1)
        }
        
        func pop() -> ListNode?{
            guard let res = self.queue.first else {
                return nil
            }
            
            guard self.queue.count > 1 else {
                self.queue.removeFirst()
                return res
            }
            
            let last = self.queue.removeLast()
            self.queue[0] = last
            
            self.heapifyDown()
            return res
        }
        
        private func heapifyUp(from index: Int) {
            var current = index
            var parenet = current.parenet
            
            while parenet >= 0 && self.queue[parenet].val > self.queue[current].val {
                self.swap(current, parenet)
                current = parenet
                parenet = current.parenet
            }
        }
        
        private func heapifyDown() {
            
            var current = 0
            
            while current.leftChild < self.queue.count {
                var swapIndex = current.leftChild
                if current.rightChild < self.queue.count && self.queue[current.rightChild].val < self.queue[current.leftChild].val {
                    swapIndex = current.rightChild
                }
                
                if self.queue[current].val > self.queue[swapIndex].val {
                    self.swap(current, swapIndex)
                }
                
                current = swapIndex
            }
        }
        
        private func swap(_ firstIndex:Int, _ secondIndex:Int) {
            (self.queue[firstIndex], self.queue[secondIndex])=(self.queue[secondIndex], self.queue[firstIndex])
        }
        
        
        
        
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        guard lists.count > 1 else {
            return lists.first ?? nil
        }
        
        var priorityQueue = PriorityQueue()
        for list in lists {
            if let list = list {
                priorityQueue.add(list)
            }
        }
        
        var head = ListNode()
        var tail = head
        
        while let minNode = priorityQueue.pop() {
            tail.next = minNode
            tail = tail.next!
            if let next = minNode.next {
                priorityQueue.add(next)
            }
        }
        
        return head.next
    }
}
