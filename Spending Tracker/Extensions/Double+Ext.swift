//
//  Double+Ext.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-26.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

extension Double {
    var currencyString: String? {
        return NumberFormatter.currencyFormatter.string(from: NSNumber(value: self))
    }
}
