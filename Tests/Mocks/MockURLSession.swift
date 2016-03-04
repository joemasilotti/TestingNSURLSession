//
//  MockURLSession.swift
//  TestingNSURLSessionTests
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation
@testable import TestHost

class MockURLSession: URLSessionProtocol {
    var nextDataTask = MockURLSessionDataTask()
    var nextData: NSData?
    var nextResponse: NSURLResponse?
    var nextError: NSError?

    private (set) var lastURL: NSURL?

    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}
