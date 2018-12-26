//
//  DataManager.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-12-15.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var transactions: [Transaction] = []
    
    private init() {
        updateTransactions()
    }
    
    func updateTransactions(completion: (() -> Void)? = nil) {
        guard let txns = Transaction.fetchAll() else {
            print("Failed to fetch transactions")
            return
        }
        
        transactions = txns
        completion?()
    }
}
