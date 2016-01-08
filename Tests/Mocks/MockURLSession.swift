//
//  MockURLSession.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    private (set) var lastURL: NSURL?

    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult) -> NSURLSessionDataTask {
        lastURL = url
        return NSURLSessionDataTask()
    }
}
