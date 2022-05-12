//
//  Pizza.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import Foundation

/// ENSURE THE NAMES OF THE OBJECT ARE EQUAL TO THE JSON KEY NAMES
//struct Pizza: Decodable {
//    var name: String
//    var ingredients: String
//    var imageName: String
//    var thumbnailName: String
//    var type: PizzaType
//}

enum PizzaType: String, Decodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}
