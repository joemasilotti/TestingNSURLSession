//
//  NSURLSession+MainQueue.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/27/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

extension NSURLSession {
    static func defaultSession() -> NSURLSession {
        return NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
    }
}
