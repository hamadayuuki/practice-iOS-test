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
    
    // test_マークと数字_正常に実行される() で代わりにテスト可能
    /*
    func test_カードの初期化_正常に実行される() {
        let card = Card(suit: .heart, rank: .three)
        XCTAssertEqual(card.suit, .heart)
        XCTAssertEqual(card.rank, .three)
    }
    
    func test_カードの初期化_正常に実行されない() {
        let card = Card(suit: .heart, rank: .three)
        XCTAssertNotEqual(card.suit, .spade)
        XCTAssertNotEqual(card.rank, .jack)
    }
     */
    
    func test_マークと数字_正常に実行される() {
        let card = Card(suit: .heart, rank: .three)
        XCTAssertEqual(card.notation, "❤️3")
        
        let card2 = Card(suit: .club, rank: .jack)
        XCTAssertEqual(card2.notation, "♣️J")
    }
    
    func test_2枚のカードが同じ_正常に実行される() {
        let card1 = Card(suit: .heart, rank: .ace)
        let card2 = Card(suit: .heart, rank: .two)
        XCTAssertTrue(card1.hasSameSuit(card: card2))   // card1 と card2 の柄が"同じか"判別
        
        let card3 = Card(suit: .heart, rank: .ace)
        let card4 = Card(suit: .club, rank: .two)
        XCTAssertFalse(card3.hasSameSuit(card: card4))   // card3 と card4 の柄が"異なるか"判別
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
