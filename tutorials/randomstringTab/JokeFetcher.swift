//
//  JokeFetcher.swift
//  randomstringTab
//
//  Created by Marcy Regalado on 10/13/15.
//  Copyright © 2015 Marcy Regalado. All rights reserved.
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
                let value = String(jsonJoke["value"]["joke"])
                
                let defaultCenter = NSNotificationCenter.defaultCenter()
                defaultCenter.postNotificationName("jokeFetched", object: value)
        
        }

    }
    
    func getJoke() -> String {
        
        return joke
    }
    
}