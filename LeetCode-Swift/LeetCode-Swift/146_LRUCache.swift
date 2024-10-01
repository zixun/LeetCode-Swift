//
//  146_LRUCache.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/1.
//

class Solution_146_LRUCache {
    
    private class Node {
        var key: Int
        var val: Int
        weak var pre: Node?
        weak var next: Node?
        
        init(key: Int, val: Int, pre: Node? = nil, next: Node? = nil) {
            self.key = key
            self.val = val
            self.pre = pre
            self.next = next
        }
    }
    
    private var header = Node(key: -1, val: -1)
    private var footer = Node(key: -1, val: -1)
    private var map = [Int:Node]()
    private var capacity: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.header.next = self.footer
        self.footer.pre = self.header
    }
    
    func get(_ key: Int) -> Int {
        guard let node = self.map[key] else {
            return -1
        }
        
        self.moveToHeader(node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        var node = self.map[key]
        if node != nil {
            node!.val = value
            self.moveToHeader(node!)
        }else {
            node = Node(key: key, val: value)
            self.putToHeader(node!)
            self.map[key] = node
        }
        if self.map.count > self.capacity {
            self.deleteLast()
        }
    }
    
    
    private func moveToHeader(_ node:Node) {
        self.removeNode(node)
        self.putToHeader(node)
    }
    
    private func putToHeader(_ node:Node) {
        node.pre = self.header
        node.next = self.header.next
        
        self.header.next = node
        node.next?.pre = node
    }
    
    private func removeNode(_ node:Node) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }
    
    private func deleteLast() {
        guard let node = self.footer.pre else {
            return
        }
        
        guard node !== self.header else {
            return
        }
        self.removeNode(node)
        self.map.removeValue(forKey: node.key)
    }
}
