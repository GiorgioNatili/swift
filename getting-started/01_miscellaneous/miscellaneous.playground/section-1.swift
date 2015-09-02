// Playground - noun: a place where people can play
import UIKit

// Operators
var x = 0

var y = x++
y = x++
y = x++
y = x++

/*
var y = ++x
y = ++x
y = ++x
y = ++x
*/
x
y

// swithc and fallthrough
var aNumber = 7
switch aNumber
{
case 0...5:
    println("This number is between 0 and 5")
    fallthrough
case 6...10:
    println("This number is between 6 and 10")
    fallthrough
case aNumber % 2:
    println("it's an odd number")
default:
    println("I dunno in which range is this number")
}

// Dictionary
var dict:[String: Int] = ["giorgio": 74, "isaac": 82, "jonathan": 94]

for (key, value) in dict{
    
    println(key)
    
}

for (value) in dict.values{
    
    println(value)
    
}


// Array excercise
var letters = [1, 2, 3, 7, 8]
letters.append("9".toInt()!)

var range:Range = 4...6
for index in range {
    letters.insert(index, atIndex: index-1)
}
letters

// Functions arguments
func wishYou(name:String, holidayName holiday:String){
    
    println("Dear \(name), my best wishes for the next \(holiday) holiday!")
    
}

wishYou("giorgio", holidayName: "xmas")

class MyFunClass {
    
    func hello(name: String, age: Int, location: String) {
        println("Hello \(name). I live in \(location) too. When is your \(age + 1)th birthday?")
    }
    
}
var test = MyFunClass()
test.hello("giorgio", age: 5, location: "Rome")

// functions overload
func helloWorld(){
    
    println("Hello world")
    
}

func helloWorld(from:String){
    
    println("Hello world by \(from)")
    
}

helloWorld()
helloWorld("giorgio")

// Array and ranges
var data = [1, 2, 3, 7, 8, 9]
var dataRange = 3..<5
data [dataRange] = [4, 5, 6]
data

// Closures
var hellos = ["giorgio", "jonathan", "isaac"].map({"Hello " + $0})
hellos

func someFunctionThatTakesAClosure(closure: () -> ()) {
    // function body goes here
}

someFunctionThatTakesAClosure({
    // closure's body goes here
})

var tot = [1,2,3,5,6].reduce(0) { (total, number) in total + number }
tot

// Classses

class Dog{
    
    var type:String
    
    init (type t:String){
        
        type = t
        
    }
}

class DefenseDog:Dog {
    
    func bark() -> String{
        
        return "Wof!Wof!"
        
    }
    
}

var ermes = DefenseDog(type: "German Shepherd")
ermes.bark()

// ======= 
class Ball{
    
    init(){
        
        println("Ball initialized")
        
    }
}

class BouncingBall:Ball{
    
    override init(){
        
        println("Bouncing ball initialized")
        
    }
    
}

var ball = BouncingBall()

class Teacher{
    var name:String = "Giorgio", surname:String = "Natili"
    var fullname:String {
        get { return name + " " + surname}
        set(value){
            var data = split(value) {$0 == " "}
            name = data[0]
            surname = data[1]
        }
    }
}

var giorgio = Teacher()
giorgio.fullname
giorgio.fullname = "Isaac Zarsky"
giorgio.fullname

// Strings stack

struct StringsStack {
    private var items = [String]()
    mutating func push(item:String){
        items.append(item)
    }
    mutating func pop() -> String{
        return items.removeLast()
    }
    subscript(index : Int) -> String{
        get{
            return items[index]
        }
        set(value){
            items[index] = value
        }
    }

}
var words = StringsStack(items: ["one", "two", "three"])
words[1]
words[2] = "yeah"
words

// Enumeration

enum AccountType:String{
    case Savings = "savings"
    case Checking = "checking"
}
var value = AccountType.Savings
value = .Checking

enum AccountID{
    case inString (String)
    case inNumber (Int)
}
var enudata = AccountID.inString("my string")

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight == .Low
ovenLight.next()
ovenLight == .High

// Tuples
let http404Error = (404, "Not Found")
http404Error.0
http404Error.1

var namedHttp404Error: (satatusCode:Int, statusText:String)
namedHttp404Error.satatusCode = 404
namedHttp404Error.statusText = "Not Found"


