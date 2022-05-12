//
//  DatabaseController.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-04-06.
//

import CoreData
import Foundation

/*
 * Only a single instance of `DataConroller` is used for the entire application for reading/writing data
 * We will be injecting the container to the environment so that all view/controllers can access it if they want to
 */
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Pizzas") // Loads/Caches the container
    
    init() {
        container.loadPersistentStores { description, error in // Actually loading it into RAM
            if let error = error {
                print("Core Data loading error: \(error.localizedDescription)")
            }
        }
    }
}
