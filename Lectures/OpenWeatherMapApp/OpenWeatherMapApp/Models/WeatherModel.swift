//
//  WeatherModel.swift
//  OpenWeatherMapApp
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import Foundation
import SwiftUI

struct WeatherModel {
    let id: Int
    let name: String
    let temperature: Double
    let description: String
    let humidity: Int
    let pressure: Int
    let windSpeed: Double
    let direction: Int
    let cloudPercentage: Int
    let unit: WeatherUnit
    
    var tempString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionIcon: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    var detailedData: [WeatherDetailData] {
        return [
            .init(title: "Temperature", icon: "thermometer", color: Color.red, value: tempString, unit: self.unit == .metric ? "°C" : "°F"),
            .init(title: "Humidity", icon: "drop.fill", color: Color.blue, value: "\(humidity)", unit: "%"),
            .init(title: "Pressure", icon: "digitalcrown.horizontal.press.fill", color: Color.green, value: "\(pressure)", unit: "hPa"),
            .init(title: "Wind speed", icon: "wind", color: Color.orange, value: "\(windSpeed)", unit: self.unit == .metric ? "m/s" : "mi/h"),
            .init(title: "Wind direction", icon: "arrow.up.left.circle", color: Color.yellow, value: "\(direction)"),
            .init(title: "Cloud Percentage", icon: "icloud", color: Color.cyan, value: "\(cloudPercentage)"),
        ]
    }
}

struct WeatherDetailData: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
    let value: String
    var unit: String = ""
}
