//
//  TimeView.swift
//  MyConv
//
//  Created by Maciej on 24/07/2022.
//

import SwiftUI

struct TimeView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var inputAmount = ""
    @State private var startUnit = 0
    @State private var endUnit = 1
    
    private let units: [(String, UnitDuration)] = [
        ("Seconds", .seconds), ("Minutes", .minutes), ("Hours", .hours)
    ]
    
    private var convert: Double {
        let unitToConvert = Measurement(value: Double(inputAmount) ?? 0, unit: units[startUnit].1)
        return unitToConvert.converted(to: units[endUnit].1).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Value", text: $inputAmount)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        Picker("Your unit", selection: $startUnit) {
                            ForEach(0..<3) {
                                Text("\(self.units[$0].0)")
                            }
                        }
                        .pickerStyle(.menu)
                        
                        Text(Image(systemName: "arrow.right"))
                        
                        Picker("Wanted unit", selection: $endUnit) {
                            ForEach(0..<3) {
                                Text("\(self.units[$0].0)")
                            }
                        }
                        .pickerStyle(.menu)
                    }
                } header: {
                    Text("Value and units")
                }
                
                Section {
                    Text(convert, format: .number) +
                    Text(" \(units[endUnit].1.symbol)")
                } header: {
                    Text("Conversion")
                }
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            .navigationTitle("Time")
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
