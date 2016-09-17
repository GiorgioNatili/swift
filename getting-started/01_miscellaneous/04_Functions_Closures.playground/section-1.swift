// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func jediGreet(name: String, ability: String) -> (farewell: String, mayTheAbilityBeWithYou: String) {
  return ("Good bye, \(name).", " May the \(ability) be with you.")
}

let retValue = jediGreet(name: "old friend", ability: "Force")

print(retValue)
print(retValue.farewell)
print(retValue.mayTheAbilityBeWithYou)

// http://fuckingswiftblocksyntax.com/
