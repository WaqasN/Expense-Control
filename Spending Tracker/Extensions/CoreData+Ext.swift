//
//  CoreData+Ext.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit
import CoreData

extension NSPersistentContainer {
    static var main: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }
}

extension NSManagedObject {
    static func create(in context: NSManagedObjectContext = NSPersistentContainer.main.viewContext) -> NSManagedObject? {
        return entity().name.flatMap { NSEntityDescription.insertNewObject(forEntityName: $0, into: context) }
    }
}
