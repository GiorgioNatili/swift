//
//  PreferenceManager.swift
//  UserDataPersistence
//
//  Created by Giorgio Natili on 9/29/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class PreferenceManager: NSObject {
    
    
    func shouldRotate() -> Bool {
        
        var value = true

        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let rotation = (defaults.valueForKey("rotationEnabled") as? Bool) {
            
            value = rotation
            
        }

        return value
        
    }

}
