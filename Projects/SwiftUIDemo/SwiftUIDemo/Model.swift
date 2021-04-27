//
//  Model.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 27/04/2021.
//

import Foundation

struct Ingredient {
    let name: String
    let isVeggie: Bool
}

extension Ingredient: Hashable { }

// Create a protocol to unify Drink, Meal and other things to sell

//protocol Shop {
//    static var allSellable: [Sellable] { get }
//}

protocol Sellable {
    var name: String { get }
    var price: Double { get }
    var pitch: String { get }
}

struct Drink: Sellable {
    let name: String
    let price: Double
    let pitch: String
}

struct Meal: Hashable, Sellable, Identifiable {

    enum Kind: String {
        case appetizer
        case main
        case desert
    }

    let name: String
    var ingredients: Set<Ingredient>
    let price: Double
    let pitch: String
    let preciseDescription: Optional<String>
    let kind: Kind

    let id = UUID()

    // Computed property
    var isVeggie: Bool {
        ingredients.allSatisfy { $0.isVeggie }
    }

    init(name: String, kind: Kind, ingredients: [Ingredient], price: Double, pitch: String, preciseDescription: String? = nil) {
        self.name = name
        self.ingredients = Set(ingredients)
        self.price = price
        self.pitch = pitch
        self.preciseDescription = preciseDescription
        self.kind = kind
    }
}



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

    func add(_ sellable: Sellable) {

    }

    func remove(_ mealToRemove: Meal) {
        meals.remove(mealToRemove)

        if let index = mealsArray.firstIndex(of: mealToRemove) {
            mealsArray.remove(at: index)
        }
    }

    static var demoResto: Restaurant {
        let salade = Ingredient(name: "Salade verte", isVeggie: true)
        let poulet = Ingredient(name: "Poulet", isVeggie: false)

        let saladeEntrée = Meal(name: "Salade verte", kind: .appetizer, ingredients: [salade], price: 3.5, pitch: "Une salade verte", preciseDescription: "")
        let saladeCésar = Meal(name: "Salade césar", kind: .main, ingredients: [salade, poulet], price: 3.5, pitch: "Une salade césar avec du poulet", preciseDescription: "")

        let myResto = Restaurant(name: "test", address: "", pitch: "")
        myResto.add(saladeEntrée)
        myResto.add(saladeCésar)

        return myResto
    }
}
