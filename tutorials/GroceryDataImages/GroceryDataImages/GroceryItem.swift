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
    
    convenience init(context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("GroceryItem", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)

        
    }
    
   
    func categoryIcon() -> String {
        
        return categories[Int(category!)]
        
    }
    
}
