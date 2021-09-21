//
//  ModelStore.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import Foundation

/// Protocol for a ModelStore that should have a network service
public protocol ModelStore {
    associatedtype SVC: NetworkService
    var network: SVC { get }
}
