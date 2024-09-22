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
    
    @Test
    func test_94() async throws {
        let root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.left = TreeNode(3)
        
        let solution = Solition_94_BinaryTree_InorderTraversal()
        let result = solution.inorderTraversal(root)
        #expect(result == [1,3,2])
    }
}
