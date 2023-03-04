//
//  CalculationNumberTests.swift
//  UnitTestApp01Tests
//
//  Created by 濵田　悠樹 on 2023/03/04.
//

import XCTest
@testable import UnitTestApp01   // テスト対象のモジュールを指定, テスト対象のCalculationNumberクラスはUnitTestApp01モジュールと依存関係にあるので、今回はモジュールダ名がフォルダ名と同様になる

final class CalculationNumberTests: XCTestCase {
    func test_足し算_成功() {
        let calculationNumber = CalculationNumber()   // 足し算を行うためにインスタンス化
        let answer = calculationNumber.Add(a: 10, b: 20)   // 足し算, answer = 30
        XCTAssertEqual(answer, 30)   // answer と 30 が等しいかテスト
    }
}
