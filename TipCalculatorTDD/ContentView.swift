//
//  ContentView.swift
//  TipCalculatorTDD
//
//  Created by Marco Alonso Rodriguez on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                
                Picker(selection: $tipPercentage) {
                    Text("5%").tag(0.05)
                    Text("10%").tag(0.1)
                    Text("15%").tag(0.15)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)
                
                
                Button {
                    
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
                    .padding(.top, 50)
                
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
