//
//  DataController.swift
//  AssesmentManager
//
//  Created by Visal Rajapakse on 2022-03-26.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "AssessmentManager")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
