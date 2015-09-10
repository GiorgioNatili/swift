//
//  GroceryItem.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/9/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import Foundation
import CoreData

class GroceryItem: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var type: String

}
