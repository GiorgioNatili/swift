//
//  GroceryItem.swift
//  GroceryDataImages
//
//  Created by Giorgio Natili on 11/14/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class GroceryItem: NSObject {

    var name:String
    var category:Int
    
    private let categories:[String] = ["vegetables", "meat", "wine"]
    
    override init(){
        
        self.name = ""
        self.category = Int(arc4random_uniform(3))
        
    }
    
    func categoryIcon() -> String {
        
        return categories[category]
        
    }
    
}
