//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************
***** Optionals *****
********************/ 

// Optionals and unwrapping
var name:String?
let randomNumber = arc4random_uniform(150)

if randomNumber > 75 {
    
    name = "Giorgio"
    
}

if let username = name {
    
    for var char in username.characters {
        
        print(char)
    }
}

// Force unwrapping
let value:String? = "Test"

print("We got a value \(value)")
print("We got a value and I promise it's not nil \(value!)")
