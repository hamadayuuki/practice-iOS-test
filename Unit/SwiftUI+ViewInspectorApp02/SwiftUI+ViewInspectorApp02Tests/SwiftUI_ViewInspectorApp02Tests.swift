//
//  SwiftUI_ViewInspectorApp02Tests.swift
//  SwiftUI+ViewInspectorApp02Tests
//
//  Created by 濵田　悠樹 on 2022/11/15.
//

import XCTest
import ViewInspector

@testable import SwiftUI_ViewInspectorApp02

extension ContentView: Inspectable { }

final class SwiftUI_ViewInspectorApp02Tests: XCTestCase {
    
    func test_画面に表示されている文字() throws {
        try XCTContext.runActivity(named: "static string") { _ in
            let view = ContentView(viewModel: .init(count: 0))
            let text = try view.inspect().vStack().text(0).string()   // VStackの0番目に配置されている要素
            XCTAssertEqual(text, "Hellow World!")
        }
        
        try XCTContext.runActivity(named: "dynamic string") { _ in
            let view = ContentView(viewModel: .init(count: 0))
            var count = try view.inspect().vStack().text(1).string()   // カウントの初期値
            XCTAssertEqual(count, "0")
            
            try view.inspect().vStack().button(2).tap()
            count = try view.inspect().vStack().text(1).string()
            XCTAssertEqual(count, "1")   // ViewModelを介すことでエラー解消
        }
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
