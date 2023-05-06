//
//  Onboarding5.swift
//  MC1
//
//  Created by Nuki Venoza on 04/05/23.
//

import SwiftUI

struct Onboarding5: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Onboarding_5")
                    .resizable()
                
                VStack{
                    Spacer()
                        .frame(height: 610)
                    
                    HStack{
                        Text("You can disable or enable vibration, notification, and change wake up time.")
                            .font(.system(size:15))
                        
                        Spacer()
                            .frame(width: 10)
                        
                    }
                    .frame(width: 300)
                    .multilineTextAlignment(.leading)
                    
                    
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
                        
                        
                        NavigationLink(destination: Onboarding6().preferredColorScheme(.light)) {
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
        }
        .navigationBarBackButtonHidden()
    }
}

struct Onboarding5_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding5()
    }
}
