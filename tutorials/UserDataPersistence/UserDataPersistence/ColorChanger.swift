//
//  ColorChanger.swift
//  UserDataPersistence
//
//  Created by Giorgio Natili on 9/29/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ColorChanger: NSObject {
    
    static func updateUI(view:UIView, colorSelection:Int) {
        
        switch colorSelection {
            
        case 0:
            view.backgroundColor = UIColor.redColor()
            break
            
        case 1:
            view.backgroundColor = UIColor.blueColor()
            break
            
        case 2:
            view.backgroundColor = UIColor.greenColor()
            break
            
        default:
            view.backgroundColor = UIColor.whiteColor()
            break
            
        }
        
    }

}
