//
//  PizzaList.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import SwiftUI

struct PizzaList: View {

    @State private var selection = 0 // State variable for the Segmented Picker selection
    @State private var isSheetShowing = false // State variable representing if the action sheet is open/not
    @Environment(\.managedObjectContext) var context // Context tells us that we are trying to save data in "THIS" application

    /*
     * SwiftUI is declarative -- Meaning if we specify what we want it will automatically do it for us
     * FetchRequest listens to any updates in the database for type `Pizza` and updates the list if any updates have occured
     */
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: []) var pizzas: FetchedResults<Pizza>
    
    init() {
//        self.pizzas = @FetchRequest(entity: Pizza.entity(), sortDescriptors: [])
    }

    var body: some View {
        NavigationView { // NavigationView should be the top most View.
            VStack {
                Picker("Pizzas", selection: $selection) {
                    Text("All🍕").tag(0) // Tag is similar to the tag in UIKit. It is a unique identifier. It is important to add here as well.
                    Text("Meat🥩").tag(1)
                    Text("Veggie🥦").tag(2)
                }
                .pickerStyle(.segmented)
                List(pizzas, id: \.name) { pizza in  // `\.name` is used to uniquely indentify each of the elements
                    NavigationLink { // Navigation link to navigate to `PizzaDetailView(pizza:_)`
                        PizzaDetailView(pizza: pizza) // Custom view.
                    } label: {
                        HStack {
                            Image(pizza.imageName ?? "")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(pizza.name ?? "")
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            context.delete(pizza)
                            try? context.save()
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                        
                    }
                }
                .onChange(of: selection, perform: { newValue in
                    print(newValue)
                })
                .listStyle(PlainListStyle()) // PlainListStyle
            }
            .navigationBarTitle("Pizzas", displayMode: .inline)
            .sheet(isPresented: $isSheetShowing, content: { // Showing the sheet using a binding variable
                NewPizzaView() // Sheet content
            })
            .toolbar {  // Adding a button to the tabbar view
                ToolbarItem {
                    Button {
                        isSheetShowing.toggle() /// `.toggle()` can be used to toggle between true and false values
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct PizzaList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaList()
    }
}
