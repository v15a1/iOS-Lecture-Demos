//
//  ContentView.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView { // Including a tab
            PizzaList()
                .tabItem { // It should be a VC + Should have a tab bar item.
                    Label("Pizza List", systemImage: "list.dash") /// `Label` to show a
                }
            Text("Favourites")
                .tabItem { /// Include `.tabItem` to ensure the view knows that the user
                    Label("Favourites", systemImage: "star.fill")

                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
