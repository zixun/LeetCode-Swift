//
//  703_KthLargestElementinaStream.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/7.
//

class PriorityQueue {
    
    private var queue = Array<Int>()
    
    func add(_ item: Int) {
        self.queue.append(item)
        self.heapifyUp(from: self.queue.count - 1)
    }
    
    func count() -> Int {
        return self.queue.count
    }
    
    func pop() -> Int? {
        
        guard let res = self.queue.first else {
            return nil
        }
        
        guard self.queue.count > 1 else {
            self.queue.removeFirst()
            return res
        }
        
        
        let last = self.queue.removeLast()
        self.queue[0] = last
        
        self.heapifyDown()
        return res
    }
    
    func peek() -> Int? {
        return self.queue.first
    }
    
    private func heapifyDown() {
        var current = 0
        
        while current.leftChild < self.queue.count || current.rightChild < self.queue.count {
            var swapIndex = current.leftChild
            if current.rightChild < self.queue.count && self.queue[current.leftChild] > self.queue[current.rightChild]{
                swapIndex = current.rightChild
            }
            
            if self.queue[current] > self.queue[swapIndex]{
                self.swap(current, swapIndex)
            }
            
            current = swapIndex
        }
    }
    
    private func heapifyUp(from index:Int) {
        var current = index
        var parent = current.parent
        while parent >= 0 && self.queue[parent] > self.queue[current] {
            self.swap(current, parent)
            current = parent
            parent = current.parent
        }
    }
    
    private func swap(_ firstIndex:Int, _ secondIndex:Int) {
        (self.queue[firstIndex], self.queue[secondIndex]) = (self.queue[secondIndex], self.queue[firstIndex])
    }
    
}

/*
 The purpose of this extension is to find node's parent node, left child node or right child node in a heap make by array.
 such as:
            1[0]
      3[1]        4[2]
   6[3]  5[4]  8[5]  9[6]
 6[3] means the at the index of 3, it's value is 6
 */
fileprivate extension Int {
    
    /*
      As we can see, whether it's a left node or right node of it's parent node.
      If we want to find it's parent node, (x - 1) / 2 always make sense.
     */
    var parent: Int {
        return (self - 1) / 2
    }
    
    /*
     As we can see, if we want to find the node's left child node,
     x * 2 + 1 always make sense
     */
    var leftChild: Int {
        return self * 2 + 1
    }
    
    var rightChild: Int {
        return self.leftChild + 1
    }
}

class Solution_703_KthLargestElementinaStream {
    private var queue = PriorityQueue()
    private var limit: Int = 0
    
    init(_ k: Int, _ nums: [Int]) {
        self.limit = k
        for m in nums {
            self.add(m)
        }
    }
    
    func add(_ val: Int) -> Int {
        self.queue.add(val)
        if self.queue.count() > self.limit {
            self.queue.pop()
        }
        return self.queue.peek()!
    }
    
}

//  ------------------------------------------------------------------------------------------

//class KthLargest {
//
//    private var limit: Int = 0
//    private var queue = PriorityQueue<Int>()
//
//    init(_ k: Int, _ nums: [Int]) {
//        self.limit = k
//        for num in nums {
//            self.add(num)
//        }
//    }
//    
//    func add(_ val: Int) -> Int {
//        self.queue.add(val)
//        if self.queue.size > self.limit {
//            self.queue.dequeue()
//        }
//        return self.queue.peek()!
//    }
//}
//
//enum QueueError: Error {
//    case noSuchItem(String)
//}
//
//private extension Int {
//    var leftChild: Int {
//        return 2 * self + 1
//    }
//    
//    var rightChild: Int {
//        return 2 * self + 2
//    }
//    
//    var parent: Int {
//        return (self - 1) / 2
//    }
//}
//
//class PriorityQueue<DataType: Comparable> {
//    // 队列的存储
//    private var queue: Array<DataType>
//    
//    // 当前队列的大小
//    public var size: Int {
//        return self.queue.count
//    }
//    
//    public init() {
//        self.queue = Array<DataType>()
//    }
//    
//    @discardableResult
//      public func add(_ item: DataType) -> Bool {
//        self.queue.append(item)
//        self.heapifyUp(from: self.queue.count - 1)
//        return true
//      }
//
//      @discardableResult
//      public func remove() throws -> DataType {
//        guard self.queue.count > 0 else {
//          throw QueueError.noSuchItem("Attempt to remove item from an empty queue.")
//        }
//        return self.popAndHeapifyDown()
//      }
//
//      public func dequeue() -> DataType? {
//        guard self.queue.count > 0 else {
//          return nil
//        }
//        return self.popAndHeapifyDown()
//      }
//
//      public func peek() -> DataType? {
//        return self.queue.first
//      }
//
//      public func clear() {
//        self.queue.removeAll()
//      }
//
//      /**
//      弹出队列中的第一个元素，并通过将根元素移向队尾的方式恢复最小堆排序。
//      - 返回值: 队列中的第一个元素。
//      */
//      private func popAndHeapifyDown() -> DataType {
//        let firstItem = self.queue[0]
//
//        if self.queue.count == 1 {
//          self.queue.remove(at: 0)
//          return firstItem
//        }
//
//        self.queue[0] = self.queue.remove(at: self.queue.count - 1)
//
//        self.heapifyDown()
//
//        return firstItem
//      }
//
//      /**
//       通过将元素移向队头的方式恢复最小堆排序。
//       - 参数 index: 要移动的元素的索引值。
//       */
//      private func heapifyUp(from index: Int) {
//        var child = index
//        var parent = child.parent
//
//        while parent >= 0 && self.queue[parent] > self.queue[child] {
//          swap(parent, with: child)
//          child = parent
//          parent = child.parent
//        }
//      }
//
//      /**
//       通过将根元素移向队尾的方式恢复队列的最小堆排序。
//       */
//      private func heapifyDown() {
//        var parent = 0
//
//        while true {
//          let leftChild = parent.leftChild
//          if leftChild >= self.queue.count {
//            break
//          }
//
//          let rightChild = parent.rightChild
//          var minChild = leftChild
//          if rightChild < self.queue.count && self.queue[minChild] > self.queue[rightChild] {
//            minChild = rightChild
//          }
//
//          if self.queue[parent] > self.queue[minChild] {
//            self.swap(parent, with: minChild)
//            parent = minChild
//          } else {
//            break
//          }
//        }
//      }
//    
//    private func swap(_ firstIndex: Int, with secondIndex: Int) {
//        let firstItem = self.queue[firstIndex]
//        self.queue[firstIndex] = self.queue[secondIndex]
//        self.queue[secondIndex] = firstItem
//    }
//}
