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
    
    enum ChangePosition {
        case front
        case middle
        case back
    }
    enum ChangeType {
        case push
        case pop
    }
    
    private var head = Node(val: -1)
    private var foot = Node(val: -1)
    private var midd: Node?
    private var count = 0
    
    init() {
        self.head.next = self.foot
        self.foot.pre = self.head
    }
    
    func pushFront(_ val: Int) {
        let node = Node(val: val)
        self.insert(node, before: self.head.next)
        self.updateMidd(type: .push, position: .front)
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
        self.updateMidd(type: .push, position: .middle)
    }

    func pushBack(_ val: Int) {
        let node = Node(val: val)
        
        self.insert(node, before: self.foot)
        self.updateMidd(type: .push, position: .back)
    }

    func popFront() -> Int {
        
        guard self.count > 0 else {
            return -1
        }
        guard let node = self.head.next else {
            fatalError()
        }
        
        self.delete(node)
        self.updateMidd(type: .pop, position: .front)
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
        self.updateMidd(type: .pop, position: .middle)
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
        self.updateMidd(type: .pop, position: .back)
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
        self.count = self.count + 1
        
    }
    
    private func delete(_ node: Node) {
        let nextNode = node.next
        let preNode = node.pre
        
        preNode?.next = nextNode
        nextNode?.pre = preNode
        
        self.count = self.count - 1
    }
    
    private func updateMidd(type:ChangeType, position:ChangePosition){
        guard self.count > 0 else {
            self.midd = nil
            return
        }
        
        guard self.count > 1 else {
            self.midd = self.head.next
            return
        }
        
        if count % 2 == 0 {
            // From odd to even, in most situation, we just need to move the midd point to it's previous node once, in other words,call midd?.pre
            // such as [6,3,6] to [6,2,3,6] by pushMiddle, midd changed from node 3 to node 2, node 2 is the previous node of ndoe 3
            
            // But there are exceptions. They are popFront and pushBack
            if (type == .pop && position == .front) || (type == .push && position == .back) {
                // For example, [6,3,4,5,7] to [3,4,5,7] by popFront, or [6,3,4,5,7] to [6,3,4,5,7,3] by pushBack.
                // As you can see, the midd point needn't change. so we need to be aware of them, and return them.
                return
            }
            self.midd = self.midd?.pre
        } else {
            // Similar as from odd to even. when we meet the situation of from even to odd. We just need to move the midd point to it's next node once
            // such as [6,2,3,4] to [6,2,3,4,5] by pushBack, midd changed from node 2 to node 3, node 3 is the next node of node 2
            
            // But there are also have exceptions. They are popBack and pushFront
            if (type == .pop && position == .back) || (type == .push && position == .front) {
                // For example, [6,2,3,4] to [6,2,3] by popBack, or [6,2,3,4] to [1,6,2,3,4] by pushFront.
                // We can see, the midd point needn't change.
                return
            }
            self.midd = self.midd?.next
        }
    }
}
