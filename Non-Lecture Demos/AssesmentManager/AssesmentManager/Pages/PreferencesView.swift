//
//  PreferencesView.swift
//  AssesmentManager
//
//  Created by Visal Rajapakse on 2022-03-26.
//

import SwiftUI

struct PreferencesView: View {

    @Environment(\.dismiss) var dismiss
    @State private var dismissView = false

    let preferences = [
        Preference(name: "Section 1", preferences: [.init(name: "Assesments")]),
        Preference(name: "Section 2", preferences: [.init(name: "Settings")]),
    ]

    var body: some View {
        List(preferences, id: \.id) { preference in
            Section {
                ForEach(preference.preferences!) { pref in
                    NavigationLink(pref.name) {
                        Text(pref.name)
                            .onAppear {
                                dismissView = true
                            }
                    }
                }
            }
        }
        .onChange(of: dismissView, perform: { _ in
            dismiss()
        })
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Preferences")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
