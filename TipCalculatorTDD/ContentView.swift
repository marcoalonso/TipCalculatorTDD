//
//  ContentView.swift
//  TipCalculatorTDD
//
//  Created by Marco Alonso Rodriguez on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.15
    @State private var tip: String?
    @State private var message: String = ""
    
    let tipCalculator = TipCalculator()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numbersAndPunctuation)
                    .accessibilityIdentifier("totalTextField")
                
                Picker(selection: $tipPercentage) {
                    Text("5%").tag(0.05)
                    Text("10%").tag(0.1)
                    Text("15%").tag(0.15)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)
                    .accessibilityIdentifier("tipPercentageSegmentedControl")
                
                
                Button {
                    
                    guard let total = Double(self.total) else {
                        message = "Invalid Input"
                        return }
                    
                    do {
                       let result = try tipCalculator.calculate(total: total, tipPercentage: tipPercentage)
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .currency
                        tip = formatter.string(from: NSNumber(value: result))
                        
                    } catch TipCalculatorError.invalidInput {
                        message = "Invalid Input"
                    } catch {
                        message = error.localizedDescription
                    }
                    
                } label: {
                    Text("Calculate")
                        .padding(5)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(16)
                        .padding(10)
                }

                Text(message)
                    .padding(.top, 40)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(tip ?? "")
                .font(.system(size: 54))
                
                Image("calculator")
                    .resizable()
                
                Spacer()
                .navigationTitle("Tip Calculator")
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
