//
//  Genre.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

/// Defines the type of Movie returned from the API
struct Genre {

    // Primitive attributes
    let id: Int
    let name: String?
}

/// Implementation of Decodable
extension Genre: Model { }
