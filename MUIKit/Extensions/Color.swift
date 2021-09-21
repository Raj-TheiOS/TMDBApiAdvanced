//
//  Color.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import Foundation

/// Extension for UIColor utility
public extension UIColor {

    /// Convenience initializer for using HEX values
    convenience init(rgba: UInt32) {
        let red   = CGFloat((rgba >> 24) & 0xff) / 255.0
        let green = CGFloat((rgba >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgba >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgba      ) & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
