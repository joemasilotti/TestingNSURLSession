//
//  URLSessionProtocol.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

typealias DataTaskResult = (NSData?, NSURLResponse?, NSError?) -> Void

protocol URLSessionProtocol {
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult) -> NSURLSessionDataTask
}
