//
//  ContentView.swift
//  NumberConverter
//
//  Created by Mahshad Jafari on 05.08.24.
//

import SwiftUI

struct ContentView: View {
    @State private var numInput = ""
    @State private var inputBase = 16
    
    let inputSystem = [ 2: "Binärsystem", 8: "Oktalsystem", 10: "Dezimalsystem", 16: "Hexadezimalsystem"]
    
    var body: some View {
        VStack {
            Menu {
                ForEach(inputSystem.sorted(by: <), id: \.key) { base, name in
                    Button(action: {inputBase = base }) {
                    Text(name)
                    }
                    
                }
                
            } label: {
                Text("Eingaben \(inputSystem[inputBase] ?? "")")
                
                #if os(iOS)
                Image(systemName: "chevron.down")
                #endif
            }

            TextField("Your input", text: $numInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            ZStack {
                Color("CardBackgroundColor")
                
                VStack(spacing: 10) {
                   
                    NumberLine(number: numberSystemResult(forBase: 2), base: "2")
                    NumberLine(number: numberSystemResult(forBase: 8), base: "8")
                    NumberLine(number: numberSystemResult(forBase: 10), base: "10")
                    NumberLine(number: numberSystemResult(forBase: 16), base: "16")
                }
                .padding()
                
            }
            
            .cornerRadius(10)
            .shadow(radius: 3)
            .frame(height: 200)
            .padding(.top, 10)
        }
        .padding()
    }
    func numberSystemResult(forBase base: Int) -> String {
        if let decimal = UInt64(numInput, radix: inputBase) {
            return String(decimal, radix: base).uppercased()
        }
        return "-"
    }
}

#Preview {
    ContentView()
}
struct NumberLine: View {
    let number: String
    let base: String
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 0.0) {
            Spacer()
            Text(number)
                .font(.title)
                .minimumScaleFactor(0.8)
            Text(base)
                .minimumScaleFactor(0.2)
            
        }.foregroundColor(.white)
        .lineLimit(1)
    }
}
