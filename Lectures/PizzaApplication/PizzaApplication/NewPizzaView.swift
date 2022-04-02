//
//  NewPizzaView.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import SwiftUI

struct NewPizzaView: View {

    @Environment(\.presentationMode) var presentationMode // Used to close the sheet

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .opacity(0.2)
                VStack {
                    TextField("Enter Pizza Name", text: .constant("")) /// `.constant()` can be used as a placeholder
                        .textFieldStyle(.roundedBorder)
                    TextEditor(text: .constant(""))
                        .frame(height: 200)
                    TextField("Enter Image Name", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Pizza Thumbnai Name", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Pizza Type", text: .constant(""))
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
