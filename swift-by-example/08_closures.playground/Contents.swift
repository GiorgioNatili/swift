//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/************************
 ******* Closures *******
 ************************

 {(parameters) -> type in
 
    // body
 
 }

 ************************/

// Using a closure to order an array
var numbers = [1, 2, 3, 4, 5, 6, 7]
numbers.sorted(by: {(a: Int, b: Int) -> Bool in
    return a > b})

//var reversed = numbers.sorted {(a: Int, b: Int) -> Bool in
//    return a > b;
//}

// Using a closure to filter an array
var oddNumbers = numbers.filter { $0 % 2 == 0 }

// Using a closure to generate a single value from an array
let total = numbers.reduce(0) {(a:Int, b:Int) -> Int in
    return a + b
}
let shortTotal = numbers.reduce(0) { $0 + $1 }

// Using a closure to manipulate the elements in an array
let formattedNumbers = numbers.map { NumberFormatter.localizedString(from: NSNumber(value: $0), number: .decimal) }
print(formattedNumbers)

/*********************
 **** Excercise ******

 Create a function that
 get 2 arrays and a 
 closure and that, using
 the closure, returns an
 the sum of the elements
 of the new array

 ********************/

// Your code here...

