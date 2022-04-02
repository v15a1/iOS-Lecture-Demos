//
//  Preference.swift
//  AssesmentManager
//
//  Created by Visal Rajapakse on 2022-03-26.
//

import Foundation

struct Preference: Identifiable {
    var id: UUID = UUID()
    var name: String
    var preferences: [Preference]?
}
