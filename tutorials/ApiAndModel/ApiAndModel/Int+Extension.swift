//
//  Int+Extension.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/20/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation

extension Int {
    
    func toBool () ->Bool? {
        
        switch self {
            
        case 0:
            
            return false
            
        case 1:
            
            return true
            
        default:
            
            return nil
            
        }
        
    }
    
}