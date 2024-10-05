//
//  239_SlidingWindowMaximum.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/6.
//

// swift open source package of data structure implementations: https://github.com/apple/swift-collections
import Collections

class Solution_239_SlidingWindowMaximum {
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var left = 0, right = 0
        // Deque，double-ended queue
        var deque = Deque<Int>()
        var res = [Int]()
        // sliding window's right should be slided to the end of nums
        while right < nums.count {
            
            // remove the element at deque which is lesser than right point's element.
            // as they not only the value is lesser, but also slide out earlier, we needn't be aware of them,it'll make scene of performance
            // such as deque is [4,2], and the right point's element is 3, the value of 2 need be remove.
            //  and this operation will occurs at the end of the deque.
            while !deque.isEmpty, deque.last! < nums[right] {
                deque.removeLast()
            }
            // after above if happen or not, we need add the right point's element into the deque
            deque.append(nums[right])
            
            // as the intent of this is a sliding window situation, we need move right with left together at a particular position.
            // and begin to decide the result value into res array.
            // but why is right + 1 >= k?
            // such as [1,2,3,4,5,6] and 3, when right = 2, right point's value is 3, and the sliding window is [1,2,3].
            // we need to begin decide the first value of result. so at this particular situation,right + 1 >= k will work well.
            if right + 1 >= k {
                // as we remove the values which is lesser than, the deque also is a monotonic queue
                // so deque.first is the maximum of this sliding window
                res.append(deque.first!)
                // as we need to slide to next, we should remove the first value(also the maximum) at deque, if the value is equal to the slide out value
                if nums[left] == deque.first {
                    deque.removeFirst()
                }
                left = left + 1
            }
            right = right + 1
        }
        return res
    }
    
//    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        guard nums.count > 0 && k > 0  else {
//            return []
//        }
//        
//        // if k > nums.count
//        
//        var queue = [Int]()
//        var res = [Int]()
//        
//        // initial queue
//        for i in 0..<k {
//            let ele = nums[i]
//            if queue.count == 0 {
//                queue.append(ele)
//            }else {
//                while queue.last != nil && queue.last! < ele {
//                    queue.removeLast()
//                }
//                queue.append(ele)
//            }
//        }
//        res.append(queue.first!)
//        
//        //move
//        for j in k..<nums.count {
//            let ele = nums[j]
//            
//            if queue.count == 0 {
//                queue.append(ele)
//            }else {
//                let k3 = nums[j - k]
//                if k3 == queue.first {
//                    queue.removeFirst()
//                }
//                
//                while queue.last != nil && queue.last! < ele {
//                    queue.removeLast()
//                }
//                queue.append(ele)
//            }
//            res.append(queue.first!)
//        }
//        
//        return res
//    }
}
