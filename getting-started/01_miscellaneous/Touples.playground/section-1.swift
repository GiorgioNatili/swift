// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let http404Error = (404, "Not Found")

println(http404Error.0)
println(http404Error.1)

let (errorCode, _) = http404Error
println(errorCode)

// Tuples are particularly useful as the return values of functions
// https://developer.apple.com/library/prerelease/mac/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html

let (firstNumber, secondNumber) = (10, 42)


func findMaxAndMin(values: [Int]) -> (Int, Int) {

  var min = values[0],
      max = min

  for value in values [1..<values.count]{
  
    if value < min {
      
      min = value
      
      } else if value > max {
      
        max = value
    
    }
  
  }
  
  return(min, max)

}

findMaxAndMin([1, 2, 3, 4, 5, 6])



