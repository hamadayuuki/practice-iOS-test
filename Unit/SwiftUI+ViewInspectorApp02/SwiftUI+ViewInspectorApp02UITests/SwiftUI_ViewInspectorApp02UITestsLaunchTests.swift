//
//  SwiftUI_ViewInspectorApp02UITestsLaunchTests.swift
//  SwiftUI+ViewInspectorApp02UITests
//
//  Created by 濵田　悠樹 on 2022/11/15.
//

import XCTest

final class SwiftUI_ViewInspectorApp02UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
