//
//  ContentView.swift
//  Challenge1SwiftUI
//
//  Created by Marko Zivanovic on 12.6.23..
//

import SwiftUI

struct ContentView: View {
    
    @State private var amountOfWater = 0.0
    
    @FocusState private var amountIsFocused: Bool
    
    let metricSystem = ["L", "dL", "cl", "mL"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Water", value: $amountOfWater, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section {
                    
                }
            }
            .navigationTitle("Hydrocalc")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
