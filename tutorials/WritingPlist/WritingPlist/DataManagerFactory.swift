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
        
        var manager:ManageListItem
    
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let coreData:Bool = defaults.valueForKey("coredataEnabled") as! Bool
        
        if coreData {
            
            manager = CoreDataManager()
            
        } else {
            
            manager = PlistManager(plist: "grocery_notes")
            
        }

        return manager
    
    }
    
}
