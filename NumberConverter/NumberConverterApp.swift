//
//  NumberConverterApp.swift
//  NumberConverter
//
//  Created by Mahshad Jafari on 05.08.24.
//

import SwiftUI

@main
struct NumberConverterApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            
            ContentView()
            .frame(minWidth: 500)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            #else
            ContentView()
            #endif
        }
    }
}
