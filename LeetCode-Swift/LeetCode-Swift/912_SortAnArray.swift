//
//  912_SortAnArray.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/12.
//

class Solution_912_SortAnArray {
    
    func sortArray(_ nums: [Int]) -> [Int] {
        
        return quickSort(nums)
    }
    
}

extension Solution_912_SortAnArray {
    
    private func quickSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        var n = nums
        _quickSort(&n, 0, nums.count - 1)
        return n
    }
    
    private func _quickSort(_ nums: inout [Int], _ left:Int, _ right:Int) {
        if left < right {
            let pivot = _partition(&nums, left, right)
            _quickSort(&nums, left, pivot - 1)
            _quickSort(&nums, pivot + 1, right)
        }
    }
    
    private func _partition(_ nums: inout [Int], _ left:Int, _ right:Int) -> Int {
        let pivot = nums[right]
        var i = left // to make sure the element befor index of i, is less than the pivot
        for j in left..<right {
            if nums[j] < pivot {
                nums.swapAt(i, j)
                i += 1
            }
        }
        nums.swapAt(i, right)
        return i
    }
}
