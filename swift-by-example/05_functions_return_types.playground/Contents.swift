//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************
 **** functions *****
 ********************/

// A simple block of code
func sayHello() {
    
    print("Hello Fellas!")

}

sayHello()

// A block of code that can accept an argument
func sayHello(name:String) {
    
    print("Hello \(name), are you a buddy of mine?")
    
}

sayHello("Jonathan")

// A block of code that returns a value
func sum (a:Int, b:Int) -> Int {
    
    return a + b
    
}

let value = sum(2, b: 5)

// External named arguments
func multiply (left l:Int, right r:Int) -> Int {
    
    return l * r
    
}

let num = multiply(left: 3, right: 7)

// Suppressing naming arguments
func multiply (left:Int, _ right:Int) -> Int {
    
    return left * right
    
}

let 🍕s = multiply(2, 7)

// Variadic arguments
func concatenate (chars:Character...) -> String {
    
    var str = ""
    for var char in chars{
        
        str.append(char)
        
    }
    
    return str
    
}

let sequence = concatenate("1", "e", "r", "l")

// In and out arguments
func increase(by amount:Int, inout items:Int) {
    
    for var i = 0; i < amount; i++ {
        
        items += 1
        
    }
    
}

var 🏀s = 5
increase(by: 6, items: &🏀s)

/*********************
 **** Excercise ******

 Write a function that 
 takes an Int and returns 
 it’s last digit.

 ********************/

// Your code here...


