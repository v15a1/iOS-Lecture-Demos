//
//  AssesmentManagerApp.swift
//  AssesmentManager
//
//  Created by Visal Rajapakse on 2022-03-26.
//

import SwiftUI

@main
struct AssesmentManagerApp: App {

    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
