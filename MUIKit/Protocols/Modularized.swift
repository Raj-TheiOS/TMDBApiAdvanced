//
//  Modularized.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import Foundation

/// To support de-coupling of the app
public protocol Modularized {
    /// Each module of the app can be mapped with a storyboard
    var storyboad: String { get }
}
