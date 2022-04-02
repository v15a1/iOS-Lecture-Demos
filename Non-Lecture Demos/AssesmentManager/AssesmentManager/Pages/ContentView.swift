//
//  ContentView.swift
//  AssesmentManager
//
//

import SwiftUI

struct ContentView: View {
    @State private var showingPopover = false

    var body: some View {
        NavigationView {
            Text("First")
                .navigationTitle("First")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("something")
                            showingPopover.toggle()
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        .popover(isPresented: $showingPopover) {
                            Text("Your content here")
                                .font(.headline)
                                .padding()
                        }

                    }
                }

            Text("Second")
                .navigationTitle("Second")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad mini (6th generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
