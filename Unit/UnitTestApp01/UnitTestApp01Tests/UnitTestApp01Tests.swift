//
//  UnitTestApp01Tests.swift
//  UnitTestApp01Tests
//
//  Created by 濵田　悠樹 on 2022/10/21.
//

/*
 
    テストコードの命名規則
        func test_処理_結果
 
 */

import XCTest
@testable import UnitTestApp01

final class UnitTestApp01Tests: XCTestCase {
    
    func test_カードの初期化_正常に実行される() {
        let card = Card(suit: .heart, rank: .three)
        XCTAssertEqual(card.suit, .heart)
        XCTAssertEqual(card.rank, .three)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
