//
//  20_ValidParentheses.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/10/9.
//

class Solution_20_ValidParentheses {
    func isValid(_ s: String) -> Bool {
        // just need to mapping the close bracket, because the open bracket can be appended immediately.
        let mapping: [Character:Character] = [
            ")":"(",
            "]":"[",
            "}":"{",
        ]

        var stack = [Character]()

        for char in s {
            if char == Character("(") || char == Character("[") || char == Character("{")  {
                // as you know, the open bracket is to be matched,so we can put it in the stack immediataly,and wait for it to be matched
                stack.append(char)
            }else if let openBracket = mapping[char] {
                // in this case, a close bracket is to be matched.
                if stack.isEmpty || openBracket != stack.last! {
                    // so if the stack is empty, nothing can be match, it need return false.
                    // in addition(moreover), if they are not matched, also need return false.
                    return false
                }else {
                    //if they are matched, we need remove the matched open bracket
                    stack.removeLast()
                }
            }
        }
        // if every bracket is matched, it is a valid string
        return stack.isEmpty
    }
}
