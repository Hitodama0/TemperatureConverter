//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Biagio Ricci on 27/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double = 0
    @State private var inputUnit: String = "Celsius"
    @State private var outputUnit: String = "Celsius"
    @FocusState private var isFocused: Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    var input: Double {
        let number = inputNumber
        if inputUnit == "Fahrenheit" {
            return ((inputNumber - 32) * 5/9)
        }
        else  if inputUnit == "Kelvin" {
            return (inputNumber - 273.15)
        }
        else if inputUnit == "Celsius" {
            return inputNumber
        }
        return number
    }
    
    
    var outputUnits: Double {
        let number = input
        if outputUnit == "Celsius" {
            return number
        }
        else if outputUnit == "Fahrenheit" {
            return ((number * (9/5)) + 32)
        }
        else if outputUnit == "Kelvin" {
            return (number + 273.15)
        }
         return number
    }
    
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Input value", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Input unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section{
                    Text(outputUnits, format: .number)
                } header: {
                    Text("Your conversion is: ")
                }
            }
            .navigationTitle("TemperatureConv")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}
