//
//  BaseViewModel.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import Foundation

/// Providing utility for initialization setup of a ViewModel
open class BaseViewModel {

    public init() {
        prepare()
    }

    /// Override this method to provide custom initialization
    open func prepare() {
        // Default is a no-op
    }
}
