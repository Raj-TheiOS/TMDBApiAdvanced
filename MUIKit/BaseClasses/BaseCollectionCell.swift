//
//  BaseCollectionCell.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import UIKit

/// Base class for UICollectionViewCell
open class BaseCollectionCell: UICollectionViewCell, ViewPreparable {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }

    /// Override point for custom UI setup
    public func prepareView() {
        // Default is a no-op
    }
}
