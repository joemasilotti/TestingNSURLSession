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
}
