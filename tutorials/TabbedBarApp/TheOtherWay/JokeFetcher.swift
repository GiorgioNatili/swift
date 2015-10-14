//
//  JokeFetcher.swift
//  TheOtherWay
//
//  Created by Dmitry Shamis on 10/13/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JokeFetcher: NSObject {
    
    private var api:String
    private var joke:String
    
    init(url:String) {
        
        self.joke = ""
        self.api = url
        
    }
    
    func loadData() {
        Alamofire.request(.GET, api)
            .responseJSON { request, response, result in
                let jokeJSON = JSON(result.value!)
                let value = jokeJSON["value"]
                
                self.joke = String(value)
                
                let defaultCenter = NSNotificationCenter.defaultCenter()
                defaultCenter.postNotificationName( "jokeFetched", object: nil)
                
        }
        
    }
    
    func getJoke() -> String {
        return joke
    }

}
