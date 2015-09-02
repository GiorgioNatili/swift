//
//  Friend.swift
//  HelloCoreData
//
//  Created by Giorgio Natili on 8/24/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import Foundation
import CoreData

@objc(Friend)
class Friend: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var age: NSNumber

}
