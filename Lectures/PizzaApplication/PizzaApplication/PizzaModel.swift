//
//  PizzaModel.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import Foundation

class PizzaModel {
    var pizzas: [Pizza] = [] // Pizzas holder

    init() {
        if let url = Bundle.main.url(forResource: "Pizzas", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                pizzas = try JSONDecoder().decode([Pizza].self, from: data) // Decoding the JSON Data.
            } catch {
                print(error)
            }
        }
    }
}
