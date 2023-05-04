//
//  Onboarding6.swift
//  MC1
//
//  Created by Nuki Venoza on 04/05/23.
//

import SwiftUI

struct Onboarding6: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Onboarding_6")
                    .resizable()
                
                VStack{
                    Spacer()
                        .frame(height: 620)
                    
                    HStack{
                        Text("Select “Focus” page to Start your exercise!")
                            .font(.system(size:15))
                        
                        Spacer()
                            .frame(width: 70)
                        
                    }
                    .frame(width: 300)
                    .multilineTextAlignment(.leading)
                    
                    
                    HStack{
                        //                        NavigationLink(destination: Onboarding3View()) {
                        //                            Text("Skip")
                        //                                .font(.system(size:15))
                        //                                .foregroundColor(Color.gray)
                        //                        }
                        
                        Spacer()
                            .frame(width: 260)
                        
                        
                        NavigationLink(destination: ContentView().preferredColorScheme(.light)) {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(red: 17/255, green: 118/255, blue: 106/255))
                                
                        }
                        .simultaneousGesture(TapGesture()
                            .onEnded({ _ in
                                UserDefaults.standard.set(true, forKey: "firstTime")
                            })
                        )
                    }
                    
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

struct Onboarding6_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding6()
    }
}
