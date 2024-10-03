//
//  1670_DesignFrontMiddleBackQueue.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/3.
//

class Solution_1670_DesignFrontMiddleBackQueue {
    
    fileprivate class Node {
        var val: Int
        var pre: Node?
        var next: Node?
        
        init(val: Int, pre: Node? = nil, next: Node? = nil) {
            self.val = val
            self.pre = pre
            self.next = next
        }
    }
    
    private var head = Node(val: -1)
    private var foot = Node(val: -1)
    private var midd: Node?
    private var count = 0
    private var mid_position = -1
    
    init() {
        self.head.next = self.foot
        self.foot.pre = self.head
    }
    
    func pushFront(_ val: Int) {
        let node = Node(val: val)
        
        self.insert(node, before: self.head.next)
        self.count = self.count + 1
        self.updateMidd()
    }
    
    func pushMiddle(_ val: Int) {
        let node = Node(val: val)
        
        
        
        var beforeNode:Node? = self.foot
        if self.midd != nil {
            if self.count % 2 == 0 {
                beforeNode = self.midd?.next // [1, 2, -3-, 4, 5, 6]
            }else {
                beforeNode = self.midd       // [1, 2, -3-, 4, 5]
            }
        }
        
        self.insert(node, before: beforeNode)
        self.count = self.count + 1
        self.updateMidd()
    }

    func pushBack(_ val: Int) {
        let node = Node(val: val)
        
        self.insert(node, before: self.foot)
        self.count = self.count + 1
        self.updateMidd()
    }

    func popFront() -> Int {
        
        guard self.count > 0 else {
            return -1
        }
        guard let node = self.head.next else {
            fatalError()
        }
        
        self.delete(node)
        self.count = self.count - 1
        self.updateMidd()
        return node.val
    }
    
    func popMiddle() -> Int {
        guard self.count > 0 else {
            return -1
        }
        
        guard let node = self.midd else {
            fatalError()
        }
        
        self.delete(node)
        self.count = self.count - 1
        self.updateMidd()
        return node.val
    }

    func popBack() -> Int {
        guard self.count > 0 else {
            return -1
        }
        guard let node = self.foot.pre else {
            fatalError()
        }
        
        self.delete(node)
        self.count = self.count - 1
        self.updateMidd()
        return node.val
    }
    
    private func insert(_ node:Node, before nextNode:Node?) {
        guard let nextNode = nextNode, let preNode = nextNode.pre else {
            fatalError()
        }
        
        node.pre = preNode
        node.next = nextNode
        
        preNode.next = node
        nextNode.pre = node
    }
    
    private func delete(_ node: Node) {
        let nextNode = node.next
        let preNode = node.pre
        
        preNode?.next = nextNode
        nextNode?.pre = preNode
    }
    
    private func updateMidd(){
        guard self.count > 0 else {
            self.midd = nil
            self.mid_position = -1
            return
        }
        // self.count = 6            = 0      3   mid_tobe = 3
        // self.count = 5           != 0                               3
        
        // 6363  4                                 1
        // 663
        let mid_tobe = self.count % 2 == 0 ? self.count / 2  - 1:  self.count / 2
        if mid_tobe == 0 {
            self.midd = self.head.next
        }else {
            self.midd = self.head
            for _ in 0...mid_tobe {
                self.midd = self.midd?.next
            }
//            if mid_tobe - self.mid_position == 1 {
//                self.midd = self.midd?.next
//            }else if mid_tobe == -1 {
//                self.midd = self.midd?.pre
//            }
        }
        self.mid_position = mid_tobe
    }
}
