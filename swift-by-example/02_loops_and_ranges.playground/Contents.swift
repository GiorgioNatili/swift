//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************
 ****** While *******
 ********************/

var i = 0
while i < 10 {
    
    print(i)
    i += 1
    
}

/********************
 ****** Repeat ******
 ********************/

var j = 10
repeat {
    
    print(j)
    
} while j < 10

/********************
 ****** Ranges ******
 ********************/

let users = 1...10
let username = "giorgionatili"

/********************
 ****** for *******
 ********************/

// Iterate in a range
for value in users {
    
    print(value)
    
}

// Iterate in a "string"
for value in username.characters {
    
    print(value)
    
}

// Iterate over chars
let chars = username as NSString
for i in ((0 + 1)...chars.length).reversed() {
    
   print(chars.character(at: i))
    
}

// Repeat an operation several times
let tot = username.characters.count
for _ in 0..<tot {
    
    print("Swift is so sweet")
    
}

/*********************
 **** Excercise ******

 Write a program that 
 writes “I will not skip 
 the fundamentals!” N times.
 
 ********************/

// Your code here...

/*********************
 **** Excercise ******

 Print the powers of 2 
 that are less than or 
 equal to N.

 ********************/

// Your code here...

