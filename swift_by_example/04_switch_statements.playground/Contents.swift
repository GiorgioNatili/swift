//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************
 ****** Switch ******
 ********************/

let value = 10

switch value {
    
    case 0:
    print("a is equal to 0")
    
    case 1:
    print("a is equal to 1")
    
    default:
    print("a has another value")

}

// Range comparison
var beers = 6

switch beers {
    
    case 1..<2:
    print("You should be happy")
    
    case 3..<4:
    print("You should be VERY happy")
    
    default:
    print("You should be drunk")
    
}

// Tuples comparison
let coordinates = (41.9, 12.5)

switch coordinates {
    
    case (0, 0):
    print("We're at the center of the planet.")

    case (0...90, _):
    print("We're in the Northern hemisphere.")
    
    case (-90...0, _):
    print("We're in the Southern hemisphere.")
    
    default:
    print("The coordinate is invalid.")

}

// A tuple is simply an ordered list of values
var result: (Int, String, Bool)
result = (200, "OK", true)


