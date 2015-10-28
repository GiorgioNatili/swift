//
//  Todo+CoreDataProperties.swift
//  ParseData
//
//  Created by Giorgio Natili on 10/27/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var done: NSNumber?
    @NSManaged var note: String?
    @NSManaged var title: String?
    @NSManaged var id: String?
    @NSManaged var dueDate: NSDate?

}
