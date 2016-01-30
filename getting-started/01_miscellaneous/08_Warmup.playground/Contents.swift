/*:
## A Swift Warmup
### A quick refresher (or some quick catch-up)
*/
//: Swift creates variables like this:
var variable = 42
//: and constants like this:
let today = "A good day to learn some Swift!"
//: If a variable needs to be created with an explicit type, it's done like this:
var explicitlyTypedVariable: Double
//: This function takes a `String` and returns another `String`:
func superCoolFunction(coolName: String) -> String {
    return "Oh hi, " + coolName + ", you're my favorite!"
}
//: I've called it, but you should probably put in your own name. (Note the live results to the right! You might want to make the result area wider.)
superCoolFunction("super cool friend")
//: Now then, let's get down to business. Write me a function that takes two `Int`s, adds them together, and returns a new `Int`.
func addingSomeNumbersVeryImpressively(){
    
}
//: Alright, let's try it out!
addingSomeNumbersVeryImpressively()
/*:
Now here's something really nifty: try option-clicking on your function's name where it was just called.

-----

Alright, here's where it get's weird. Swift has these things called optionals:
*/
let 🐱: Bool?
//: An optional value is like Schrodinger's cat: it might exist, but then again it might not. You won't know until you try to use it. You'll either get a value, or you'll get `nil`. Only one way to find out... (Oh, you can totally use emoji to name things. Probably don't in the real world, though.)
//:
//: One way to deal with optionals is just to check if they're `nil`:
var optional: String?

if optional != nil {
    "It has a value!"
    optional
} else {
    "Oh. No value here."
}
//: If we want to be fancy (we totally want to be fancy), we can rewrite the above like this:
if let totallyHasAValue = optional {
    "It has a value!"
    totallyHasAValue
} else {
    "Oh. No value here."
}
//: Try giving `optional` a value above and see how the output from these examples changes.
//:
//: One last thing about optionals: if you're pretty sure one will have a value, you can let it be _implicitly unwrapped_. In fact, if you declare a variable or constant, and you know it'll have a value, you can mark it to _always_ be implictly unwrapped. Take a look:
var optionalThatHasAValue: String? = "There's a value here."
var automaticallyImplicitlyUnwrapped: String! = "There's a value here, too!"

print(optionalThatHasAValue!)
print(automaticallyImplicitlyUnwrapped)
/*:
Try removing the `!` from the first `println` statement, and you'll see what it's doing here. Basically, if you don't unwrap an optional, and you're not testing if it has a value, you're not working with the value at all; you're working with an optional. In other words, `Int?` and `Int` are two different types of data. `Int?` can contain an `Int`, but you have to ask for it.

-----

Alright, that's it! If you still have some time, feel free to play around. I'll leave you some space below.
*/

