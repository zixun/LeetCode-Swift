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
