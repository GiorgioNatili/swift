// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func sayHello(name:String)->String{
    
    return "Hello " + name
    
}

func hello(var message:String, name:String)->String{
    
    message += name
    return message
    
}
hello("Hello ", "Giorgio")

var names = ["Jonathan", "Rico", "Matthew"]
func updateArray(inout data:Array<String>){
    
    data.append("Giorgio")
    
}
updateArray(&names)
names

let helloFromClosure = {(name:String) -> String in
    return "Hello " + name + " from your closure! "
}
println(helloFromClosure("giorgio"))

println(18 % 2)

// non functional
var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}


var evenSum = 0
for i in evens {
    evenSum += i
}
println(evenSum)








// functional
evenSum = Array(1...10)
    .filter { (number) in number % 2 == 0 }
    .reduce(0) { (total, number) in total + number }


println(evenSum)



















var animals = ["Dog", "Cat", "Fish", "Worm"]

let sortedStrings = animals.sorted({(one:String, two:String) -> Bool in return one < two })
sortedStrings

class Person{
    
    var name:String = "Giorgio"
    var surname:String = "Natili"
    
    var fullName:String {
        
        get {
            return name + " " + surname
        }
        
    }
    
    init(){}
    
}

class Animal{
    init(specie:String){
        println("I am a \(specie)")
    }
    init(specie:String, gender:String){
        println("I am a \(specie), my gender is \(gender)")
    }
}
var animal = Animal(specie: "Cat")
var otherAnimal = Animal(specie: "Dog", gender: "Female")

var test = 2.0
test += 4.4

struct Account{
    
    var accountId:Int
    var amount:UInt8 = 0
    
    init(id:Int){
        
        accountId = id
        
    }
    
    mutating func manageAmount(value:UInt8){
        
        amount += value
        
    }
}

var account = Account(id: 1234)
account.manageAmount(100)
account

enum AccountType:String{
    
    case Savings = "savings"
    case Checking = "checking"
    
}

enum AccountID{
    case inString (String)
    case inNumber (Int)
}
AccountID.inNumber(12345)


var wrappable:String?
// wrappable = "Giorgio"

if let data = wrappable {

    println("hello " + data)

}


func maxValue(nums: [Int]) -> Int?{
    
    return nums.reduce(Int.min, { max($0, $1) })
    
}

maxValue([1, 3, 5, 6, 8, 11])
maxValue([])


func minMax(numbers:[Int]) -> (min: Int, max: Int, average: Int)?{
    
    if(numbers.isEmpty){return nil}
    
    var average = 0
    var currentMin = numbers[0]
    var currentMax = numbers[0]
    
    for value in numbers[1..<numbers.count]{
        
        if value < currentMin{
            
            currentMin = value
        
        }else if value > currentMax{
            
            currentMax = value
            
        }
        
        average += value
        
    }
    
    return (currentMin, currentMax, average/numbers.count)
}

