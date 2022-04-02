//
//  WeatherManager.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import Foundation
import UIKit

class WeatherManager: ObservableObject {
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.key)&units=metric"
    @Published var weather: WeatherModel?
    @Published var error: Error?

    func fetchForCurrentLocation() async {
        let lat = 7.291418
        let lon = 80.636696

        let url = "\(baseURL)&lat=\(lat)&lon=\(lon)"
        await performRequest(url: url)
    }

    func fetchForCity(city: String) async {
        let url = "\(baseURL)&q=\(city)"
        await performRequest(url: url)
    }

    private func performRequest(url: String) async {
        guard let url = URL(string: url) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let weather = try JSONDecoder().decode(WeatherData.self, from: data)
            DispatchQueue.main.async {
                self.weather = WeatherModel(conditionId: weather.weather.first!.id,
                                            cityName: weather.name,
                                            temperature: weather.main.temp,
                                            humidity: weather.main.humidity,
                                            pressure: weather.main.pressure,
                                            windSpeed: weather.wind.speed,
                                            windDirection: weather.wind.deg,
                                            cloudPercentage: weather.clouds.all)
                print(weather)
            }
        } catch {
            self.error = error
        }
    }
}


enum WeatherFetcherError: Error {
    case invalidURL
    case missingData
}
