//
//  617_MergeTwoBinaryTrees.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/25.
//

class Solution_617_MergeTwoBinaryTrees {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {

        guard root1 != nil, root2 != nil else {
            return root1 ?? root2
        }

        let node = TreeNode()
        node.val = (root1!.val + root2!.val)

        node.left = mergeTrees(root1!.left, root2!.left)
        node.right = mergeTrees(root1!.right, root2!.right)

        return node
    }
}
