//
//  JokeDecorator.swift
//  SimpleJSONLoading
//
//  Created by Giorgio Natili on 9/28/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation

class JokeDecorator: NSObject, IDecorate{
    
    private let SALUTATION:String = "Mr. Norris said:"
    
    func format(value: Joke) -> String {
        
        return "\(SALUTATION) \(value.sentence)"
    
    }
    
}
