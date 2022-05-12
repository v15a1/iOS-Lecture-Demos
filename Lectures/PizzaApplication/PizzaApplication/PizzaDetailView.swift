//
//  PizzaDetailView.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import SwiftUI

struct PizzaDetailView: View {

    let pizza: Pizza
    @Environment(\.managedObjectContext) var context // Context tells us that we are trying to save data in "THIS" application
    @State private var isFavourite: Bool
    
    init(pizza: Pizza) {
        self.pizza = pizza
        self.isFavourite = pizza.isFavourite
    }

    var body: some View {
        GeometryReader { reader in // GeometryReader to get the the coordinate space/space of the entire view (screen)
            VStack(alignment: .leading) {
                Image(pizza.imageName ?? "")
                    .resizable()
                    .frame(width: reader.size.width, height: 200)
                Text(pizza.name ?? "")
                    .padding()
                Text(pizza.ingredients ?? "")
                    .padding()
                Button {
                    print("Object before isFavourite: ", pizza)
                    isFavourite.toggle()
                    pizza.isFavourite = isFavourite
                    try? context.save()
                    print("Object after saving: ", pizza)
                } label: {
                    Text(isFavourite ? "Is Favourite" : "Not favourite")
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

//struct PizzaDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PizzaDetailView(pizza: )
//    }
//}
