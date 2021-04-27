

struct Ingredient {
    let name: String
    let isVeggie: Bool
}

extension Ingredient: Hashable { }

struct Meal: Hashable {
    let name: String
    var ingredients: Set<Ingredient>
    let price: Double
    let pitch: String
    let preciseDescription: Optional<String>

    // Computed property
    var isVeggie: Bool {
        ingredients.allSatisfy { $0.isVeggie }
    }

    init(name: String, ingredients: [Ingredient], price: Double, pitch: String, preciseDescription: String? = nil) {
        self.name = name
        self.ingredients = Set(ingredients)
        self.price = price
        self.pitch = pitch
        self.preciseDescription = preciseDescription
    }
}

let salade = Ingredient(name: "Salade verte", isVeggie: true)
let poulet = Ingredient(name: "Poulet", isVeggie: false)

let saladeEntrée = Meal(name: "Salade verte", ingredients: [salade], price: 3.5, pitch: "Une salade verte", preciseDescription: "")
let saladeCésar = Meal(name: "Salade césar", ingredients: [salade, poulet], price: 3.5, pitch: "Une salade verte", preciseDescription: "")

saladeEntrée.isVeggie
saladeCésar.isVeggie

class Restaurant {
    let name: String
    let address: String
    private var meals: Set<Meal>
    private(set) var mealsArray: Array<Meal>
    let pitch: String

    var mediumMealPrice: Double {
        let sum = meals.reduce(0.0) { (previous, meal) -> Double in
            return previous + meal.price
        }
        return sum / Double(meals.count)
    }

    init(name: String, address: String, pitch: String, meals: [Meal] = []) {
        self.name = name
        self.address = address
        self.pitch = pitch
        self.meals = Set(meals)
        self.mealsArray = meals
    }

    func add(_ newMeal: Meal) {
        // Don't add if already in
        guard !meals.contains(newMeal) else { return }

        meals.insert(newMeal)
        mealsArray.append(newMeal)
    }

    func remove(_ mealToRemove: Meal) {
        meals.remove(mealToRemove)

        if let index = mealsArray.firstIndex(of: mealToRemove) {
            mealsArray.remove(at: index)
        }
    }
}

let myResto = Restaurant(name: "test", address: "", pitch: "")
myResto.add(saladeCésar)
myResto.add(saladeCésar)
myResto.add(saladeCésar)
myResto.mealsArray.count
