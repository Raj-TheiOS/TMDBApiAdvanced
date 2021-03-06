//
//  BaseViewController.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import UIKit

/// Base ViewController providing common functionalities
open class BaseViewController: UIViewController, ViewPreparable, DataPreparable {

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareView()

        prepareBinding()

        prepareData()
    }

    /// Override this method to provide UI setup
    open func prepareView() {
        // Default is a no-op
    }

    /// Override point for Event binding
    open func prepareBinding() {
        // Default is a no-op
    }

    /// Override point to provide Data loading and instance state setup
    open func prepareData() {
        // Default is a no-op
    }

}

extension BaseViewController: Alertable { }
