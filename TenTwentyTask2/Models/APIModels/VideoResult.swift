//
//  VideoResult.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

/// To parse the API result from video list
struct VideoResult {
    let id: Int
    let results: [Video]
}

/// Implementation of Decodable
extension VideoResult: Model { }
