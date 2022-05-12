//
//  DataController.swift
//  CoreDataTutorial
//
//  Created by Visal Rajapakse on 2022-04-05.
//

import Foundation
import CoreData

/*
 * Core Data is an object graph and persistence framework. You can think of it as UserDefaults, but much more advanced
 * Lets us define Entities (objects) and properties (variables) for them with the ability to read and write
 * Userdefaults JUST STORES The data, Core Data can sort and filter data based on parameters
 
 * Normal class definitions won't work becase CoreData requires all the classes and their relationships to be known before runtime
 
 * Only a single instance of the CoreData Store will be there in a single app. We will use this single one througout the application via dependency injection
 */
class DataController: ObservableObject {
    // Loads/prepares the model for us to access data in the DB
    // Name should be precise
    let container = NSPersistentContainer(name: "Student")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data loading error: \(error.localizedDescription)")
            }
        }
    }
}
