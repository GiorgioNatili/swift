//
//  JokeProvider.swift
//  SimpleJSONLoading
//
//  Created by Giorgio Natili on 9/28/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class JokeProvider: NSObject {

    private var decorator:IDecorate?
    
    init(decorator:IDecorate){
        
        self.decorator = decorator
        
    }
    
    func getJoke() {
        
        Alamofire.request(.GET, "http://api.icndb.com/jokes/random")
            .responseJSON { request, response, result in
                // debugPrint(response)
                
                let jsonJoke = JSON(result.value!)//["value"])
                let value = jsonJoke["value"]
                
                let joke = Joke()
                joke.sentence = String(value["joke"])
                
                let jokeSentence:String = (self.decorator?.format(joke))!
                
                NSNotificationCenter.defaultCenter().postNotificationName("jokeFetched", object: jokeSentence)
                
        }
        
    }
    
}
