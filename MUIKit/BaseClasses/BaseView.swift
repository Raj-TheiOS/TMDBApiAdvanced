//
//  BaseView.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//


import UIKit

/// Base UIView class
open class BaseView: UIView, ViewPreparable {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }

    /// Override this method to provide custom UI setup
    open func prepareView() {
        // Default is a no-op
    }

}
