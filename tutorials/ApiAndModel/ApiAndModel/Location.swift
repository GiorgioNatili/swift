//
//  Location.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/22/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class Location: NSObject {

    var id:String
    var name:String
    var countryCode:String
    var longitude:String
    var latitude:String
    
     init(values: [String]){
        
        id = values[0]
        name = values[1]
        longitude = values[2]
        latitude = values[3]
        countryCode = values[4]
        
    }
    
}
