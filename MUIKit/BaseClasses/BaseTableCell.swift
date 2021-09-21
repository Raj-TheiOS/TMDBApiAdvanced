//
//  BaseTableCell.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import UIKit

// Base class for UITableViewCell
open class BaseTableCell: UITableViewCell, ViewPreparable {

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        prepareView()
    }

    // Override point for custom UI setup
    open func prepareView() {
        // Default is a no-op
    }

}
