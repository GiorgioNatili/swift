// Example: Find all the even numbers between 1 and 10.

// non-functional
var evens = [Int]()
for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}
println(evens)




// functional with explicit function
func isEven(number:Int) -> Bool {
  return number % 2 == 0
}
evens = Array(1...10).filter(isEven)
println(evens)





// functional with closure
evens = Array(1...10).filter { (number) in number % 2 == 0 }
println(evens)




// functional with shorthand closure
evens = Array(1...10).filter { $0 % 2 == 0 }
println(evens)




// Your own filter implementation
func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
  var result = [T]()
  for i in source {
    if predicate(i) {
      result.append(i)
    }
  }
  return result
}

evens = myFilter(Array(1...10)) { $0 % 2 == 0 }
println(evens)



