//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var hello:()->String = {
    
    return "Hello everyone"
    
}
var surname = "Smith"
var sayHello:(String) -> String = { name in
    
    return "Hello \(name) \(surname)"
    
}

func iWillSayHello(_ hello:(String) -> String) {
    
    hello("Super Mario")
    
}

iWillSayHello(sayHello)
sayHello("Luigi")

var numbers = [3, 5, 7, 2, 1, 0, 54]
numbers.sorted(by: {x, y in
    
    return x < y
    
})
// numbers.sort(by: >)
let 😊 = "happy"

var letters = ["g", "h", "a", "c", "z"]
letters.sorted(by: <)

let others = [3, 43, 7, 8, 32, 12, 1, 2, 0]
var test = others.reduce(0, {x, y in

    return x + y

})
test

var even = others.filter {x in

    return x % 2 == 0
}

var doubled = others.map {x in

    return x * 2
}

var doubled2 = letters.map {x in
    
    return x + x
}

