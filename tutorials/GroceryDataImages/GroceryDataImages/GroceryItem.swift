//
//  GroceryItem.swift
//  GroceryDataImages
//
//  Created by Giorgio Natili on 11/14/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation
import CoreData

@objc(GroceryItem)
class GroceryItem: NSManagedObject {

    private let categories:[String] = ["vegetables", "meat", "wine"]
    
    init(context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("GroceryItem", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = ""
        self.category = NSNumber(unsignedInt: arc4random_uniform(3))
        
    }

    func categoryIcon() -> String {
        
        return categories[Int(category!)]
        
    }
    
}
