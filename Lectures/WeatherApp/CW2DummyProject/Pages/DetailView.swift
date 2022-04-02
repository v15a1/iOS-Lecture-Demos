//
//  DetailView.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import SwiftUI

struct DetailView: View {

    @State private var searchText = ""
    @StateObject var manager = WeatherManager()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        TextField("Search for City", text: $searchText)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            Task {
                                await manager.fetchForCity(city: searchText)
                            }
                        } label: {
                            Text("Search")
                        }
                    }
                    .padding()
                    if let data = manager.weather?.data {
                        List(data) { item in
                            HStack {
                                Image(systemName: item.icon)
                                    .foregroundColor(item.color)
                                Text(item.title)
                                    .font(.system(size: 18, weight: .regular, design: .rounded))
                                Spacer()
                                Text("\(item.value, specifier: "%.2f")")
                                    .font(.system(size: 22, weight: .bold, design: .rounded))
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                    Spacer()

                }
            }
            .navigationTitle("Weather")
        }
        .onAppear {

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

