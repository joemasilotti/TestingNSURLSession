//
//  HTTPClientTests_Part2.swift
//  TestingNSURLSessionTests
//
//  Created by Joe Masilotti on 1/25/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import XCTest

class HTTPClientTests_Part2: XCTestCase {
    var subject: HTTPClient!
    let session = MockURLSession()

    override func setUp() {
        super.setUp()
        subject = HTTPClient(session: session)
    }

    func test_GET_WithResponseData_AndA200StatusCode_ReturnsTheData() {
        let expectedData = "{}".dataUsingEncoding(NSUTF8StringEncoding)
        session.nextData = expectedData
        session.nextResponse = NSHTTPURLResponse(URL: NSURL(), statusCode: 200, HTTPVersion: nil, headerFields: nil)

        var actualData: NSData?
        subject.get(NSURL()) { (data, _) -> Void in
            actualData = data
        }

        XCTAssertEqual(actualData, expectedData)
    }

    func test_GET_WithANetworkError_ReturnsANetworkError() {
        session.nextError = NSError(domain: "error", code: 0, userInfo: nil)

        var error: ErrorType?
        subject.get(NSURL()) { (_, theError) -> Void in
            error = theError
        }

        XCTAssertNotNil(error)
    }

    func test_GET_WithResponseDataAndANetworkError_ReturnsAnError() {
        session.nextData = "{}".dataUsingEncoding(NSUTF8StringEncoding)
        session.nextError = NSError(domain: "error", code: 0, userInfo: nil)

        var error: ErrorType?
        subject.get(NSURL()) { (data, theError) -> Void in
            XCTAssertNil(data)
            error = theError
        }

        XCTAssertNotNil(error)
    }

    func test_GET_WithAStatusCodeLessThan200_ReturnsAnError() {
        session.nextResponse = NSHTTPURLResponse(URL: NSURL(), statusCode: 199, HTTPVersion: nil, headerFields: nil)

        var error: ErrorType?
        subject.get(NSURL()) { (data, theError) -> Void in
            XCTAssertNil(data)
            error = theError
        }

        XCTAssertNotNil(error)
    }

    func test_GET_WithAStatusCodeGreaterThan299_ReturnsAnError() {
        session.nextResponse = NSHTTPURLResponse(URL: NSURL(), statusCode: 300, HTTPVersion: nil, headerFields: nil)

        var error: ErrorType?
        subject.get(NSURL()) { (data, theError) -> Void in
            XCTAssertNil(data)
            error = theError
        }

        XCTAssertNotNil(error)
    }
}
