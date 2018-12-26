//
//  Account.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

enum Account: String {
    case cash       = "CASH"
    case visa       = "VISA"
    case masterCard = "MASTERCARD"
    case paypal     = "PAYPAL"
    case other      = "OTHER"

    static var all: [Account] {
        return [
            .cash,
            .visa,
            .masterCard,
            .paypal,
            .other
        ]
    }

    var title: String {
        switch self {
        case .cash:
            return "Cash"
        case .visa:
            return "Visa"
        case .masterCard:
            return "Mastercard"
        case .paypal:
            return "Paypal"
        case .other:
            return "Other"
        }
    }

    var image: UIImage {
        switch self {
        case .cash:
            return #imageLiteral(resourceName: "icon-cash")
        case .visa:
            return #imageLiteral(resourceName: "icon-visa")
        case .masterCard:
            return #imageLiteral(resourceName: "icon-mcard")
        case .paypal:
            return #imageLiteral(resourceName: "icon-paypal")
        case .other:
            return #imageLiteral(resourceName: "icon-other")
        }
    }
}
