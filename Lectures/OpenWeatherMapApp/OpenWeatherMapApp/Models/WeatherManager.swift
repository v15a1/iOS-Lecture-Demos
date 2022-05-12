//
//  WeatherManager.swift
//  OpenWeatherMapApp
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import Foundation

enum WeatherUnit: String {
    case metric = "metric"
    case imperial = "imperial"
}

class WeatherManager: ObservableObject {
    
    let baseURL: String = "https://api.openweathermap.org/data/2.5/weather?appid=\(API.key)"
    
    @Published var weather: WeatherModel?
    private var unit: WeatherUnit = .metric
    
    func fetchForCurrentLocation() async {
        // Lat and lon of Kandy
        let lat = 7.291418
        let lon = 80.636696
        
        let url = "\(baseURL)&lat=\(lat)&lon=\(lon)&units=metric"
        print(url)
        
        await requestWeather(url: url)
    }
    
    func fetchForCity(string: String, unit: WeatherUnit) async {
        self.unit = unit
        let url = "\(baseURL)&q=\(string)&units=\(unit.rawValue)"
        print(url)

        await requestWeather(url: url)
    }
    
    func requestWeather(url: String) async {
        guard let url = URL(string: url) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url) // Defining a session using a URL for requests
            let weather =  try JSONDecoder().decode(WeatherData.self, from: data) // Converting a JSON response into Swift Objects
            DispatchQueue.main.async {
                self.weather = WeatherModel(id: weather.weather.first?.id ?? 0,
                                            name: weather.name,
                                            temperature: weather.main.temp,
                                            description: weather.weather.first?.description ?? "",
                                            humidity: weather.main.humidity,
                                            pressure: weather.main.pressure,
                                            windSpeed: weather.wind.speed,
                                            direction: weather.wind.deg,
                                            cloudPercentage: weather.clouds.all,
                                            unit: self.unit)
            }
            print(weather)
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
