//
//  Coding.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import Foundation

/// Extension to allow deserialization of object from JSON data
extension Data {

    /// Try to deserialize directly from JSON data
    func decode<T: Decodable>(type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(MConfig.Servers.dateFormatter)
        return try decoder.decode(type, from: self)
    }
}
