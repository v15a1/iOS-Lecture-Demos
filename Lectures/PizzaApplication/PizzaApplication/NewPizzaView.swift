//
//  NewPizzaView.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import SwiftUI

struct NewPizzaView: View {

    @Environment(\.presentationMode) var presentationMode // Used to close the sheet
    @Environment(\.managedObjectContext) var context // Context tells us that we are trying to save data in "THIS" application
    
    // State variables for storing the user entered data
    @State private var name = ""
    @State private var ingredients = ""
    @State private var imageName = ""
    @State private var type = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .opacity(0.2)
                VStack {
                    TextField("Enter Pizza Name", text: $name) /// `.constant()` can be used as a placeholder
                        .textFieldStyle(.roundedBorder)
                    TextEditor(text: $ingredients)
                        .frame(height: 200)
                    TextField("Enter Image Name", text: $imageName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Pizza Thumbnail Name", text: $imageName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Pizza Type", text: $type)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("New Pizza") // Setting the title bar
            .navigationBarTitleDisplayMode(.inline) // Making the title small
            .toolbar {
                ToolbarItem {
                    Button {
                        // By passing context we are telling Swift that the pizza object below will be saved for/under this application
                        let pizza = Pizza(context: context)
                        // Assigning the data to the object properties
                        pizza.name = name
                        pizza.ingredients = ingredients
                        pizza.imageName = imageName
                        pizza.thumbnailName = imageName
                        pizza.type = type
                        try? context.save() // asking core data to save the pizza object. An error can occur if values to all parameters are not provided
                        print(pizza)
                        presentationMode.wrappedValue.dismiss() // Closing the sheet
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {

                        presentationMode.wrappedValue.dismiss() // Closing the sheet
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

struct NewPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        NewPizzaView()
    }
}
