//
//  HTTPClientTests_Part1.swift
//  TestingNSURLSessionTests
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import XCTest

class HTTPClientTests_Part1: XCTestCase {
    var subject: HTTPClient!
    let session = MockURLSession()

    override func setUp() {
        super.setUp()
        subject = HTTPClient(session: session)
    }

    func test_GET_RequestsTheURL() {
        let url = NSURL(string: "http://masilotti.com")!
        subject.get(url) { (_, _) -> Void in }

        XCTAssert(session.lastURL === url)
    }

    func test_GET_StartsTheRequest() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask

        subject.get(NSURL()) { (_, _) -> Void in }

        XCTAssert(dataTask.resumeWasCalled)
    }
}
