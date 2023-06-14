//
//  ContentView.swift
//  Challenge1SwiftUI
//
//  Created by Marko Zivanovic on 12.6.23..
//

import SwiftUI

struct ContentView: View {
    
    @State private var amountOfWater = 0.0
    @State private var liter = 1.0
    @State private var deciliter = 0.10
    @State private var centiliter =  0.010
    @State private var mililiter = 0.0010
    @FocusState private var amountIsFocused: Bool
    
    var measurementComponents = ["liter", "deciliter", "centiliter", "mililiter"]
    @State private var selectedmeasurementComponents = "deciliter"
    
//    var measurment: Double {
//        let deciliterMeasurment = Double(deciliter * 10)
//        let centiliterMeasurment = Double(centiliter * 100)
//        let mililiterMeasurment = Double(mililiter * 1000)
//
//        return measurment
//    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Water", value: $amountOfWater, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Picker("Select ", selection: $selectedmeasurementComponents) {
                        ForEach(measurementComponents, id: \.self) {
                            Text($0)
                        }
                    }
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
