//
//  1_TwoSum.swift
//  LeetCode-Swift
//
//  Created by zixun on 2024/9/16.
//

/*
 This is Elon,an iOS developer from China,I‘m learning and practicing my English. So I recorded this video in English.
 On the one hand, I can learn algorithms. On the other hand, I can practice my English.
 If you are also a Chinese developer, and learning English, I hope my video can be a little bit helpful for your learning.
 If you are from an English-speaking country, I hope to get some advice from you.
 Well, without further ado, let's move on to today's LeetCode problem. Today's topic is problem one named Two Sum.
 As we can see, it given us an array of integers named nums and an interger named target, and it wants to return the indices of
 the two numbers such that they can add up to be target.
 then, it gives us three examples.From example one, we can see there are two inputs,the one is named nums, it's content is an array which contains 4 elements, they are two,seven,eleven and fifteen, and another is named target equals to nine.
 And the Output is also be an array,and it contains two element,zero and one.Because adding elements with indeces of zero and one
 is equal to the target of nine.
 So,to solve this problem, we can use a map, in swift,it will be Dictionary, it will be very useful and efficient.
 we can loop the array of nums, put them to the map, and at the same time, we can try to let target minus the element which will be put to the map, if the result is in the map,then we will find the expected result.
*/

class Solution_TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count >= 2 else {
            return []
        }
        var map = [Int:Int]()
        for (i,item) in nums.enumerated(){
            let key = target - item
            if map[key] != nil {
                return [map[key]!, i]
            }else {
                map[item] = i
            }
        }
        return []
    }
}
