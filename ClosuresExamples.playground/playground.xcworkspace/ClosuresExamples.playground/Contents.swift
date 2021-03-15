import UIKit
import SwiftUI
import Foundation

let moreAndMoreCountries = ["japan", "south korea", "singapore"]
var uppercaseCountries4 = moreAndMoreCountries.map{ $0.uppercased() }
print(uppercaseCountries4)

let countries = ["america", "canada", "mexico"]

uppercaseCountries4.replaceSubrange(0...2, with:countries)
print(uppercaseCountries4)

enum HTTPResponse {
    case ok
    case error(Int)
}

let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
let sortedResponses = responses.sorted {
    switch ($0, $1) {
    // Order errors by code
    case let (.error(aCode),.error(bCode)): return aCode < bCode
    // All successes are equivalent, so none is before any other
    case (.ok, .ok): return false
    // Order errors before successes
    case(.error, .ok): return true
    case(.ok, .error): return false
    }
}
print(sortedResponses)


var completionHandlers = [() -> Void]()
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass
{
var x = 10
func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let obj = SomeClass()
obj.doSomething()
print(obj.x)
// Prints "200"

completionHandlers.first?()
print(obj.x)
// Prints "100"


//let countries = ["america", "canada", "mexico"]
var uppercasedCountries = countries.map( { (country: String) -> String in
    return country.uppercased()
})


let moreCountries = ["india", "spain", "great britain"]
let uppercasedCountries1 = moreCountries.map( { country in
    return country.uppercased()
})
uppercasedCountries.append(contentsOf: uppercasedCountries1)
print(uppercasedCountries1)


let countries2 = ["america", "canada", "mexico"]
let uppercasedCountries2 = countries2 .map( { country in
    country.uppercased()
})
print(uppercasedCountries2)


let countries3 = ["india", "canada", "mexico"]
let uppercasedCountries3 = countries3.map({ $0.uppercased() })
print(uppercasedCountries3)



let addClosure:(Int,Int)->Int = { $0 + $1 }

func returnClosure() -> (Int,Int)->Int { return addClosure }

print("sum = \(returnClosure()(517,13249))")

var newClosure = addClosure

print("sum = \(newClosure(57829,15084))")


// returns 30var returnedClosure = returnClosure() // returns a closure of type (Int,Int)->IntreturnedClosure(20,10) // returns 30


func chooseANewStepFunction(backward: Bool) -> (Int) -> Int {
    backward ? { $0 - 1 }:{ $0 + 1 }
}
var currentValue = -5
var moveCloserToZero = chooseANewStepFunction(backward: currentValue > 0)
while currentValue < 1 {
    print("\(currentValue)... ")
        currentValue = moveCloserToZero(currentValue)
    }
    print("zero!")



var numArray = [3, 7, 13, 19]
let myClosure = { (number: Int) -> Int in
    let result = number * number
    return result
}
let mappedNumbers = numArray.map(myClosure)


let newMappedNumbers = numArray.map({ (number: Int) -> Int in
    let result = number * number
    return result
})
print(newMappedNumbers)


var testNumbers = [2, 4, 6, 7]
let squaredTestNumbers = testNumbers.map{$0*$0}
print(squaredTestNumbers)



class MyClass {
    var someClosure: ((_ someString: String) -> ())?
    init() {
        self.someClosure = aMethod
    }
    func aMethod(aString: String) -> () {
        print(aString)
    }
}

let instance = MyClass()
if let someClosure = instance.someClosure {
    someClosure("My name is AAYUSH")
}

instance.someClosure = { (theVerySameString: String) -> () in
    print(theVerySameString)
  //  someThingReturningBool()
}
instance.someClosure!("I'm a cool string!")


//SCOPE in SWIFT

let three = 3 // global scope
print("Global Scope:")
print(three) // Legal as can see things in the same or enclosing scope.
func outerFunction() {
    print("OuterFunction Scope:")
    let two = 2 // scoped to the braces of the outerFunction
    print(two) // Legal as can see things in the same or enclosing scope.
    print(three) // Also legal as can see things in same or enclosing scope.
    let innerClosure = {
        let one = 1
        print("Inner CLOSURE Scope:")
        // scoped to the braces of the `if` statement.
        print(one) // Legal as can see things in the same or enclosing scope.
        print(two) // Legal as can see things in same or enclosing scopes.
        print(three) // Also legal for the same reason.
    }
    innerClosure()
    // print(one) - Would cause an error. Variable `one` is no accessible from outer scope.
}
// print(two) - Would cause an error. Variable `two` is not accessible from outer scope.

outerFunction()

// Global Scope:
// 3
// OuterFunction Scope:
// 2
// 3
// If Statement Scope:
// 1
// 2
// 3


let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]

let multiples = numbers.filter { $0 % 3 == 0 }

