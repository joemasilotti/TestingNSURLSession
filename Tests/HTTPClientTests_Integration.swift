//
//  HTTPClientTests_Integration.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/27/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import XCTest

class HTTPClientTests_Integration: XCTestCase {
    var subject: HTTPClient!

    override func setUp() {
        super.setUp()
        subject = HTTPClient()
    }

    func test_GET_ReturnsData() {
        let url = NSURL(string: "http://masilotti.com")!
        let expectation = expectationWithDescription("Wait for \(url) to load.")
        var data: NSData?

        subject.get(url) { (theData, error) -> Void in
            data = theData
            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(5, handler: nil)
        XCTAssertNotNil(data)
    }
}
