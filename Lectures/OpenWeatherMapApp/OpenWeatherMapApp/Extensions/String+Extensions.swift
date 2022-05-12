//
//  String+Extensions.swift
//  OpenWeatherMapApp
//
//  Created by Visal Rajapakse on 2022-04-29.
//

import Foundation

extension String {
    /// Converts OpenWeatherAPI Unix date to Date
    /// - Returns: Optional Date conversion
    func unixToDate() -> Date? {
        guard let unixDate = Int(self) else { return nil }
        return Date(timeIntervalSince1970: TimeInterval(unixDate))
    }
}
