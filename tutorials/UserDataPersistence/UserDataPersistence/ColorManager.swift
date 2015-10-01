//
//  ColorManager.swift
//  UserDataPersistence
//
//  Created by Giorgio Natili on 9/29/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ColorManager: NSObject {

    let defaults = NSUserDefaults.standardUserDefaults()
    
    func retrieveColor() -> Int {
        
        var value = 100
        
        if let colorSelection = defaults.valueForKey("userColor") {
            
            value = colorSelection as! Int
            
        }
        
        return  value
        
    }
    
    func saveColor(colorSelection:Int) {
        
        defaults.setInteger(colorSelection, forKey: "userColor")
        
    }
    
}
