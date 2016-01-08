//
//  HTTPClient.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

typealias DataResult = (NSData?, ErrorType?) -> Void

class HTTPClient {
    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = NSURLSession()) {
        self.session = session
    }

    func get(url: NSURL, completion: DataResult) {
        let task = session.dataTaskWithURL(url) { (_, _, _) -> Void in }
        task.resume()
    }
}
