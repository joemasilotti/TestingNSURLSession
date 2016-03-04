//
//  Configuration.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 2/24/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

struct Config {
    static let urlSession: URLSessionProtocol = UITesting() ? SeededURLSession() : NSURLSession.defaultSession()
}

private func UITesting() -> Bool {
    return NSProcessInfo.processInfo().arguments.contains("UI-TESTING")
}
