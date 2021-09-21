//
//  AppModules.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MUIKit

/// List all the modules in the app
enum Module {
    case movies
}

/// List all the storyboards in the app
enum Storyboard: String {
    case main = "Main"
}

/// Mapping modules to respective storyboards
extension Module: Modularized {

    var storyboad: String {
        switch self {
        case .movies:
            return Storyboard.main.rawValue
        }
    }

}
