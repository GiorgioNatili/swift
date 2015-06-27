//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************
 ****** Arrays ******
 ********************/

// Declaration and type inference
var players = ["Isaac", "Jonathan", "Giorgio"]
players.append(1.description)

var enemies:[String] = [String]()
enemies.append("Bill")

// Prepopulated arrays
var bugs = [String](count: 4, repeatedValue: "bug")

bugs += ["hug", "dug"]
bugs.insert("SWIFT", atIndex: 3)

// Accessing elements
bugs[bugs.endIndex - 1]
bugs[2...3]

// Remove items
if !bugs.isEmpty {

    bugs.removeLast()
    bugs.removeRange(2...3)

}

/********************
 *** Dictionaries ***
 ********************/

// Declaration and type inference
var emptyDictionary = [String:Float]()
var dictionary = ["a": 4, "b": 7, "c": 8, "d": 2, "e": 5]

// Update and delete values
dictionary.updateValue(41, forKey: "b")
dictionary
dictionary.removeValueForKey("c")
dictionary
dictionary["e"] = nil
dictionary

// Get all the keys and values
let keys = Array(dictionary.keys)
let values = Array(dictionary.values)

/******************
 ****** Sets ******
 ******************/

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters.insert("b")
letters.insert("c")
letters.insert("d")
letters.insert("b")
letters.insert("c")

/*********************
 **** Excercise ******

 Given a number find 
 and store all its 
 divisors

 ********************/

// Your code here...

