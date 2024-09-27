//
//  9_PalindromeNumber.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/28.
//

class Solution_9_PalindromeNumber {
    
    func isPalindrome(_ x: Int) -> Bool {
        // nagative number and zero is not a palindroom
        guard x >= 0 else {
            return false
        }
        
        // single-digit number is a palindroom
        if x < 10 {
            return true
        }
        
        // if a single-digit of a number is zero, then it cann't be a palindroom
        if x % 10 == 0 {
            return false
        }
        
        var x = x
        var reversedNum = 0
        // only need to reverse half of the number
        //  12321  -->   12 123
        while x > reversedNum {
            let pop = x % 10 // get the single-digit of current x
            x = x / 10 // after signle-digit is taken, x must be divided by ten
            
            // add pop number to reversedNum at the single-digit, we need to multiply by 10 for the reversedNum first
            reversedNum = reversedNum * 10 + pop
        }
        
        // if original x is an even number, now just need to equal to reversedNum,
        // but if original x is an odd number, we need to divid by 10 at reversedNum first
        // such as x = 12321 at first, now x = 12, but reversedNum is equal to 123
        if x == reversedNum || x == reversedNum / 10 {
            return true
        }else {
            return false
        }
    }
}
