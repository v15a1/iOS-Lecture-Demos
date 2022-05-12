//
//  HomeView.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import SwiftUI

struct HomeView: View {

    @State private var joke: String = ""
    @StateObject var manager = WeatherManager()

    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.3)
                .ignoresSafeArea() // To overflow from the Safe areas
            if let weather = manager.weather {
                VStack {
                    Image(systemName: weather.conditionIcon)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.blue)
                    HStack {
                        Text("\(weather.tempString)°C")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                        Text("|")
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .foregroundColor(.blue)
                        Text(weather.cityName)
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                    }
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

        }
        .onAppear {
            Task {
                await manager.fetchForCurrentLocation()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Joke: Codable {
    let value: String
}
