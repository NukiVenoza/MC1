//
//  Onboarding1.swift
//  MC1
//
//  Created by Nuki Venoza on 04/05/23.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Onboarding_1")
                    .resizable()
                
                VStack{
                    Spacer()
                        .frame(height: 90)
                    
                    Text("You can see messages of the day here, which will be different every day.")
                        .frame(width: 280)
                        .font(.system(size:15))
                    
                    HStack{
                        NavigationLink(destination: ContentView().preferredColorScheme(.light)) {
                            Text("Skip")
                                .font(.system(size:15))
                                .foregroundColor(Color.gray)
                        }
                        .simultaneousGesture(TapGesture()
                            .onEnded({ _ in
                                UserDefaults.standard.set(true, forKey: "firstTime")
                            })
                        )
                        
                        Spacer()
                            .frame(width: 220)
                        
                        
                        NavigationLink(destination: Onboarding2().preferredColorScheme(.light)) {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                        }
                    }
                    
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }    }
}

struct Onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1()
    }
}
