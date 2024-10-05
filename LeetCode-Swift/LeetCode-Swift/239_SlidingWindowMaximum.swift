//
//  239_SlidingWindowMaximum.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/6.
//

import Collections

class Solution_239_SlidingWindowMaximum {
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0  else {
            return []
        }
        
        // if k > nums.count
        
        var queue = [Int]()
        var res = [Int]()
        
        // initial queue
        for i in 0..<k {
            let ele = nums[i]
            if queue.count == 0 {
                queue.append(ele)
            }else {
                while queue.last != nil && queue.last! < ele {
                    queue.removeLast()
                }
                queue.append(ele)
            }
        }
        res.append(queue.first!)
        
        //move
        for j in k..<nums.count {
            let ele = nums[j]
            
            if queue.count == 0 {
                queue.append(ele)
            }else {
                let k3 = nums[j - k]
                if k3 == queue.first {
                    queue.removeFirst()
                }
                
                while queue.last != nil && queue.last! < ele {
                    queue.removeLast()
                }
                queue.append(ele)
            }
            res.append(queue.first!)
        }
        
        return res
    }
}


//import Collections
//class Solution {
//    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        guard nums.count > 1 else { return nums}
//        var res : [Int] = []
//        var deque = Deque<Int>()
//        var left = 0
//        var right = 0
//
//        while right < nums.count {
//            while !deque.isEmpty, deque.last! < nums[right] {
//                deque.removeLast()
//            }
//            deque.append(nums[right])
//
//            if right + 1 >= k{
//                res.append(deque.first!)
//                 if nums[left] == deque[0]{
//                    deque.removeFirst()
//                    }
//                left += 1
//            }
//            right += 1
//        }
//        return res
//    }
//}
