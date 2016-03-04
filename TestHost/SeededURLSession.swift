//
//  SeededURLSession.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 2/24/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

typealias DataCompletion = (NSData?, NSURLResponse?, NSError?) -> Void

class SeededURLSession: NSURLSession {
    override func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        return SeededDataTask(url: url, completion: completionHandler)
    }
}

class SeededDataTask: NSURLSessionDataTask {
    private let url: NSURL
    private let completion: DataCompletion
    private let realSession: URLSessionProtocol = NSURLSession.defaultSession()

    init(url: NSURL, completion: DataCompletion) {
        self.url = url
        self.completion = completion
    }

    override func resume() {
        if let json = NSProcessInfo.processInfo().environment[url.absoluteString] {
            let response = NSHTTPURLResponse(URL: url, statusCode: 200, HTTPVersion: nil, headerFields: nil)
            let data = json.dataUsingEncoding(NSUTF8StringEncoding)
            completion(data, response, nil)
        } else {
            realSession.dataTaskWithURL(url, completionHandler: completion)
        }
    }
}
