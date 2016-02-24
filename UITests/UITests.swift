//
//  UITests.swift
//  TestingNSURLSessionUITests
//
//  Created by Joe Masilotti on 2/24/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import XCTest

class UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app.launch()
    }

    func test_DisplaysPostCount() {
        let postCountLabel = app.staticTexts["17"]
        waitForElementToAppear(postCountLabel)
    }

    private func waitForElementToAppear(element: XCUIElement, file: String = __FILE__, line: UInt = __LINE__) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)

        waitForExpectationsWithTimeout(5) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }
}
