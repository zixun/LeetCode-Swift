//
//  56_MergeIntervals.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/4.
//

class Solution_56_MergeIntervals {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        //initial check
        guard intervals.count >= 2 else {
            return intervals
        }
        var intervals = intervals
        //Sorting
        intervals.sort { cur, next in
            return cur.first! < next.first!
        }
        
        //Merging
        var result = [[Int]]()
        result.append(intervals.removeFirst())
        intervals.forEach { interval in
            var resLast = result.last!
            // be aware of it
            // "<=" for [1,4] [4,5]
            // and [1,3] [2,6] 2 must be lesser than 3 (one is first,the other is last)
            if interval.first! <= resLast.last! {
                if interval.last! > resLast.last! {
                    resLast[1] = interval.last!
                    result.removeLast()
                    result.append(resLast)
                }
            }else {
                result.append(interval)
            }
        }
        return result
    }
}
