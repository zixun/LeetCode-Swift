//
//  704_BinarySearch.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/13.
//

class Solution_704_BinarySearch {
    
    // non-recursion
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        var startIndex = 0
//        var endIndex = nums.count - 1
//        while startIndex <= endIndex {
//            let midIndex = (startIndex + endIndex) / 2
//            
//            if nums[midIndex] == target {
//                return midIndex
//            }else if nums[midIndex] > target {
//                endIndex = midIndex - 1
//            }else if nums[midIndex] < target {
//                startIndex = midIndex + 1
//            }
//        }
//        return -1
//    }
    
    // recursion
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        return binarySearch(nums,0, nums.count - 1, target)

    }

    func binarySearch(_ nums: [Int], _ left: Int, _ right: Int, _ target:Int) -> Int {

        if left > right {
            // because left may be lesser than right, as nums = [2,5], target is -1 which is out of the nums
            return -1
        }

        let mid = (left + right) / 2

        if nums[mid] == target {
            return mid
        }else if nums[mid] > target {
            return binarySearch(nums,left,mid - 1,target)
        }else {
            return binarySearch(nums,mid + 1,right,target)
        }
    }
}
