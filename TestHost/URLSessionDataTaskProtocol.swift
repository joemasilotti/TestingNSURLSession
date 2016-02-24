//
//  URLSessionDataTaskProtocol.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension NSURLSessionDataTask: URLSessionDataTaskProtocol { }
