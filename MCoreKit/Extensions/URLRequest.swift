//
//  URLRequest.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import Foundation

/// Adding utility methods to URLRequest
public extension URLRequest {

    /// Get the URLComponents for a request
    var urlComponents: URLComponents? {
        if let url = url {
            return URLComponents(url: url, resolvingAgainstBaseURL: false)
        }
        return nil
    }

    /// Easily get or set the query string part for a request
    var queryString: String? {
        get {
            return urlComponents?.percentEncodedQuery
        }

        set(value) {
            if var urlComponents = urlComponents {
                urlComponents.percentEncodedQuery = value
                self.url = urlComponents.url
            }
        }
    }
}
