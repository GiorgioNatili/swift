//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*********************
 * Number Comparison *
 * < Less than
 * <= Less than or equal
 * > Greater than
 * >= Greater than or equal
 * == Equal
 * != Not equal
 *********************/

// Number comparison
if 7 % 2 == 2 {
    
    print("7 is even")     // What's wrong?

} else {
    
    print("7 is odd")      // 7 is odd

}

// Number comparison with operator
var money = 20
var burgerPrice = 10

if money >=  burgerPrice {
    
    print("pay burger")
    money -= burgerPrice
    
} else {
    
    print("wash dishes")
    
}

// Multiple conditions && and ||
let users = 9
if users >= 8 && users <= 16 {
    
    print("nice workshop")
    
}

let dogs = 7, cats = 5
if dogs == 7 ||  cats == 5 {
    
    print("you got a lot of pets!")
    
}

/*********************
 **** Excercise ******
    
 You are given a year, 
 determine if it’s a leap
 year.
 Leap years occur every 4 
 years.

 ********************/

let year = 2014
if year % 4 == 0 {
    if year % 100 == 0 && year % 400 != 0 {
        
        print("Not a leap year!")
        
    } else {
        
        print("Leap year!")
        
    }
    
} else {
    
    print(year)
    print("Not a leap year!")
    
}

