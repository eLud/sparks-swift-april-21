

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

    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}

class Dog: Animal {

    var owner: String

    init(name: String, age: Int, owner: String) {
        self.owner = owner
        super.init(name: name, age: age)
    }
}

let dog1 = Dog(name: "Médor", age: 5, owner: "")
let dog2 = Dog(name: "Brutus", age: 10, owner: "")

//dog2 = Dog(name: "", age: 0)

let dog3 = dog2
dog2.age += 1

print(dog2.age)
print(dog3.age)


var ingredients = ["A", "C"]
let result = ingredients.contains { str -> Bool in
    return str == "C"
}

