// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person{

  private var name:String
  private var surname:String
  private let messages: [String] = ["Good evening", "Good morning", "Good afternoon", "Hello"]
  var dayPhase:String = ""
  
  init(name n:String, surname s:String){
  
    name = n;
    surname = s;
  
  }
  
  func sayHello(){
    
    var index: Int;
  
    switch dayPhase {
      case "morning":
        index = 1
      case "evening":
        index = 0
      case "afternoon":
        index = 2
      default:
        index = 3
    }

    print(messages[index] + ", " + name + " " + surname)
  
  }

}

let person:Person = Person(name: "Giorgio", surname: "Natili")

person.sayHello()

person.dayPhase = "morning"
person.sayHello()
