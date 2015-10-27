//
//  Todo.swift
//  ParseData
//
//  Created by Giorgio Natili on 10/27/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation
import CoreData

@objc (Todo)
class Todo: NSManagedObject {

    // Insert code here to add functionality to your managed object subclass
    
    init(context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Todo", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
    }

    
}
