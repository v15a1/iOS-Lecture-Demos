//
//  SearchView.swift
//  OpenWeatherMapApp
//
//  Created by Visal Rajapakse on 2022-04-29.
//

import SwiftUI

struct SearchView: View {
    
    @State private var cityText = ""
    @State private var unitToggle = false
    
    @StateObject var manager = WeatherManager()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a city", text: $cityText)
                    .textFieldStyle(.roundedBorder)
                Button {
                    Task {
                        print("dsfadf")
                        await manager.fetchForCity(string: self.cityText, unit: unitToggle ? .imperial : .metric)
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding()
                }
            }
            Toggle(isOn: $unitToggle) {
                Text("Is Imperial?")
            }
            if let data = manager.weather?.detailedData {
                List(data) { item in
                    HStack {
                        Image(systemName: item.icon)
                            .foregroundColor(item.color)
                        Text(item.title)
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                        Spacer()
                        Text("\(item.value)")
                            .font(.system(size: 20, weight: .bold, design: .rounded)) + Text(item.unit)
                            .font(.system(size: 16, weight: .light, design: .rounded))
                    }
                }
                .listStyle(PlainListStyle())
            } else {
                Spacer()
            }
        }
        .onChange(of: unitToggle, perform: { _ in
            Task {
                print("dsfadf")
                await manager.fetchForCity(string: self.cityText, unit: unitToggle ? .imperial : .metric)
            }
        })
        .padding()

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
