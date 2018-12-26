//
//  NumberFormatter+Ext.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-26.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.usesGroupingSeparator = true
        formatter.roundingMode = .halfUp
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
