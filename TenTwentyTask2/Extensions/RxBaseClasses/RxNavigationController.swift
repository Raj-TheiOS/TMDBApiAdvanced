//
//  RxNavigationController.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MUIKit
import RxSwift

/// Reactive Rx base class for UINavigationController
class RxNavigationController: UINavigationController {
    ///
    let bag = DisposeBag()
}
