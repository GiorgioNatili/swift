//
//  DataManagerFactory.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/8/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class DataManagerFactory: NSObject {

    static func getManager() -> ManageListItem {
    
        var manager:ManageListItem = CoreDataManager()
               
        return manager
    
    }
    
}
