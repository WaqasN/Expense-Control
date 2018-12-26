//
//  DateFormatter+Ext.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

extension DateFormatter {
    static var shared: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        return formatter
    }

    static var short: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        return formatter
    }
}

extension Date {
    var midnight: Date {
        return DateFormatter.shared.date(from: DateFormatter.shared.string(from: self)) ?? self
    }
}
