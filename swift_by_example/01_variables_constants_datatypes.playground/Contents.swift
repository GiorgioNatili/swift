
//: Playground - noun: a place where people can play

import UIKit

/*********************
 * Numeric types *****
 *********************
 Int8 and UInt8
 Int16 and UInt16
 Int32 and UInt32
 Int64 and UInt64
 Float (size: 32-bit, precision: ≥6 decimal digits)
 Double (size: 64-bit, precision: ≥15 decimal digits)

*/

// Integer and Floats
var aNumber = 1
var aFloat = 1.5

// Syntax sugar
var earthPopulation = 7_100_000_000

// Emojy as unicode
var 🍕🍕 = 2

// Casting and costants
let sum = Double(aNumber) + aFloat
// sum = aNumber as Double + aFloat
// sum = 3

/*********************
 ****** Strings ******
 ********************/

var sayWhat = "hello"
var name = "Giorgio"

print(sayWhat + " " + name)

// Capitalize strings
let sayWatCapitalized = sayWhat.capitalizedString

// The power of the value types
print(sayWhat.capitalizedString + " " + name)

// Basic manipulation
let sentence = sayWhat + " " + name
let today = "Saturday "

print(sentence + ", today is \(today.uppercaseString)")

/*********************
 **** Excercise ******

 Using the NSDate class
 concatenate a string and
 today's date and hour

 ********************/

// Your code here...

