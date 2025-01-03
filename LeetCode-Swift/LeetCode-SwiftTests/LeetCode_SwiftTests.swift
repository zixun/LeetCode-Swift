//
//  LeetCode_SwiftTests.swift
//  LeetCode-SwiftTests
//
//  Created by zixun on 2024/9/16.
//

import Testing
@testable import LeetCode_Swift

struct LeetCode_SwiftTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let res = Solution_TwoSum().twoSum([2,7,11,15], 9)
        #expect(res == [0, 1])
    }

}

extension LeetCode_SwiftTests {
    
    @Test func test_217() async throws {
        let res = Solution_ContainsDuplicate().containsDuplicate([1,2,3,1])
        #expect(res == true)
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_167() async throws {
        let res = Solution_TwoSumII_InputArrayIsSorted().twoSum([2,7,11,15], 9)
        #expect(res == [1,2])
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_234() async throws {
        let nodes = [1,2,3,3,2,1].map { ListNode($0) }
        for i in 0..<nodes.count - 1 {
            nodes[i].next = nodes[i + 1]
        }
        let res = Solution_234_PalindromeLinkedList().isPalindrome(nodes[0])
        #expect(res == true)
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_590() async throws {
        // 创建测试用的 N 叉树
        let root = Node(1)
        let node3 = Node(3)
        let node2 = Node(2)
        let node4 = Node(4)
        let node5 = Node(5)
        root.children = [node3, node2, node4]
        node3.children = [node5]
        let expected = [5,3,2,4,1]
        let result = Solution_590_N_aryTreePostorderTraversal().postorder(root)
        #expect(expected == result)
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_94() async throws {
        let root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.left = TreeNode(3)
        
        let solution = Solition_94_BinaryTree_InorderTraversal()
        let result = solution.inorderTraversal(root)
        #expect(result == [1,3,2])
    }
}

extension LeetCode_SwiftTests {
    
    @Test() func test_19() async throws {
        let solution = Solution_19_RemoveNthNodeFromEndofList()

    // create linklist 1->2->3->4->5
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5

    let result = solution.removeNthFromEnd(node1, 2)

    #expect(result?.val == 1)
    #expect(result?.next?.val == 2)
    #expect(result?.next?.next?.val == 3)
    #expect(result?.next?.next?.next?.val == 5)
    }
}

extension LeetCode_SwiftTests {
    
    @Test() func test_617(){
        let t1 = TreeNode(1)
        t1.left = TreeNode(3)
        t1.right = TreeNode(2)
        
        let t2 = TreeNode(2)
        t2.left = TreeNode(1)
        t2.right = TreeNode(3)
        
        let expectedResult = TreeNode(3)
        expectedResult.left = TreeNode(4)
        expectedResult.right = TreeNode(5)
        let result = Solution_617_MergeTwoBinaryTrees().mergeTrees(t1, t2)
        #expect(result?.val == expectedResult.val)
    }
}

extension LeetCode_SwiftTests {
    
    @Test() func test_160(){
        
        let nodeA1 = ListNode(1)
        let nodeA2 = ListNode(2)
        let nodeA3 = ListNode(3)
        let nodeA4 = ListNode(4)
        let nodeA5 = ListNode(5)
        nodeA1.next = nodeA2
        nodeA2.next = nodeA3
        nodeA3.next = nodeA4
        nodeA4.next = nodeA5

        let nodeB1 = ListNode(6)
        let nodeB2 = ListNode(7)
        let nodeB3 = ListNode(8)
        nodeB1.next = nodeB2
        nodeB2.next = nodeB3

        let intersectionNode = ListNode(9)
        nodeA5.next = intersectionNode
        nodeB3.next = intersectionNode

        let solution = Solution_160_IntersectionofTwoLinkedLists()
        let result = solution.getIntersectionNode(nodeA1, nodeB1)
        #expect(result?.val == 9)
    }
}

extension LeetCode_SwiftTests {
    
    @Test() func test_226(){
        let root = TreeNode(4,
                            TreeNode(2,
                                     TreeNode(1),
                                     TreeNode(3)),
                            TreeNode(7,
                                     TreeNode(6),
                                     TreeNode(9)))
        let invertedRoot = Solution_226_InvertBinaryTree().invertTree(root)
        #expect(invertedRoot?.val == 4)
        #expect(invertedRoot?.left?.val == 7)
        #expect(invertedRoot?.right?.val == 2)
        #expect(invertedRoot?.left?.left?.val == 9)
        #expect(invertedRoot?.left?.right?.val == 6)
        #expect(invertedRoot?.right?.left?.val == 3)
        #expect(invertedRoot?.right?.right?.val == 1)
        
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_9() async throws {
        let solution = Solution_9_PalindromeNumber()
        let res_odd = solution.isPalindrome(12321)
        let res_even = solution.isPalindrome(1221)
        
        #expect(res_odd == true)
        #expect(res_even == true)
    }
}

extension LeetCode_SwiftTests {
    
    @Test()
    func test_7() async throws {
        let solution = Solution_7_ReverseIntegeer()
        let res1 = solution.reverse(-321)
        #expect(res1 == -123)
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_141() async throws {
        // 无环链表测试
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        node1.next = node2
        node2.next = node3
        
        let solution = Solution_141_LinkedListCycle()
        #expect(solution.hasCycle(node1) == false)
        
        // 有环链表测试
        node3.next = node1
        #expect(solution.hasCycle(node1) == true)
    }
}

extension LeetCode_SwiftTests {
    @Test() func test_146() async throws {
        let lRUCache = Solution_146_LRUCache(2) // -1 -- -1
        lRUCache.put(2, 1)                      // -1 -- 2:1 -- -1
        lRUCache.put(1, 1)                      // -1 -- 1:1 -- 2:1 -- -1
        lRUCache.put(2, 3)                      // -1 -- 1:1 -- 2:3 -- -1    -1 -- 2:3 -- 1:1 -- -1
        lRUCache.put(4, 1)                      // -1 -- 4:1 -- 2:3 -- 1:1 -- -1   -1 -- 4:1 -- 2:3 -- -1
        var res = lRUCache.get(1)
        #expect(res == -1)
        res = lRUCache.get(2)
        #expect(res == 3)
        
//       XCTAssertNil(lRUCache.put(3, 3))
//       XCTAssertEqual(lRUCache.get(2), -1)
//       XCTAssertNil(lRUCache.put(4, 4))
//       XCTAssertEqual(lRUCache.get(1), -1)
//       XCTAssertEqual(lRUCache.get(3), 3)
//       XCTAssertEqual(lRUCache.get(4), 4)
    }
}

extension LeetCode_SwiftTests {
    
    @Test() func test_1670() async throws {
        let sol = Solution_1670_DesignFrontMiddleBackQueue()
//        sol.pushFront(1)
//        sol.pushBack(2)
//        sol.pushMiddle(3)
//        sol.pushMiddle(4)
//        
//        // 1432  
//        let ret_4: Int = sol.popFront()
//        #expect(ret_4 == 1)
//        // 432
//        let ret_5: Int = sol.popMiddle()
//        #expect(ret_5 == 3)
//        // 42
//        let ret_6: Int = sol.popMiddle()
//        // 4
//        #expect(ret_6 == 4)
//        let ret_7: Int = sol.popBack()
//        #expect(ret_7 == 2)
//        
//        let ret_8: Int = sol.popFront()
//        #expect(ret_8 == -1)
        
        sol.pushMiddle(3)
        sol.pushFront(6)
        sol.pushMiddle(6)
        sol.pushMiddle(3) // 663
        // 6363
        let r1 = sol.popMiddle()
        #expect(r1 == 3)
        sol.pushMiddle(7)
        let r2 = sol.popMiddle()
        #expect(r2 == 7)
        sol.pushMiddle(8)
    }
}

extension LeetCode_SwiftTests {
    
    @Test()
    func test_56() async throws {
        let solution = Solution_56_MergeIntervals()
        let intervals = [
            [1, 3],
            [2, 6],
            [8, 10],
            [15, 18],
           
        ]
        let mergedIntervals = solution.merge(intervals)
        #expect(mergedIntervals.count == 3)
        #expect(mergedIntervals[0] == [1, 6])
        #expect(mergedIntervals[1] == [8, 10])
        #expect(mergedIntervals[2] == [15, 18])
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_933() async throws {
        let solution = Solution_933_NumberofRecentCalls()
        #expect(solution.ping(1) == 1)
        #expect(solution.ping(100) == 2)
        #expect(solution.ping(3001) == 3)
        #expect(solution.ping(3002) == 3)
    }
}

extension LeetCode_SwiftTests {
    @Test func test_239() async throws {
        let sol = Solution_239_SlidingWindowMaximum()
        let res = sol.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
        #expect(res == [3,3,5,5,6,7])
//        let res = sol.maxSlidingWindow([1,-1], 1)
//        #expect(res == [1,-1])
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_703() async throws {
        //KthLargest  Solution_703_KthLargestElementinaStream
//        let sol = Solution_703_KthLargestElementinaStream(3, [4,5,8,2])
//        #expect(sol.add(3) == 4) //4,5,8,2,3
//        #expect(sol.add(5) == 5)
//        #expect(sol.add(10) == 5)
//        let res = sol.add(9) // 4,5,8,2,3,5,10   
//        
//        #expect(res == 8)
//        #expect(sol.add(4) == 8)
        
        let sol = Solution_703_KthLargestElementinaStream(2, [0])
        var res = sol.add(-1)
        #expect(res == -1)
        
         res = sol.add(1)
        #expect(res == 0)
        
         res = sol.add(-2)
        #expect(res == 0)
        
    }
}

extension LeetCode_SwiftTests {
    @Test func test_14() async throws {
        let sol = Solution_14_LongestCommonPrefix()
        let res = sol.longestCommonPrefix(["flower","flow","flight"])
        #expect(res == "fl")
    }
}

extension LeetCode_SwiftTests {
    @Test func test_20() async throws {
        let sol = Solution_20_ValidParentheses()
        let res = sol.isValid("(){}}{")
        #expect(res == false)
    }
}

extension LeetCode_SwiftTests {
    @Test func test_21() async throws {
        let solution = Solution_21_MergeTwoSortedLists()
               
       // 创建第一个链表：1 -> 2 -> 4
       let l1Node1 = ListNode(1)
       let l1Node2 = ListNode(2)
       let l1Node3 = ListNode(4)
       l1Node1.next = l1Node2
       l1Node2.next = l1Node3
       
       // 创建第二个链表：1 -> 3 -> 4
       let l2Node1 = ListNode(1)
       let l2Node2 = ListNode(3)
       let l2Node3 = ListNode(4)
       l2Node1.next = l2Node2
       l2Node2.next = l2Node3
       
       let mergedList = solution.mergeTwoLists(l1Node1, l2Node1)
       
       // 验证合并后的链表是否正确：1 -> 1 -> 2 -> 3 -> 4 -> 4
        #expect(mergedList?.val == 1)
        #expect(mergedList?.next?.val == 1)
        #expect(mergedList?.next?.next?.val == 2)
        #expect(mergedList?.next?.next?.next?.val == 3)
        #expect(mergedList?.next?.next?.next?.next?.val == 4)
        #expect(mergedList?.next?.next?.next?.next?.next?.val == 4)
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_23() async throws {
        let list1 = ListNode(1, ListNode(4, ListNode(5)))
        let list2 = ListNode(1, ListNode(3, ListNode(4)))
        let list3 = ListNode(2, ListNode(6))
        let sol = Solution_23_MergeKSortedLists()
        let mergedList = sol.mergeKLists([list1,list2,list3])
        
        var resultArray: [Int] = []
        var current = mergedList
        while current != nil {
            resultArray.append(current!.val)
            current = current!.next
        }
        #expect(resultArray == [1, 1, 2, 3, 4, 4, 5, 6])
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_912() async throws {
        let sol = Solution_912_SortAnArray()
        let res = sol.sortArray([3,-1])
        #expect(res == [-1,3])
    }
}

extension LeetCode_SwiftTests {
    
    @Test func test_704() async throws {
        let sol = Solution_704_BinarySearch()
        let res = sol.search([2,5], -1)
        #expect(res == -1)
    }
}

extension LeetCode_SwiftTests {
    @Test func test_50() async throws {
        let sol = Solution_50_Pow_x_n()
        let res = sol.myPow(2, 4)
        #expect(res == 16)
    }
}

extension LeetCode_SwiftTests {
    @Test func test_206() async throws {
        let solution = Solution_206_ReverseLinkedList()
        // 创建链表 1->2->3->4->5
        let node5 = ListNode(5)
        let node4 = ListNode(4)
        node4.next = node5
        let node3 = ListNode(3)
        node3.next = node4
        let node2 = ListNode(2)
        node2.next = node3
        let node1 = ListNode(1)
        node1.next = node2

        let reversedList = solution.reverseList(node1)
        #expect(reversedList?.val == 5)
        #expect(reversedList?.next?.val == 4)
        #expect(reversedList?.next?.next?.val == 3)
        #expect(reversedList?.next?.next?.next?.val == 2)
        #expect(reversedList?.next?.next?.next?.next?.val == 1)
    }
    
    @Test func test_24() async throws {
        let solution = Solution_24_SwapNodesInPairs()
        // 创建链表 1->2->3->4
        let node4 = ListNode(4)
        let node3 = ListNode(3)
        node3.next = node4
        let node2 = ListNode(2)
        node2.next = node3
        let node1 = ListNode(1)
        node1.next = node2

        let swappedList = solution.swapPairs(node1)
        #expect(swappedList?.val == 2)
        #expect(swappedList?.next?.val == 1)
        #expect(swappedList?.next?.next?.val == 4)
        #expect(swappedList?.next?.next?.next?.val == 3)
        #expect(swappedList?.next?.next?.next?.next == nil)
    }
    
    @Test func test_2() async throws {
        let l1 = ListNode(2, ListNode(4, ListNode(3, nil)))
        let l2 = ListNode(5, ListNode(6, ListNode(4, nil)))
        let sol = Solution_2_AddTwoNumbers()
        let res = sol.addTwoNumbers(l1, l2)
        
        #expect(res?.val == 7)
        #expect(res?.next?.val == 0)
        #expect(res?.next?.next?.val == 8)
    }
    
    @Test func test_232() async throws {
        let queue = Solution_232_ImplementQueueUsingStacks()
        queue.push(1)
        queue.push(2)
        
        #expect(queue.peek() == 1)
        #expect(queue.pop() == 1)
        #expect(queue.empty() == false)
        queue.push(3)
        #expect(queue.pop() == 2)
        #expect(queue.pop() == 3)
        #expect(queue.empty() == true)
    }
    
    @Test func test_225() async throws {
        let stack = Solution_225_ImplementStackUsingQueues()
        stack.push(1)
        stack.push(2)
        #expect(stack.top() == 2)
        #expect(stack.pop() == 2)
        #expect(stack.empty() == false)
        stack.push(3)
        #expect(stack.pop() == 3)
        #expect(stack.pop() == 1)
        #expect(stack.empty() == true)
    }
    
    @Test func test_921() async throws {
        let solution = Solution_921_MinimumAddtoMakeParenthesesValid()
        #expect(solution.minAddToMakeValid("())") == 1)
        #expect(solution.minAddToMakeValid("(((") == 3)
        #expect(solution.minAddToMakeValid("()") == 0)
        #expect(solution.minAddToMakeValid("()))(((") == 5)
    }
    
    @Test func test_856() async throws {
        let solution = Solution_856_ScoreofParentheses()
//        #expect(solution.scoreOfParentheses("()") == 1)
//        #expect(solution.scoreOfParentheses("(())") == 2)
//        #expect(solution.scoreOfParentheses("()()") == 2)
        
        #expect(solution.scoreOfParentheses("(()(()))") == 6)
    }
           
}


