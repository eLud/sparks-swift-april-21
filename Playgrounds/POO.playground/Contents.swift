

struct Cat {

    let name: String
    var age: Double
}

let myCat = Cat(name: "Patapouf", age: 12)
var myOtherCat = Cat(name: "Grou", age: 5)

print(myCat.age)
myOtherCat.age += 1
//myCat.age += 1

var thirdCat = myOtherCat
myOtherCat.age += 1

thirdCat.age
myOtherCat.age

class Animal {
    let name: String
    var age: Int

    var humanAge: Int {
        get {
            return age
        }
        set {
            age = newValue
        }
    }

    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}

class Dog: Animal {

    // Stored property with observers
    var owner: String {
        willSet {
            print("Owner will change. Current owner is \(owner), future will be \(newValue)")
        }
        didSet {
            print("Owner did change. Current owner is \(owner), previous was be \(oldValue)")
            owner = "Test"
        }
    }

    init(name: String, age: Int, owner: String) {
        self.owner = owner
        super.init(name: name, age: age)
    }

    override var humanAge: Int {
        get {
            return age * 7
        }

        set {
            age = newValue / 7
        }
    }

//    override var age: Int {
//        get {
//            return 42
//        }
//
//        set {
//
//        }
//    }
}

let dog1 = Dog(name: "Médor", age: 5, owner: "")
let dog2 = Dog(name: "Brutus", age: 10, owner: "Toto")

//dog2 = Dog(name: "", age: 0)

let dog3 = dog2
dog2.age += 1

print(dog2.age)
print(dog3.age)


var ingredients = ["A", "C"]
let result = ingredients.contains { str -> Bool in
    return str == "C"
}

dog2.owner = "Toto"
dog2.owner = "Titi"
dog2.owner = "Tata"

struct Employee {
    var salary: Double

    mutating func raiseSalary(by amount: Double) {
        salary += amount
    }
}

struct Trainee {}

class Company {

    var employees: [Employee] = []
    var trainees: [Trainee] = []

    func add(_ employee: Employee) {
        employees.append(employee)
    }

    func add(_ trainee: Trainee) {
        trainees.append(trainee)
    }

    func removeEmployee(at index: Int) {
        employees.remove(at: index)
        print("index 0")
    }

    func removeEmployee(id: Int) {
//        employees.remove(at: index)
    }

    func remove(_ employee: Employee) {

    }

    func raiseSalary(for employee: inout Employee) {
        //employee.raiseSalary()
    }

    // Variadic parameters
    func raiseSalary(employees: Employee..., amount: Int) {

    }
}

var apple = Company()

var newEmployee = Employee(salary: 0)
//newEmployee.raiseSalary(by: 100)

let newTrainee = Trainee()
//apple.addEmployee(employee: newEmployee)
apple.add(newEmployee)
apple.add(newTrainee)

apple.removeEmployee(at: 0)
apple.removeEmployee(id: 23456)
apple.remove(newEmployee)

var aSet = Set<String>()
aSet.insert("Ludovic")
aSet.insert("Ludovic")

// In Out
apple.raiseSalary(for: &newEmployee)
apple.raiseSalary(employees: newEmployee, amount: 10)
print("toto", "titi", 42, true)


// Optionals
struct FaceID {
    var resolution: Int = 500
}

struct Ipad {
    var frequency = 200
    var faceId: FaceID?
}

var ipadModels = [2020 : Ipad()]

//let iPad2020 = ipadModels[2020]! // Force unwrap operator ->> Baad

if ipadModels[2020] != nil {

}

if let iPad2020 = ipadModels[2021] {
    let frequency2020 = iPad2020.frequency
    let frequency2021 = frequency2020 * 2
} else {
    print("Not found the model")
}

let reso = ipadModels[2020]?.faceId?.resolution ?? 0 // Nil coalescing operator : default value

let array: [String] = ["A"]
guard !array.isEmpty else {
    fatalError("Empty array, should not happen")
}
array.forEach { (str) in
    print(str)
}

guard let ipad = ipadModels[2020] else { fatalError() }


class Something: Equatable {

    static func == (lhs: Something, rhs: Something) -> Bool {
        return lhs.foo == rhs.foo
    }

    var foo: String = ""
}

let test = [42.3, 67.7, 98.54]
test.reduce(0.0, +)

let compareDesc = { (n1: Double, n2: Double) -> Bool in
    return n1 > n2
}

let compareAsc = { (n1: Double, n2: Double) -> Bool in
    return n1 < n2
}

test.sorted(by: compareDesc)

test.sorted(by: compareAsc)

test.sorted(by: { (n1: Double, n2: Double) -> Bool in
    return n1 < n2
})

test.sorted { (n1: Double, n2: Double) -> Bool in
    return n1 < n2
}

test.sorted { $0 < $1 }
test.sorted(by: <)
test.map { String($0) }


func repeating(numberOfTime: UInt, something: (UInt)->()) {
    for i in 0..<numberOfTime {
        something(i)
    }
}

repeating(numberOfTime: 5) { (index) in
    print("Toto \(index)")
}

import UIKit

func loadImage(from url: URL, completion: @escaping (String)->() ) {

    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        completion("This is the string data from the network from \(url)")
    }

    print("End of function")
}

loadImage(from: URL(string: "http://apple.com")!) { (str) in
    print(str)
}

print("End of playground")


//Protocols

protocol Named {
    var name: String { get }
}

protocol FullyNamed: Named {
    var fullName: String { get }
}

// Extension de protocole = implémentation par défaut
extension FullyNamed {
    var fullName: String {
        return name
    }
}

struct Human {
    let firstName: String
    let lastName: String
}

extension Human: FullyNamed {
    var name: String {
        firstName
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let me = Human(firstName: "Ludovic", lastName: "Ollagnier")
me.fullName

//Enums
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var currentDirection = CompassPoint.north
currentDirection = .south

//Raw values (String, Int, Double, Float, Character)
enum TransportType: String {
    case car
    case bus
    case plane = "avion"
    case rocket
}

extension TransportType: CaseIterable {

}

TransportType.allCases

let car = TransportType.car
car.rawValue

let rawString = "avion"
if let newTransport = TransportType(rawValue: rawString) {
    print("Transport is \(newTransport)")
}

// Associated values
enum TransportStatus {
    case onTime
    case delayed(delay: Int, reason: String)
    case cancelled

    var message: String {
        switch self {
        case .onTime:
            return "We are on schedule"
        case .delayed(let delay, let reason) where delay <= 5:
            return "We are currently delayed by \(delay) minutes because of \(reason)"
        case .delayed(let delay, let reason) where delay > 5:
            return "We are currently delayed by \(delay) minutes because of \(reason)"
        case .cancelled:
            return "We are cancelled"
        default:
            return ""
        }
    }
}

var currentStatus = TransportStatus.onTime
currentStatus = .delayed(delay: 15, reason: "Traffic jam")
currentStatus.message

for i in 0...100 where i.isMultiple(of: 2) {
    print(i)
}

enum Optionel {
    case some(value: String)
    case none

    func unwrap() -> String {
        switch self {
        case .none:
            fatalError()
        case .some(let value):
            return value
        }
    }
}

var opt = Optionel.none
opt = .some(value: "Hello")

let value = opt.unwrap()
