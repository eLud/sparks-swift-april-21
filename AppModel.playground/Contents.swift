


struct Ingredient: Hashable {
    let name: String
    let isVeggie: Bool
}

struct Meal {
    let name: String
    var ingredients: Set<Ingredient>
    let price: Double
    let pitch: String
    let preciseDescription: String

    // Computed property
    var isVeggie: Bool {
        ingredients.allSatisfy { $0.isVeggie }
    }

//    init(name: String, ing: [Ingredient], price: Double, pitch: String, preciseDescription: String) {
//    }
}

let salade = Ingredient(name: "Salade verte", isVeggie: true)
let poulet = Ingredient(name: "Poulet", isVeggie: false)

let saladeEntrée = Meal(name: "Salade verte", ingredients: [salade], price: 3.5, pitch: "Une salade verte", preciseDescription: "")
let saladeCésar = Meal(name: "Salade césar", ingredients: [salade, poulet], price: 3.5, pitch: "Une salade verte", preciseDescription: "")

saladeEntrée.isVeggie
saladeCésar.isVeggie
