//
//  Int+Extension.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/20/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation

extension Int {
    
    func toBool () -> Bool? {
        
        switch true {
            
        case self == 0:
            
            return false
            
        case self == 1:
            
            return true
            
        case self > 1:
            return true
            
        default:
            
            return nil
            
        }
        
    }
    
}