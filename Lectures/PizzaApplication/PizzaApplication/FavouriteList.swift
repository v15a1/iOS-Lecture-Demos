//
//  FavouriteList.swift
//  PizzaApplication
//
//  Created by Visal Rajapakse on 2022-04-06.
//

import SwiftUI

struct FavouriteList: View {
    
    @FetchRequest(entity: Pizza.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavourite = %d", true)) var favourites: FetchedResults<Pizza>
     
    var body: some View {
        List(favourites) { favourite in
            HStack {
                Image(favourite.imageName ?? "")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(favourite.name ?? "")
            }

        }
        .listStyle(PlainListStyle()) // PlainListStyle
    }
}

struct FavouriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteList()
    }
}
