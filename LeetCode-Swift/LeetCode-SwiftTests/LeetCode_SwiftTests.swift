//
//  LeetCode_SwiftTests.swift
//  LeetCode-SwiftTests
//
//  Created by zixun on 2024/9/16.
//

import Testing
@testable import LeetCode_Swift

struct LeetCode_SwiftTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let res = Solution_TwoSum().twoSum([2,7,11,15], 9)
        #expect(res == [0, 1])
    }

}

extension LeetCode_SwiftTests {
    
    @Test func test_217() async throws {
        let res = Solution_ContainsDuplicate().containsDuplicate([1,2,3,1])
        #expect(res == true)
    }
}
