//
//  ForecastProvider.swift
//  ApiAndModel
//
//  Created by Giorgio Natili on 10/22/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class ForecastProvider: NSObject {

    private let appID = "04d664c7462233089c62aeb2d8991a4e"
    
    init(location:Location){
        
        let api = "http://api.openweathermap.org/data/2.5/weather?q=\(location.name),\(location.countryCode)&appid=\(appID)"

        Alamofire.request(.GET, api)
            .responseJSON { request, response, result in
                
                let forecast = JSON(result.value!)
                let value = forecast["weather"]
                
                
        }

        
        
    }
    
}
