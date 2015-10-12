//
//  Note+CoreDataProperties.swift
//  WritingPlist
//
//  Created by Marcy Regalado on 10/10/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var noteItem: String?
    @NSManaged var noteDescription: String?

}