print(multiples)


var numbersToFilter: [Int] = []
numbersToFilter.append(contentsOf: 1...100)
var oddSquareNumbers1 = numbersToFilter.filter({ (number: Int) -> Bool in
    return number % 2 == 1
}).map{$0 * $0}
print(oddSquareNumbers1)


var oddSquareNumbers = numbersToFilter.filter({
        $0 % 2 == 1 //select all the odd numbers
    }).map {
        $0 * $0 // square them
    }//.reduce(0, +) // get their sum
print(oddSquareNumbers)



func calculateOddSquare(arrayOfInt: [Int]) -> [Int]
{
    let tempArray = arrayOfInt
    var oddSquareNumbers: [Int] = []
    for index in 0 ..< tempArray.count
    {
        if tempArray[index] % 2 == 1 {
            oddSquareNumbers.append(tempArray[index]*tempArray[index])
        }
    }

print("\(oddSquareNumbers)")
return oddSquareNumbers
}
calculateOddSquare(arrayOfInt: numbersToFilter)




// a closure without having any parameters and return types

var helloworld = {
print("Welcome to Tutlane")
}
helloworld()

 

//a closure with only return type

var addition = {() -> Int in
return 100 + 500
}
print(addition())

 

//a closure with only parameter type

var onlyparam = {( x: String) in
print(x)
}
onlyparam("Welcome to Tutlane")

 

//a closure with single parameter and return type

var singleparam = {(x: String) -> String in
return x
}
print(singleparam("Welcome to Tutlane"))

 

//a closure with multiple parameters and return types

var multiplication = {(num1: Int, num2: Int) -> Int in
return num1 * num2
}
let result = multiplication (50, 100)
print(result)



//Swift Escaping Closures

/*
var closurehandler:[( ) -> Void] = []
func escapeclosurefunction(closurehandler: @escaping () -> Void) {
    closurehandler.append(closurehandler)
}
*/

//Mark : - autoclosures in swift programming language.

func autoclosurefunction(checktwonumber: () -> Bool) {
if checktwonumber() {
print("It’s Correct")
}
else {
print("It’s Wrong")
}
}
autoclosurefunction(checktwonumber: {20 > 34})

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        print(runningTotal)
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

var newByTen = incrementByTen

newByTen()

newByTen()

incrementByTen()

newByTen()

var incrementBySeven = makeIncrementer(forIncrement: 7)
//new reference so the counter runningTotal starts from 0 and increments the value by 7.
incrementBySeven()

incrementByTen()


var simpleNumb = [1,2,3,4,5,6]
print(numbers)

var strings = simpleNumb.map{"\($0)"}
print(strings)
//prints ["1", "2", "3", "4", "5", "6"]\n

/*
var completionHandlers: [() -> Void] = []
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)

}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {[weak self] in guard let weakSelf = self else { return }
            weakSelf.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
    deinit{
    print("deinitalised")
    }
}
var s:SomeClass? = SomeClass()
s?.doSomething()
print(s?.x ?? -1)
//prints 200

completionHandlers.first?()
print(s?.x ?? -1)
//prints 100
s = nil

*/

func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String) {
    if condition() {
        print(message())
    }
}
func conditionOne() -> Bool {
    return true
}
func phrase() -> String {
    return "Text"
}

assert(true, "Hello")
assert(false, "Good bye")
assert(conditionOne(), phrase())


func noAutoClosure(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}

noAutoClosure({print("Hello")})
// if the print method is not enclosed in curly brackets, the compiler throws below error

// Cannot convert value of type '()' to expected argument type '() -> Void'

noAutoClosure({ print("Hello") })
// this function call will work

func testAutoClosure(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

testAutoClosure(print("Hello"))
//the print("Hello") won't be executed immediately because it gets wrapped inside a closure for execution later.


let f1Countries = ["bahrain", "italy", "portugal","spain","monaco"]
func visitCountry() -> (String) -> Void {
    var numberOfRaces = 0
    return {
        print("I just visited \($0)")
        numberOfRaces += 1
        print("Number of races covered: \(numberOfRaces)")
    }
}

let bucketList = visitCountry()

f1Countries.map { $0.uppercased() }.forEach {
    bucketList($0)
}
print("NOW I AM BANKRUPTED")
//final prints one FACT.


let newList = visitCountry()
f1Countries.map { $0.uppercased() }.forEach {
    newList($0)
}
let fewMoreCountries = ["azerbaijan", "canada", "france"]

var nextBucket = bucketList
fewMoreCountries.map { $0.uppercased() }.forEach {
    nextBucket($0)
}

let names = ["godzilla", "kong", "scylla", "muto"]
var reversedNames = names.sorted(by: >)



let filteredNumbers = numbersToFilter.filter({ $0 % 2 == 1}).map{$0 * $0}
print(filteredNumbers)




