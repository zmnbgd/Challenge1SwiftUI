//
//  ContentView.swift
//  Challenge1SwiftUI
//
//  Created by Marko Zivanovic on 12.6.23..
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    
    @State private var selectedlitersInputUnit = UnitVolume.liters
    @State private var selectedDecilitersInputUnit = UnitVolume.deciliters
    @State private var selectedCentilitersInputUnit = UnitVolume.centiliters
    @State private var selectedMillilitersInputUnit = UnitVolume.milliliters
    
    let volumeUnits: [UnitVolume] = [.liters, .deciliters, .centiliters, .milliliters]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount of water", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Amount of water in liters")
                }
                
                Section {
                    Picker("Unit volume", selection: $selectedDecilitersInputUnit) {
                        ForEach(volumeUnits, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select a measurement value")
                }
                
            }
            .navigationTitle("Hydrocalc")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                       // amountIsFocused = false
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
