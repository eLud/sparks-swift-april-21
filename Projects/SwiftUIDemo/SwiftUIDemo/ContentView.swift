//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 27/04/2021.
//

import SwiftUI

struct ContentView: View {

    let resto = Restaurant.demoResto

    var body: some View {
        NavigationView {
            List(resto.mealsArray) { meal in
                ListCell(meal: meal)
            }.navigationTitle("Meals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {

    let meal: Meal

    var body: some View {
        NavigationLink(
            destination: Text(meal.name),
            label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(meal.name)
                        Text(meal.pitch)
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    if meal.isVeggie {
                        Image(systemName: "leaf")
                            .foregroundColor(.green)
                    }
                }

            })
    }
}
