//
//  NSHTTPURLResponse+StatusCode.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/31/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

extension NSHTTPURLResponse {
    convenience init?(statusCode: Int) {
        self.init(URL: NSURL(), statusCode: statusCode, HTTPVersion: nil, headerFields: nil)
    }
}
