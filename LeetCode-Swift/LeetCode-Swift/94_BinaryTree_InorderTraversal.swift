//
//  94_BinaryTree_InorderTraversal.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/23.
//


public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
}


class Solition_94_BinaryTree_InorderTraversal {
    // func inorderTraversal(_ root: TreeNode?) -> [Int] {
        //     var result = [Int]()
        //     var stack = [TreeNode]()
        //     var cur = root

        //     while(cur != nil || !stack.isEmpty) {
        //         while cur != nil {
        //             stack.append(cur!)
        //             cur = cur?.left
        //         }
        //         cur = stack.removeLast()
        //         result.append(cur!.val)
        //         cur = cur?.right
        //     }
        //     return result
        // }

        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else {
                return [Int]()
            }
            var result = [Int]()
            result += inorderTraversal(root.left)
            result.append(root.val)
            result += inorderTraversal(root.right)
            return result
        }
}
