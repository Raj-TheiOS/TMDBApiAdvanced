//
//  ViewPreparable.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import Foundation

/// Providing a prepare method on load of any UI
internal protocol ViewPreparable {
    // Use this method configure UI on load
    func prepareView()
}
