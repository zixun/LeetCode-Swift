//
//  226_InvertBinaryTree.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/27.
//

class Solution_226_InvertBinaryTree {
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.right = left
        root.left = right
        return root
    }
}
