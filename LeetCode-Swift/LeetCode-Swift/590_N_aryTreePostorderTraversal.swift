//
//  590._N-aryTreePostorderTraversal.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/21.
//

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution_590_N_aryTreePostorderTraversal {
        //recursion
        func postorder(_ root: Node?) -> [Int] {
            guard let root = root else {
                return []
            }
            return recursion(root)
            
        }

        func recursion(_ node: Node) -> [Int] {
            var res = [Int]()
            for child in node.children {
                let cv = recursion(child)
                res += cv
            }
            //mid
            res.append(node.val)
            return res
        }


        // // loop
        // func postorder(_ root: Node?) -> [Int] {
        //     guard let root = root else {
        //         return []
        //     }
        //     var result = [Int]()
        //     var tem = [root]
        //     while (tem.count > 0) {
        //         //left right mid   -->  mid  right left
        //         let n = tem.removeLast()
        //         result.insert(n.val, at:0)

        //         let children = n.children
        //         for child in children {
        //             tem.append(child)
        //         }
        //     }
        //     return result
        // }
}
