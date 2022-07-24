//
//  LengthView.swift
//  MyConv
//
//  Created by Maciej on 24/07/2022.
//

import SwiftUI

struct LengthView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var inputAmount = ""
    @State private var startUnit = 0
    @State private var endUnit = 1
    
    private let units: [UnitLength] = [
        .meters, .kilometers, .feet, .yards, .miles
    ]
    
    private var convert: Double {
        let unitToConvert = Measurement(value: Double(inputAmount) ?? 0, unit: units[startUnit])
        return unitToConvert.converted(to: units[endUnit]).value
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
                            ForEach(0..<5) {
                                Text("\(self.units[$0].symbol)")
                            }
                        }
                        .pickerStyle(.menu)
                        
                        Text(Image(systemName: "arrow.right"))
                        
                        Picker("Wanted unit", selection: $endUnit) {
                            ForEach(0..<5) {
                                Text("\(self.units[$0].symbol)")
                            }
                        }
                        .pickerStyle(.menu)
                    }
                } header: {
                    Text("Number and units")
                }
                
                Section {
                    Text(convert, format: .number) +
                    Text(" \(units[endUnit].symbol)")
                } header: {
                    Text("Converted")
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
            .navigationTitle("Length")
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
