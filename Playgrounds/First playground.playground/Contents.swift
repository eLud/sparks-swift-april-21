import UIKit

// Variables and constants
var str = "Hello, playground"
str = "Hello Swift!"

let aConstant = "This value can't change"
aConstant

// Typing
var age = 10
age = Int(10.5)

var height = 12.6
var width: Float = 8.9
height = Double(width)

let a = 5.0
let b = 2
let c = a / Double(b)

var notYetDefined: Any
notYetDefined = ""
notYetDefined = 42

var initialString = "hello world"
initialString.capitalized
initialString.uppercased()

var emptyTabString: [String] = []

var aTab = ["A", "B", "C", "Z"]
aTab[2...] = ["D", "E", "F"]
aTab[1...3]

var emptyArray: [String: Int] = [:]
//emptyArray[""]
