//
//  PizzaDetailView.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-03-30.
//

import SwiftUI

struct PizzaDetailView: View {

    let pizza: Pizza

    var body: some View {
        GeometryReader { reader in // GeometryReader to get the the coordinate space/space of the entire view (screen)
            VStack(alignment: .leading) {
                Image(pizza.imageName)
                    .resizable()
                    .frame(width: reader.size.width, height: 200)
                Text(pizza.name)
                    .padding()
            }
        }
    }
}

struct PizzaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaDetailView(pizza: Pizza(name: "", ingredients: "", imageName: "", thumbnailName: "", type: .meat))
    }
}
