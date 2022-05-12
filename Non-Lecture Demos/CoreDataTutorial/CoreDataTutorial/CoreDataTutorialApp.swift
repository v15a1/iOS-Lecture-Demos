//
//  CoreDataTutorialApp.swift
//  CoreDataTutorial
//
//  Created by Visal Rajapakse on 2022-04-05.
//

import SwiftUI

@main
struct CoreDataTutorialApp: App {
    // Keeps the object alive for the entire lifetime of the application
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                // This allows you to work with data in the memory/RAM because that is faster than CRUD ops
        }
    }
}
