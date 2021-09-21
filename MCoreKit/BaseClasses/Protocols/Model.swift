//
//  Model.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import Foundation

/// Protocol model should atleast be Decodable
public protocol Model: Decodable { }

/// Utility alias to representing json data
public typealias JSON = [String: Any]
