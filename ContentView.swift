//
//  ContentView.swift
//  Challenge1SwiftUI
//
//  Created by Marko Zivanovic on 12.6.23..
//

import SwiftUI

struct ContentView: View {
    
    @State private var amountOfWater = 0.0
    
    let metricSystem = ["L", "dL", "cl", "mL"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                }
                Section {

                }
            }
            .navigationTitle("Hydrocalc")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
