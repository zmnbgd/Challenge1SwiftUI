//
//  ContentView.swift
//  Challenge1SwiftUI
//
//  Created by Marko Zivanovic on 12.6.23..
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var conversionValue = 0.0
    
    @State private var selectedlitersInputUnit = UnitVolume.liters
    @State private var selectedDecilitersInputUnit = UnitVolume.deciliters
    @State private var selectedCentilitersInputUnit = UnitVolume.centiliters
    @State private var selectedMillilitersInputUnit = UnitVolume.milliliters
    
    @FocusState private var inputValueFocused: Bool
    
    let volumeUnits: [UnitVolume] = [.liters, .deciliters, .centiliters, .milliliters]
    
    var convertedValue: Double {
        let inputValueInLiters = inputValue

        switch selectedDecilitersInputUnit {
        case .liters:
            return inputValueInLiters * 1
        case .deciliters:
            return inputValueInLiters * 10
        case .centiliters:
            return inputValueInLiters * 100
        case .milliliters:
            return inputValueInLiters * 1000
        default:
            return inputValueInLiters 
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount of water", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputValueFocused)
                    Picker("Input unit volume", selection: $selectedlitersInputUnit) {
                        ForEach(volumeUnits, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                } header: {
                    Text("Amount of water in liters")
                }
                
                Section {
                    Picker("Convert to unit volume", selection: $selectedDecilitersInputUnit) {
                        ForEach(volumeUnits, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select a measurement value")
                }
                Section {
                    Text("Result: \(convertedValue, specifier: "%.2f") \(selectedDecilitersInputUnit.symbol)")
                   }
            }
            .navigationTitle("Hydrocalc")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                       inputValueFocused = false
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
