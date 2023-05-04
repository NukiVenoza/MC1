//
//  MC1App.swift
//  MC1
//
//  Created by Nuki Venoza on 19/04/23.
//

import SwiftUI

@main
struct MC1App: App {
    
    var firstTime = !UserDefaults.standard.bool(forKey: "firstTime")
    
    var body: some Scene {
        WindowGroup {
            
            if firstTime {
                Onboarding1()
                    .preferredColorScheme(.light)
            } else {
                ContentView()
                    .preferredColorScheme(.light)
            }
        }
    }
}
