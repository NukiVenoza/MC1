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
    
    @State var isSplash: Bool = true
    
    var body: some Scene {
        WindowGroup {
            
            if self.isSplash {
                SplashView()
                    .preferredColorScheme(.light)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                self.isSplash = false
                            }
                        }
                    }
            } else {
                if firstTime {
                    OnboardingName()
                        .preferredColorScheme(.light)
                } else {
                    ContentView()
                        .preferredColorScheme(.light)
                }
            }
            
        }
    }
}
