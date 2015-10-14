//
//  JokeFetcher.swift
//  TheOtherWay
//
//  Created by Giorgio Natili on 10/13/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JokeFetcher: NSObject {

    private var api:String
    private var joke:String
    
    init(api:String) {
     
        self.api = api
        self.joke = ""
        
    }
    
    func loadData() {
        
        Alamofire.request(.GET, api)
            .responseJSON { request, response, result in
                
                let jsonJoke = JSON(result.value!)
                let value = jsonJoke["value"]
                
                self.joke = String(value["joke"])
                
                let defaultCenter = NSNotificationCenter.defaultCenter()
                defaultCenter.postNotificationName("jokeFetched", object: nil)
                
        }
        
    }
    
    func getJoke() -> String {
        
        return joke
        
    }
    
}
