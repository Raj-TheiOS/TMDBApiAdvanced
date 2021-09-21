//
//  RxViewController.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MUIKit
import RxSwift
import NVActivityIndicatorView

/// Reactive Rx base class for UIViewController
class RxViewController: BaseViewController, NVActivityIndicatorViewable {
    ///
    let bag = DisposeBag()
    ///
    //    var viewModel: T!
}

/// Reactive Rx base class for UITableViewController
class RxTableController: BaseTableViewController, NVActivityIndicatorViewable {
    ///
    let bag = DisposeBag()

    override func prepareData() {
        super.prepareData()

        tableView.dataSource = nil
        tableView.delegate = nil
    }
}
