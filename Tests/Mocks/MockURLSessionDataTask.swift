//
//  MockURLSessionDataTask.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false

    func resume() {
        resumeWasCalled = true
    }
}
