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
    let postCount = "33"

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app.launchArguments += ["UI-TESTING"]
        app.launchEnvironment["http://masilotti.com/api/posts.json"] = "{\"posts\": \(postCount)}"
        app.launch()
    }

    func test_DisplaysPostCount() {
        let postCountLabel = app.staticTexts[postCount]
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
