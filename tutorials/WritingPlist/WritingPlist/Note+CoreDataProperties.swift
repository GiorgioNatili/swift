//
//  Note+CoreDataProperties.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/8/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
import UIKit

extension Note {

    @NSManaged var title: String?
    @NSManaged var image: UIImage?

}
