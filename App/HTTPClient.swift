//
//  HTTPClient.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 1/8/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import Foundation

class HTTPClient {
    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = NSURLSession()) {
        self.session = session
    }

}
