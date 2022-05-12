//
//  WeatherModel.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import Foundation
import SwiftUI

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let humidity: Int
    let pressure: Int
    let windSpeed: Double
    let windDirection: Int
    let cloudPercentage: Int

    var tempString: String {
        return String(format: "%.1f", temperature)
    }

    var data: [WeatherUnitData] {
        return [
            .init(title: "Temperature", icon: "thermometer", color: .red, value: self.temperature),
            .init(title: "Humidity", icon: "drop.fill", color: .blue, value: Double(self.humidity)),
            .init(title: "Pressure", icon: "digitalcrown.horizontal.press.fill", color: .green, value: Double(self.pressure)),
            .init(title: "Wind Speed", icon: "wind", color: .orange, value: self.windSpeed),
            .init(title: "Wind Direction", icon: "arrow.up.left.circle", color: .blue, value: Double(self.windDirection)),
            .init(title: "Cloud %", icon: "icloud", color: .cyan, value: Double(self.cloudPercentage)),
        ]
    }

    var conditionIcon: String {
        switch conditionId {
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
}

struct WeatherUnitData: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
    let value: Double
}
