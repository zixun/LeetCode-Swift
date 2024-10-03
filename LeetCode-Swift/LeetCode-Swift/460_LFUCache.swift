//
//  460_LFUCache.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/2.
//

class Solution_LFUCache {
    private let capacity: Int
    private var map = [Int : Node]()
    private var freqMap = [Int : DoubleLinkedList]()
    private var minFreq = 1
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        return updateNode(node: node).val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.val = value
            updateNode(node: node)
            return
        }
        
        if map.count >= self.capacity {
            let minList = freqMap[self.minFreq]
            guard let last = minList?.removeLast() else {
                fatalError()
            }
            map[last.key] = nil
            if minList?.isEmpty == true {
                freqMap[self.minFreq] = nil
            }
        }
        
        
        self.minFreq = 1
        let node = Node(key: key, val: value)
        map[key] = node
        let list = freqMap[self.minFreq] ?? DoubleLinkedList()
        list.addFirst(node: node)
        freqMap[self.minFreq] = list
    }
}


private extension Solution_LFUCache {
    @discardableResult
    func updateNode(node: Node) -> Node {
        let curFreq = node.freq
        guard let curList = freqMap[curFreq] else {
            return node
        }
        let newFreq = curFreq + 1

        // 将节点从当前频率的链表中删除
        curList.remove(node: node)
        if curList.isEmpty {
            if self.minFreq == curFreq {
                self.minFreq = newFreq
            }
            freqMap[curFreq] = nil
        }
        
        // 将节点移到更高频率的链表中
        let newList = freqMap[newFreq] ?? DoubleLinkedList()
        node.freq = newFreq
        newList.addFirst(node: node)
        freqMap[newFreq] = newList
        
        return node
    }
    
    
    class Node {
        var key: Int, val: Int, freq = 1
        var prev: Node?
        var next: Node?
        
        init(key: Int = -1, val: Int = -1) {
            self.key = key
            self.val = val
        }
    }
    
    class DoubleLinkedList {
        private var head = Node(), tail = Node()
        
        var isEmpty: Bool {
            return head.next === tail
        }
        
        init() {
            head.next = tail
            tail.prev = head
        }
        
        @discardableResult
        func remove(node: Node) -> Node {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            return node
        }
        
        func removeLast() -> Node? {
            guard let node = tail.prev, node !== head else {
                return nil
            }
            
            return remove(node: node)
        }
        
        func addFirst(node: Node) {
            let second = head.next
            node.next = second
            node.prev = head
            second?.prev = node
            head.next = node
        }
    }
}
